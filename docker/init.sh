#!/bin/bash
echo "Updating Going Poddy"
cd /
if [ -d "/going_poddy" ]; then
    rm -r /going_poddy
fi
git clone https://github.com/ndrwmoss/going_poddy
cd /going_poddy
chmod -R +x install
chmod -R +x uninstall
chmod -R +x util

cd /going_poddy/manager
chmod -R +x scripts
mv /going_poddy/manager/manager.py /
cd /
manager.py --listen 0.0.0.0 --port 8288