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
$process/workflow vid_lipsync

# INSTALL CUSTOM NODES
echo "SCRIPT: custom nodes"
# $process1/node url
$process/node https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
$process/node https://github.com/kijai/ComfyUI-KJNodes
$process/node https://github.com/kijai/ComfyUI-WanVideoWrapper
$process/node https://github.com/kijai/ComfyUI-MelBandRoFormer


# COPY MODELS
echo "SCRIPT: models"
# $process/model name folder url
$process/model MelBandRoformer_fp16.safetensors diffusion_models https://huggingface.co/Kijai/MelBandRoFormer_comfy/resolve/main/MelBandRoformer_fp16.safetensors
$process/model umt5-xxl-enc-bf16.safetensors text_encoders https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-bf16.safetensors
$process/model Wan2_1-InfiniTetalk-Single_fp16.safetensors diffusion_models https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/InfiniteTalk/Wan2_1-InfiniTetalk-Single_fp16.safetensors
$process/model wav2vec2-chinese-base_fp16.safetensors wav2vec2 https://huggingface.co/Kijai/wav2vec2_safetensors/resolve/main/wav2vec2-chinese-base_fp16.safetensors
$process/model lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors loras https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
$process/model Wan14Bi2vFusioniX.safetensors diffusion_models https://huggingface.co/vrgamedevgirl84/Wan14BT2VFusioniX/resolve/main/Wan14Bi2vFusioniX.safetensors
$process/model wan_2.1_vae.safetensors vae https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
$process/model clip_vision_h.safetensors clip_vision https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors

echo "COMPLETE"