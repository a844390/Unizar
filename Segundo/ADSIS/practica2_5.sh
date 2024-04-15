#!/bin/bash
#806643, Calvo Casado, Fernando, T, 3, B
#844390, Chaves Muniesa, Pedro, T, 3, B

#primero comprobamos que el directorio existe
echo "Introduzca el nombre de un directorio: "
read nombre
#test -d: True si es directorio 
if [ -d "$nombre" ]
then
	dirs=$(ls -l "$nombre" |sed '1d' |cut --bytes=01 | grep d | wc -l)
	nodirs=$(ls -l "$nombre"|sed '1d' |cut --bytes=01 | grep - | wc -l)
	echo "El numero de ficheros y directorios en "$nombre" es de $nodirs y $dirs, respectivamente"
	
else	
	echo ""$nombre" no es un directorio"
fi