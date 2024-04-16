#!/bin/bash

# Función para encontrar archivos antiguos en un directorio
find_old_files() {
    directory=$1
    threshold_date=$(date -d "1 month ago" +%s)
    old_files=()

    while IFS= read -r -d '' file; do
        modification_time=$(stat -c %Y "$file")
        if (( modification_time < threshold_date )); then
            old_files+=("$file")
        fi
    done < <(find "$directory" -type f -print0)

    echo "${old_files[@]}"
}

# Función para crear un archivo tar
create_tar_archive() {
    output_filename=$1
    shift
    files_to_archive=("$@")

    tar -cf "$output_filename" "${files_to_archive[@]}"
    echo "Archive created: $output_filename"
}

# Verificación de argumentos
if [ "$#" -lt 3 ]; then
    echo "Uso: $0 prefijo directorio1 [directorio2 ...]"
    exit 1
fi

prefix=$1
shift

# Crear una lista de archivos antiguos de todos los directorios
old_files=()
for directory in "$@"; do
    old_files+=($(find_old_files "$directory"))
done

if [ ${#old_files[@]} -eq 0 ]; then
    echo "No se encontraron archivos antiguos."
    exit 0
fi

# Crear el archivo tar
output_filename="${prefix}_$(date +"%Y%m%d").tar"
create_tar_archive "$output_filename" "${old_files[@]}"
