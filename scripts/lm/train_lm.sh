train_file='/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/lm/tamil/lm_proper_nouns_ai4bharat_train.txt'
model='/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Large/2022-09-03_14-06-50/checkpoints/Conformer-CTC-BPE-Large.nemo'
output='../../lm/tamil/ai4bharat.bin'

python ../../src/lm/train_kenlm.py --train_file ${train_file} \
       	--nemo_model_file ${model} \
       	--kenlm_model_file ${output} \
	--ngram_length 5 \
	--kenlm_bin_path decoders/kenlm/build/bin/ 
