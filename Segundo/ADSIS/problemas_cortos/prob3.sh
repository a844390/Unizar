#!/bin/bash

#Se desea programar un script en bash que reciba un fichero con una lista de usuarios, un usuario por
#línea, como parámetro de entrada y determine si el usuario existe en el sistema. En caso afirmativo, el
#script revisará los permisos del directorio .ssh verificando si son correctos. Cuando los permisos sean
#incorrectos, se mostrara un mensaje de error por pantalla y si el usuario no pertenece al sistema se
#borrara el directorio /home/usuario si existe.

if [ ! -r $1 ]
then
    echo "Usage: $0 users_file"
    exit 1
fi
home_usr=$(getent passwd "$usuario" | cut -d: -f6)
user_ssh="$home_usr/.ssh"

while read user
do 
    if [ -d "$user_ssh" ]
    then
    permisos=$(stat -c "%a" "$user_ssh")
        if [ "$permisos" != "700" ]; then
            echo "Los permisos del directorio .ssh para el usuario $usuario son incorrectos."
        fi
    else
        echo "El usuario $usuario no existe en el sistema."
        # Borrar el directorio /home/usuario si existe
        if [ -d "/home/$usuario" ]; then
            rm -rf "/home/$usuario"
            echo "Se borró el directorio /home/$usuario."
        fi
    fi
done < "$1"
