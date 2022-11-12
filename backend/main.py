from fastapi import FastAPI, UploadFile, File
from backend import Location, ITEM_STATUS, set_item_status, set_item_location, get_item_location, get_not_scanned_itens, get_scanned_itens, get_moved_itens
from enum import Enum
import os


app = FastAPI()
#Rodar com 'uvicorn main:app --reload'
#Pegar um item "http://127.0.0.1:8000/get-item/791140"
#Pegar a lista de não escaneados "http://127.0.0.1:8000/not-scanned-itens"
#Pegar a lista de escaneados "http://127.0.0.1:8000/scanned-itens"

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