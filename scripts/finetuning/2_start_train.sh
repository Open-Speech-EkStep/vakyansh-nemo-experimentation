config_path=''
config_name=''
train_manifest_path=''
valid_manifest_path=''
tokenizer_dir=''
tokenizer_type=''
wandb_project_name=''
wandb_run_name=''


python speech_to_text_ctc_bpe.py \
     --config-path="/home/harveen/nemo_training/conf" \
     --config-name='conformer_medium' \
    model.train_ds.manifest_filepath="/home/harveen/nemo_training/data/train_combined.json" \
    model.validation_ds.manifest_filepath=/home/harveen/nemo_training/data/valid_manifest.json \
    model.tokenizer.dir=/home/harveen/nemo_training/data/tokenized/tokenizer_spe_unigram_v128 \
    model.tokenizer.type=bpe \
    trainer.devices=-1 \
    trainer.accelerator="gpu" \
    trainer.strategy="ddp" \
    trainer.max_epochs=100 \
    exp_manager.create_wandb_logger=True \
    exp_manager.wandb_logger_kwargs.name="conformer_medium_hindi" \
    exp_manager.wandb_logger_kwargs.project="nemo_conformer" \
    +init_from_pretrained_model=stt_hi_conformer_ctc_medium
