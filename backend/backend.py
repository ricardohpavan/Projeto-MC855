import pandas as pd
import pathlib
from enum import Enum


INVENTORY_FILE = pathlib.Path('inventory.xlsx')
ID_COLUMN = 'Identificador'
ITEM_STATUS_COLUMN = 'item_status'

COLUMNS = [
    'Área de Patrimônio',
    'Identificador',
    'PI Antigo',
    'Desc. Órgão',
    'Imóvel',
    'Local N1',
    'Local N2',
    'Local N3',
    'Local N4',
    'Local N5',
]



class ITEM_STATUS(Enum):
    NOT_SCANNED = 0
    SCANNED = 1
    SCANNED_AND_MOVED = 2

class Place():

    def __init__(self, area: str, description: str, building: str, n1: str, n2: str, n3: str, n4: str, n5: str):
        self.area = area
        self.description = description
        self.building = building
        self.n1 = n1
        self.n2 = n2
        self.n3 = n3
        self.n4 = n4
        self.n5 = n5
    
Place('a', 'b', 'b', 'b', 'b', 'b', 'b', 'b').area

moved_itens = set()
checked_itens = set()

inventory_table = pd.read_excel(INVENTORY_FILE, index_col=ID_COLUMN, usecols=COLUMNS)

#Creates a status column and initializes all of its cells with the NOT_SCANNED status value
inventory_table[ITEM_STATUS_COLUMN] = ITEM_STATUS.NOT_SCANNED.value


def set_item_status(item_id, status: Enum):
    inventory_table.loc[item_id, ITEM_STATUS_COLUMN] = status.value
    

set_item_status(22484, ITEM_STATUS.SCANNED_AND_MOVED)

print(inventory_table.loc[22484, ITEM_STATUS_COLUMN])