import pathlib
import json
from dataclasses import dataclass
from parsers.gothic_1.npc_parser import guilds as guilds1, guild_constants as guild_constants1
from parsers.gothic_2.npc_parser import guilds as guilds2, guild_constants as guild_constants2

basepath = pathlib.Path(__file__).parent.resolve()


class Voices:
    voice_insert_line = "INSERT INTO voices (id, name) VALUES ({}, '{}');\n"
    game_voice_insert_line = "INSERT INTO games_voices (game_id, voice_id, in_game_id) VALUES ({}, {}, {});\n"

    g1voices = {
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
        16: "Agata Gawrońska-Bauman",
        17: "Mirosław Zbrojewicz",
    }

    g2voices = {
        1: "Andrzej Tomecki",
        3: "Jarosław Boberek",
        4: "Jacek Kopczyński",
        5: "Paweł Szczesny",
        6: "Marek Obertyn",
        7: ("Mirosław Zbrojewicz", "Jarosław Domin"),  # 2 osoby mają ten sam ID
        8: "Przymysław Nikiel",
        9: "Adam Bauman",  # za to jedna osoba ma 2 ID
        10: "Janusz Wituch",
        11: "Adam Bauman",  # za to jedna osoba ma 2 ID
        12: "Piotr Bąk",
        13: "Paweł Iwanicki",
        14: "Tomasz Marzecki",
        15: "Jacek Mikołajczak",
        16: "Kinga Ilgner",
        17: "Agata Gawrońska-Bauman",
        19: "Mirosław Zbrojewicz"
    }

    def __init__(self) -> None:
        self.voices_map = {}
        self.voices_counter = 1

    def add_voice_inserts(self, in_game_id, name, game) -> list:
        insert_lines = []

        if isinstance(name, tuple):
            names = name
        else:
            names = [name]

        for name in names:
            if name not in self.voices_map:
                self.voices_map[name] = self.voices_counter
                insert_lines.append(self.voice_insert_line.format(self.voices_counter, name))
                self.voices_counter += 1

            insert_lines.append(self.game_voice_insert_line.format(game, self.voices_map[name], in_game_id))

        return insert_lines

    def list_voices(self, game_id):
        if game_id == 1:
            return self.g1voices
        if game_id == 2:
            return self.g2voices
        
        assert False, f"Unknown game id: {game_id}"
        

    def resolve_id(self, game: int, voice_id: int, file_type: str = None, npc=None):
        voice_id = int(voice_id)
        voice_id = voice_id if voice_id != 0 else 15
        if game == 1:
            if voice_id not in self.g1voices:
                print(f"Voice id {voice_id} not found in g1 voices")
                return -1
            return self.voices_map[self.g1voices[voice_id]]
        elif game == 2:
            if voice_id not in self.g2voices:
                print(f"Voice id {voice_id} not found in g2 voices")
                return -1
            
            value = self.g2voices[voice_id]
            if isinstance(value, tuple):
                if file_type == 'guild' or file_type == 'svm':
                    return self.voices_map[value[1]]
                if file_type == 'mission':
                    if npc in {"Biff", "Jorgen", "Keroloth", "Grimbald", "Meldor", "Rangar", "Tengron", "Morgahard"}:
                        return self.voices_map[value[0]]
                    else:
                        return self.voices_map[value[1]]

                assert False, f"Unknown file type: {file_type}"

            return self.voices_map[value]


class Guilds:
    guild_insert_line = "INSERT INTO guilds (id, name, in_game_id, in_game_alias, game_id) VALUES ({}, '{}', {}, '{}', {});\n"

    def __init__(self) -> None:
        self.guilds = {}
        self.counter = 1

    def add_guild_inserts(self, game) -> list:
        insert_lines = []
        guilds = guilds2() if game == 2 else guilds1()
        guild_constants = guild_constants2() if game == 2 else guild_constants1()

        for name, gconstant in zip(guilds, guild_constants.items()):
            self.guilds[(game, gconstant[0])] = self.counter
            insert_lines.append(self.guild_insert_line.format(self.counter, name, gconstant[1], gconstant[0], game))
            self.counter += 1

        return insert_lines
    
    def resolve_id(self, game, guild_constant):
        return self.guilds[(game, guild_constant)]
    
class Npcs:
    npc_insert_line = "INSERT INTO npcs (id, name, in_game_id, in_game_alias, game_id, voice_id, guild_id) VALUES ({}, '{}', {}, {}, {}, {});\n"

    def __init__(self, guilds: Guilds, voices: Voices) -> None:
        self.guilds = guilds
        self.voices = voices
        self.npcs = {}
        self.npc_names = {}
        self.counter = 1

    def add_npc_inserts(self, game, file_path) -> list:
        insert_lines = []

        with open(basepath / file_path, 'r', encoding='utf8') as npc_file:
            npcs = json.load(npc_file)
        
        for npc in npcs.values():
            self.npcs[(game, npc['INSTANCE_NAME'])] = self.counter
            self.npc_names[(game, npc['INSTANCE_NAME'])] = npc['name']
            self.counter += 1
            guild_id = self.guilds.resolve_id(game, npc['guild_short'])
            voice_id = self.voices.resolve_id(game, npc['voice_id'], 'mission', npc['name'])
            name = npc['name'].replace("'", "''")
            insert_lines.append(self.npc_insert_line.format(self.counter, name, npc['id'], npc['INSTANCE_NAME'], game, voice_id, guild_id))

        return insert_lines
    
    def resolve_id(self, game, npc_constant):
        return self.npcs[(game, npc_constant)]
    
    def resolve_name(self, game, npc_constant):
        return self.npc_names[(game, npc_constant)]
    



class SourceFiles:
    def __init__(self) -> None:
        self.sources = {}
        self.counter = 1

    def add_source_file_inserts(self, game, file_path, file_type) -> list:
        insert_lines = []

        with open(basepath / file_path, 'r', encoding='utf8') as source_file:
            records = json.load(source_file)
            for record in records:
                if (game, record['source_file']) not in self.sources:
                    self.sources[(game, record['source_file'])] = self.counter
                    insert_lines += ["INSERT INTO source_files (id, name, type, game_id) VALUES ({}, '{}', '{}', {});\n".format(
                        self.counter, record['source_file'], file_type, game)]
                    self.counter += 1

        return insert_lines

    def resolve_id(self, game, source_file):
        return self.sources[(game, source_file)]


class Recordings:
    insert_line = "INSERT INTO recordings (wave, transcipt, game_id, source_file_id, voice_id, guild_id, npc_id, title) VALUES ('{}', '{}', {}, {}, {}, {}, {}, {});\n"

    def __init__(self, voices: Voices, guilds: Guilds, source_files: SourceFiles, npcs: Npcs) -> None:
        self.voices = voices
        self.guilds = guilds
        self.source_files = source_files
        self.npcs = npcs

    def add_recording_inserts(self, game, file_path, file_type) -> list:
        insert_lines = []

        with open(basepath / file_path, 'r', encoding='utf8') as file:
            records = json.load(file)

        match file_type:
            case 'guild':
                for record in records:
                    text = record['text'].replace("'", "''")
                    guild_id = self.guilds.resolve_id(game, record['target']['guild'])
                    voice_id = self.voices.resolve_id(game, record['voice'], file_type)
                    source_file_id = self.source_files.resolve_id(game, record['source_file'])
                    insert_lines.append(self.insert_line.format(record['wave'], text, game, source_file_id, voice_id, guild_id, 'null', 'null'))

            case 'mission':
                for record in records:
                    text = record['text'].replace("'", "''")
                    npc_instance_name = record['npcs'][0] if record['source'] == 'self' else 'PC_Hero'
                    npc_name = self.npcs.resolve_name(game, npc_instance_name)
                    npc_id = self.npcs.resolve_id(game, npc_instance_name)
                    voice_id = self.voices.resolve_id(game, record['voice'], file_type, npc_name)
                    source_file_id = self.source_files.resolve_id(game, record['source_file'])
                    insert_lines.append(self.insert_line.format(record['wave'], text, game, source_file_id, voice_id, 'null', npc_id, 'null'))

            case 'svm':
                for record in records:
                    text = record['text'].replace("'", "''")
                    voice_id = self.voices.resolve_id(game, record['voice'], file_type)
                    source_file_id = self.source_files.resolve_id(game, record['source_file'])
                    insert_lines.append(self.insert_line.format(record['wave'], text, game, source_file_id, voice_id, 'null', 'null', record['title']))

        return insert_lines

@dataclass
class GothicVersion:
    id: int
    name: str
    base_path: pathlib.Path

def process_gothic_version(gothicVersion: GothicVersion, voices: Voices, guilds: Guilds, source_files: SourceFiles, npcs: Npcs, recordings: Recordings):
    output = []

    output += [f"INSERT INTO games (id, name) VALUES ({gothicVersion.id}, '{gothicVersion.name}');\n"]

    voices_list = voices.list_voices(gothicVersion.id)
    for id, name in voices_list.items():
        output += voices.add_voice_inserts(id, name, gothicVersion.id)

    output += guilds.add_guild_inserts(gothicVersion.id)
    output += npcs.add_npc_inserts(gothicVersion.id, gothicVersion.base_path / "npc.json")
    output += source_files.add_source_file_inserts(
        gothicVersion.id, gothicVersion.base_path / "guild_waves.json", "guild")
    output += source_files.add_source_file_inserts(
        gothicVersion.id, gothicVersion.base_path / "mission_waves.json", "mission")
    output += source_files.add_source_file_inserts(
        gothicVersion.id, gothicVersion.base_path / "svm_waves.json", "svm")
    output += recordings.add_recording_inserts(gothicVersion.id, gothicVersion.base_path / "guild_waves.json", "guild")
    output += recordings.add_recording_inserts(gothicVersion.id, gothicVersion.base_path / "mission_waves.json", "mission")
    output += recordings.add_recording_inserts(gothicVersion.id, gothicVersion.base_path / "svm_waves.json", "svm")

    return output
    


def main():
    voices = Voices()
    guilds = Guilds()
    npcs = Npcs(guilds, voices)
    source_files = SourceFiles()
    recordings = Recordings(voices, guilds, source_files, npcs)

    gothic1 = GothicVersion(1, "Gothic 1", basepath / "../../results/gothic_1/")
    gothic2 = GothicVersion(2, "Gothic 2: Noc Kruka", basepath / "../../results/gothic_2/")

    with open(basepath / "output.sql", 'w', encoding='utf8') as output_file:
        output_file.writelines(voices.voice_insert_line.format("-1", "Brak"))
        output_file.writelines(process_gothic_version(gothic1, voices, guilds, source_files, npcs, recordings))
        output_file.writelines(process_gothic_version(gothic2, voices, guilds, source_files, npcs, recordings))
    
    

    

    


if __name__ == '__main__':
    main()
