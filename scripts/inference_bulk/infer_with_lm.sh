model_path="/home/harveen/evaluations/best_25.5.nemo"
dataset_manifest='../../data/'$1'_manifest.json'
kenlm_model='/home/harveen/vakyansh-nemo-experimentation/lm/ai4b_normalized.bin'
alpha=1.0
beta=1.0
beam=128



python ../../src/inference/eval_beamsearch_ngram.py --nemo_model_file ${model_path} \
       	--input_manifest ${dataset_manifest} \
       	--kenlm_model_file ${kenlm_model} --beam_width ${beam} \
	--beam_alpha ${alpha} \
	--beam_beta ${beta}

