
model_path='/home/harveen/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-Transducer-Char/2022-05-13_22-13-02/checkpoints/Conformer-Transducer-Char.nemo'
dataset_manifest='../../data/tarini_manifest.json'
output_filename='../../results/hi_small_tarini_rnnt_char'


python ../../src/inference/speech_to_text_eval.py model_path=${model_path} dataset_manifest=${dataset_manifest} output_filename=${output_filename}
