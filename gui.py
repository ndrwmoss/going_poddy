from nicegui import ui
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

def startup():

    getLayout()
    ui.run(port=8288)