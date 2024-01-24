source configure.sh

SHORT=neopep
LONG=mutation

# plot Gartner comparison
CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotClassifierResults.py -fn Figure_3A -re LR_*_${SHORT}_*test.txt XGBoost_*_${SHORT}_*test.txt Voting_classifier_0.50_${SHORT}_test.txt SimpleRanking_${SHORT}_mixmhc_test.txt SimpleRanking_${SHORT}_netmhc_test.txt -pt neopep -g \"{'TESLA':'TESLA','HiTIDE':'HiTIDE','NCI_test':'NCI-test','NCI_train':'NCI-train'}\" -cln \"{0:'LR',1:'XGBoost',2:'Voting',3:'MixMHC+RNA',4:'NetMHC+RNA'}\" -a 0.02 -rot 75 -las 30 -tis 18 -les 15 -sr -ga -o \"MixMHC+RNA,NetMHC+RNA,Gartner et al.,LR,XGBoost,Voting\" -ds NCI_test -plt topn_counts"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotClassifierResults.py -fn Figure_3B -re LR_*_${SHORT}_*test.txt XGBoost_*_${SHORT}_*test.txt Voting_classifier_0.50_${SHORT}_test.txt SimpleRanking_${SHORT}_mixmhc_test.txt SimpleRanking_${SHORT}_netmhc_test.txt -pt neopep -g \"{'TESLA':'TESLA','HiTIDE':'HiTIDE','NCI_test':'NCI-test','NCI_train':'NCI-train'}\" -cln \"{0:'LR',1:'XGBoost',2:'Voting',3:'MixMHC+RNA',4:'NetMHC+RNA'}\" -a 0.02 -rot 75 -las 30 -tis 18 -les 15 -sr -o \"MixMHC+RNA,NetMHC+RNA,LR,XGBoost,Voting\" -ds TESLA -plt topn_counts"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotClassifierResults.py -fn Figure_3C -re LR_*_${SHORT}_*test.txt XGBoost_*_${SHORT}_*test.txt Voting_classifier_0.50_${SHORT}_test.txt SimpleRanking_${SHORT}_mixmhc_test.txt SimpleRanking_${SHORT}_netmhc_test.txt -pt neopep -g \"{'TESLA':'TESLA','HiTIDE':'HiTIDE','NCI_test':'NCI-test','NCI_train':'NCI-train'}\" -cln \"{0:'LR',1:'XGBoost',2:'Voting',3:'MixMHC+RNA',4:'NetMHC+RNA'}\" -a 0.02 -rot 75 -las 30 -tis 18 -les 15 -sr -o \"MixMHC+RNA,NetMHC+RNA,LR,XGBoost,Voting\" -ds HiTIDE -plt topn_counts"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotTESLAMLVotingComp.py -tsf Voting_classifier_${SHORT}_0.50_test.txt -fn Figure_3D -ft pdf -pt FR_plot"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotTESLAMLVotingComp.py -tsf Voting_classifier_${SHORT}_0.50_test.txt -fn Figure_3E -ft pdf -pt TTIF_plot"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotTESLAMLVotingComp.py -tsf Voting_classifier_${SHORT}_0.50_test.txt -fn Figure_3F -ft pdf -pt AUPRC_plot"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotShapleyImportance.py -c1 LR_*${SHORT}*.sav -c2 XGBoost_*${SHORT}*.xgbm -ds1 NCI_train -pt neopep -ft pdf -fn Figure_3G -las 30 -tis 23 -tts 25 -les 20 -cm \"{'LR':0,'XGBoost':3}\""
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotShapleyValues.py -c LR_*${SHORT}*.sav -tr NCI_train -p 4350 -pept KTYQGSYGFRR -pt neopep -ft pdf -fn Figure_3H -las 30 -tis 23 -tts 25 -les 20"
echo $CMD
eval $CMD

CMD="PYTHONPATH=$NEORANKING_CODE python3 Scripts/paper/PlotShapleyValues.py -c LR_*${SHORT}*.sav -tr NCI_train -p 4324 -pept DRNIFRHSVV -pt neopep -ft pdf -fn Figure_3I -las 30 -tis 23 -tts 25 -les 20"
echo $CMD
eval $CMD
