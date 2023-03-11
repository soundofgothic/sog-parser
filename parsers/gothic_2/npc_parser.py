import os
import re
import json

source_folder = '../../GameScripts/SolGothic2/PrjGOTHIC/Story/NPC'
names_path = '../../GameScripts/SolGothic2/PrjGOTHIC/Story/Text.d'
output_json = '../../results/gothic_2/npc.json'
excluded_files = []
extra_npc = {
    "Wisp_Detector": {
        "INSTANCE_NAME": "Wisp_Detector",
        "NPC_TYPE": "npctype_main",
        "voice_id": -1,
        "id": "-1",
        "guild_short": "GIL_BLOODFLY",
        "name": "Ognik",
        "G": 2,
    }
}


def guilds():
    return [
        "Brak przyn.",
        "Paladyn",
        "Strażnik",
        "Obywatel",
        "Mag",
        "Nowicjusz",
        "Łowca smoków",
        "Najemnik",
        "Farmer",
        "Bandyta",
        "Skazaniec",
        "Poszukiwacz",
        "Mieszkaniec",
        "Pirat",
        "Mag Wody",
        "D",
        "",
        "Chrząszcz",
        "Owca",
        "Goblin",
        "Szkielet-goblin",
        "Prz. szkielet-goblin",
        "Ścierwojad",
        "Olbrzymi szczur",
        "Polna bestia",
        "Krwiopijca",
        "Jaszczur",
        "Wilk",
        "Prz. Wilk",
        "Pełzacz",
        "Topielec",
        "Szkielet",
        "Prz. Szkielet",
        "Szkielet-mag",
        "Zombie",
        "Zębacz",
        "Cieniostwór",
        "Szkielet-potwór",
        "Harpia",
        "Kamienny golem",
        "Ognisty golem",
        "Lodowy golem",
        "Prz. golem",
        "Demon",
        "Prz. demon",
        "Troll",
        "Wąż błotny",
        "Smok",
        "Kretoszczur",
        "Aligator",
        "Błotny golem",
        "Strażnik",
        "Kamienna puma",
        "A",
        "Strażnik",
        "Zombie",
        "",
        "",
        "",
        "Ork",
        "Ork",
        "Ork-ożywieniec",
        "Smokowiec",
        "X",
        "Y",
        "Z"
    ]


def guild_constants():
    return {
        "GIL_NONE": 0,
        "GIL_HUMAN": 1,
        "GIL_PAL": 1,
        "GIL_MIL": 2,
        "GIL_VLK": 3,
        "GIL_KDF": 4,
        "GIL_NOV": 5,
        "GIL_DJG": 6,
        "GIL_SLD": 7,
        "GIL_BAU": 8,
        'GIL_BDT': 9,
        "GIL_STRF": 10,
        "GIL_DMT": 11,
        "GIL_OUT": 12,
        "GIL_PIR": 13,
        "GIL_KDW": 14,
        "GIL_EMPTY_D": 15,
        "GIL_PUBLIC": 15,
        "GIL_SEPERATOR_HUM": 16,
        "GIL_MEATBUG": 17,
        "GIL_SHEEP": 18,
        "GIL_GOBBO": 19,
        "GIL_GOBBO_SKELETON": 20,
        "GIL_SUMMONED_GOBBO_SKELETON": 21,
        "GIL_SCAVENGER": 22,
        "GIL_Giant_Rat": 23,
        "GIL_GIANT_BUG": 24,
        "GIL_BLOODFLY": 25,
        "GIL_WARAN": 26,
        "GIL_WOLF": 27,
        "GIL_SUMMONED_WOLF": 28,
        "GIL_MINECRAWLER": 29,
        "GIL_LURKER": 30,
        "GIL_SKELETON": 31,
        "GIL_SUMMONED_SKELETON": 32,
        "GIL_SKELETON_MAGE": 33,
        "GIL_ZOMBIE": 34,
        "GIL_SNAPPER": 35,
        "GIL_SHADOWBEAST": 36,
        "GIL_SHADOWBEAST_SKELETON": 37,
        "GIL_HARPY": 38,
        "GIL_STONEGOLEM": 39,
        "GIL_FIREGOLEM": 40,
        "GIL_ICEGOLEM": 41,
        "GIL_SUMMONED_GOLEM": 42,
        "GIL_DEMON": 43,
        "GIL_SUMMONED_DEMON": 44,
        "GIL_TROLL": 45,
        "GIL_SWAMPSHARK": 46,
        "GIL_DRAGON": 47,
        "GIL_MOLERAT": 48,
        "GIL_Alligator": 49,
        "GIL_SWAMPGOLEM": 50,
        "GIL_Stoneguardian": 51,
        "GIL_Gargoyle": 52,
        "GIL_Empty_A": 53,
        "GIL_SummonedGuardian": 54,
        "GIL_SummonedZombie": 55,
        "GIL_EMPTY_B": 56,
        "GIL_EMPTY_C": 57,
        "GIL_SEPERATOR_ORC": 58,
        "GIL_ORC": 59,
        "GIL_FRIENDLY_ORC": 60,
        "GIL_UNDEADORC": 61,
        "GIL_DRACONIAN": 62,
        "GIL_EMPTY_X": 63,
        "GIL_EMPTY_Y": 64,
        "GIL_EMPTY_Z": 65
    }


def read_names():
    with open(names_path, 'r') as src:
        lines = src.readlines()

    def line(pattern):
        return next(filter(lambda l: re.search(pattern, l) and l.strip().endswith(';'), lines))

    names = {}

    for l in lines:
        if re.search("const string NAME", l):
            left, right = l.split('=')
            name = left.strip().split(' ')[-1]
            value = right.replace('"', '').replace(';', '').strip()
            names[name] = value

    return names


def process_npc(lines):
    def line(pattern):
        return next(filter(lambda l: re.search(pattern, l) and l.strip().endswith(';'), lines))

    def instance():
        return re.search(r'[A-Za-z0-9_]+',
                         next(filter(lambda l: re.search(r"instance [A-Za-z0-9_]+", l), lines)).split()[1]).group()

    def attribute(header):
        try:
            return line(header).split('=')[1].replace(';', '').strip()
        except StopIteration:
            return None

    npc = {
        'INSTANCE_NAME': instance(),
        'NPC_TYPE': attribute(r'npcType'),
        'voice_id': attribute(r'voice'),
        'id': attribute(r'id( )*='),
        'guild_short': attribute(r'guild( )*='),
        'name': attribute(r'name').replace('"', ''),
        'G': 2
    }

    nulls = list(map(lambda key: key, filter(lambda key: npc[key] is None, npc)))
    for null in nulls:
        del npc[null]
    return npc


def process_npc_file(file):
    with open(file, 'r') as src:
        lines = src.readlines()

    splits = []
    last_idx = 0
    for idx, line in enumerate(lines):
        if re.match(r"[\s]*instance [A-Za-z0-9_]+\(Npc_Default\)\n", line):
            if last_idx != 0:
                splits.append(lines[last_idx:idx])
            last_idx = idx
    splits.append(lines[last_idx:])

    return [process_npc(lines) for lines in splits]


def main():
    files = list(filter(lambda f: f.endswith('.d'), os.listdir(source_folder)))
    npcs = {**extra_npc}
    for file in files:
        if file not in excluded_files:
            f_npcs = process_npc_file(os.path.join(source_folder, file))
            for npc in f_npcs:
                if npc['INSTANCE_NAME'] not in npcs:
                    npcs[npc['INSTANCE_NAME']] = npc
                else:
                    print(
                        f"Collision with {npc['INSTANCE_NAME']}: {npc['name']} vs {npcs[npc['INSTANCE_NAME']]['name']}")
                    print(f"File: {file} {npc['INSTANCE_NAME']} {npcs[npc['INSTANCE_NAME']]['INSTANCE_NAME']}")
    names = read_names()
    for npc in npcs:
        if npcs[npc]['name'] in names.keys():
            npcs[npc]['name'] = names[npcs[npc]['name']]
        guild_short = npcs[npc]['guild_short']
        npcs[npc]['guild'] = guilds()[guild_constants()[guild_short]]
        npcs[npc]['guild_id'] = guild_constants()[guild_short]
    with open(output_json, 'wb') as output:
        output.write(json.dumps(npcs, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
