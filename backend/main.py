from fastapi import FastAPI
from backend import set_item_status, set_item_location, get_item_location, get_not_scanned_itens, get_scanned_itens, get_moved_itens
from enum import Enum

app = FastAPI()
#Rodar com 'uvicorn main:app --reload'
#Pegar um item "http://127.0.0.1:8000/get-item/791140"
#Pegar a lista de não escaneados "http://127.0.0.1:8000/not-scanned-itens"
#Pegar a lista de escaneados "http://127.0.0.1:8000/scanned-itens"

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

@app.get("/moved-itens")
def get_moved():
    return get_moved_itens()
