nohup inferpython eval_beamsearch_ngram.py --nemo_model_file ../evaluations/hindi_medium_hi/Conformer-CTC-BPE.nemo --input_manifest ~/evaluations/tarini_manifest.json --kenlm_model_file text/ai4b.bin --beam_width 128 --beam_alpha 0 0.5 1.0 1.5 2.0 --beam_beta 0 0.5 1.0 1.5 2.0 &