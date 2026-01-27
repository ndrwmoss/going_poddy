#!/bin/bash
set -e # Exit the script if any statement returns a non-true return value
# Get a fresh copy of scripts in case they've changed since the Docker image was made
WORKFLOW=${WORKFLOW:-"video_character_replace"}
CIVITAI=${CIVITAI:-"none"}
if [ ! -d "workspace" ]; then
  mkdir workspace
fi
cd /workspace
if [ -d "going_poddy" ]; then
  rm -r going_poddy
fi
git clone https://github.com/ndrwmoss/going_poddy
chmod -R +x /workspace/going_poddy/scripts
cd /workspace/going_poddy/scripts/install
./install_comfy.sh
./install_sage.sh
  
# Install selected workflow
cd /workspace/going_poddy/scripts/workflows
 ./$WORKFLOW.sh --$CIVITAI

# Start ComfyUI
cd /workspace/ComfyUI
python main.py --listen 0.0.0.0 --port 8188