#!/bin/bash
set -e # Exit the script if any statement returns a non-true return

# COPY 
cd /scripts
./move_workflow.sh clothing_transfer

# COPY CUSTOM NODES
cd /scripts
./install_node.sh ComfyUI-Manager https://github.com/Comfy-Org/ComfyUI-Manager
./install_node.sh rgthree-comfy https://github.com/rgthree/rgthree-comfy
./install_node.sh ComfyUI-Easy-Use https://github.com/yolain/ComfyUI-Easy-Use
./install_node.sh ComfyUI-KJNodes https://github.com/kijai/ComfyUI-KJNodes
./install_node.sh ComfyUI_UltimateSDUpscale https://github.com/ssitu/ComfyUI_UltimateSDUpscale
./install_node.sh ComfyUI-mxToolkit https://github.com/Smirnov75/ComfyUI-mxToolkit

# COPY MODELS
./install_model.sh qwen_image_edit_fp8_e4m3fn.safetensors https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_fp8_e4m3fn.safetensors diffusion_models
./install_model.sh juggernautXL_juggXIByRundiffusion.safetensors  https://huggingface.co/misri/juggernautXL_juggXIByRundiffusion/resolve/main/juggernautXL_juggXIByRundiffusion.safetensors diffusion_models
./install_model.sh qwen_image_vae.safetensors https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors vae
./install_model.sh qwen_2.5_vl_7b_fp8_scaled.safetensors https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors text_encoders
./install_model.sh RealESRGAN_x2.pth https://huggingface.co/dtarnow/UPscaler/resolve/main/RealESRGAN_x2plus.pth upscale_models
./install_model.sh Qwen-Image-Lightning-4steps-V2.0.safetensors https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V2.0.safetensors loras
./install_model.sh extract-outfit_v3.safetensors https://huggingface.co/datasets/dubsta/xmas/resolve/main/extract-outfit_v3.safetensors loras
./install_model.sh clothes_tryon_qwen-edit-lora.safetensors "https://civitai.com/api/download/models/2196278?type=Model&format=SafeTensor&token=" loras civ

echo "DONE: RESTART COMFYUI FOR CHANGES TO TAKE EFFECT"