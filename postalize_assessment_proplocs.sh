#!/usr/bin/env bash

# activate python env
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ -f "$script_dir/env/bin/activate" ]; then
    source ${script_dir}/env/bin/activate
else
    echo "VIRTUALENV NOT FOUND --- INSTALLING..."
    virtualenv env --python=python3
    pip install -r requirements.txt
    echo "installed, try now"
    exit 1
fi

python postalize_assessment_proplocs.py

deactivate
