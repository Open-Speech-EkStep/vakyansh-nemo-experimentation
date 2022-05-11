model_path='/home/harveen/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Small/2022-05-06_09-10-05/checkpoints/averaging/Conformer-CTC-BPE-Small-averaged.nemo'
dataset_manifest='../../data/tarini_manifest.json'
output_filename='../../results/hi_small_tarini'
kenlm_model='/home/harveen/vakyansh-nemo-experimentation/lm/ai4b.bin'
alpha=1.0
beta=1.0
beam=128

python ../../src/inference/eval_beamsearch_ngram.py --nemo_model_file ${model_path} \
       	--input_manifest ${dataset_manifest} \
       	--kenlm_model_file ${kenlm_model} --beam_width ${beam} \
	--beam_alpha ${alpha} \
	--beam_beta ${beta}
