#!/bin/bash

#Este script no es de gran utilidad ya que hay modulos PAM capaces de aplicar las restricciones de manera más eficientes

# Función para verificar la fortaleza de la contraseña
check_password_strength() {
    password=$1

    # Verificar la longitud mínima de 8 caracteres
    if [ ${#password} -lt 8 ]; then
        echo "La contraseña debe tener al menos 8 caracteres."
        return 1
    fi

    # Verificar la presencia de letras mayúsculas, minúsculas y dígitos
    if ! [[ "$password" =~ [[:upper:]] && "$password" =~ [[:lower:]] && "$password" =~ [[:digit:]] ]]; then
        echo "La contraseña debe contener letras mayúsculas, minúsculas y dígitos."
        return 1
    fi

    return 0
}

# Verificación de argumentos
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 nombre_de_usuario"
    exit 1
fi

# Solicitar la nueva contraseña
read -s -p "Ingrese la nueva contraseña para el usuario $1: " password
echo

# Verificar la fortaleza de la contraseña
if ! check_password_strength "$password"; then
    exit 1
fi

# Cambiar la contraseña del usuario
echo "$1:$password" | chpasswd

if [ $? -eq 0 ]; then
    echo "Contraseña cambiada exitosamente para el usuario $1."
else
    echo "Se produjo un error al cambiar la contraseña para el usuario $1."
fi
