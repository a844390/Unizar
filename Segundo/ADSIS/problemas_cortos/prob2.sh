#!/bin/bash

#Este script escribe todas las palabras diferentes que se encuentran en 
# los ficheros pasados como parametros.Elimina todo caracter no alfabetico

E_BADARGS=85

if [ ! -r "$1" ]
then
    echo "Usage: $0 files-to-process"
    exit $E_BADARGS
fi
#Vuelca todo el contenido de los ficheros
cat "$@" |
#Transforma todas las mayusculas a minusculas
tr A-Z a-z |
#Cada espacio es una nueva linea
tr ' ' '\012' |
#Todo lo que no sean letras las elimina
tr -c '\012a-z' '\012' |
# -v invierte matching asi que selecciona todas las lineas que no
# estan vacias
grep -v '^$' |
#Ordena alfabeticamente
sort |
#Elimina repetidos
uniq
exit $?