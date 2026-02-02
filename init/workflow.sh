#!/bin/bash
if [[ ! -d "/workspace/ComfyUI/user" ]]; then
    mkdir /workspace/ComfyUI/user
fi
if [[ ! -d "/workspace/ComfyUI/user/default" ]]; then
    mkdir /workspace/ComfyUI/user/default
fi
if [[ ! -d "/workspace/ComfyUI/user/default/workflows" ]]; then
    mkdir /workspace/ComfyUI/user/default/workflows
fi
if [ ! -f "/workspace/ComfyUI/user/default/workflows/$1" ]; then
    cp /going_poddy/workflows/$1 /workspace/ComfyUI/user/default/workflows/$1
fi