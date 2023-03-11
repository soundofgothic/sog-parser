import json
import pathlib
import re


def filter_wavs(line):
    return ".WAV" in line


def main():
    bin_path = pathlib.Path(__file__) / "../../../scripts/km/OU.BIN"
    transcription = []
    wavs = []
    with open(bin_path, 'rb') as file:
        content_lines = [line.decode('cp1250', errors='ignore')[:-2] for line in file.read().rsplit(b'\x00') if
                         len(line) > 0]
    previous_wave_matched = True
    previous_wave_matched_idx = -1
    for idx, line in enumerate(content_lines):
        if ".WAV" in line:
            wavs += [line]
            test = content_lines[idx - 2]
            while not re.fullmatch(
                    r"[*<>…0-9AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpRrSsŚśTtUuWwYyZzŹźŻżvVxXqQ,;:?!.\-–'\"\s]+",
                    test):
                test = test[1:]
            transcription += [test]

    transcripts = [
        {
            "filename": wav,
            "text": text,
            "g": "km",
            "source": "unknown"
        } for wav, text in zip(wavs, transcription)
    ]
    save_path = pathlib.Path(__file__) / "../../../results/km/text_assignments.json"
    with open(save_path, 'wb') as output:
        output.write(json.dumps(transcripts, ensure_ascii=False, indent=2).encode('utf8'))


if __name__ == "__main__":
    main()
