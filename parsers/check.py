import json


def main():
    dump = []
    with open('../2020dump.json', 'r', encoding='utf8') as src:
        for line in src:
            dump.append(json.loads(line))
    with open('../results/waves.json', 'r', encoding='utf8') as src:
        waves = json.load(src)

    dump = list(filter(lambda w: w['g'] == '1', dump))
    f_waves = {wave["wave"].upper(): wave for wave in waves}

    for wave in dump:
        if wave["filename"].upper() not in f_waves:
            print(wave["filename"])
            print(wave["text"])


if __name__ == "__main__":
    main()
