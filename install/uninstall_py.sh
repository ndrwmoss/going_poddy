#!/bin/bash
$restore = $PWD
cd /
python install.py "$1"
EXIT_CODE=$?
if [ $EXIT_CODE -eq 1 ]; then
  echo "Installing Python: $1"
  pip install "$1"
else
  echo "Python Package $1 is already installed"
fi
cd "$restore"