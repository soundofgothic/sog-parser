import re
import json
import pathlib
from parsers.utils import extract_sounds, extract_sounds_from_text

basepath = pathlib.Path(__file__).parent.resolve() / '../..'

base_path = basepath / 'sources/gothic_2/PrjGOTHIC/Story/B_AssignAmbientInfos'
npc_path = basepath / 'results/gothic_2/npc.json'
output_path = basepath / 'results/gothic_2/guild_waves.json'

def parse_single_script(script):
    with open(script, 'r', encoding='Windows-1250') as src:
        text = src.read()
    affected_guilds = list(re.finditer(r'self\.guild[\s]*==[\s*]\w+', text))
    splits = [*list(map(lambda l: l.span()[0], affected_guilds)), len(text)]
    guild_dict = {}
    from_guilds_waves = []
    for idx, split in enumerate(splits[:-1]):
        section = text[split:splits[idx + 1]]
        guild = re.search(r'==[\s]*\w+', affected_guilds[idx].group()).group().split()[1]
        waves = extract_sounds_from_text(section, script)

        if guild in guild_dict:
            guild_dict[guild].extend(waves)
        else:
            guild_dict[guild] = waves

        from_guilds_waves.extend(waves)

    pc_hero_sounds = list(filter(lambda wave: len(wave["npcs"]) > 0, extract_sounds(script)))

    return guild_dict, pc_hero_sounds

def extract_sounds_with_dependancy(script):
    waves = extract_sounds(script)

    with open(script, 'r', encoding='Windows-1250') as src:
        text = src.read()

    new_camp_infos = re.search(r'B_AssignFindNpc_NC', text)
    old_camp_infos = re.search(r'B_AssignFindNpc_OC', text)
    swamp_camp_infos = re.search(r'B_AssignFindNpc_ST', text)

    try:
        return waves, next(
            (info.group() for info in [new_camp_infos, old_camp_infos, swamp_camp_infos] if info is not None))
    except StopIteration:
        return waves, None

sources = [
    {
        "npc_type": "NPCTYPE_AMBIENT",
        "guilds": {
            "GIL_VLK": [
                "B_AssignAmbientInfos_VLK_1",
                "B_AssignAmbientInfos_VLK_6",
                "B_AssignAmbientInfos_VLK_8",
                "B_AssignAmbientInfos_VLK_16",
                "B_AssignAmbientInfos_VLK_17"
            ],
            "GIL_MIL": [
                "B_AssignAmbientInfos_MIL_6",
                "B_AssignAmbientInfos_MIL_7"
            ],
            "GIL_PAL": [
                "B_AssignAmbientInfos_PAL_4",
                "B_AssignAmbientInfos_PAL_9",
                "B_AssignAmbientInfos_PAL_12"
            ],
            "GIL_BAU": [
                "B_AssignAmbientInfos_BAU_1",
                "B_AssignAmbientInfos_BAU_7",
                "B_AssignAmbientInfos_BAU_13",
                "B_AssignAmbientInfos_BAU_16"
            ],
            "GIL_SLD": [
                "B_AssignAmbientInfos_SLD_6",
                "B_AssignAmbientInfos_SLD_7"
            ],
            "GIL_NOV": [
                "B_AssignAmbientInfos_NOV_3",
                "B_AssignAmbientInfos_NOV_8"
            ],
            "GIL_PIR": [
                "B_AssignAmbientInfos_Addon_PIR_6",
                "B_AssignAmbientInfos_Addon_PIR_7"
            ],
            "GIL_OUT": [
                "B_AssignAmbientInfos_OUT_1",
                "B_AssignAmbientInfos_OUT_7",
                "B_AssignAmbientInfos_OUT_13"
            ],
        }
    },
    {
        "npc_type": "NPCTYPE_OCAMBIENT",
        "guilds": {
            "GIL_MIL": [
                "B_AssignAmbientInfos_OcVLK_1",
                "B_AssignAmbientInfos_OcVLK_6"
            ],
            "GIL_PAL": [
                "B_AssignAmbientInfos_OcPAL_4",
                "B_AssignAmbientInfos_OcPAL_9"
            ],
            "GIL_OUT": [
                "B_AssignAmbientInfos_OwPAL_4"
            ]
        }
    },
    {
        "npc_type": ["NPCTYPE_OCAMBIENT", "NPCTYPE_OCAMBIENT"],
        "guilds": {
            "GIL_STRF": [
                "B_AssignAmbientInfos_STRF_1",
                "B_AssignAmbientInfos_STRF_13"
            ],
            "GIL_BDT": [
                "B_AssignAmbientInfos_BDT_1",
                "B_AssignAmbientInfos_BDT_13"
            ],
            "GIL_DMT": {
                "B_AssignDementorTalk"
            }
        }
    },
    {
        "npc_type": ["NPCTYPE_BL_AMBIENT"],
        "guilds": {
            "GIL_STRF": [
                "B_AssignAmbientInfos_Addon_Sklaven_3"
            ],
            "GIL_BDT": [
                "B_AssignAmbientInfos_Addon_BL_BDT_1",
                "B_AssignAmbientInfos_Addon_BL_BDT_13"
            ]
        }
    },
    {
        "npc_type": ["NPCTYPE_TAL_AMBIENT"],
        "guilds": {
            "GIL_BDT": [
                "B_AssignAmbientInfos_Addon_TAL_BDT_1",
                "B_AssignAmbientInfos_Addon_TAL_BDT_13"
            ]
        }
    }
]

def main():
    with open(npc_path, 'r', encoding='utf8') as src:
        npcs = json.load(src)

    texts_per_file = {}
    for source in sources:
        for guild_name, guild in source["guilds"].items():
            for file in guild:
                texts_per_file[file] = extract_sounds(base_path / (file + '.d'))
                for wave in texts_per_file[file]:
                    wave["target"] = {
                        "guild": guild_name,
                        "npc_types": source["npc_type"]
                    }

    for npc in npcs.values():
        for source in sources:
            if 'NPC_TYPE' in npc and npc['NPC_TYPE'] in source["npc_type"]:
                if npc['guild_short'] in source["guilds"]:
                    files = source["guilds"][npc['guild_short']]
                    for file in files:
                        for meta in texts_per_file[file]:
                            if meta["voice"] == npc["voice_id"]:
                                meta["npcs"].add(npc["INSTANCE_NAME"])

    waves = []
    for recordings in texts_per_file.values():
        for recording in recordings:
            recording["npcs"] = list(recording["npcs"])
            waves.append(recording)

    with open(output_path, 'wb') as output:
        output.write(json.dumps(waves, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
