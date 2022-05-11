
input_model_path='/home/harveen/evaluations/hindi_medium_hi/Conformer-CTC-BPE.nemo'
output_model_path='../../checkpoints/torchscript/hindi_medium_hi.pt'
device='cuda'


python ../../src/inference/export.py --source ${input_model_path} --autocast --out ${output_model_path} --verbose DEBUG   --device ${device}
