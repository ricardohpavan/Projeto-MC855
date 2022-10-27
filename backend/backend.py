import pandas as pd
import pathlib
from enum import Enum


INVENTORY_FILE = pathlib.Path('inventory.xlsx')

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
        n4: {self.n4})\
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

inventory_table = pd.read_excel(INVENTORY_FILE, index_col=ID_COLUMN, usecols=COLUMNS)

#Creates a status column and initializes all of its cells with the NOT_SCANNED status value
inventory_table[ITEM_STATUS_COLUMN] = ITEM_STATUS.NOT_SCANNED.value


def set_item_status(item_id, status: Enum):
    inventory_table.loc[item_id, ITEM_STATUS_COLUMN] = status.value

def get_item_location(item_id):
    item_row = inventory_table.loc[item_id]
    area = item_row[AREA_COLUMN]
    organization_description = item_row[ORGANIZATION_DESCRIPTION_COLUMN]
    building = item_row[BUILDING_COLUMN]
    n1 = item_row[N1_COLUMN]
    n2 = item_row[N2_COLUMN]
    n3 = item_row[N3_COLUMN]
    n4 = item_row[N4_COLUMN]
    n5 = item_row[N5_COLUMN]

    return Location(area, organization_description, building, n1, n2, n3, n4, n5)

def set_item_location(item_id, location: Location):
    inventory_table.loc[item_id, AREA_COLUMN] = location.area
    inventory_table.loc[item_id, ORGANIZATION_DESCRIPTION_COLUMN] = location.organization_description
    inventory_table.loc[item_id, BUILDING_COLUMN] = location.building
    inventory_table.loc[item_id, N1_COLUMN] = location.n1
    inventory_table.loc[item_id, N2_COLUMN] = location.n2
    inventory_table.loc[item_id, N3_COLUMN] = location.n3
    inventory_table.loc[item_id, N4_COLUMN] = location.n4
    inventory_table.loc[item_id, N5_COLUMN] = location.n5


def get_scan_summary():
    not_scanned_itens = inventory_table.loc[inventory_table[ITEM_STATUS_COLUMN] == ITEM_STATUS.NOT_SCANNED.value]
    scanned_itens = inventory_table.loc[inventory_table[ITEM_STATUS_COLUMN] == ITEM_STATUS.SCANNED.value]
    moved_itens = inventory_table.loc[inventory_table[ITEM_STATUS_COLUMN] == ITEM_STATUS.SCANNED_AND_MOVED.value]

    return not_scanned_itens, scanned_itens, moved_itens

location = Location('area', 'organization_description', 'building', 'n1', 'n2', 'n3', 'n4', 'n5')

set_item_status(790934, ITEM_STATUS.SCANNED)
set_item_status(22484, ITEM_STATUS.SCANNED_AND_MOVED)

not_scanned_itens, scanned_itens, moved_itens = get_scan_summary()

print(not_scanned_itens, scanned_itens, moved_itens)
