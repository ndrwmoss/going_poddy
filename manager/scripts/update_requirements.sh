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