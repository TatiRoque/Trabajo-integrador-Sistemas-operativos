#!/bin/bash

clear

# Ruta a la carpeta de archivos temporales (versión WSL)
TEMP_DIR="/mnt/d/visualStudioCode/repos/Trabajo-integrador-Sistemas-operativos/temp"

# Función para verificar si la carpeta existe
function verificar_carpeta() {
    if [ ! -d "$TEMP_DIR" ]; then
        echo "La carpeta $TEMP_DIR no existe. Verifique la ruta."
        exit 1
    fi
}

# Función para eliminar los archivos temporales
function eliminar_temporales() {
    echo "🔍 Verificando archivos temporales en: $TEMP_DIR"
    sleep 1

    # Verificar si hay archivos
    if [ "$(ls -A "$TEMP_DIR")" ]; then
        echo "Eliminando archivos temporales..."
        rm -f "$TEMP_DIR"/*
        echo "✅ Archivos temporales eliminados correctamente."
    else
        echo "⚠️ No se encontraron archivos temporales en la carpeta."
    fi
}

# Función principal del script
function main() {
    clear
    echo "===== Eliminación de Archivos Temporales ====="
    verificar_carpeta
    eliminar_temporales
}

# Ejecutar la función principal
main
