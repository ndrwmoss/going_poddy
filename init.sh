#!/bin/bash
echo "Installing Going Poddy"
if [ -d "/workspace/going_poddy" ]; then
    rm -r /workspace/going_poddy
fi
cd /workspace
git clone https://github.com/ndrwmoss/going_poddy
chmod -R +x /workspace/going_poddy/scripts
cd /workspace/going_poddy/scripts
./check_cuda.sh
./intall_sage.sh
./move_comfy.sh
./update_comfy.sh
./start_ssh.sh
./start_nginx.sh
./start_jupityer.sh
./install_comfy.sh
cd /workspace/ComfyUI
python main.py --port=8188
cd /workspace/going_poddy
python main.py