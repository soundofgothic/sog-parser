-- Postgres schema for the mappers

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE voices (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE game_voices (
    game_id INTEGER NOT NULL,
    voice_id INTEGER NOT NULL,
    in_game_id INTEGER NOT NULL,
    PRIMARY KEY (game_id, voice_id)
);

CREATE TABLE guilds (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    in_game_id TEXT NOT NULL,
    in_game_alias TEXT NOT NULL,
    game_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX guilds_in_game_id ON guilds (in_game_id, game_id);

CREATE TABLE npcs (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    in_game_id TEXT NOT NULL,
    in_game_alias TEXT NOT NULL,
    game_id INTEGER NOT NULL,
    voice_id INTEGER NOT NULL,
    guild_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX npcs_in_game_id ON npcs (in_game_id, game_id);

CREATE TYPE source_type AS ENUM ('guild', 'mission', 'svm');

CREATE TABLE source_files (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type source_type NOT NULL,
    game_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX source_files_name ON source_files (name, game_id);

CREATE TABLE recordings (
    id SERIAL PRIMARY KEY,
    wave TEXT NOT NULL,
    transcript TEXT NOT NULL,
    game_id INTEGER NOT NULL,
    source_file_id INTEGER NOT NULL,
    voice_id INTEGER NOT NULL,
    guild_id INTEGER NULL,
    npc_id INTEGER NULL,
    title TEXT NULL
);

CREATE UNIQUE INDEX recordings_wave ON recordings (wave, game_id);

-- Create the foreign keys

ALTER TABLE game_voices ADD FOREIGN KEY (game_id) REFERENCES games(id);
ALTER TABLE game_voices ADD FOREIGN KEY (voice_id) REFERENCES voices(id);
ALTER TABLE guilds ADD FOREIGN KEY (game_id) REFERENCES games(id);
ALTER TABLE npcs ADD FOREIGN KEY (game_id) REFERENCES games(id);
ALTER TABLE npcs ADD FOREIGN KEY (voice_id) REFERENCES voices(id);
ALTER TABLE npcs ADD FOREIGN KEY (guild_id) REFERENCES guilds(id);
ALTER TABLE recordings ADD FOREIGN KEY (game_id) REFERENCES games(id);
ALTER TABLE recordings ADD FOREIGN KEY (source_file_id) REFERENCES source_files(id);
ALTER TABLE recordings ADD FOREIGN KEY (voice_id) REFERENCES voices(id);
ALTER TABLE recordings ADD FOREIGN KEY (guild_id) REFERENCES guilds(id);
ALTER TABLE recordings ADD FOREIGN KEY (npc_id) REFERENCES npcs(id);