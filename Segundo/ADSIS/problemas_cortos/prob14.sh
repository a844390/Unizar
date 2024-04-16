#!/bin/bash

# Indica en qué casos 
# este siguiente comando podría fallar y como solucionarlo.

mv $1 $2

# El comando puede fallar cuando las variables tengan nombres con espacios 
# ya que al expandir estos nombres el comando mv utilizará el separador espacio
# y por lo tanto tratara como diferentes campos cada una de las partes del 
# nombre.