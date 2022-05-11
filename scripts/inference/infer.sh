
model_path='/home/harveen/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Small/2022-05-06_09-10-05/checkpoints/Conformer-CTC-BPE-Small.nemo'
dataset_manifest='../../data/tarini_manifest.json'
output_filename='../../results/hi_small_tarini'


python ../../src/inference/speech_to_text_eval.py model_path=${model_path} dataset_manifest=${dataset_manifest} output_filename=${output_filename}
