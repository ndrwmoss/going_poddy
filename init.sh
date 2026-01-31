#!/bin/bash
echo "Installing Going Poddy"
if [ -d "/workspace/going_poddy" ]; then
    rm -r /workspace/going_poddy
fi
cd /workspace
git clone https://github.com/ndrwmoss/going_poddy
cd /workspace/going_poddy/manager
chmod -R +x /workspace/going_poddy/scripts
cd /workspace/going_poddy/manager
./check_cuda.sh
./intall_sage.sh
./move_comfy.sh
./update_comfy.sh
./start_ssh.sh
./start_nginx.sh
./start_jupityer.sh
./install_comfy.sh

python main.py