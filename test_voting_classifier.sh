# test LR and XGBoost voting classifier on NCI_test, TESLA and HiTIDE

source configure.sh

cmd="PYTHONPATH=$NEORANKING_CODE python3 Classifier/TestVotingClassifier.py -c1 LR_*_${SHORT}_*.sav -c2 XGBoost_*_short_*.xgbm -w 0.5 -tr NCI_train -te NCI_test -te TESLA -te HiTIDE -pt ${SHORT}"
echo $cmd
eval $cmd

cmd="PYTHONPATH=$NEORANKING_CODE python3 Classifier/TestVotingClassifier.py -c1 LR_*_${LONG}_*.sav -c2 XGBoost_*_long_*.xgbm -w 0.5 -tr NCI_train -te NCI_test -te TESLA -te HiTIDE -pt ${LONG}"
echo $cmd
eval $cmd

