#!/bin/bash
# --- CUDA preflight (bail early) ---
echo "STAGE: Checking CUDA initialization"
if ! python - <<'PY' &>/dev/null
import torch; torch.cuda.current_device()
PY
then
  cat << 'EOF'
 �������+��+  ��+��+��������+    ������+  ������+ ������+ 
 ��+----+���  ������+--��+--+    ��+--��+��+---��+��+--��+
 �������+�����������   ���       ������++���   ������   ��+
 +----�����+--������   ���       ��+---+ ���   ������  ��++
 �����������  ������   ���       ���     +������++������++
 +------++-+  +-++-+   +-+       +-+      +-----+ +-----+

       this pod has broken or outdated GPU drivers 
           deploy a new one and kill this one

EOF
  echo "CUDA initialization failed" >> ~/comfyui_error.log
  exit 1
fi