import pathlib
import json
from parsers.gothic_1.npc_parser import guilds, guild_constants

basepath = pathlib.Path(__file__).parent.resolve()



def main():
    with open(basepath / "data.sql", 'w') as file:
        # GAMES
        file.write("INSERT INTO games (id, name) VALUES (1, 'Gothic 1');\n")

        # VOICES

        voices = {
            1: "Łukasz Nowicki",
            2: "Paweł Iwanicki",
            3: "Jacek Sołtysiak",
            4: "Andrzej Tomecki",
            5: "Paweł Szczesny",
            6: "Marek Obertyn",
            7: "Robert Tondera",
            8: "Jacek Kopczyński",
            9: "Przymysław Nikiel",
            10: "Janusz Wituch",
            11: "Adam Bauman",
            12: "Jarosław Domin",
            13: "Piotr Bąk",
            14: "Tomasz Marzecki",
            15: "Jacek Mikołajczak",
            16: "Agata Gawrońska",
            17: "Mirosław Zbrojewicz",
        }

        for id, name in voices.items():
            file.write(f"INSERT INTO voices (id, name) VALUES ({id}, '{name}');\n")
            file.write(f"INSERT INTO games_voices (game_id, voice_id, in_game_id) VALUES (1, {id}, {id});\n")

        for name, gconstant in zip(guilds(), guild_constants().items()):
            file.write(f"INSERT INTO guilds (id, name, in_game_id, in_game_alias, game_id) VALUES ({gconstant[1]}, '{name}', {gconstant[1]}, '{gconstant[0]}', 1);\n")

        npc_map = {}
        with open(basepath / "../../results/gothic_1/npc.json", 'r') as npc_file:
            npcs = json.load(npc_file)
            for npc in npcs.values():
                guild_id = guild_constants()[npc['guild_short']]
                name = npc['name'].replace("'", "''")
                npc_map[npc['INSTANCE_NAME']] = npc['id']
                file.write(f"INSERT INTO npcs (id, name, in_game_id, in_game_alias, game_id, voice_id, guild_id) VALUES ({npc['id']}, '{name}', {npc['id']}, {npc['INSTANCE_NAME']}, {npc['voice_id']}, {guild_id});\n")

        source_file_map = {}

        def load_source_files(file_path, file_type):
            nonlocal source_file_map
            nonlocal file
            with open(basepath / file_path, 'r') as source_file:
                records = json.load(source_file)
                records_set = set()
                for record in records:
                    records_set.add(record['source_file'])

            source = enumerate(records_set, 1)
            for idx, source_file in source:
                source_file_map[source_file] = idx
                file.write(f"INSERT INTO source_files (id, name, type, game_id) VALUES ({idx}, '{source_file}', '{file_type}', 1);\n")

        load_source_files("../../results/gothic_1/guild_waves.json", "guild")
        load_source_files("../../results/gothic_1/mission_waves.json", "mission")
        load_source_files("../../results/gothic_1/svm_waves.json", "svm")

        with open(basepath / "../../results/gothic_1/guild_waves.json", 'r') as guild_file:
            records = json.load(guild_file)

        insert_line = "INSERT INTO recordings (wave, transcipt, game_id, source_file_id, voice_id, guild_id, npc_id, title) VALUES ('{}', '{}', {}, {}, {}, {}, {}, {});\n"

        for record in records:
            text = record['text'].replace("'", "''")
            guild_id = guild_constants()[record['target']['guild']]
            voice_id = record['voice'] if record['voice'] != '0' else '15'
            file.write(insert_line.format(record['wave'], text, 1, source_file_map[record['source_file']], voice_id, guild_id, 'null', 'null'))

        with open(basepath / "../../results/gothic_1/mission_waves.json", 'r') as mission_file:
            records = json.load(mission_file)
        
        for record in records:
            text = record['text'].replace("'", "''")
            voice_id = record['voice'] if record['voice'] != '0' else '15'
            assert len(record['npcs']) == 1
            npc_id = npc_map[record['npcs'][0] if record['source'] == 'self' else 'PC_Hero']
            file.write(insert_line.format(record['wave'], text, 1, source_file_map[record['source_file']], voice_id, 'null', npc_id, 'null'))

        with open(basepath / "../../results/gothic_1/svm_waves.json", 'r') as svm_file:
            records = json.load(svm_file)

        for record in records:
            text = record['text'].replace("'", "''")
            voice_id = record['voice'] if record['voice'] != '0' else '15'
            file.write(insert_line.format(record['wave'], text, 1, source_file_map[record['source_file']], voice_id, 'null', npc_id, record['title']))




        
if __name__ == '__main__':
    main()