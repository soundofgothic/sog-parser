import os
import re
import json
from parsers.utils import load_npcs_2, extract_sounds

source_folder = './GameScripts/SolGothic2/PrjGOTHIC/Story/Dialoge'
excluded_files = [
    'DIA_extro_avi.d',
    'DIA_FH.d',
    'DIA_OrcElite_AntiPaladin1.d'
]

output_file = './results/gothic_2/mission_waves.json'


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
    npcs = load_npcs_2()
    npcs_dict = {npc["INSTANCE_NAME"]: npc for npc in npcs.values()}
    total_waves = []
    for file in files:
        if file not in excluded_files:
            waves = extract_sounds(source_folder + '/' + file)
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
