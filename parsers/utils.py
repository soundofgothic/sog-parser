import re
import json
import pathlib
basepath = pathlib.Path(__file__).parent.resolve()



def extract_sounds(file_path, gothic_version='1'):
    with open(file_path, 'r', encoding='Windows-1250') as src:
        text = src.read()

    return extract_sounds_from_text(text, file_path, gothic_version)


def extract_sounds_from_text(text, file_path, gothic_version='1'):
    occurrences = re.findall(r'AI_Output\([ \n]*\w+[ \n]*,[ \n]*\w+[ \n]*,\"[a-zA-Z0-9_ß]+\"\);[\s]*[//]{2}.*', text)
    occurrences_test = re.findall(r'AI_Output', text)
    assert len(occurrences) == len(
        occurrences_test), f"There is output in different format than expected in {file_path}"

    def occurrence_mapper(line):
        try:
            self_pos = re.search('self', line).span()[0]
            if re.search('other', line):
                other_pos = re.search('other', line).span()[0]
            elif re.search('hero', line):
                other_pos = re.search('hero', line).span()[0]
            else:
                other_pos = re.search('NULL', line).span()[0]

            wave = re.search('\"[a-zA-Z0-9_ß]+\"', line).group()[1:-1]
            translation = re.search('//.*', line).group()[2:]
            if re.search('[0-9]{2}_[0-9]{2}', line):
                voices = [voice[1:] if voice.startswith("0") else voice for voice in
                          re.search('[0-9]{2}_[0-9]{2}', line).group().split('_')]
            elif re.search('[0-9]+', line):
                voices = [re.search('[0-9]+', line).group() for _ in range(2)]

            meta = {
                "wave": wave,
                "text": translation,
                "source_file": file_path.split('/')[-1],
                "npcs": set(),
                "G": gothic_version
            }
            if self_pos < other_pos:
                meta["source"] = "self"
                meta["voice"] = voices[0]
            else:
                meta["source"] = "hero"
                meta["voice"] = "0"
                meta["npcs"].add("PC_HERO")

            return meta
        except AttributeError:
            print(f"Error in line: {line}")
            raise Exception

    return list(map(occurrence_mapper, occurrences))


def load_npcs():
    with open(basepath / "../results/gothic_1/npc.json", 'r') as src:
        npcs = json.load(src)
    return npcs

def load_guilds():
    with open(basepath / "../results/gothic_1/npc.json", 'r') as src:
        guilds = json.load(src)
    return guilds

def load_npcs_2():
    with open("../../results/gothic_2/npc.json", 'r', encoding='utf8') as src:
        npcs = json.load(src)
    return npcs
