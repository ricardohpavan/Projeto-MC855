from fastapi import FastAPI, UploadFile, File
from enum import Enum
import pandas as pd
import pathlib
from fastapi.middleware.cors import CORSMiddleware
import os
from enum import Enum

AREA_COLUMN = 'Área de Patrimônio'
ID_COLUMN = 'Identificador'
DEPRECATED_ID_COLUMN = 'PI Antigo'
ORGANIZATION_DESCRIPTION_COLUMN = 'Desc. Órgão'
BUILDING_COLUMN = 'Imóvel'
N1_COLUMN = 'Local N1'
N2_COLUMN = 'Local N2'
N3_COLUMN = 'Local N3'
N4_COLUMN = 'Local N4'
N5_COLUMN = 'Local N5'

ITEM_STATUS_COLUMN = 'item_status'

COLUMNS = [
    AREA_COLUMN,
    ID_COLUMN,
    DEPRECATED_ID_COLUMN,
    ORGANIZATION_DESCRIPTION_COLUMN,
    BUILDING_COLUMN,
    N1_COLUMN,
    N2_COLUMN,
    N3_COLUMN,
    N4_COLUMN,
    N5_COLUMN,
]

class ITEM_STATUS(Enum):
    NOT_SCANNED = 0
    SCANNED = 1
    SCANNED_AND_MOVED = 2

class Location():

    def __repr__(self):
        return f'(area: {self.area},\
        organization_description: {self.organization_description},\
        building: {self.building},\
        n1: {self.n1},\
        n2: {self.n2},\
        n3: {self.n3},\
        n4: {self.n4},\
        n5: {self.n5})\
        '

    def __init__(self, area: str, organization_description: str, building: str, n1: str, n2: str, n3: str, n4: str, n5: str):
        self.area = area
        self.organization_description = organization_description
        self.building = building
        self.n1 = n1
        self.n2 = n2
        self.n3 = n3
        self.n4 = n4
        self.n5 = n5

app = FastAPI()
#Rodar com 'uvicorn main:app --reload'
#Pegar um item "http://127.0.0.1:8000/get-item/791140"
#Pegar a lista de não escaneados "http://127.0.0.1:8000/not-scanned-itens"
#Pegar a lista de escaneados "http://127.0.0.1:8000/scanned-itens"

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ITEM_STATUS(Enum):
    NOT_SCANNED = 0
    SCANNED = 1
    SCANNED_AND_MOVED = 2

class Location():
    def __init__(self, area: str, organization_description: str, building: str, n1: str, n2: str, n3: str, n4: str, n5: str):
        self.area = area
        self.organization_description = organization_description
        self.building = building
        self.n1 = n1
        self.n2 = n2
        self.n3 = n3
        self.n4 = n4
        self.n5 = n5

app.was_file_uploaded = False

@app.put("/set-item-status")
def set_status(item_id: int, status: int):
    return set_item_status(item_id, ITEM_STATUS(status))

@app.put("/set-item-location")
def set_location(item_id: int, area: str, organization_description: str, building: str, n1: str, n2: str, n3: str, n4: str, n5: str):
    location = Location(area, organization_description, building, n1, n2, n3, n4, n5)
    return set_item_location(item_id, location)

@app.get("/get-item/{id_item}")
def get_item(id_item: int):
    return get_item_location(id_item)

@app.get("/not-scanned-itens")
def get_not_scanned():
    return get_not_scanned_itens()

@app.get("/scanned-itens")
def get_scanned():
    return get_scanned_itens()

@app.put("/upload")
def upload(file: UploadFile = File(...)):
    try:
        contents = file.file.read()
        with open(file.filename, 'wb') as f:
            f.write(contents)
        app.INVENTORY_FILE = pathlib.Path('inventory.xlsx')
        app.inventory_table = pd.read_excel(app.INVENTORY_FILE, index_col=ID_COLUMN, usecols=COLUMNS)
        #Creates a status column and initializes all of its cells with the NOT_SCANNED status value
        app.inventory_table[app.ITEM_STATUS_COLUMN] = ITEM_STATUS.NOT_SCANNED.valu
    except Exception:
        return {"message": "There was an error uploading the file"}
    finally:
        file.file.close()

    app.was_file_uploaded = True
    app.filename = file.filename
    return {"message": f"Successfully uploaded {app.filename}"}

@app.get("/unload-database")
def unload_database():
    if hasattr(app, 'filename'):
        os.remove(app.filename)
        filename = app.filename
        del app.filename
        app.was_file_uploaded = False
        return {"message": f"Successfully unloaded {filename}"}
    else:
        return {"message": f"No database was uploaded to unload"}

@app.get("/upload-check")
def upload_check():
    return {"was-file-uploaded": app.was_file_uploaded}

def set_item_status(item_id, status: ITEM_STATUS):
    app.inventory_table.loc[item_id, ITEM_STATUS_COLUMN] = status.value
    return status

def set_item_location(item_id, location: Location):
    app.inventory_table.loc[item_id, AREA_COLUMN] = location.area
    app.inventory_table.loc[item_id, ORGANIZATION_DESCRIPTION_COLUMN] = location.organization_description
    app.inventory_table.loc[item_id, BUILDING_COLUMN] = location.building
    app.inventory_table.loc[item_id, N1_COLUMN] = location.n1
    app.inventory_table.loc[item_id, N2_COLUMN] = location.n2
    app.inventory_table.loc[item_id, N3_COLUMN] = location.n3
    app.inventory_table.loc[item_id, N4_COLUMN] = location.n4
    app.inventory_table.loc[item_id, N5_COLUMN] = location.n5
    return location

def get_item_location(inventory_table, item_id):
    return inventory_table.loc[item_id].to_json(orient="index")

def get_not_scanned_itens():
    return app.inventory_table.loc[app.inventory_table[ITEM_STATUS_COLUMN] == ITEM_STATUS.NOT_SCANNED.value].to_json(orient="index")

def get_scanned_itens():
    return app.inventory_table.loc[app.inventory_table[ITEM_STATUS_COLUMN] == ITEM_STATUS.SCANNED.value].to_json(orient="index")

def get_moved_itens():
    return app.inventory_table.loc[app.inventory_table[ITEM_STATUS_COLUMN] == ITEM_STATUS.SCANNED_AND_MOVED.value].to_json(orient="index")
