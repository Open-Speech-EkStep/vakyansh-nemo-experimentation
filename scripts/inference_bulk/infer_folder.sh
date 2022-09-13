for i in $(ls -d /root/Data/hindi_bench/*/); do f=$(sed 's#.*/##' <<< "${i%/}"); echo 'Dataset: '$f; bash create_manifest.sh $f ; bash infer_with_lm.sh $f; done
