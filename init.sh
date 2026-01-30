#!/bin/bash
echo "Installing Going Poddy"
cd /
if [ -d "/going_poddy" ]; then
    rm -r /going_poddy
fi
git clone https://github.com/ndrwmoss/going_poddy
cd /going_poddy/manager
python main.py