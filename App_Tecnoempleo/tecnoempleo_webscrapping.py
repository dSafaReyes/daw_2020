import tecnoempleo_metodos as metodos
import tecnoempleo_database as bbdd

def cargar_dict_datos_ciudades(empleo):
    n_ciudades = range(231, 231+52)
    lista_url_ciudades = [f"https://www.tecnoempleo.com/busqueda-empleo.php?te={empleo}&pr=,{n},&pagina=1" for n in n_ciudades]

    # Almacenamos en el siguiente diccionario: ciudad {número total de ofertas, número de páginas a recorrer,
    # url original de cada ciudad y el url relativo a cada página}
    dict_ciudad_info = dict()
    for url_ciudad in lista_url_ciudades:
        soup = metodos.connect_url(url_ciudad)
        title = soup.find("h1", "h4 h5-xs py-4 text-center")
        ciudad, n_ofertas, n_paginas = metodos.get_ciudad_ofertas_paginas(title.text)
        dict_ciudad_info[ciudad] = {
            "n_ofertas": n_ofertas,
            "n_paginas": n_paginas,
            "url_original": url_ciudad,
            "lista_paginas": [url_ciudad[:-1] + str(pag) for pag in range(1, n_paginas + 1)]
        }
    return dict_ciudad_info

def cargar_lista_empleo_info(empleo):
    ''' Devuelve una lista de diccionarios con información de cada puesto de trabajo '''
    # Del diccionario anterior usamos las url de todas las páginas de cada ciudad para
    lista_empleo_info = list()
    dict_ciudad_info = cargar_dict_datos_ciudades(empleo)
    for ciudad, elemento in dict_ciudad_info.items():
        for url_pag in elemento["lista_paginas"]:
            # De cada url obtenemos los div que contienen información acerca del puesto
            soup = metodos.connect_url(url_pag)
            div_container = soup.find_all("div", "p-2 border-bottom bg-white")
            for info in div_container:
                # Dentro del div obtenemos el nombre del puesto, el nombre de la empresa y el enlace a la oferta
                nombre_puesto = info.find("h5").text.strip()
                nombre_empresa = info.find("p").find("a").text.strip()
                url_empleo = info.find('a')['href']
                # Obtenemos además información extra acerca de la fecha, modalidad, jornada, etc
                detalles_empleo = info.find("div", "bg-theme-color-light h-100-xs p-3 rounded mb-3 fs--15 text-muted").text
                fecha, remoto, jornada, contrato, salario = metodos.filtrado_datos(detalles_empleo)
                # Almacenamos toda la información en un diccionario y la guardamos en la lista empleo info
                dic_datos_empleo = metodos.dict_empleo(nombre_puesto, nombre_empresa, fecha, remoto, jornada, contrato, salario, url_empleo)
                lista_empleo_info.append(dic_datos_empleo)
    return lista_empleo_info


def cargar_datos_tecnoempleo(empleo):
    empleo_url = empleo.lower().replace(" ", "+")
    empleo_database = empleo.lower().replace(" ", "_")
    bbdd.crear_bbdd("app_tecnoempleo")
    tecnoempleo = bbdd.Database("app_tecnoempleo")
    tecnoempleo.crear_tabla(empleo_database)
    lista_empleo_info = cargar_lista_empleo_info(empleo_url)
    for empleo in lista_empleo_info:
        tecnoempleo.insertar_datos(empleo_database, tuple(empleo.values()))
    return True


