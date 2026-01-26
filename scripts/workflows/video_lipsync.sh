#!/bin/bash
set -e # Exit the script if any statement returns a non-true return
CIVITAI=${CIVITAI:-""}
# COPY WORKFLOW
echo "SCRIPT: Fetching Workflow"
cd /workspace/going_poddy/workflows
if [ ! -f "/workspace/ComfyUI/user/default/workflows/lipsync_infinite_talk.json" ]; then
  mv /workspace/going_poddy/workflows/lipsync_infinite_talk.json /workspace/ComfyUI/user/default/workflows
fi

# COPY CUSTOM NODES
echo "SCRIPT: Fetching Custom Nodes"
cd /workspace/ComfyUI/custom_nodes
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
if [ ! -d "ComfyUI-MelBandRoFormer" ]; then
  git clone https://github.com/kijai/ComfyUI-MelBandRoFormer
fi

# COPY MODELS
cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "MelBandRoformer_fp16.safetensors" ]; then
  wget https://huggingface.co/Kijai/MelBandRoFormer_comfy/resolve/main/MelBandRoformer_fp16.safetensors
fi

cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "Wan2_1-InfiniTetalk-Single_fp16.safetensors" ]; then
  wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/InfiniteTalk/Wan2_1-InfiniTetalk-Single_fp16.safetensors
fi

cd /workspace/ComfyUI/models/wav2vec2
if [ ! -f "wav2vec2-chinese-base_fp16.safetensors" ]; then
  wget https://huggingface.co/Kijai/wav2vec2_safetensors/resolve/main/wav2vec2-chinese-base_fp16.safetensors
fi

cd /workspace/ComfyUI/models/loras
if [ ! -f "lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors" ]; then
  wget https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank64_bf16.safetensors
fi

cd /workspace/ComfyUI/models/diffusion_models
if [ ! -f "Wan14Bi2vFusioniX.safetensors" ]; then
  wget https://huggingface.co/vrgamedevgirl84/Wan14BT2VFusioniX/resolve/main/Wan14Bi2vFusioniX.safetensors
fi

cd /workspace/ComfyUI/models/vae
if [ ! -f "wan_2.1_vae.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
fi

cd /workspace/ComfyUI/models/clip_vision
if [ ! -f "clip_vision_h.safetensors" ]; then
  wget https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors
fi


# Update custom nodes
cd /workspace/going_poddy/scripts/install
./update_comfy.sh