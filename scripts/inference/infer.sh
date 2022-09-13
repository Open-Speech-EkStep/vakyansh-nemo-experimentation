
model_path='/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Large/2022-08-09_22-37-34/checkpoints/Conformer-CTC-BPE-Large.nemo'
dataset_manifest='../../data/punjabi_450h/punjabi_test_manifest.json'
output_filename='../../results/hi_small_tarini_rnnt_char'


CUDA_VISIBLE_DEVICES=1 python ../../src/inference/speech_to_text_eval.py model_path=${model_path} dataset_manifest=${dataset_manifest} output_filename=${output_filename}
