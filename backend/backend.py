import pandas as pd
import pathlib

INVENTORY_FILE = pathlib.Path('inventory.xlsx')
ID_COLUMN = 'Identificador'

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

moved_itens = set()
checked_itens = set()

inventory_table = pd.read_excel(INVENTORY_FILE, index_col=ID_COLUMN, usecols=COLUMNS)

#print(inventory_table.loc[790989])