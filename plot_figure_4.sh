source configure.sh

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotClassifierResults.py -fn Figure_4A -re LR_*_${LONG}_*test.txt XGBoost_*_${LONG}_*test.txt Voting_classifier_0.50_${LONG}_test.txt -pt mutation -g \"{'TESLA':'TESLA','HiTIDE':'HiTIDE','NCI_test':'NCI-test','NCI_train':'NCI-train'}\" -cln \"{0:'LR',1:'XGBoost',2:'Voting'}\" -a 0.02 -rot 30 -las 30 -tis 18 -les 15 -sr -ga -o \"Gartner et al.,LR,XGBoost,Voting\" -ds NCI_test -plt topn_counts"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotShapleyImportance.py -c1 LR_*_${LONG}_*.sav -c2 XGBoost_*_${LONG}_*.xgbm -ds1 NCI_train -pt mutation -ft pdf -fn Figure_4B -las 30 -tis 23 -tts 25 -les 20 -cm \"{'LR':0,'XGBoost':3}\""
echo $CMD
eval $CMD

feat_imp_file_mut="${NEORANKING_RESOURCE}/plots/Figure_4B.txt"
feat_imp_file_neopep="${NEORANKING_RESOURCE}/plots/Figure_3G.txt"
CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotShapImpRankChange.py -fn Figure_4C -fin ${feat_imp_file_neopep} -fim ${feat_imp_file_mut}"
echo $CMD
eval $CMD

