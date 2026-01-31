#!/bin/bash
cd /
jupyter lab \
  --ip=0.0.0.0 \
  --port=8888 \
  --no-browser \
  --allow-root \
  --NotebookApp.allow_origin='*' \
  --ServerApp.token='' \
  --ServerApp.password='' \
  --FileContentsManager.preferred_dir=/workspace \
  --FileContentsManager.delete_to_trash=False \
  --ServerApp.terminado_settings='{"shell_command":["/bin/bash","-l"]}' \
  &> /jupyter.log &