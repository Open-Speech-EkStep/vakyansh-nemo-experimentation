
manifests='../../data/train_manifest.json,../../data/train_other_manifest.json'
destination='../../data/tokenized/'
vocab_size=128
tokenizer='spe'
spe_type='unigram'


python ../src/tokenize.py --manifest=${manifests} --data_root=${destination} --vocab_size=${vocab_size} --tokenizer=${tokenizer} --spe_type=${spe_type} --log --spe_train_extremely_large_corpus 
