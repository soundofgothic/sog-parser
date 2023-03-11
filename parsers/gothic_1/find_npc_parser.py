import re
import sys
sys.path.append('..')
from utils import extract_sounds_from_text, load_npcs

scripts_gothic_1 = {
    "../../PrjGothic/Story/B/Info_FindNPC_NC.d",
    "../../PrjGothic/Story/B/Info_FindNPC_OC.d",
    "../../PrjGothic/Story/B/Info_FindNPC_ST.d"
}

npcs = load_npcs()
count = 0

def parse_single_script(script):
    global count
    with open(script, 'r', encoding='Windows-1250') as src:
        text = src.read()
    affected_guilds = list(re.finditer(r'self\.guild[\s]*==[\s*]\w+', text))
    splits = [*list(map(lambda l: l.span()[0], affected_guilds)), len(text)]
    for idx, split in enumerate(splits[:-1]):
        section = text[split:splits[idx + 1]]
        guild = re.search(r'==[\s]*\w+', affected_guilds[idx].group()).group().split()[1]
        waves = extract_sounds_from_text(section, script)
        for wave in waves:
            wave["target"] = {
                "guild": guild
            }
            correct_npcs = list(filter(lambda npc: npc["voice_id"] == wave["voice"] and npc["guild_short"] == guild, npcs.values()))
            wave["npcs"] = correct_npcs



def main():
    for script in scripts_gothic_1:
        parse_single_script(script)


if __name__ == "__main__":
    main()
