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
$process/workflow character_replace_mdmz

# INSTALL CUSTOM NODES
echo "SCRIPT: custom nodes"
# $process1/node url
$process/node https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
$process/node https://github.com/kijai/ComfyUI-KJNodes
$process/node https://github.com/kijai/ComfyUI-WanVideoWrappers
$process/node https://github.com/kijai/ComfyUI-WanAnimatePreprocess
$process/node https://github.com/un-seen/comfyui-tensorops
$process/node https://github.com/kijai/ComfyUI-segment-anything-2

# COPY MODELS
echo "SCRIPT: models"
# $process/model name folder url
$process/model Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors diffusion_models https://huggingface.co/Kijai/WanVideo_comfy_fp8_scaled/resolve/main/Wan22Animate/Wan2_2-Animate-14B_fp8_e4m3fn_scaled_KJ.safetensors
$process/model umt5-xxl-enc-bf16.safetensors text_encoders https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-bf16.safetensors
$process/model Wan2_1_VAE_bf16.safetensors vae https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_bf16.safetensors
$process/model clip_vision_h.safetensors clip_vision https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors
$process/model sam2.1_hiera_base_plus.safetensors sam2 https://huggingface.co/Kijai/sam2-safetensors/resolve/main/sam2.1_hiera_base_plus.safetensors
$process/model WanAnimate_relight_lora_fp16.safetensors loras https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/LoRAs/Wan22_relight/WanAnimate_relight_lora_fp16.safetensors
$process/model lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors loras https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
$process/model vitpose-l-wholebody.onnx detection https://huggingface.co/JunkyByte/easy_ViTPose/resolve/main/onnx/wholebody/vitpose-l-wholebody.onnx
$process/model yolov10m.onnx detection https://huggingface.co/Wan-AI/Wan2.2-Animate-14B/resolve/main/process_checkpoint/det/yolov10m.onnx

echo "COMPLETE"