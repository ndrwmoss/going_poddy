#!/bin/bash
if [ -d "$1" ]; then
    full_path="$1/$2"
    if [ ! -d "$full_path" ]; then
        mkdir "$full_path"
        echo "Made directory: $full_path"
    else
        echo "Directory already exists: $full_path"
    fi
else
    echo "Parent doesn't exist: $1"
fi