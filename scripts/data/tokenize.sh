
manifests='/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/data/english/english_train_manifest.json'
destination='../../data/english/tokenizer/'
vocab_size=128
tokenizer='spe'
spe_type='unigram'

mkdir -p ${destination}
python ../../src/data/do_tokenize.py --manifest=${manifests} --data_root=${destination} --vocab_size=${vocab_size} --tokenizer=${tokenizer} --spe_type=${spe_type} --log --spe_train_extremely_large_corpus 
