import mysql.connector

class Database:
    def __init__(self, nombre_bbdd):
        self.nombre_bbdd = nombre_bbdd
        self.conector = mysql.connector.connect(host="localhost", port="3306", user="root", password="raiz", database=nombre_bbdd, autocommit=True)
        self.cursor_on = self.conector.cursor()
        self.cursor_off = self.conector.cursor().close()

    def get_tables(self):
        mycursor = self.cursor_on
        mycursor.execute("SHOW TABLES")
        lista_tables = [str(table)[2:-3] for table in mycursor.fetchall()]
        mycursor = self.cursor_off
        return lista_tables

    def get_columns(self, nombre_tabla):
        mycursor = self.cursor_on
        mycursor.execute(f"SHOW COLUMNS FROM {nombre_tabla}")
        lista_columnas = [elemento[0] for elemento in mycursor.fetchall()]
        mycursor = self.cursor_off
        return lista_columnas

    def crear_tabla(self, nombre_tabla):
        mycursor = self.cursor_on
        mycursor.execute(
            f"CREATE TABLE IF NOT EXISTS {nombre_tabla} ("
            f"id int(4) not null auto_increment,"
            f"nombre_puesto varchar(150),"
            f"nombre_empresa varchar(150),"
            f"fecha_empleo date,"
            f"modo_remoto varchar(150),"
            f"tipo_jornada varchar(150),"
            f"tipo_contrato varchar(150),"
            f"salario varchar(150),"
            f"url varchar(300),"
            f"constraint {nombre_tabla}_pk primary key (id)"
            f")"
        )
        mycursor = self.cursor_off
        return True

    def insertar_datos(self, nombre_tabla, lista_datos):
        mycursor = self.cursor_on
        tabla = (f"INSERT INTO {nombre_tabla} "
                "(nombre_puesto, nombre_empresa, fecha_empleo, modo_remoto, tipo_jornada, tipo_contrato, salario, url) "
                "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)")
        mycursor.execute(tabla, lista_datos)
        mycursor = self.cursor_off
        return True

    def eliminar_tabla(self, nombre_tabla):
        mycursor = self.cursor_on
        mycursor.execute(f"DROP TABLE IF EXISTS {nombre_tabla}")
        mycursor = self.cursor_off
        return True

    def consultar_todos(self, nombre_tabla):
        mycursor = self.cursor_on
        # Obetenemos una lista de atributos
        columnas = self.get_columns(nombre_tabla)
        # Obtenemos una lista de tuplas de los datos
        query = (f"SELECT * FROM {nombre_tabla}")
        mycursor.execute(query)
        # Almacenamos lo anterior en un lista de diccionarios
        lista_dict_datos = [dict(zip(columnas, registro)) for registro in mycursor.fetchall()]
        return lista_dict_datos


def crear_bbdd(nombre_bbdd):
    conexion = mysql.connector.connect(host="localhost", port="3306", user="root", password="raiz", autocommit=True)
    mycursor = conexion.cursor()
    mycursor.execute(f"CREATE DATABASE IF NOT EXISTS {nombre_bbdd}")
    mycursor = conexion.close()
    return True

def consultar_bbdd():
    conexion = mysql.connector.connect(host="localhost", port="3306", user="root", password="raiz", autocommit=True)
    mycursor = conexion.cursor()
    mycursor.execute("SHOW DATABASES")
    lista_bbdd = [str(bbdd)[2:-3] for bbdd in mycursor.fetchall()]
    return lista_bbdd
