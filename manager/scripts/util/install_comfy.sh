#!/bin/bash
set -e # Exit the script if any statement returns a non-true return value
cd /
if [ ! -d "temporary" ]; then
    mkdir temporary
fi

cd /workspace/ComfyUI
if [ ! -d "user" ]; then
    mkdir user
fi

cd /workspace/ComfyUI/user
if [ ! -d "default" ]; then
    mkdir default
fi

cd /workspace/ComfyUI/user/default
if [! -d "workflows" ]; then
    mkdir workflows
fi

cd /workspace/ComfyUI
if [ ! -d "models" ]; then
    mkdir models
fi

cd /workspace/ComfyUI/models
if [ ! -d "sam2" ]; then
    mkdir sam2
fi

cd /workspace/ComfyUI/models
if [ ! -d "detection" ]; then
    mkdir detection
fi

cd /workspace/ComfyUI/models
if [ ! -d "upscale_models" ]; then
    mkdir upscale_models
fi

cd /workspace/ComfyUI/models
if [ ! -d "wav2vec2" ]; then
    mkdir wav2vec2
fi