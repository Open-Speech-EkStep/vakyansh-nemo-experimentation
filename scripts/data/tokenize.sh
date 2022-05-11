
manifests='/home/harveen/vakyansh-nemo-experimentation/data/hindi/train_combined.json'
destination='/home/harveen/vakyansh-nemo-experimentation/data/hindi/'
vocab_size=1024
tokenizer='spe'
spe_type='unigram'


python ../../src/data/do_tokenize.py --manifest=${manifests} --data_root=${destination} --vocab_size=${vocab_size} --tokenizer=${tokenizer} --spe_type=${spe_type} --log --spe_train_extremely_large_corpus 
