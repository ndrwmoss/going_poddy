#!/bin/bash
python -m pip install --upgrade pip
echo "Updating Going Poddy"
cd /
./update_poddy.sh
cd /scripts
./check_cuda.sh
./install_sage.sh
./move_comfy.sh
./update_comfy.sh
./start_ssh.sh
./start_nginx.sh
./start_jupityer.sh
./install_comfy.sh
cd /workspace/ComfyUI
python main.py --port=8188
echo "Ready to use an install script!"