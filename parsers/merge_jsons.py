import json


def main():
    with open('../results/guild_waves.json', encoding='utf8') as src:
        guild_waves = json.load(src)

    with open('../results/mission_waves.json', encoding='utf8') as src:
        mission_waves = json.load(src)

    with open('../results/svm_waves.json', encoding='utf8') as src:
        svm_waves = json.load(src)

    for wave in guild_waves:
        wave["type"] = "guild"

    for wave in mission_waves:
        wave["type"] = "quest"

    for wave in svm_waves:
        wave["type"] = "svm"

    with open('../results/waves.json', 'wb') as output:
        output.write(
            json.dumps([*guild_waves, *mission_waves, *svm_waves], ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
