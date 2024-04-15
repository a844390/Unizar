#!/bin/bash
#806643, Calvo Casado, Fernando, T, 3, B
#844390, Chaves Muniesa, Pedro, T, 3, B

#Pedir pulsar tecla 
echo -n "Introduzca una tecla: "
read -n 1 tecla  
echo #Insertar un salto de linea para paginar la salida
#ignorar todas las teclas pulsadas
#   despues de la primera
#si es letra
case $tecla in
	[[:alpha:]])  #Es una letra
		echo "$tecla es una letra";;
	[[:digit:]])  #Es un digito
		echo "$tecla es un numero";;
    *)            #Es un caracter especial
        echo "$tecla es un caracter especial";;
esac
