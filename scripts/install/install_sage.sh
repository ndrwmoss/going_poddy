#!/bin/bash
set -e # Exit the script if any statement returns a non-true return value
echo "SCRIPT: Install Sage Attention"
# --- Install appropriate sageattention wheel based on GPU architecture ---
ARCH=$(python3 - <<'EOF'
import torch
if not torch.cuda.is_available():
    print("none")
    exit(0)
cap = torch.cuda.get_device_capability()[0] * 10 + torch.cuda.get_device_capability()[1]
arch_map = {120: "sm120", 86: "sm86", 89: "sm89"}
print(arch_map.get(cap, "none"))
EOF
)
if [ "$ARCH" != "none" ]; then
    WHEEL_FILE=$(find /wheels -type f -name "sageattention-*+${ARCH}-*.whl" | head -n 1)
    if [ -n "$WHEEL_FILE" ]; then
        echo "Installing sageattention wheel for architecture $ARCH"
        pip install --no-deps "$WHEEL_FILE"
    else
        echo "No matching wheel found for architecture $ARCH, falling back to pip"
        pip install sageattention==1.0.6
    fi
else
    echo "Installing sageattention from pip"
    pip install sageattention==1.0.6
fi
