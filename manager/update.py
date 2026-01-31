import os
from pathlib import Path
def load():
    
    return None
def save():
    return None

def refresh():
    return None
def update_poddy():
    print("parent:" + str(os.getcwd()))
    os.chdir(os.path.dirname(os.getcwd()))
    print("current" + str(os.getcwd()))