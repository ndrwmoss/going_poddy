from directory import args_has_argument, _refresh_directories, go_to_directory
loaded = _refresh_directories()
from nicegui import ui
from gui import startup


@ui.refreshable
def getFooter():
    with ui.row().classes():
        ui.label('Footer').classes('col-span-1 border p-1')

@ui.refreshable
def getHeader(win = False):
    with ui.row().classes():
        ui.label("Going Poddy on Windows" if win else "Going Poddy in the cloud")

@ui.refreshable
def getBody():
    with ui.row().classes():
        ui.label("Body")


@ui.refreshable
def getLayout(win = False):
    getHeader(win)
    getBody()
    getFooter()

getLayout()
ui.run(port=8288)