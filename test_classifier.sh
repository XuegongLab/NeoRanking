# test LR and XGBoost classifiers on NCI_test, TESLA and HiTIDE for ${LONG} and ${SHORT} data

source configure.sh

# test logistic regression
cmd="PYTHONPATH=$NEORANKING_CODE python3 Classifier/TestClassifiers.py -c LR_*${SHORT}*.sav -tr NCI_train -te NCI_test -te TESLA -te HiTIDE -pt ${SHORT}"
echo $cmd
eval $cmd

cmd="PYTHONPATH=$NEORANKING_CODE python3 Classifier/TestClassifiers.py -c LR_*${LONG}*.sav -tr NCI_train -te NCI_test -te TESLA -te HiTIDE -pt ${LONG}"
echo $cmd
eval $cmd

# test XGBoost
cmd="PYTHONPATH=$NEORANKING_CODE python3 Classifier/TestClassifiers.py -c XGBoost_*${SHORT}*.xgbm -tr NCI_train -te NCI_test -te TESLA -te HiTIDE -pt ${SHORT}"
echo $cmd
eval $cmd

cmd="PYTHONPATH=$NEORANKING_CODE python3 Classifier/TestClassifiers.py -c XGBoost_*${LONG}*.xgbm -tr NCI_train -te NCI_test -te TESLA -te HiTIDE -pt ${LONG}"
echo $cmd
eval $cmd
