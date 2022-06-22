folder='/home/harveen/evaluations/benchmark_hindi/hindi/'$1
name='../../data/'$1


python ../../src/data/create_manifest.py ${folder} ${name}
