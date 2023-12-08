# Gothic scripts parser

The following code is a parser for the Gothic scripts. It takes game scripts, read them, extract recordings, npcs and guild members and then save them in a json files. Then the json files are used to generate postgres database with relations between the entities as docker image.

## How to use

### Requirements

- Python 3.11 (probably works with older versions too)
- linux environment (bash & makefile)
- docker

### Generate database

To generate database you need to run `make` command in the root directory of the project. It will generate jsons with game knowledge, then generate sql files with database schema and finally build docker image with postgres database.
The postgres database will be available on port 5432.
The user is `postgres` and password is `postgres`.

### Run database

You can start the database with `make run` command. It will start the database in the background. To stop it you need to run `make stop` command.
