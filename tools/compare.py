import json
import pathlib

basepath = pathlib.Path(__file__).parent.resolve()

def old_recordings():
    with open(basepath / "../2020dump.json", 'r', encoding='utf8') as file:
        for line in file:
            yield json.loads(line)


def new_recordings():
    with open(basepath / "../results/waves.json", 'r', encoding='utf8') as file:
        for entry in json.load(file):
            yield entry


gothic_1 = filter(lambda f: f["g"] == "1", old_recordings())
filenames = map(lambda f: f["filename"], gothic_1)
uppercased = map(lambda f: f.upper(), filenames)

old_files = set(uppercased)
old_files_list = list(old_files)

new_files = set(map(lambda f: f["wave"].upper(), new_recordings()))
new_files_list = list(new_files)

for file in old_files_list:
    if file not in new_files:
        print(f"Recording {file} is not in new set")

g1_map = {}
for rec in old_recordings():
    g1_map[rec["filename"].upper()] = rec

g1_map_not_found = {}
for file in new_files_list:
    if file not in old_files:
        print(f"Recording {file} is not in old set")
        g1_map_not_found[file] = g1_map[file]

print("-----")

print(json.dumps(g1_map_not_found, indent=2))

