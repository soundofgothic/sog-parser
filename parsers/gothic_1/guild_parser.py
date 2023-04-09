import re
import json
import sys
import pathlib
from parsers.utils import extract_sounds, extract_sounds_from_text, load_npcs

basepath = pathlib.Path(__file__).parent.resolve() / '../..'
scripts_path = basepath / 'sources/gothic_1/PrjGothic/Story/B'
output_path = basepath / 'results/gothic_1/guild_waves.json'

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


sources = [{
    "npc_types": ["npctype_ambient", "npctype_guard"],
    "guilds": {
        "GIL_VLK": [
            "Info_Vlk_1_EXIT.d",
            "Info_Vlk_2_EXIT.d",
            "Info_Vlk_3_EXIT.d",
            "Info_Vlk_4_EXIT.d"
        ],
        "GIL_GRD": [
            "Info_grd_6_EXIT.d",
            "Info_grd_7_EXIT.d",
            "Info_grd_13_EXIT.d"
        ],
        "GIL_STT": [
            "Info_Stt_10_EXIT.d",
            "Info_Stt_12_EXIT.d"
        ],
        "GIL_SFB": [
            "Info_SFB_1_EXIT.d",
            "Info_SFB_2_Pre.d",
            "Info_SFB_5_Pre.d"
        ],
        "GIL_NOV": [
            "Info_Nov_2_EXIT.d",
            "Info_Nov_3_EXIT.d",
            "Info_Nov_5_EXIT.d"
        ],
        "GIL_TPL": [
            "Info_Tpl_8_EXIT.d",
            "Info_Tpl_13_EXIT.d"
        ],
        "GIL_BAU": [
            "Info_Bau_2_EXIT.d",
            "Info_Bau_4_EXIT.d",
            "Info_Bau_9_EXIT.d"
        ],
        "GIL_ORG": [
            "Info_Org_6_EXIT.d",
            "Info_Org_7_EXIT.d",
            "Info_Org_13_EXIT.d"
        ],
        "GIL_SLD": [
            "Info_Sld_8_EXIT.d",
            "Info_Sld_11_EXIT.d"
        ]
    }
}, {
    "npc_types": ["Npctype_MINE_Ambient", "NpcType_MINE_Guard"],
    "guilds": {
        "GIL_VLK": [
            "Info_Mine_Vlk_1_EXIT.d",
            "Info_Mine_Vlk_2_EXIT.d",
            "Info_Mine_Vlk_3_EXIT.d",
            "Info_Mine_Vlk_4_EXIT.d"
        ],
        "GIL_GRD": [
            "Info_Mine_Grd_6_EXIT.d",
            "Info_Mine_Grd_7_EXIT.d",
            "Info_Mine_Grd_13_EXIT.d"
        ],
        "GIL_SLD": [
            "Info_Mine_Sld_8_EXIT.d",
            "Info_Mine_Sld_11_EXIT.d"
        ],
        "GIL_ORG": [
            "Info_Mine_Org_6_EXIT.d",
            "Info_Mine_Org_7_EXIT.d",
            "Info_Mine_Org_13_EXIT.d"
        ]
    }
}]

extra_infos = [
    "Info_FindNPC_NC.d",
    "Info_FindNPC_OC.d",
    "Info_FindNPC_ST.d",
]



def extract_extras():
    total = {}
    by_script = {info: None for info in extra_infos}
    for script in extra_infos:
        extras, pc_hero_questions = parse_single_script(scripts_path / script)
        by_script[script] = {
            "answers": extras,
            "questions": pc_hero_questions
        }
        total.update(extras)
    return total, by_script


def main():
    npcs = load_npcs()

    extras, by_script = extract_extras()

    texts_per_file = {}
    extra_per_file = {}
    for source in sources:
        for guild_name, guild in source["guilds"].items():
            for file in guild:
                texts_per_file[file], extra_per_file[file] = extract_sounds_with_dependancy(scripts_path / file)
                for wave in texts_per_file[file]:
                    wave["target"] = {
                        "guild": guild_name,
                        "npc_types": source["npc_types"]
                    }

    for npc in npcs.values():
        for source in sources:
            if 'NPC_TYPE' in npc and npc['NPC_TYPE'] in source["npc_types"]:
                if npc['guild_short'] in source["guilds"]:
                    files = source["guilds"][npc['guild_short']]
                    for file in files:
                        for meta in texts_per_file[file]:
                            if meta["voice"] == npc["voice_id"]:
                                meta["npcs"].add(npc["INSTANCE_NAME"])
                            if extra_per_file[file] is not None:
                                if npc["guild_short"] in extras:
                                    for info in extras[npc["guild_short"]]:
                                        if info["voice"] == npc["voice_id"]:
                                            info["npcs"].add(npc["INSTANCE_NAME"])

    waves = []
    for recordings in texts_per_file.values():
        for recording in recordings:
            recording["npcs"] = list(recording["npcs"])
            waves.append(recording)
    for guild, extra in extras.items():
        for info in extra:
            info["npcs"] = list(info["npcs"])
            info["target"] = {
                "guild": guild
            }
            waves.append(info)

    with open(output_path, 'wb') as output:
        output.write(json.dumps(waves, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
