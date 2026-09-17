#!/usr/bin/env bash
# Linux / macOS: set up the venv, calibrate, then run the camera.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ ! -d "venv" ]; then
    python3.12 -m venv venv
fi

source venv/bin/activate
pip install -r requirements.txt

read -rp "Camera index (0 default, try another if 0 is wrong): " CAM
CAM="${CAM:-0}"

python its_giving_v2.py --calibrate --camera "$CAM"
python its_giving_v2.py --camera "$CAM" "$@"
