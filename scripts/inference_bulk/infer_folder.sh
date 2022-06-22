for i in $(ls -d /home/harveen/evaluations/benchmark_hindi/hindi/*/); do f=$(sed 's#.*/##' <<< "${i%/}"); echo 'Dataset: '$f; bash create_manifest.sh $f ; bash infer_with_lm.sh $f; done
