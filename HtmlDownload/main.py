from typing import List

import requests
from bs4 import BeautifulSoup


def save_html():
    url = input("Introduzca la url: ")
    file_name = input("Introduzca el nombre con el que quiere guardar el archivo: ")
    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")
        with open(f"{file_name}.html", "w") as file:
            file.write(str(soup))
        print("Archivo HTML creado con éxito.")
    else:
        print("Error al conectar con la web.")


def decorator(function):
    def hi():
        print("Hey Python!")
        print(function())
        print("Bye Python")

    return hi


@decorator
def hello() -> str:
    msg: str = 'Hello World!'
    return msg


if __name__ == '__main__':
    nums: list[int] = [1, 2, 3, 4]
    print(hello())
