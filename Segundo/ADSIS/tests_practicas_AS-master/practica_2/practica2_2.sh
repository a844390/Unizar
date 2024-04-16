#!/bin/bash
#806643, Calvo Casado, Fernando, T, 3, B
#844390, Chaves Muniesa, Pedro, T, 3, B

#Para cada uno (for)
for fich in "$@"
do
    #EL fichero es regular. Mostrar contenido paginado
    [ -f "$fich" ] && more "$fich"      
    #El fichero no es regular
    [ ! -f "$fich" ] && echo "$fich no es un fichero"   
done