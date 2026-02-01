$restore = $PWD
cd /
python install.py "$1"
EXIT_CODE=$?
if [ $EXIT_CODE -eq 1 ]; then
  cd /workspace/ComfyUI/models/$3
  if [ $4 == "civ" ]; then
    CIV={{ RUNPOD_SECRET_civitai }} || "null"
    if [ ! -f "$1" && "$4" ==  "civ" && "$CIV" != "null" ]; then
      echo "Downloading Model: $1"
      wget "$2?token=$CIV" -O "$1"
    fi
  else
    if [ ! -f "$1" ]; then
      echo "Downloading Model: $1"
      wget "$2" -O "$1"
    fi
  fi
else
  echo "Model $1 is already installed"
fi
cd "$restore"