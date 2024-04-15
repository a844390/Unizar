#!/bin/bash
#806643, Calvo Casado, Fernando, T, 3, B
#844390, Chaves Muniesa, Pedro, T, 3, B

#Si hay un argumento
if [ $# -eq 1 ]
then
	if [ -f "$1"  ]
	then
	#cambiamos permisos con chmod y le damos formato a la salida de stat con grep y cut
		chmod --silent u+x "$1"
		stat "$1" | grep Uid | cut --bytes=15-24
	else
		echo ""$1" no existe"
	fi
else 
	echo "Sintaxis: practica2_3.sh <nombre_archivo>"
fi