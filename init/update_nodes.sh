echo "Updating Custom Nodes"
for d in /workspace/ComfyUI/custom_nodes/*/; do
  if [[ -d "$d/.git" ]]; then
    if [[ -f "$d/requirements.txt" ]]; then
      pip install -r "$d/requirements.txt"
    fi
  fi
done