
model_path=$1
dataset_manifest=$2
output_filename='../../results/test.json'


CUDA_VISIBLE_DEVICES=1 python ../../src/inference/speech_to_text_eval.py model_path=${model_path} dataset_manifest=${dataset_manifest} output_filename=${output_filename}
