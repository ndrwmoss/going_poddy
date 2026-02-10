#!/bin/bash
# parameter 1 = install | uninstall
process=$PODDY/${1:-install}

# INSTALL APT
echo "SCRIPT: apt packages"
# $process/apt apt

# INSTALL PYTHON SCRIPTS
echo "SCRIPT: python packages"
# $process/py pyt

# COPY WORKFLOW
echo "SCRIPT: workflows"
# $process/workflow workflow
$process/workflow img_upscale

# INSTALL CUSTOM NODES
echo "SCRIPT: custom nodes"
# $process1/node url
$process/node https://github.com/kijai/ComfyUI-KJNodes
$process/node https://github.com/yolain/ComfyUI-Easy-Use
$process/node https://github.com/cubiq/ComfyUI_essentials
$process/node https://github.com/StableLlama/ComfyUI-basic_data_handling

# COPY MODELS
echo "SCRIPT: models"
# $process/model name folder url
$process/model juggernaut-sdxl.safetensors diffusion_models https://civitai.com/api/download/models/1759168?type=Model&format=SafeTensor&size=full&fp=fp16
$process/model sdxl_lightning_8step_lora.safetensors loras https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_8step_lora.safetensors
$process/model tiled-controlnet-sdxl.safetensors controlnet https://huggingface.co/xinsir/controlnet-tile-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors

echo "COMPLETE"