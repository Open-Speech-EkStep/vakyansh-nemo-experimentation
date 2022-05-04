import pandas as pd
import glob
import sox
from tqdm import tqdm
from joblib import Parallel, delayed
import json
import sys
import os

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
        local_obj = {
        "audio_filepath": wav_file,
        "duration": duration,
        "text": transcript
        }
        return local_obj
    except:
        print(local_file_id)
        return


if __name__ == "__main__":
    list_files = []
    location_files = sys.argv[1]
    manifest_location = sys.argv[2]

    files = glob.glob(f'{location_files}/**/*.wav', recursive=True)
    list_files.extend(Parallel(n_jobs=-1)(delayed(create_manifest)(file) for file in tqdm(files)))
    total_duration = 0

    with open(f'{manifest_location}_manifest.json', mode='w+') as file:
        for local_dict in list_files:
            if local_dict:
                json.dump(local_dict, file)
                file.write('\n')

    for local_dict in list_files:
        if local_dict:
            total_duration = total_duration + local_dict['duration']

    print(f"Total Duration: {total_duration/3600}")


