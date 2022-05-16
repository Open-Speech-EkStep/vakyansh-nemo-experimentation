model_path='/home/harveen/evaluations/hindi_medium_ls/Conformer-CTC-BPE.nemo'
dataset_manifest='../../data/tarini_manifest.json'
output_filename='../../results/test'
kenlm_model='/home/harveen/vakyansh-nemo-experimentation/lm/ai4b.bin'
alpha=1.0
beta=1.0
beam=128

python ../../src/inference/eval_beamsearch_ngram.py --nemo_model_file ${model_path} \
       	--input_manifest ${dataset_manifest} \
       	--kenlm_model_file ${kenlm_model} --beam_width ${beam} \
	--beam_alpha ${alpha} \
	--beam_beta ${beta}
