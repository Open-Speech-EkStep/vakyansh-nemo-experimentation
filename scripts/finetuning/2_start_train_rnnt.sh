config_path='/home/harveen/vakyansh-nemo-experimentation/conf/finetuning/transducer'
config_name='hindi_conformer_transducer_bpe_small.yaml'
train_manifest_path=/home/harveen/vakyansh-nemo-experimentation/data/hindi/train_combined.json
valid_manifest_path=/home/harveen/vakyansh-nemo-experimentation/data/hindi/valid_manifest.json
tokenizer_dir=/home/harveen/vakyansh-nemo-experimentation/data/hindi/tokenizer_spe_unigram_v1024
tokenizer_type=char
wandb_project_name=nemo_conformer
wandb_run_name=conformer_small_hindi_ls_rnnt_char_restored_from_ctc
pretrained_model='/home/harveen/vakyansh-nemo-experimentation/scripts/finetuning/nemo_experiments/Conformer-CTC-BPE-Small/2022-05-06_09-10-05/checkpoints/averaging/Conformer-CTC-BPE-Small-averaged.nemo'


if  [[ ${tokenizer_type}=char ]]; then

python ../../src/finetuning/speech_to_text_rnnt.py \
     --config-path=${config_path} \
     --config-name=${config_name} \
    model.train_ds.manifest_filepath=${train_manifest_path} \
    model.validation_ds.manifest_filepath=${valid_manifest_path} \
    trainer.devices=-1 \
    trainer.accelerator="gpu" \
    trainer.strategy="ddp" \
    trainer.max_epochs=100 \
    exp_manager.create_wandb_logger=True \
    exp_manager.wandb_logger_kwargs.name=${wandb_run_name} \
    exp_manager.wandb_logger_kwargs.project=${wandb_project_name} \
    +init_from_pretrained_model=${pretrained_model}


fi


if [[ ${tokenizer_type}=bpe ]]; then

python ../../src/finetuning/speech_to_text_rnnt_bpe.py \
     --config-path=${config_path} \
     --config-name=${config_name} \
    model.train_ds.manifest_filepath=${train_manifest_path} \
    model.validation_ds.manifest_filepath=${valid_manifest_path} \
    model.tokenizer.dir=${tokenizer_dir} \
    model.tokenizer.type=${tokenizer_type} \
    trainer.devices=-1 \
    trainer.accelerator="gpu" \
    trainer.strategy="ddp" \
    trainer.max_epochs=100 \
    exp_manager.create_wandb_logger=True \
    exp_manager.wandb_logger_kwargs.name=${wandb_run_name} \
    exp_manager.wandb_logger_kwargs.project=${wandb_project_name} \
    +init_from_pretrained_model=${pretrained_model}

fi
