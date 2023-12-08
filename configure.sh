# configure paths before running python scripts

#export NEORANKING_RESOURCE=/mnt/d/code/NeoRanking_resource/isotonic1b #"/home/localadmin/Priorization/paper"
export NEORANKING_CODE=/mnt/d/code/NeoRanking/isotonic1 #"/home/localadmin/Priorization/paper_code"

mkdir -p "$NEORANKING_RESOURCE/data"
mkdir -p "$NEORANKING_RESOURCE/plots"
mkdir -p "$NEORANKING_RESOURCE/classifier_models"
mkdir -p "$NEORANKING_RESOURCE/classifier_results"
mkdir -p "$NEORANKING_RESOURCE/data/hla"
mkdir -p "$NEORANKING_RESOURCE/data/cat_encoding"

SHORT=neopep
LONG=mutation

