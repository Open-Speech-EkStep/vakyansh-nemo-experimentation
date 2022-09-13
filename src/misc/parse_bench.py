#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import sys

# In[65]:


def parse_benchmark_logs(input_file):
    lines = []
    with open(input_file) as file:
        lines = file.readlines()

    index = -1
    lines_dict = {}

    for line in lines:
        if "Tokenizer" in line:
            index = index + 1
            lines_dict[index] = []

        if index != -1:
            lines_dict[index].append(line)

    final_entries = []

    for key, lines in lines_dict.items():
        words_needed = {
            "Model": "was successfully restored",
            "Tokenizer": "Tokenizer",
            "Dataset": "Reading Manifest",
            "WER": "Greedy WER/CER",
            "WER_LM": "WER/CER with beam search decoding and N-gram model",
        }

        lines_filtered = {}
        for line in lines:
            for key, value in words_needed.items():
                if value in line:
                    lines_filtered[key] = line.strip()

        tokenizer = ""
        tokens = ""
        model_path = ""
        model_name = ""
        model_type = ""
        dataset_manifest_path = ""
        dataset = ""
        wer = ""
        cer = ""
        wer_lm = ""
        cer_lm = ""
        alpha = ""
        beta = ""
        beam = ""

        for key, value in lines_filtered.items():
            if key == "Tokenizer":
                tokenizer = value.split(" ")[-5]
                tokens = value.split(" ")[-2]
            #             print(tokenizer)
            #             print(tokens)

            if key == "Model":
                model_path = value.split(" ")[-1][0:-1]
                model_name = model_path.split("/")[-1]
                model_type = value.split("]")[-1].split(" ")[2]
            #             print(model_path)
            #             print(model_name)

            if key == "Dataset":
                dataset_manifest_path = value.split(" ")[2]
                dataset = "_".join(
                    dataset_manifest_path.split("/")[-1].split(".")[0].split("_")[0:-1]
                )
            #             print(dataset)
            #             print("_".join(dataset.split('/')[-1].split('.')[0].split('_')[0:-1]))

            if key == "WER":
                wer_ = value.split("=")[-1]
                wer, cer = wer_.split("/")
            #             print(wer, cer)

            if key == "WER_LM":
                wer_lm_ = value.split("=")[-1]
                wer_lm, cer_lm = wer_lm_.split("/")

                beam = value.split(",")[0].split("=")[-1]
                alpha = value.split(",")[1].split("=")[-1]
                beta = value.split(",")[2].split("=")[-1].split(":")[0]

        final_entries.append(
            {
                "tokenizer": tokenizer,
                "tokens": tokens,
                "model_path": model_path,
                "model_name": model_name,
                "model_type": model_type,
                "dataset_manifest_path": dataset_manifest_path,
                "dataset": dataset,
                "wer": wer,
                "cer": cer,
                "wer_lm": wer_lm,
                "cer_lm": cer_lm,
                "beam": beam,
                "alpha": alpha,
                "beta": beta,
            }
        )
    return final_entries


# In[67]:


if __name__ == "__main__":
    filename = sys.argv[1]
    output_filename = sys.argv[2]
    logs = parse_benchmark_logs(filename)
    df = pd.DataFrame(logs)
    df.to_csv(output_filename + ".csv", index=False)
