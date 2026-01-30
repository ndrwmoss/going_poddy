#!/bin/bash
set -e # Exit the script if any statement returns a non-true return

echo "Installing $1"
cd /workspace/ComfyUI/custom_nodes

if [ ! -d $1 ]; then
  git clone https://github.com/Comfy-Org/ComfyUI-Manager
else
   
fi

if [ ! -d "ComfyUI-Manager" ]; then
  git clone https://github.com/Comfy-Org/ComfyUI-Manager
fi


if [ ! -f "/workspace/ComfyUI/user/default/workflows/$1.json" ]; then
    if [ -f "/workflows/$1.json" ]; then
        cp /workflows/$1.json /workspace/ComfyUI/user/default/workflows
    fi
fi
