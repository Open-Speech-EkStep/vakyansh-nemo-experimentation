model_path="/home/harveen/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Small/2022-05-06_09-10-05/checkpoints/Conformer-CTC-BPE-Small.nemo"
data_path='/home/harveen/vakyansh-nemo-experimentation/data'
dataset_manifest="${data_path}/mucs_hi_eval_manifest.json,${data_path}/mucs_hi_dev_manifest.json,${data_path}/tarini_manifest.json,${data_path}/vakyansh_team_manifest.json"
kenlm_model='/home/harveen/vakyansh-nemo-experimentation/lm/ai4b_pruned.bin'
alpha=1.0
beta=1.0
beam=128


IFS=','
read -ra arr <<< "$dataset_manifest"

for val in "${arr[@]}";
do

python ../../src/inference/eval_beamsearch_ngram.py --nemo_model_file ${model_path} \
       	--input_manifest $val \
       	--kenlm_model_file ${kenlm_model} --beam_width ${beam} \
	--beam_alpha ${alpha} \
	--beam_beta ${beta}

done
