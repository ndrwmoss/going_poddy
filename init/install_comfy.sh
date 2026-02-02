#!/bin/bash

# --- First boot: persist ComfyUI into /workspace and fetch taesd ---
if [[ ! -d /workspace/ComfyUI && -d /Comfy ]]; then
  echo "Moving ComfyUI to /workspace (first boot only)…"
  mv /Comfy /workspace/ComfyUI
else
  echo "ComfyUI already present in /workspace; skipping copy."
fi

# --- Update Comfy ---
if [[ -f "/workspace/ComfyUI/requirements.txt" ]]; then
  pip install -r "/workspace/ComfyUI/requirements.txt"
fi
/going_poddy/command/update_nodes.sh
# --- Create necessary directories ---
echo "Creating internal Comfy directories"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI" "user"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI/user" "default"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI/user/default" "workflows"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI" "models"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI/models" "detection"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI/models" "upscale_models"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI/models" "wav2vec2"
/going_poddy/command/make_directory.sh "/workspace/ComfyUI/models" "sam2"