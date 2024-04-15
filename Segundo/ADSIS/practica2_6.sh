#!/bin/bash
#806643, Calvo Casado, Fernando, T, 3, B
#844390, Chaves Muniesa, Pedro, T, 3, B

#Stat devuelve un directorio y su ultima fecha de modificación
#Usamos sort para ordenarlos por fecha y head para quedarnos con la primera fila
#Por ultimo cut para quedarnos con el nombre del directorio
dir=$(stat -c %n,%Y ~/bin??? 2> /dev/null | 
sort -t ',' -k 2 | head -n 1 |cut -d ',' -f 1)

#Si no existe ningun directorio que cumpla los requisitos creamos uno nuevo
if [ "$dir" = "" ]
then
    dir=$(mktemp -d ~/binXXX)
    echo "Se ha creado el directorio $dir"
fi
count=0
echo "Directorio destino de copia: $dir"
for param in $(ls)
do 
    #Si es un archivo ejecutable
    if [ -f "$param" -a -x "$param" ]
    then
        cp "$param" "$dir"
        echo "./$param ha sido copiado a $dir"
        count=$((coun+1))
    fi
done
[ "$count" -eq 0 ] && echo "No se ha copiado ningun archivo"
[ ! "$count" -eq 0 ] && echo "Se han copiado $count archivos"