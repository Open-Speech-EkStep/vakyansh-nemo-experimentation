folder='/root/Data/hindi_bench/'$1
name='../../data/'$1


python ../../src/data/create_manifest.py ${folder} ${name}
