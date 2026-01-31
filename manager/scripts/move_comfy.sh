#!/bin/bash
# --- First boot: persist ComfyUI into /workspace and fetch taesd ---
if [[ ! -d /workspace/ComfyUI && -d /Comfy ]]; then
  echo "Persisting ComfyUI to /workspace (first boot)…"
  mv /Comfy /workspace/ComfyUI
else
  echo "ComfyUI already present in /workspace; skipping copy."
fi