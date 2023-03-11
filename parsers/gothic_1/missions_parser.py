import os
import re
import json
import sys
import utils

source_folder = '../../PrjGothic/Story/MISSIONS'
excluded_files = [
    'DIA_extro_avi.d'
]

output_file = '../../results/gothic_1/mission_waves.json'


def get_npc_from_mission(file):
    with open(file, 'r', encoding='Windows-1250') as src:
        text = src.read()
    try:
        npc = re.search(r"npc[\s]*=[\s]*[A-Za-z0-9_]+", text).group().split(" ")[-1]
        return npc
    except:
        print(f"Could not get npc from {file}")


def main():
    files = list(filter(lambda f: f.endswith('.d'), os.listdir(source_folder)))
    npcs = utils.load_npcs()
    npcs_dict = {npc["INSTANCE_NAME"]: npc for npc in npcs.values()}
    total_waves = []
    for file in files:
        if file not in excluded_files:
            waves = utils.extract_sounds(source_folder + '/' + file)
            npc = get_npc_from_mission(source_folder + '/' + file)
            if npc in npcs_dict:
                for wave in waves:
                    if wave["source"] == 'self':
                        wave["npcs"].add(npc)
                    else:
                        wave["target"] = [npc]
                total_waves.extend(waves)
            else:
                print(f"Could not find npc {npc} {file}")
    for wave in total_waves:
        wave["npcs"] = list(wave["npcs"])

    with open(output_file, 'wb') as output:
        output.write(json.dumps(total_waves, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
