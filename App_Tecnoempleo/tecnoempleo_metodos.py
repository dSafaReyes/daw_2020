import requests
from bs4 import BeautifulSoup


def connect_url(url):
    response = requests.get(url)
    if response.status_code == 200:
        return BeautifulSoup(response.content, "html.parser")
    else:
        return False


def lista_palabras(txt):
    ''' Elimina todos los espacios de un string. Devuelve una lista con cada palabra '''
    lista_palabras = txt.split()
    lista_sin_espacios = list(filter(None, lista_palabras))
    return lista_sin_espacios


def redondear_arriba(num):
    ''' Deuelve el número redondeado
        a la siguiente unidad '''
    return round(num+0.5)


def get_ciudad_ofertas_paginas(string):
    ''' Recibe el contenido en h1, separa cada palabra en un elemento de la lista y devuelve de ella la ciudad,
        el número de ofertas y las páginas que tiene asociada dicha ciudad (en cada página caben 30 ofertas) '''
    lista_palabras_title = lista_palabras(string)
    n_ofertas = int(lista_palabras_title[0])
    ciudad = lista_palabras_title[-1]
    n_paginas = redondear_arriba(n_ofertas/30)
    return ciudad, n_ofertas, n_paginas


def filtrado_datos(text):
    lista = lista_palabras(text)
    fecha = to_fecha_mariadb(lista[0])
    remoto = True if '100%' in lista else False
    jornada = "Jornada Completa" if 'completa' in lista else "No Jornada Completa"
    contrato = "Contrato Indefinido" if 'indefinido' in lista else "Contrato No Indefinido"
    salario =  "Salario No Disponible" if 'disponible' in lista else lista[-4] + lista[-3] + lista[-2]
    return fecha, remoto, jornada, contrato, salario


def to_fecha_mariadb(string):
    ''' Convertimos del formato dd/mm/yyyy a yyyy-mm-dd '''
    lista_fecha = string.split("/")[::-1]
    return "-".join(lista_fecha)

def dict_empleo(nombre_puesto, nombre_empresa, fecha, remoto, jornada, contrato, salario, url_empleo):
    diccionario = {
        "nombre_puesto": nombre_puesto,
        "nombre_empresa": nombre_empresa,
        "fecha": fecha,
        "tipo_modalidad": remoto,
        "tipo_jornada": jornada,
        "tipo_contrato": contrato,
        "salario": salario,
        "url": url_empleo
    }
    return diccionario