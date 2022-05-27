import random
import decimal

lNombres = ["Aarón", "Abdón", "Abel", "Abelardo", "Abrahán", "Absalón", "Acacio", "Adalberto", "Adán", "Adela", "Adelaida", "Adolfo", "Adón", "Adrián", "Agustín", "Aitor", "Alba", "Albert", "Alberto", "Albina", "Alejandra", "Alejandro", "Alejo", "Alfonso", "Alfredo", "Alicia", "Alipio", "Almudena", "Alonso", "Álvaro", "Amadeo", "Amaro", "Ambrosio", "Amelia", "Amparo", "Ana", "Ananías", "Anastasia", "Anatolio", "Andrea", "Andrés", "Ángel", "Ángela", "Ángeles", "Aniano", "Anna", "Anselmo", "Antero", "Antonia", "Antonio", "Aquiles", "Araceli", "Aránzazu", "Arcadio", "Aresio", "Ariadna", "Aristides", "Arnaldo", "Artemio", "Arturo", "Ascensión", "Asunción", "Atanasio", "Augusto", "Áurea", "Aurelia", "Aureliano", "Aurelio", "Aurora", "Baldomero", "Balduino", "Baltasar", "Bárbara", "Bartolomé", "Basileo", "Beatriz", "Begoña", "Belén", "Beltrán", "Benedicto", "Benigno", "Benito", "Benjamín", "Bernabé", "Bernarda", "Bernardo", "Blanca", "Blas", "Bonifacio", "Borja", "Bruno", "Calixto", "Camilo", "Cándida", "Carina", "Carlos", "Carmelo", "Carmen", "Carolina", "Casiano", "Casimiro", "Casio", "Catalina", "Cayetano", "Cayo", "Cecilia", "Ceferino", "Celia", "Celina", "Celso", "César", "Cesáreo", "Cipriano", "Cirilo", "Cirino", "Ciro", "Clara", "Claudia", "Claudio", "Cleofás", "Clotilde", "Colombo", "Columba", "Columbano", "Concepción", "Conrado", "Constancio", "Constantino", "Consuelo", "Cosme", "Cristian", "Cristina", "Cristóbal", "Daciano", "Dacio", "Dámaso", "Damián", "Daniel", "Dario", "David", "Demócrito", "Diego", "Dimas", "Dolores", "Domingo", "Donato", "Dorotea", "Edgar", "Edmundo", "Eduardo", "Eduvigis", "Efrén", "Elena", "Elías", "Elisa", "Eliseo", "Elvira", "Emilia", "Emiliano", "Emilio", "Encarnación", "Enrique", "Epifanía", "Erico", "Ernesto", "Esdras", "Esiquio", "Esperanza", "Esteban", "Ester", "Esther", "Eugenia", "Eugenio", "Eulalia", "Eusebio", "Eva", "Evaristo", "Ezequiel", "Fabián", "Fabio", "Fabiola", "Facundo", "Fátima", "Faustino", "Fausto", "Federico", "Feliciano", "Felipe", "Félix", "Fermín", "Fernando", "Fidel", "Fortunato", "Francesc", "Francisca", "Francisco", "Fulgencio", "Gabriel", "Gema", "Genoveva", "Gerardo", "Germán", "Gertrudis", "Gisela", "Gloria", "Godofredo", "Gonzalo", "Gregorio", "Guadalupe", "Guido", "Guillermo", "Gustavo", "Guzmán", "Héctor", "Heliodoro", "Heraclio", "Heriberto", "Hilarión", "Hildegarda", "Homero", "Honorato", "Honorio", "Hugo", "Humberto", "Ifigenia", "Ignacio", "Ildefonso", "Inés", "Inmaculada", "Inocencio", "Irene", "Ireneo", "Isaac", "Isabel", "Isaías", "Isidro", "Ismael", "Iván", "Jacinto", "Jacob", "Jacobo", "Jaime", "Jaume", "Javier", "Jeremías", "Jerónimo", "Jesús", "Joan", "Joaquím", "Joaquín", "Joel", "Jonás", "Jonathan", "Jordi", "Jorge", "Josafat", "José", "Josefa", "Josefina", "Josep", "Josué", "Juan", "Juana", "Julia", "Julián", "Julio", "Justino", "Juvenal", "Ladislao", "Laura", "Laureano", "Lázaro", "Leandro", "Leocadia", "León", "Leonardo", "Leoncio", "Leonor", "Leopoldo", "Lidia", "Liduvina", "Lino", "Lorena", "Lorenzo", "Lourdes", "Lucano", "Lucas", "Lucía", "Luciano", "Lucrecia", "Luis", "Luisa", "Luz", "Macario", "Magdalena", "Manuel", "Manuela", "Mar", "Marc", "Marcelino", "Marcelo", "Marcial", "Marciano", "Marcos", "Margarita", "María", "Mariano", "Marina", "Mario", "Marta", "Martín", "Mateo", "Matías", "Matilde", "Mauricio", "Maximiliano", "Melchor", "Mercedes", "Miguel", "Milagros", "Miqueas", "Míriam", "Mohamed", "Moisés", "Mónica", "Montserrat", "Narciso", "Natalia", "Natividad", "Nazario", "Nemesio", "Nicanor", "Nicodemo", "Nicolás", "Nicomedes", "Nieves", "Noé", "Noelia", "Norberto", "Nuria", "Octavio", "Odón", "Olga", "Onésimo", "Orestes", "Oriol", "Oscar", "Óscar", "Oseas", "Oswaldo", "Otilia", "Oto", "Pablo", "Pancracio", "Pascual", "Patricia", "Patricio", "Paula", "Pedro", "Petronila", "Pilar", "Pío", "Poncio", "Porfirio", "Primo", "Priscila", "Probo", "Purificación", "Rafael", "Raimundo", "Ramiro", "Ramón", "Raquel", "Raúl", "Rebeca", "Reinaldo", "Remedios", "Renato", "Ricardo", "Rigoberto", "Rita", "Roberto", "Rocío", "Rodrigo", "Rogelio", "Román", "Romualdo", "Roque", "Rosa", "Rosalia", "Rosario", "Rosendo", "Rubén", "Rufo", "Ruperto", "Salomé", "Salomón", "Salvador", "Salvio", "Samuel", "Sandra", "Sansón", "Santiago", "Sara", "Sebastián", "Segismundo", "Sergio", "Severino", "Silvia", "Simeón", "Simón", "Siro", "Sixto", "Sofía", "Soledad", "Sonia", "Susana", "Tadeo", "Tarsicio", "Teodora", "Teodosia", "Teófanes", "Teófila", "Teresa", "Timoteo", "Tito", "Tobías", "Tomas", "Tomás", "Toribio", "Trinidad", "Ubaldo", "Urbano", "Úrsula", "Valentín", "Valeriano", "Vanesa", "Velerio", "Venancio", "Verónica", "Vicenta", "Vicente", "Víctor", "Victoria", "Victorino", "Victorio", "Vidal", "Virgilio", "Virginia", "Vladimiro", "Wilfredo", "Xavier", "Yolanda", "Zacarías", "Zaqueo"]
lApellidos = ["Aguilar", "Alonso", "Álvarez", "Arias", "Benítez", "Blanco", "Blesa", "Bravo", "Caballero", "Cabrera", "Calvo", "Cambil", "Campos", "Cano", "Carmona", "Carrasco", "Castillo", "Castro", "Cortés", "Crespo", "Cruz", "Delgado", "Díaz", "Díez", "Domínguez", "Durán", "Esteban", "Fernández", "Ferrer", "Flores", "Fuentes", "Gallardo", "Gallego", "García", "Garrido", "Gil", "Giménez", "Gómez", "González", "Guerrero", "Gutiérrez", "Hernández", "Herrera", "Herrero", "Hidalgo", "Ibáñez", "Iglesias", "Jiménez", "León", "López", "Lorenzo", "Lozano", "Marín", "Márquez", "Martín", "Martínez", "Medina", "Méndez", "Molina", "Montero", "Montoro", "Mora", "Morales", "Moreno", "Moya", "Muñoz", "Navarro", "Nieto", "Núñez", "Ortega", "Ortiz", "Parra", "Pascual", "Pastor", "Peña", "Pérez", "Prieto", "Ramírez", "Ramos", "Rey", "Reyes", "Rodríguez", "Román", "Romero", "Rubio", "Ruiz", "Sáez", "Sánchez", "Santana", "Santiago", "Santos", "Sanz", "Serrano", "Soler", "Soto", "Suárez", "Torres", "Vargas", "Vázquez", "Vega", "Velasco", "Vicente", "Vidal"]


def nombre():
    return f"'{lNombres[random.randint(0,len(lNombres)-1)]}'"

def apellido():
    return f"'{lApellidos[random.randint(0,len(lApellidos)-1)]}'"

def dni():
    num = random.randint(10000000, 99999999)
    abc = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    letter = abc[random.randint(0,len(abc)-1)]
    dni = f"{num}{letter}"
    return f"'{dni}'"
#'{}'.format(num)
def gmail():
    gmail = f"{nombre()}@gmail"
    return f"'{gmail}'"

def numero9():
    return f"'{random.randint(954000000, 954999999)}'"

def numero_movil():
    return f"'{random.randint(600000000, 699999999)}'"

def calle():
    return f"'Calle {nombre()} {apellido()}'"

def precio():
    return '{}'.format(decimal.Decimal(random.randrange(100,400))/10)

def talla(n, m):
    return random.randint(n, m)

# PROFESOR
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")    
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")

print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")    
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", numero_movil(), ")")    

def numero1():
    return random.randint(1, 6)

# ASIGNATURA
print("(", dni(), ", 'Matemáticas',", numero1(), ")")  
print("(", dni(), ", 'Lengua Española',", numero1(), ")")    
print("(", dni(), ", 'Biología',", numero1(), ")")  
print("(", dni(), ", 'Historia',", numero1(), ")")  
print("(", dni(), ", 'Geología',", numero1(), ")")  
print("(", dni(), ", 'Aprende con Alf',", numero1(), ")")  
print("(", dni(), ", 'Educación Física',", numero1(), ")")  
print("(", dni(), ", 'Física',", numero1(), ")")  
print("(", dni(), ", 'Química',", numero1(), ")")  
print("(", dni(), ", 'Educación Cívica',", numero1(), ")")    

# Ancho de cuello
# Ancho de torso
# Ancho de cintura
# Largo manga
# Largo cuello-cintura
# Cuello 37 - 44
# 
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")
print(f"({talla(36, 44)}, {talla(42, 49)}, {talla(48, 63)}, {talla(65, 69)}, {talla(70, 75)})")

# articulo ropa
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")
print(f"({nombre()}, {precio()})")


# TIENDA 
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")    
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  
print("(", nombre(), ",", apellido(), ",", dni(), ",", gmail(), ",", numero9(), ",", calle(), ")")  

lciudades =["Albacete", "Alicante", "Almería", "Araba", "Asturias", "Ávila", "Badajoz", "Balears", "Barcelona", "Bizkaia", "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón", "Ciudad" , "Córdoba", "Coruña", "Cuenca", "Gipuzkoa", "Girona", "Granada", "Guadalajara", "Huelva", "Huesca", "Jaén", "León", "Lleida", "Lugo", "Madrid", "Málaga", "Murcia", "Navarra", "Ourense", "Palencia", "Palmas", "Pontevedra", "Rioja", "Salamanca", "Santa" , "Segovia", "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia", "Valladolid", "Zamora", "Zaragoza", "Ceuta", "Melilla"]
def ciudad():
    return f"'{lciudades[random.randint(0,len(lciudades)-1)]}'"



print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")
print("(", calle(), ",", random.randint(10000, 49000), ",", ciudad(), ")")

print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")
print(f"({random.randint(10000, 12000)}, {precio()})")


drop table entregable_p2.empleado;
drop table entregable_p2.stock_articulo;
drop table entregable_p2.tienda;
drop table entregable_p2.articulo_ropa;
drop table entregable_p2.marca_ropa;
drop table entregable_p2.tipo_tallas;
drop table entregable_p2.tipo;
drop table entregable_p2.talla;
drop database entregable_p2;