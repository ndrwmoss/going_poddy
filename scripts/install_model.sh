cd /workspace/ComfyUI/models/$3
if [ $4 == "civ" ]; then
  CIV={{ RUNPOD_SECRET_civitai }} || "null"
  if [ ! -f "$1" && "$4" ==  "civ" && "$CIV" != "null" ]; then
    echo "Downloading Model: $1"
    wget "$2?token=$CIV" "$1"
  fi
else
  if [ ! -f "$1" ]; then
    echo "Downloading Model: $1"
    wget $2
  fi
fi
cd /scripts