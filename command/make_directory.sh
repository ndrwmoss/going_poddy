#!/bin/bash
if [ -d "$1" ]; then
    full_path="$1/$2"
    if [ ! -d "$full_path" ]; then
        mkdir "$full_path"
        echo "Made directory: $full_path"
    fi
fi