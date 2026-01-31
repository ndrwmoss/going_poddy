
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