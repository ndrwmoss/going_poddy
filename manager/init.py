import subprocess
from directory import _refresh_directories, execute_in_directory, get_directory, go_to_directory, directory_exists, make_directory, directory_file, directory_down
def initiate(dev):
  _refresh_directories()
  if dev:
    #Start Nginx
    execute_in_directory(get_directory('poddy_scripts'), './nginx.sh')
    #Check Cuda
    execute_in_directory(get_directory('poddy_scripts'), './check_cuda.sh')
    #Move Comfy
    execute_in_directory(get_directory('poddy_scripts'), './move_comfy.sh')
    #Install Sage
    execute_in_directory(get_directory('poddy_scripts'), './install_sage.sh')
    #Start SSH
    execute_in_directory(get_directory('poddy_scripts'), './ssh.sh')
    #Start Jupyter
    execute_in_directory(get_directory('poddy_scripts'), './jupyter.sh')
    #Install ComfyUI
    execute_in_directory(get_directory('poddy_scripts'), './install_comfy.sh')
    go_to_directory(get_directory('comfy'))
    subprocess.call(["python", "main.py", "--listen 0.0.0.0 --port 8188"])
    go_to_directory(get_directory('poddy_manager'))
  if directory_exists(get_directory('comfy_user')) == False:
    make_directory(get_directory('comfy'), 'user')
  if directory_exists(get_directory('comfy_default')) == False:
    make_directory(get_directory('comfy_user'), 'default')
  if directory_exists(get_directory('comfy_workflows')) == False:
    make_directory(get_directory('comfy_default'), 'workflows')
  return dev