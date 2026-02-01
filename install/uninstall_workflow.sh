cd /
python install.py "$1"
EXIT_CODE=$?
if [ $EXIT_CODE -eq 1 ]; then
  if [ ! -f "/workspace/ComfyUI/user/default/workflows/$1" ]; then
    echo "Installing Workflow: $1"
    cp /workflows/$1 /workspace/ComfyUI/user/default/workflows
  fi
else
  echo "Workflow $1 is already installed"
fi
