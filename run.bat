@echo off
REM Windows: set up the venv, calibrate, then run the camera.
setlocal
cd /d "%~dp0"

if not exist venv (
    py -3.12 -m venv venv
)

call venv\Scripts\activate.bat
pip install -r requirements.txt

python its_giving_v2.py --calibrate
python its_giving_v2.py %*
