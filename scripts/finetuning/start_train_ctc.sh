config_path='/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/conf/finetuning/char'
config_name='conformer_ctc_bpe_large.yaml'
train_manifest_path=/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/data/english/english_train_manifest.json
valid_manifest_path=/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/data/english/english_valid_manifest.json
test_manifest_path=../../data/tarini_manifest.json
tokenizer_dir=/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/data/tamil/tokenizer/tokenizer_spe_unigram_v128
tokenizer_type=bpe
wandb_project_name=nemo_conformer
wandb_run_name=conformer_large_filtered_english
pretrained_model=/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/checkpoints/pretrained/ssl_conformer_large_e178.nemo
#pretrained_model=/root/ekstep/nemo_exp/trained_models/stt_hi_conformer_ctc_medium.nemo
#pretrained_model='/root/ekstep/nemo_exp/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Large/2022-06-01_19-16-48/checkpoints/Conformer-CTC-BPE-Large.nemo'






if [[ ${tokenizer_type}=bpe ]]; then

python ../../src/finetuning/speech_to_text_ctc_bpe.py \
     --config-path=${config_path} \
     --config-name=${config_name} \
    model.train_ds.manifest_filepath=${train_manifest_path} \
    model.validation_ds.manifest_filepath=${valid_manifest_path} \
    model.test_ds.manifest_filepath=${test_manifest_path} \
    model.tokenizer.dir=${tokenizer_dir} \
    model.tokenizer.type=${tokenizer_type} \
    trainer.devices=-1 \
    trainer.accelerator="gpu" \
    trainer.strategy="ddp" \
    exp_manager.create_wandb_logger=True \
    exp_manager.wandb_logger_kwargs.name=${wandb_run_name} \
    exp_manager.wandb_logger_kwargs.project=${wandb_project_name} \
    +init_from_pretrained_model=${pretrained_model}

fi
