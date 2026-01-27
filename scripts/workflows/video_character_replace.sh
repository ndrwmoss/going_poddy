#!/bin/bash
set -e # Exit the script if any statement returns a non-true return
CIVITAI=${CIVITAI:-"none"}
CIVTOKEN=""
if [ $CIVITAI != "none" ]; then
  $CIVTOKEN = &token=$CIVTOKEN
fi

# COPY WORKFLOW
echo "SCRIPT: Fetching Workflow"
cd /workspace/going_poddy/workflows
if [ ! -f "/workspace/ComfyUI/user/default/workflows/character_replace_mdmz.json" ]; then
  mv /workspace/going_poddy/workflows/character_replace_mdmz.json /workspace/ComfyUI/user/default/workflows
fi

# COPY CUSTOM NODES
echo "SCRIPT: Fetching Custom Nodes"
cd /workspace/ComfyUI/

if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/Comfy-Org/ComfyUI-Manager
fi

if [ ! -d "ComfyUI-VideoHelperSuite" ]; then
  git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
fi

if [ ! -d "ComfyUI-KJNodes" ]; then
  git clone https://github.com/kijai/ComfyUI-KJNodes
fi

if [ ! -d "ComfyUI-WanVideoWrapper" ]; then
  git clone https://github.com/kijai/ComfyUI-WanVideoWrapper
fi

if [ ! -d "ComfyUI-WanAnimatePreprocess" ]; then
  git clone https://github.com/kijai/ComfyUI-WanAnimatePreprocess
fi

if [ ! -d "ComfyUI-WanVideoWrapper" ]; then
  git clone https://github.com/kijai/ComfyUI-WanVideoWrapper
fi

if [ ! -d "comfyui-tensorops" ]; then
  git clone https://github.com/un-seen/comfyui-tensorops
fi

if [ ! -d "ComfyUI-segment-anything-2" ]; then
  git clone https://github.com/kijai/ComfyUI-segment-anything-2
fi

# COPY MODELS
echo "SCRIPT: Fetching Models"
cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors" ]; then
  wget https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/Wan22Animate/Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors
fi

cd /workspace/ComfyUI/models/vae
if [ ! -f "Wan2_1_VAE_bf16.safetensors" ]; then
  wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_bf16.safetensors
fi

cd /workspace/ComfyUI/models/clip_vision
if [ ! -f "clip_vision_h.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors
fi
cd /workspace/ComfyUI/models/sam2
if [ ! -f "sam2.1_hiera_base_plus.safetensors" ]; then
  wget https://huggingface.co/Kijai/sam2-safetensors/resolve/main/sam2.1_hiera_base_plus.safetensors
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "WanAnimate_relight_lora_fp16.safetensors" ]; then
  wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22_relight/WanAnimate_relight_lora_fp16.safetensors
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors" ]; then
  wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
fi

cd /workspace/ComfyUI/models/detection
if [ ! -f "vitpose-l-wholebody.onnx" ]; then
  wget https://huggingface.co/JunkyByte/easy_ViTPose/resolve/main/onnx/wholebody/vitpose-l-wholebody.onnx
fi

cd /workspace/ComfyUI/models/detection
if [ ! -f "yolov10m.onnx" ]; then
  wget https://huggingface.co/Wan-AI/Wan2.2-Animate-14B/resolve/main/process_checkpoint/det/yolov10m.onnx
fi

# Update custom nodes
cd /workspace/going_poddy/scripts/install
./update_comfy.sh