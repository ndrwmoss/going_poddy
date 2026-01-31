
import os
import shutil
import subprocess
directory = {
    'poddy': '',
    'poddy_scripts': '',
    'poddy_workflows': '',
    'root': '',
    'workspace': '',
    'comfy': '',
    'comfy_user': '',
    'comfy_default': '',
    'comfy_workflows': '',
    'comfy_nodes': '',
    'comfy_model': '',
    'comfy_pre_install': ''
}
# appends a file name to a directory path
def directory_file(path, filename):
    return path + "\\" + filename
# checks if a directory/file exists
def directory_exists(path, filename = None):
    return os.path.exists(path if filename == None else directory_file(path, filename))
# makes a new directory at the location, adding nested directories to that path if they don't exist
def make_directory(path, directory_name):
    os.makedirs(directory_file(path, directory_name), exist_ok=True)
# moves the directory/file to the new location and renames the file
def move_directory(path, move_to, filename = None, name_change = None):
    if filename == None:
        allfiles = os.listdir(path)
        for f in allfiles:
            shutil.move(os.path.join(path, f), os.path.join(move_to, f))
    else:
        shutil.move(directory_file(path, filename), directory_file(move_to, filename if name_change == None else name_change))
# executes the script in the given directory
def execute_in_directory(path, execute_script = None):
    os.chdir(path)
    if execute_script != None:
        subprocess.run([execute_script], shell=True) 
# returns the preset directory if it exists, else returns root directory
def get_directory(name):
    if directory[name] != None:
        return directory[name]
    else:
        return directory['root']
# returns True if the argument is in any index of the argument list, else returns False
def args_has_argument(args, argument = "none"):
    for i in range(len(args)):
        if (args[i] == argument):
            return True
    return False
# returns the value of the index if it exists, else returns False
def args_has_argument_index(args, index = 1):
    for i in range(len(args)):
        if (i == index):
            return args[i]
    return False
# give a path and number of parents to navigate up and it returns the new parent path
def directory_up(path, number_of_paths_to_go_up):
    for _ in range(number_of_paths_to_go_up):
        path = directory_up(path.rpartition("\\")[0], 0)
    return(path)
# give a path and list of children folders to naviage to and it returns the new child path
def directory_down(path, folders): # here 'path' is your path, 'n' is number of dirs up you want to go
    for i in range(len(folders)):
        path = path + "\\" + folders[i]
    return path
# Sets the current working directory
def go_to_directory(path):
    os.chdir(path)
def command(argument_list = ['']):
    subprocess.call(argument_list, shell=True)
# Refreshes the program directory list
def _refresh_directories():
    directory['poddy'] = os.path.split(os.path.abspath(__file__))[0]
    directory['poddy_scripts'] = (directory_down(directory['poddy'], ['scripts']))
    directory['poddy_workflows'] = (directory_down(directory['poddy'], ['workflows']))
    directory['root'] = str(directory_up(directory['poddy'], 2))
    directory['workspace'] = str(directory_down(directory['root'], ['workspace']))
    directory['comfy'] = str(directory_down(directory['workspace'], ['ComfyUI']))
    directory['comfy_user'] = str(directory_down(directory['comfy'], ['user']))
    directory['comfy_default'] = str(directory_down(directory['comfy_user'], ['default']))
    directory['comfy_workflows'] = str(directory_down(directory['comfy_default'], ['workflows']))
    directory['comfy_nodes'] = str(directory_down(directory['comfy'], ['workflows']))
    directory['comfy_model'] =  str(directory_down(directory['comfy'], ['models']))
    directory['comfy_pre_install'] =  str(directory_down(directory['root'], ['Comfy']))
    return True
