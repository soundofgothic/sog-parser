import pathlib

basepath = pathlib.Path(__file__).parent.resolve()


def main():
    with open(basepath / "data.sql", 'w') as file:
        # GAMES
        file.write("INSERT INTO games (id, name) VALUES (1, 'Gothic 1');\n")

        # VOICES
        file.write("INSERT INTO voices (id, name) VALUES (1, 'Łukasz Nowicki');\n")
        file.write("INSERT INTO voices (id, name) VALUES (9, 'Przymysław Nikiel');\n")
        file.write("INSERT INTO voices (id, name) VALUES (14, 'Tomasz Marzecki');\n")



if __name__ == '__main__':
    main()