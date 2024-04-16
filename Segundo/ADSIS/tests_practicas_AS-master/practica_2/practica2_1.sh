#!/bin/bash
#806643, Calvo Casado, Fernando, T, 3, B
#844390, Chaves Muniesa, Pedro, T, 3, B
OldIFS=$IFS
IFS=''
echo "Introduzca el nombre del fichero: "
read fich

acc=''
acc=$(getfacl $fich 2>/dev/null | grep user | cut -d ':' -f 3 )
if [ -e $fich ]
then

    echo "Los permisos del archivo $fich son: $acc"
else
    echo "$fich no existe"
fi

IFS=$OldIFS