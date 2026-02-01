
$restore = $PWD
cd /
python install.py "$1"
EXIT_CODE=$?
if [ $EXIT_CODE -eq 1 ]; then
  cd /workspace/ComfyUI/custom_nodes
  if [ ! -d "$1" ]; then
    echo "Installing Node: $1"
    git clone $2
    if [[ -d "$1/.git" ]]; then
      if [[ -f "$1/requirements.txt" ]]; then
        pip install -r "$1/requirements.txt"
      fi
    fi
  fi
else
  echo "Node $1 is already installed"
fi
cd /scripts