#!/bin/bash
# --- CUDA preflight (bail early) ---
echo "STAGE: Checking CUDA initialization"
if ! python - <<'PY' &>/dev/null
import torch; torch.cuda.current_device()
PY
then
  cat << 'EOF'

CUDA CRAPPED OUT:
Either the GPU isn't supported, something is wrong with the drivers, or any number of issues since this is stage one of initialization. Bummer.

Recommendations:
          1. Try restarting the pod, it's kind of like the magic trick you show your grandpa when his router isn't working-- sometimes rebooting is magic sauce.
          2. Try using a different GPU. Cuda requires NVIDIA GPUs, if you're using another brand you're attempting to pound a square peg into a round hole.
          3. Third strike you're out-- If you had the patience to attempt step 1 and 2 before bugging out to another template you have more patience than 99% of people. Here's your digital gold star: ⭐.
EOF
  echo "CUDA initialization failed" >> ~/comfyui_error.log
  exit 1
fi