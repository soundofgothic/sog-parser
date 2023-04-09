import os
import re
import json
import pathlib

basepath = pathlib.Path(__file__).parent.resolve() / '../..'
source_folder = basepath / 'sources/gothic_1/PrjGothic/Story/NPC'
names_path = basepath / 'sources/gothic_1/PrjGothic/Story/Text.d'
output_json = basepath / 'results/gothic_1/npc.json'
excluded_files = [
    'CS_Eskorte5.d',
    'CS_Eskorte6.d',
    'GRD_230_Gardist.d',
    'NOV_1313_Novize.d',
    'NOV_1328_Novize.d',
    'PC_Rockefeller.d',
    'SLD_738_Soeldner.d',
    'STT_336_Schatten.d'
]

extra_npc = {
    'XardasDemon': {
        'INSTANCE_NAME': 'XardasDemon',
        'STR': 75,
        'DEX': 75,
        'MANA': 300,
        'NPC_TYPE': 'npctype_friend',
        'HP': 300,
        'voice_id': -1,
        'id': -1,
        'guild_short': "GIL_DEMON",
        'lvl': 50,
        'name': "Demon ognia",
        '1H': None,
        '2H': None,
        'CROSSBOW': None,
        'BOW': None,
        'MAGIC': None,
        'SNEAK': None,
        'G': 1
    },
    'FreemineOrc': {
        'INSTANCE_NAME': 'FreemineOrc',
        'STR': 90,
        'DEX': 20,
        'MANA': None,
        'NPC_TYPE': None,
        'HP': 250,
        'voice_id': 17,
        'id': 2101,
        'guild_short': "GIL_None",
        'lvl': 3,
        'name': "Ork-Niewolnik",
        '1H': None,
        '2H': None,
        'CROSSBOW': None,
        'BOW': None,
        'MAGIC': None,
        'SNEAK': None,
        'G': 1
    }
}


def read_names():
    with open(names_path, 'r', encoding='Windows-1250') as src:
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


def guilds():
    return [
        "(brak)",
        "Magnat",
        "Strażnik",
        "Cień",
        "Mag Ognia",
        "Kopacz",
        "Mag Wody",
        "Najemnik",
        "Szkodnik",
        "Zbieracz",
        "Kret",
        "Guru",
        "Nowicjusz",
        "Strażnik Świątynny",
        "Nekromanta",
        "Babka",
        "",
        "Jaszczur",
        "Śniący",
        "Goblin",
        "Troll",
        "Zębacz",
        "Pełzacz",
        "Chrząszcz",
        "Ścierwojad",
        "Demon",
        "Wilk",
        "Cieniostwór",
        "Krwiopijca",
        "Wąż błotny",
        "Zombi",
        "Ork-Zombi",
        "Szkielet",
        "Orkowy pies",
        "Kretoszczur",
        "Golem",
        "Topielec",
        "",
        "Ork-Szaman",
        "Ork-Wojownik",
        "Ork-Zwiadowca",
        "Ork-Niewolnik"
    ]


def guild_constants():
    return {
        "GIL_None": 0,
        "GIL_EBR": 1,
        "GIL_GRD": 2,
        "GIL_STT": 3,
        "GIL_KDF": 4,
        "GIL_VLK": 5,
        "GIL_KDW": 6,
        "GIL_SLD": 7,
        "GIL_ORG": 8,
        "GIL_BAU": 9,
        "GIL_SFB": 10,
        "GIL_GUR": 11,
        "GIL_NOV": 12,
        "GIL_TPL": 13,
        "GIL_DMB": 14,
        "GIL_BAB": 15,
        "GIL_SEPERATOR_HUM": 16,
        "GIL_WARAN": 17,
        "GIL_SLF": 18,
        "GIL_GOBBO": 19,
        "GIL_TROLL": 20,
        "GIL_SNAPPER": 21,
        "GIL_MINECRAWLER": 22,
        "GIL_MEATBUG": 23,
        "GIL_SCAVENGER": 24,
        "GIL_DEMON": 25,
        "GIL_WOLF": 26,
        "GIL_SHADOWBEAST": 27,
        "GIL_BLOODFLY": 28,
        "GIL_SWAMPSHARK": 29,
        "GIL_ZOMBIE": 30,
        "GIL_UNDEADORC": 31,
        "GIL_SKELETON": 32,
        "GIL_ORCDOG": 33,
        "GIL_MOLERAT": 34,
        "GIL_GOLEM": 35,
        "GIL_LURKER": 36,
        "GIL_SEPERATOR_ORC": 37,
        "GIL_ORCSHAMAN": 38,
        "GIL_ORCWARRIOR": 39,
        "GIL_ORCSCOUT": 40,
        "GIL_ORCSLAVE": 41,
        "GIL_MAX": 42
    }


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

    def talent_skill(talent):
        try:
            skill_line = line(talent)
            start_pos = skill_line.find(talent)
            value = re.search(r",( )*\d+", skill_line[start_pos:]).group(0).replace(',', '')
            return value
        except StopIteration:
            return None

    def name():
        pre_name = attribute(r'name\[0\]')

    npc = {
        'INSTANCE_NAME': instance(),
        'STR': attribute(r'ATR_STRENGTH'),
        'DEX': attribute(r'ATR_DEXTERITY'),
        'MANA': attribute(r'ATR_MANA_MAX'),
        'NPC_TYPE': attribute(r'npcType'),
        'HP': attribute(r'ATR_HITPOINTS_MAX'),
        'voice_id': attribute(r'voice'),
        'id': attribute(r'id( )*='),
        'guild_short': attribute(r'guild( )*='),
        'lvl': attribute(r'level'),
        'name': attribute(r'name').replace('"', ''),
        '1H': talent_skill(r'NPC_TALENT_1H'),
        '2H': talent_skill(r'NPC_TALENT_2H'),
        'CROSSBOW': talent_skill(r'NPC_TALENT_CROSSBOW'),
        'BOW': talent_skill(r'NPC_TALENT_BOW'),
        'MAGIC': talent_skill(r'NPC_TALENT_MAGE'),
        'SNEAK': talent_skill(r'NPC_TALENT_SNEAK'),
        'G': 1
    }

    nulls = list(map(lambda key: key, filter(lambda key: npc[key] is None, npc)))
    for null in nulls:
        del npc[null]
    return npc


def process_npc_file(file):
    with open(file, 'r', encoding='Windows-1250') as src:
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
        if 'guild_short' not in npcs[npc]:
            npcs[npc]['guild_short'] = 'GIL_TPL'
        guild_short = npcs[npc]['guild_short']
        npcs[npc]['guild'] = guilds()[guild_constants()[guild_short]]
        npcs[npc]['guild_id'] = guild_constants()[guild_short]
    with open(output_json, 'wb') as output:
        output.write(json.dumps(npcs, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
