import numpy as np
from Utils.Parameters import *
from collections import Counter
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import FunctionTransformer

class DataTransformer:

    def __init__(self):
        return

    @staticmethod
    def cat_to_numerical(df):
        parameters = Parameters()
        cat_features = [f for f in df.columns if f in parameters.get_categorical_features()]

        cat_dims = {}
        for f in cat_features:
            l_enc = LabelEncoder()
            df[f] = l_enc.fit_transform(df[f].values)
            cat_dims[f] = len(l_enc.classes_)

        return df, cat_dims

    @staticmethod
    def fill_missing_values(df):

        df = DataTransformer.impute_rnaseq_cov(df)
        df['rnaseq_TPM'].fillna(0, inplace=True)

        parameters = Parameters()
        value_dict = {}
        all_features = parameters.get_numerical_features()+parameters.get_ordinal_features()
        num_features = [f for f in df.columns if f in all_features]

        for f in num_features:
            order_rel = parameters.get_order_relation(f)
            min_v = np.min(df[f])
            max_v = np.max(df[f])
#            dv = (max_v-min_v)/3
            dv = 0
            if order_rel == '>':
                fill_val = min_v-dv
            elif order_rel == '<':
                fill_val = max_v+dv
            elif order_rel == '=':
                if f in parameters.get_ordinal_features():
                    counter = Counter(df[f])
                    fill_val = counter.most_common(1)[0][0]
                else:
                    fill_val = np.mean(df[f])

            value_dict[f] = fill_val

        df.fillna(value=value_dict, inplace=True)

        return df

    @staticmethod
    def impute_rnaseq_cov(df):
        for i in df.index:
            if np.isnan(df.loc[i, 'rnaseq_ref_support']):
                if df.loc[i, 'rnaseq_gene_expression_quartile'] == 0:
                    df.loc[i, 'rnaseq_ref_support'] = 100.0
                elif df.loc[i, 'rnaseq_gene_expression_quartile'] == 1:
                    df.loc[i, 'rnaseq_ref_support'] = 100.0
                elif df.loc[i, 'rnaseq_gene_expression_quartile'] == 2:
                    df.loc[i, 'rnaseq_ref_support'] = 100.0
                elif df.loc[i, 'rnaseq_gene_expression_quartile'] == 3:
                    df.loc[i, 'rnaseq_ref_support'] = 89.0
                elif df.loc[i, 'rnaseq_gene_expression_quartile'] == 4:
                    df.loc[i, 'rnaseq_ref_support'] = 67.0

                df.loc[i, 'rnaseq_alt_support'] = 100.0 - df.loc[i, 'rnaseq_ref_support']

        return df

    @staticmethod
    def same_allele(alleles_wt, alleles_mut):

        if str(alleles_wt) == 'nan' or str(alleles_mut) == 'nan':
            return False
        la_wt = str(alleles_wt).split(",")
        for a in la_wt:
            if a in alleles_mut: return True

        return False

    @staticmethod
    def normalize(df, normalizer):
        num_cols = [c for c in df.columns if c in Parameters().get_numerical_features()]
        min_v = 0
        max_v = 1

        for c in num_cols:
            if type(normalizer) is dict:
                if c in normalizer:
                    norm_transform = normalizer[c]
                else:
                    norm_transform = None
            else:
                norm_transform = normalizer
            if norm_transform is not None:
                x = df[c].to_numpy().reshape(-1, 1)
                if type(norm_transform) is FunctionTransformer and norm_transform.func.__name__ == 'log10':
                    x[x <= 0] = min(x[x > 0])/10
                num_X = norm_transform.fit_transform(x)
                df.loc[:, c] = num_X
                min_v = min(min_v, np.nanmin(num_X))
                max_v = max(max_v, np.nanmax(num_X))

        X = df.to_numpy()

        ord_cols = [c for c in df.columns if c in Parameters().get_ordinal_features()]
        for c in ord_cols:
            if type(normalizer) is dict:
                if c in normalizer:
                    norm_transform = normalizer[c]
                else:
                    norm_transform = None
            else:
                norm_transform = normalizer
            if norm_transform is not None:
                values = df[c]
                min_o = np.nanmin(values)
                max_o = np.nanmax(values)
                if max_o > min_o:
                    idx = [df.columns.get_loc(c)]
                    values = np.array(list(map(lambda v: (v-min_o)*(max_v-min_v)/(max_o-min_o) + min_v, values))).\
                        reshape((len(values), 1))
                    X[:, idx] = values

        return X
