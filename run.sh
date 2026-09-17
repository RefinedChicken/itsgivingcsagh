#!/usr/bin/env bash
# Linux / macOS: set up the venv, calibrate, then run the camera.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ ! -d "venv" ]; then
    python3.12 -m venv venv
fi

source venv/bin/activate
pip install -r requirements.txt

python its_giving_v2.py --calibrate
python its_giving_v2.py "$@"
