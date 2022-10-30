from fastapi import FastAPI
from backend import set_item_status, set_item_location, get_item_location, get_not_scanned_itens, get_scanned_itens, get_moved_itens
from enum import Enum

app = FastAPI()
#Rodar com 'uvicorn main:app --reload'
#Pegar um item "http://127.0.0.1:8000/get-item/791140"
#Pegar a lista de não escaneados "http://127.0.0.1:8000/not-scanned-itens"
#Pegar a lista de escaneados "http://127.0.0.1:8000/scanned-itens"
#Suposto link pra setar um status "http://127.0.0.1:8000/set-item-status/791140/ITEM_STATUS.SCANNED" --resolver isso

class ITEM_STATUS(Enum):
    NOT_SCANNED = 0
    SCANNED = 1
    SCANNED_AND_MOVED = 2

@app.post("/set-item-status/{id_item}/{status}")
def set_status(item_id: int, status):
    return set_item_status(item_id, status)

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

