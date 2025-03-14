#!/bin/bash

if [ -f "$HOME/.bashrc" ]; then
    mv "$HOME/.bashrc" "$HOME/.bashrc.bk"
fi

ln -sf "$(pwd)/.bashrc" "$HOME/.bashrc"

echo "# This is a symbolic link to the .bashrc file in the current directory" >> "$(pwd)/.bashrc"
