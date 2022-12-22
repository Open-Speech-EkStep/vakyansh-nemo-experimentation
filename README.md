# nemo-experimentation

## Training Steps 

### Prepare Data 
```
cd scripts/data
```
Modify `folder` and `name` paths in `create_manifest.sh`.

`folder` : path to folder containing audio and text files
`data` : will contain the json file required for training

```
bash create_manifest.sh
```

Similarly, you can create manifests for validation and test sets as well. These will be required to start the finetuning.

### Tokenize Data

We tokenize the text using a unigram sentencepiece tokenizer with a vocab size of 128. In `tokenize.sh` modify the `manifest` and `destination` path to point to train manifest and save folder respectively. 

```
bash tokenize.sh
```
### Start finetuning 
Modify `start_train_ctc.sh`

```
config_path='../..//conf/finetuning/char'
config_name='conformer_ctc_bpe_large.yaml'
train_manifest_path= < path to train manifest > 
valid_manifest_path= < path to valid manifest > 
test_manifest_path= < path to test manifest >  
tokenizer_dir= < path to tokenizer directory > 
tokenizer_type=bpe
wandb_project_name= < project name in your wandb account >
wandb_run_name= < run name >
pretrained_model= < path to pretrained checkpoint >
```

```
bash start_train_ctc.sh
```
