#!/usr/bin/env bash

PYTHON_VER=$(python --version 2>&1)

if [ "${PYTHON_VER:7:1}" == '2' ]; then
    cd ~/dotfiles/cheatsheets/ && make html && cd build/html/ && python -m SimpleHTTPServer
elif [ "${PYTHON_VER:7:1}" == '3' ]; then
    cd ~/dotfiles/cheatsheets/ && make html && cd build/html/ && python -m http.server
else
    >&2 echo "Unknown Python version. Please check to see if Python is installed."
    exit 1;
fi
