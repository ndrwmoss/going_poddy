#!/bin/bash
set -e # Exit the script if any statement returns a non-true return value
echo "SCRIPT: Update ComfyUI and custom_nodes"
# --- Helper: update repo + pip if changed ---
update_and_install_requirements() {
  cd "$1" || return
  local old="$(git rev-parse HEAD 2>/dev/null || echo)"
  git pull --ff-only || true
  local new="$(git rev-parse HEAD 2>/dev/null || echo)"
  if [[ "$old" != "$new" && -f requirements.txt ]]; then
    pip install -r requirements.txt
  fi
}

# --- Update core + custom nodes when repos change (idempotent) ---
if [[ -d /workspace/ComfyUI ]]; then
  for d in /workspace/ComfyUI/custom_nodes/*/; do
    if [[ -d "$d/.git" ]]; then
      node_name="$(basename "$d")"
      update_and_install_requirements "$d" || true
    fi
  done
fi