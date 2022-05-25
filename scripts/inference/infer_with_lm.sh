model_path="/home/harveen/evaluations/hindi_medium_hi/Conformer-CTC-BPE.nemo"
dataset_manifest='/home/harveen/vakyansh-nemo-experimentation/data/mucs_hi_eval_manifest.json'
kenlm_model='/home/harveen/vakyansh-nemo-experimentation/lm/ai4b_pruned.bin'
alpha=1.0
beta=1.0
beam=128



python ../../src/inference/eval_beamsearch_ngram.py --nemo_model_file ${model_path} \
       	--input_manifest ${dataset_manifest} \
       	--kenlm_model_file ${kenlm_model} --beam_width ${beam} \
	--beam_alpha ${alpha} \
	--beam_beta ${beta}

