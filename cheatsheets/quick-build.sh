#!/usr/bin/env bash

source ~/virtualenv/sphinx/bin/activate

PYTHON_VER=$(python --version 2>&1)

if [ "${PYTHON_VER:7:1}" == '2' ]; then
    cd ~/dotfiles/cheatsheets/ && make html && cd build/html/ && python -m SimpleHTTPServer 8080
elif [ "${PYTHON_VER:7:1}" == '3' ]; then
    cd ~/dotfiles/cheatsheets/ && make html && cd build/html/ && python -m http.server 8080
else
    >&2 echo "Unknown Python version. Please check to see if Python is installed."
    exit 1;
fi
