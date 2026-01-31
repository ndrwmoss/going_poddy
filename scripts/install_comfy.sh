
#!/bin/bash
# --- Helper: update repo + pip if changed ---
update_requirements() {
  cd "$1" || return
  local old="$(git rev-parse HEAD 2>/dev/null || echo)"
  git pull --ff-only || true
  local new="$(git rev-parse HEAD 2>/dev/null || echo)"
  if [[ "$old" != "$new" && -f requirements.txt ]]; then
    pip install -r requirements.txt
  fi
}
if [[ -d /workspace/ComfyUI ]]; then
  echo "STAGE: Updating ComfyUI core"
  update_requirements /workspace/ComfyUI || true
  echo "STAGE: Updating custom nodes"
  if command -v comfy >/dev/null 2>&1; then
    (
      cd /workspace/ComfyUI && \
      comfy --here --skip-prompt node update all --mode cache
    ) 2>&1 | grep -vE '^(Command: \[|Execute from: )' || true
  else
    for d in /workspace/ComfyUI/custom_nodes/*/; do
      if [[ -d "$d/.git" ]]; then
        node_name="$(basename "$d")"
        echo "[nodes] refreshing ${node_name}"
        update_requirements "$d" || true
      fi
    done
  fi
fi
make_dir(parent, child){
  full_path="$parent/$child"
  if [ -d "$parent" ]; then
    if [ ! -d "$full_path" ]; then
      mkdir "$full_path"
    fi
  fi
}
make_dir "/workspace/ComfyUI" "user"
make_dir "/workspace/ComfyUI/user" "default"
make_dir "/workspace/ComfyUI/user/default" "workflows"
make_dir "/workspace/ComfyUI" "models"
make_dir "/workspace/ComfyUI/models" "sam2"
make_dir "/workspace/ComfyUI/models" "detection"
make_dir "/workspace/ComfyUI/models" "upscale_models"
make_dir "/workspace/ComfyUI/models" "wav2vec2"
