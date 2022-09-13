import pandas as pd
import glob
import sox
from tqdm import tqdm
from joblib import Parallel, delayed
import json
import sys
import os
import pandas as pd
from indicnlp.tokenize.indic_tokenize import trivial_tokenize
from indicnlp.normalize.indic_normalize import IndicNormalizerFactory

lang = 'hi'
normalizer = IndicNormalizerFactory().get_normalizer(lang)

def normalize_text(sent):
    normalized = normalizer.normalize(sent)
    processed = ' '.join(trivial_tokenize(normalized, lang))
    return processed

def create_manifest(lfile):
    local_file_id = os.path.abspath(lfile)[:-4]
    wav_file = local_file_id + '.wav'
    txt_file = local_file_id + '.txt'
    
    if 'rejected' in local_file_id:
        return
    try:
        with open(txt_file) as t_file:
            transcript = t_file.read()
        duration = sox.file_info.duration(wav_file)
        if duration > 30: ## added for validation set
            return

        local_obj = {
        "audio_filepath": wav_file,
        "duration": duration,
        "text": normalize_text(transcript.strip()).strip()
        }
        return local_obj
    except:
        print(local_file_id)
        return


if __name__ == "__main__":
    list_files = []
    location_files = sys.argv[1]
    manifest_location = sys.argv[2]
    if len(sys.argv) == 4:
        filtered_data = sys.argv[3]
    else:
        filtered_data=None

    files = glob.glob(f'{location_files}/**/*.wav', recursive=True)
    if filtered_data:    
        df = pd.read_csv(filtered_data)
        df['path'] =df['path'].str.replace('/home/jupyter/stt_cleaned_data/train','/root/Data/hindi/train/hindi_stt_clean')
        valid_paths = df['path'].values
        print(valid_paths[0:5])
        print(files[-5:])
        filtered_files = list(set(files).intersection(set(valid_paths)))
        for file in tqdm(files):
            if 'hindi_other_clean' in file:
                filtered_files.append(file)
        print(f"Total files were {len(files)}")
        print(f"Valid files are {len(valid_paths)}")
        print(f"Filtered files are {len(filtered_files)}")
    else:
        filtered_files = files

    list_files.extend(Parallel(n_jobs=-1)(delayed(create_manifest)(file) for file in tqdm(filtered_files, desc='Manifest') ))
    total_duration = 0

    with open(f'{manifest_location}_manifest.json', mode='w+') as file:
        for local_dict in list_files:
            if local_dict:
                json.dump(local_dict, file)
                file.write('\n')

    count_files =0
    for local_dict in list_files:
        if local_dict:
            total_duration = total_duration + local_dict['duration']
            count_files = count_files + 1

    print(f"Total Duration: {total_duration/3600} over {count_files} files.")


