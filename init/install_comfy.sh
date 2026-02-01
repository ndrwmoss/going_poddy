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
for d in /workspace/ComfyUI/custom_nodes/*/; do
  if [[ -d "$d/.git" ]]; then
    if [[ -f "$d/requirements.txt" ]]; then
      pip install -r "$d/requirements.txt"
    fi
  fi
done

# --- Create necessary directories ---
echo "Creating internal Comfy directories"
$d = "/going_poddy/command"
"$d"/make_directory.sh "/workspace/ComfyUI" "user"
"$d"/make_directory.sh "/workspace/ComfyUI/user" "default"
"$d"/make_directory.sh "/workspace/ComfyUI/user/default" "workflows"
"$d"/make_directory.sh "/workspace/ComfyUI" "models"
"$d"/make_directory.sh "/workspace/ComfyUI/models" "detection"
"$d"/make_directory.sh "/workspace/ComfyUI/models" "upscale_models"
"$d"/make_directory.sh "/workspace/ComfyUI/models" "wav2vec2"
"$d"/make_directory.sh "/workspace/ComfyUI/models" "sam2"