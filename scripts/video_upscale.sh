#!/bin/bash
set -e # Exit the script if any statement returns a non-true return

cd /workspace/going_poddy/scripts/install
./install_comfy.sh

# COPY WORKFLOW
echo "SCRIPT: Fetching Workflow"
cd /workspace/going_poddy/workflows
if [ ! -f "/workspace/ComfyUI/user/default/workflows/upscale_mickmumpitz.json" ]; then
  mv /workspace/going_poddy/workflows/upscale_mickmumpitz.json /workspace/ComfyUI/user/default/workflows
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

if [ ! -d "ComfyUI-Florence2" ]; then
  git clone https://github.com/kijai/ComfyUI-Florence2
fi

if [ ! -d "ComfyUI-VideoHelperSuite" ]; then
  git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
fi

if [ ! -d "ComfyUI_UltimateSDUpscale" ]; then
  git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale
fi

if [ ! -d "ComfyUI_essentials" ]; then
  git clone https://github.com/cubiq/ComfyUI_essentials
fi

# Update custom nodes
cd /workspace/going_poddy/scripts/install
./update_comfy.sh

# COPY MODELS
echo "SCRIPT: Fetching Models"

cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "low_noise_model.safetensors" ]; then
  wget https://huggingface.co/lightx2v/Wan2.2-Lightning/resolve/main/Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V2.0/low_noise_model.safetensors
fi

cd /workspace/ComfyUI/models/clip
if [ ! -f "low_noise_model.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
fi

cd /workspace/ComfyUI/models/vae
if [ ! -f "wan_2.1_vae.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
fi

cd /workspace/ComfyUI/models/upscale_models
if [ ! -f "RealESRGAN_x2.pth" ]; then
  wget https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth
fi

cd /workspace/ComfyUI/models/upscale_models
if [ ! -f "stock_photography_wan22_LOW_v1.safetensors" ]; then
  wget "https://civitai.com/api/download/models/2179627?type=Model&format=SafeTensor$1"
fi

echo "DONE: RESTART COMFYUI FOR CHANGES TO TAKE EFFECT"