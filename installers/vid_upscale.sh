#!/bin/bash
# parameter 1 = install | uninstall
process=$PODDY/${1:-install}

# INSTALL APT
echo "SCRIPT: apt packages"
# $process/apt apt

# INSTALL PYTHON SCRIPTS
echo "SCRIPT: python packages"
# $process/py pyt
$process/py pyloudnorm

# COPY WORKFLOW
echo "SCRIPT: workflows"
# $process/workflow workflow
$process/workflow vid_upscale

# INSTALL CUSTOM NODES
echo "SCRIPT: custom nodes"
# $process1/node url
$process/node https://github.com/rgthree/rgthree-comfy
$process/node https://github.com/yolain/ComfyUI-Easy-Use
$process/node https://github.com/kijai/ComfyUI-KJNodes
$process/node https://github.com/ssitu/ComfyUI_UltimateSDUpscale
$process/node https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
$process/node https://github.com/cubiq/ComfyUI_essentials
$process/node https://github.com/cubiq/ComfyUI-Florence2

# COPY MODELS
echo "SCRIPT: models"
# $process/model name folder url
$process/model diffusion_models wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors
$process/model loras low_noise_model.safetensors https://huggingface.co/lightx2v/Wan2.2-Lightning/resolve/main/Wan2.2-T2V-A14B-4steps-lora-rank64-Seko-V2.0/low_noise_model.safetensors
$process/model clip low_noise_model.safetensors https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
$process/model vae wan_2.1_vae.safetensors https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
$process/model upscale_models RealESRGAN_x2.pth https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x2.pth
$process/model upscale_models stock_photography_wan22_LOW_v1.safetensors https://civitai.com/api/download/models/2179627?type=Model&format=SafeTensor

echo "COMPLETE"