from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import tecnoempleo_database as ddbb
import tecnoempleo_webscrapping as webscrapping

def app_tecnoempleo():
    body = Tk()
    body.title("Tecnoempleo")

    nav_menu = Menu(body)

    nav_menu_connect = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_connect, label="Cargar")
    nav_menu_connect.add_command(label="Cargar", command=lambda: app_tecnoempleo_cargar())

    nav_menu_show = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_show, label="Mostrar")
    nav_menu_show.add_command(label="Mostrar", command=lambda: app_tecnoempleo_select_tabla("mostrar"))

    nav_menu_query = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_query, label="Consultar")

    nav_menu_insert = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_insert, label="Insertar")
    nav_menu_insert.add_command(label="Insertar", command=lambda: app_tecnoempleo_select_tabla("insertar"))

    nav_menu_drop = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_drop, label="Eliminar")
    nav_menu_drop.add_command(label="Eliminar", command=lambda: app_tecnoempleo_select_tabla("eliminar"))

    body.config(bg="white", menu=nav_menu, width=300)
    body.mainloop()
    return True

def app_tecnoempleo_cargar(database_name="app_tecnoempleo"):
    body = Tk()
    body.title("Tecnoempleo")

    tecnoempleo = ddbb.Database(database_name)
    lista_empleos = ["Desarrollador Web", "Desarrollador Móvil", "Ciberseguridad", "Programador",
                     "Analista Programador", "Analista", "Arquitecto TIC", "Consultor", "DevOps", "Big Data",
                     "Bases de Datos"]

    Label(body, bg="white", fg="black", justify="left", text="SELECCIONE EL EMPLEO SOBRE EL QUE DESEA OBTENER LOS DATOS").grid(row=0, column=0, padx=10, pady=10,columnspan=len(lista_empleos))
    for i, empleo in enumerate(lista_empleos):
        Button(body, text=empleo, command=lambda x=empleo: webscrapping.cargar_datos_tecnoempleo(x)).grid(row=1, column=i, padx=5, pady=5)

    body.mainloop()
    return True

def app_tecnoempleo_mostrar(tabla, database_name="app_tecnoempleo"):
    tecnoempleo = ddbb.Database(database_name)

    datos = tecnoempleo.consultar_todos(tabla)
    columnas = tecnoempleo.get_columns(tabla)
    linea = 1

    body = Tk()
    body.pack_slaves()

    tabla_datos = ttk.Treeview(body)
    tabla_datos['columns'] = columnas

    tabla_datos.column("#0", width=0, stretch=NO)
    for columna in columnas:
        tabla_datos.column(columna, anchor=CENTER, width=150)

    tabla_datos.heading("#0", text="", anchor=CENTER)
    for columna in columnas:
        tabla_datos.heading(columna, text=columna.replace('_', ' ').capitalize(), anchor=CENTER)

    index = 1

    for registro in datos:
        tabla_datos.insert(parent='', index=index, values=(tuple(registro.values())))
        index += 1
    tabla_datos.pack()
    body.mainloop()

def app_tecnoempleo_select_tabla(parametro, database_name="app_tecnoempleo"):
    body = Tk()
    body.title("Tecnoempleo")

    tecnoempleo = ddbb.Database(database_name)
    lista_tablas = tecnoempleo.get_tables()

    if parametro == "mostrar":
        Label(body, bg="white", fg="black", justify="left", text="SELECCIONE LA TABLA SOBRE LA QUE DESEA OBTENER LOS DATOS").grid(row=0, column=0, padx=10, pady=10, columnspan=len(lista_tablas))
        for i, tabla in enumerate(lista_tablas):
            Button(body, text=tabla, command=lambda x=tabla: app_tecnoempleo_mostrar(x, database_name)).grid(row=1, column=i, padx=5, pady=5)
    elif parametro == "insertar":
        Label(body, bg="white", fg="black", justify="left", text="SELECCIONE LA TABLA SOBRE LA QUE DESEA INSERTAR UN NUEVO REGISTRO").grid(row=0, column=0, padx=10, pady=10, columnspan=len(lista_tablas))
        for i, tabla in enumerate(lista_tablas):
            Button(body, text=tabla, command=lambda x=tabla: app_tecnoempleo_insertar_registro(x)).grid(row=1, column=i, padx=5, pady=5)
    else:
        Label(body, bg="white", fg="black", justify="left", text="SELECCIONE LA TABLA QUE DESEA ELIMINAR").grid(row=0, column=0, padx=10, pady=10, columnspan=len(lista_tablas))
        for i, tabla in enumerate(lista_tablas):
            Button(body, text=tabla, command=lambda x=tabla: tecnoempleo.eliminar_tabla(x, database_name)).grid(row=1, column=i, padx=5, pady=5)
        Label(body, bg="white", fg="black", justify="left",
              text="Es necesario recargar esta pesataña para que la tabla desaparezca de las opciones").grid(row=2, column=0, padx=10, pady=10, columnspan=len(lista_tablas))

    body.mainloop()
    return True


def app_tecnoempleo_insertar_registro(tabla, database_name="app_tecnoempleo"):
    body = Tk()
    body.title("Tecnoempleo")

    tecnoempleo = ddbb.Database(database_name)
    lista_atributos = tecnoempleo.get_columns(f"{tabla}")[1:]

    dict_nuevo_registro = {atributo: StringVar() for atributo in lista_atributos}

    Label(body, bg="white", fg="black", justify="left", text=f"INTRODUZCA UN NUEVO REGISTRO EN LA TABLA {tabla}").grid(row=0, column=0, padx=10, pady=10, columnspan=2)
    for i, atributo in enumerate(lista_atributos):
        Label(body, bg="white", fg="black", justify="left", text=f"{atributo.replace('_', ' ').capitalize()}:").grid(row=i+1, column=0, padx=10, pady=10)
        dict_nuevo_registro[atributo] = Entry(body, bg="white", fg="black", justify="right")
        dict_nuevo_registro[atributo].grid(row=i+1, column=1, padx=10, pady=10)

    Label(body, bg="white", fg="black", justify="left", text="Introduzca la fecha en formato: yyyy-mm-dd").grid(row=len(lista_atributos)+1, column=0, padx=10, pady=10, columnspan=2)
    Label(body, bg="white", fg="black", justify="left", text="Introduzca el modo remoto en formato: True/False").grid(
        row=len(lista_atributos) + 2, column=0, padx=10, pady=10, columnspan=2)

    def registro():
        return tuple(dato.get() for dato in dict_nuevo_registro.values())

    Button(body, text="INSERTAR", width=15, command=lambda: tecnoempleo.insertar_datos(tabla, registro())).grid(row=len(lista_atributos)+3, column=0, padx=10, pady=10, columnspan=2)

    body.mainloop()


if __name__=="__main__":
    app_tecnoempleo()