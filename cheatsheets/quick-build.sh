#!/usr/bin/env bash

cd ~/dotfiles/cheatsheets/ && make html && cd build/html/ && python -m SimpleHTTPServer
