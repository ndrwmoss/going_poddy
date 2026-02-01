#!/bin/bash
$restore=${PWD}
cd /
echo "INIT STAGE 1: POPULATING YOUR PODDY"
python -m pip install --upgrade pip
./update_poddy.sh

echo "INIT STAGE 2: CHECKING YOUR CUDA"
/going_poddy/init/check_cuda.sh

echo "INIT STAGE 3: INSTALLING YOUR SAGE"
/going_poddy/init/install_sage.sh

echo "INIT STAGE 4: INSTALLING YOUR COMFY"
/going_poddy/init/install_comfy.sh

echo "INIT STAGE 5: STARTING YOUR SSH"
/going_poddy/init/start_ssh.sh

echo "INIT STAGE 6: STARTING YOUR NGINX"
/going_poddy/init/start_nginx.sh

echo "INIT STAGE 7: STARTING YOUR JUPYTER"
/going_poddy/init/start_jupyter.sh

echo "INIT COMPLEGE: STARTING YOUR COMFY"
cd /workspace/ComfyUI
echo "Ready to use an install script!"
python main.py --port=8188
cd "${restore}"