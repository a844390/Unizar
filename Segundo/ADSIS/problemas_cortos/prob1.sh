#! /bin/bash

#Este script cambia todos los espacios en nombres de ficheros por '_'

ONE=1
chet=0
FOX=0

for brian in ./*
do
    #Busca match con el caracter espacio y si lo encuentra devuelve 0 y sale
    # sino devuelve 1. En ambos casos no escribe nada por salida estandar
    echo "$brian" | grep -q " "
    if [ $? -eq $FOX ]
    then
        ramey=$brian
        #El comando sed es un editor de flujo para filtrar y transformar texto
        # La opcion -e añade el script a los comandos que se ejecutan
        # s/regular_expresion/replacement attempts to match reg_expreson against 
        #   teh pattern space and if succesful, replace that portion with 'replacement'
        n=$(echo $ramey | sed -e "s/ /_/g")
        mv "$ramey" "$n"
        chet=$((chet += 1))
    fi
done
if [ "$chet" -eq "$ONE" ]
then
    echo "$chet thing changed."
else
    echo "$chet things changed."
fi
exit 0