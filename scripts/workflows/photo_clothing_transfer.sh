#!/bin/bash
set -e # Exit the script if any statement returns a non-true return
CIVITAI=${CIVITAI:-"none"}
CIVTOKEN=""
if [ $CIVITAI != "none" ]; then
  $CIVTOKEN = "&token=" + $CIVTOKEN
fi


# COPY WORKFLOW
echo "SCRIPT: Fetching Workflow"
cd /workspace/going_poddy/workflows
if [ ! -f "/workspace/ComfyUI/user/default/workflows/clothing_transfer.json" ]; then
  mv /workspace/going_poddy/workflows/clothing_transfer.json /workspace/ComfyUI/user/default/workflows
fi

# COPY CUSTOM NODES
echo "SCRIPT: Fetching Custom Nodes"
cd /workspace/ComfyUI/custom_nodes

if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/Comfy-Org/ComfyUI-Manager
fi

if [ ! -d "rgthree-comfy" ]; then
  git clone https://github.com/rgthree/rgthree-comfy
fi

if [ ! -d "ComfyUI-Easy-Use" ]; then
  git clone https://github.com/yolain/ComfyUI-Easy-Use
fi

if [ ! -d "ComfyUI-KJNodes" ]; then
  git clone https://github.com/kijai/ComfyUI-KJNodes
fi

if [ ! -d "ComfyUI_UltimateSDUpscale" ]; then
  git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale
fi

if [ ! -d "ComfyUI-mxToolkit" ]; then
  git clone https://github.com/Smirnov75/ComfyUI-mxToolkit
fi

# COPY MODELS
echo "SCRIPT: Fetching Models"

cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "qwen_image_edit_fp8_e4m3fn.safetensors" ]; then
    wget https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_fp8_e4m3fn.safetensors
fi

cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "juggernautXL_juggXIByRundiffusion.safetensors" ]; then
    wget https://huggingface.co/misri/juggernautXL_juggXIByRundiffusion/resolve/main/juggernautXL_juggXIByRundiffusion.safetensors
fi

cd /workspace/ComfyUI/models/vae
if [ ! -f "qwen_image_vae.safetensors" ]; then
    wget https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
fi

cd /workspace/ComfyUI/models/text_encoders
if [ ! -f "qwen_2.5_vl_7b_fp8_scaled.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "Qwen-Image-Lightning-4steps-V2.0.safetensors" ]; then
  wget https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V2.0.safetensors
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "clothes_tryon_qwen-edit-lora" ]; then
  wget "https://civitai.com/api/download/models/2196278?type=Model&format=SafeTensor&token=$CIVTOKEN" clothes_tryon_qwen-edit-lora
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "extract-outfit_v3.safetensors" ]; then
  wget https://huggingface.co/datasets/dubsta/xmas/resolve/main/extract-outfit_v3.safetensors
fi

cd /workspace/ComfyUI/models/upscale_models
if [ ! -f "RealESRGAN_x2.pth" ]; then
  wget https://huggingface.co/dtarnow/UPscaler/resolve/main/RealESRGAN_x2plus.pth
fi

# Update custom nodes
cd /workspace/going_poddy/scripts/install
./update_comfy.sh