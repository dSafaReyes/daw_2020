from tkinter import *
from tkinter import messagebox
import tecnoempleo_database as ddbb
import tecnoempleo_app as extension
from tecnoempleo_app import app_tecnoempleo


def app_principal():
    body = Tk()
    body.title("Tecnoempleo")
    # body.iconbitmap("images/hook.ico")

    lista_ddbb = ddbb.consultar_bbdd()

    nav_menu = Menu(body)

    nav_menu_connect = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_connect, label="Database")
    for database in lista_ddbb:
        nav_menu_connect.add_command(label=database, command=lambda x=database: extension.app_tecnoempleo_select_tabla("mostrar", database_name=x))

    nav_menu_drop = Menu(nav_menu, tearoff=0)
    nav_menu.add_cascade(menu=nav_menu_drop, label="Borrar")
    for database in lista_ddbb:
        nav_menu_drop.add_command(label=database, command=lambda x=database: extension.app_tecnoempleo_select_tabla("eliminar", database_name=x))

    nombre_database = StringVar()
    div_database_label = Label(body, bg="white", fg="black", justify="left", text="CREAR BASE DE DATOS").grid(row=0, column=0, padx=10, pady=10, columnspan=2)
    div_database_label = Label(body, bg="white", fg="black", justify="left", text="Introduce el nombre:").grid(row=1, column=0, padx=10, pady=10)
    div_database_form = Entry(body, bg="white", fg="black", justify="right", textvariable=nombre_database).grid(row=1, column=1, padx=10, pady=10)
    div_database_button = Button(body, text="Crear", width=15, command= lambda: ddbb.crear_bbdd(nombre_database.get())).grid(row=2, column=0, padx=10, pady=10, columnspan=2)

    Button(body, text="TECNOEMPLEO APP", width=15, command=lambda: app_tecnoempleo()).grid(row=3, column=0, padx=10, pady=10, columnspan=2)

    body.config(bg="white", menu=nav_menu)
    body.mainloop()
    return True

if __name__=="__main__":
    app_principal()