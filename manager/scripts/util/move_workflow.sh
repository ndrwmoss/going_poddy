#!/bin/bash
set -e # Exit the script if any statement returns a non-true return

echo "Fetching $1"
cd /workflows
if [ ! -f "/workspace/ComfyUI/user/default/workflows/$1.json" ]; then
    if [ -f "/workflows/$1.json" ]; then
        cp /workflows/$1.json /workspace/ComfyUI/user/default/workflows
    fi
fi
