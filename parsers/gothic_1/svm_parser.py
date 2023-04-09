import os
import re
import json
import pathlib

basepath = pathlib.Path(__file__).parent.resolve() / '../..'

svm_path = basepath / 'sources/gothic_1/PrjGothic/Story/svm.d'
output_path = basepath / 'results/gothic_1/svm_waves.json'

def main():
    with open(svm_path, 'r', encoding='Windows-1250') as src:
        text = src.read()

    recordings = re.findall(r'\w+[\s]*=[\s]*\"[A-Za-z0-9_]+\"[\s]*;[\s]*//.*', text)
    less_restrict_test = re.findall(r'\w+[\s]*=[\s]*\"[A-Za-z0-9_]+\"', text)
    assert len(recordings) == len(less_restrict_test)
    waves = []
    for recording in recordings:
        title = re.search(r'^\w+', recording).group()
        wave = re.search(r'\"[A-Za-z0-9_]+\"', recording).group()[1:-1]
        text = re.search(r'//.*', recording).group()[2:]
        voice = re.search(r'[0-9]+', wave).group()
        wave = {
            "wave": wave,
            "text": text,
            "title": title,
            "voice": voice,
            "G": 1,
            "source": "self",
            "source_file": "svm.d"
        }
        waves.append(wave)
    with open(output_path, 'wb') as output:
        output.write(json.dumps(waves, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
