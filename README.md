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

```
cd scripts/finetuning
```

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

## Inference 

```
cd scripts/inference
```
Modify `infer.sh`

```
model_path= < finetuned model path >
dataset_manifest= < path to .json manifest >
output_filename= < file name to save results >
```

### Infer with language model 

First we need to train a language model to infer with it. 
```
cd scripts/lm
bash install_beamsearch_decoders.sh 
```
Modify `train_lm.sh`

```
train_file='path to tokenizer tokenizer/text_corpus/document.txt'
model='< finetuned checkpoint >'
output='<output file path .bin'
```
```
bash train_lm.sh
```

Once the language model is trained go to `cd scripts/inference`. Modify `infer_with_lm.sh`

```
model_path="< finstuned model path > "
dataset_manifest='manifest .json file path'
kenlm_model='language model path .bin'
alpha=1.0 # asr model weight
beta=1.0. # lm weight
beam=128  # beam size
```
```
bash infer_with_lm.sh
```
