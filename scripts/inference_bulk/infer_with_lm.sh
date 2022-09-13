model_path="/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Large/2022-08-01_17-30-09/checkpoints/Conformer-CTC-BPE-Large.nemo"
dataset_manifest='../../data/'$1'_manifest.json'
kenlm_model='../../lm/ai4b_normalized_generated.bin'
alpha=1.0
beta=1.0
beam=128



CUDA_VISIBLE_DEVICES=1 python ../../src/inference/eval_beamsearch_ngram.py --nemo_model_file ${model_path} \
       	--input_manifest ${dataset_manifest} \
       	--kenlm_model_file ${kenlm_model} --beam_width ${beam} \
	--beam_alpha ${alpha} \
	--beam_beta ${beta}

