#!/bin/bash
set -e # Exit the script if any statement returns a non-true return

cd /scripts
./move_workflow.sh control_net_tiled_upscale_auto

# COPY CUSTOM NODES
echo "SCRIPT: Fetching Custom Nodes"
cd /workspace/ComfyUI/custom_nodes
if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/Comfy-Org/ComfyUI-Manager
fi

if [ ! -d "ComfyUI-KJNodes" ]; then
  git clone https://github.com/kijai/ComfyUI-KJNodes
fi

if [ ! -d "ComfyUI-Easy-Use" ]; then
  git clone https://github.com/yolain/ComfyUI-Easy-Use
fi

if [ ! -d "ComfyUI_essentials" ]; then
  git clone https://github.com/cubiq/ComfyUI_essentials
fi

if [ ! -d "ComfyUI-basic_data_handling" ]; then
  git clone https://github.com/StableLlama/ComfyUI-basic_data_handling
fi

# Update custom nodes
cd /scripts
./update_requirements.sh

# COPY MODELS
echo "SCRIPT: Fetching Models"
cd /workspace/ComfyUI/models/loras
if [ ! -f "sdxl_lightning_8step_lora.safetensors" ]; then
  wget https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_8step_lora.safetensors
fi

cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "juggernaut-sdxl.safetensors" ]; then
  wget "https://civitai.com/api/download/models/1759168?type=Model&format=SafeTensor&size=full&fp=fp16&token=$1" --content-disposition
fi

cd /workspace/ComfyUI/models/controlnet
if [ ! -f "tiled-controlnet-sdxl.safetensors" ]; then
  wget https://huggingface.co/xinsir/controlnet-tile-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors tiled-controlnet-sdxl.safetensors
fi

echo "DONE: RESTART COMFYUI FOR CHANGES TO TAKE EFFECT"