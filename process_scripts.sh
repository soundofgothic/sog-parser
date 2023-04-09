#!/bin/bash

# This script is used to process the scripts in the sources directory and create json files storing info audio waves, npc, guilds, etc.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export PYTHONPATH=$SCRIPT_DIR:$PYTHONPATH

# Process Gothic scripts
gothic_vesion=("1" "2")
for version in "${gothic_vesion[@]}"; do
    python3 $SCRIPT_DIR/parsers/gothic_$version/npc_parser.py && echo "Gothic $version: npc_parser.py finished"
    python3 $SCRIPT_DIR/parsers/gothic_$version/guild_parser.py && echo "Gothic $version: guild_parser.py finished"
    python3 $SCRIPT_DIR/parsers/gothic_$version/missions_parser.py && echo "Gothic $version: missions_parser.py finished"
    python3 $SCRIPT_DIR/parsers/gothic_$version/svm_parser.py && echo "Gothic $version: svm_parser.py finished"
done

