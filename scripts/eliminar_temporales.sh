#!/bin/bash

clear

TEMP_DIR="./temp"
function verificar_carpeta() {
    if [ ! -d "$TEMP_DIR" ]; then
        echo "La carpeta $TEMP_DIR no existe. Verifique la ruta."
        exit 1
    fi
}


function eliminar_temporales() {
    echo "🔍 Verificando archivos temporales en: $TEMP_DIR"
    sleep 1

    if [ "$(ls -A "$TEMP_DIR")" ]; then
        echo "Eliminando archivos temporales..."
        rm -f "$TEMP_DIR"/*
        echo "✅ Archivos temporales eliminados correctamente."
    else
        echo "⚠️ No se encontraron archivos temporales en la carpeta."
    fi
}

function main() {
    clear
    echo "===== Eliminación de Archivos Temporales ====="
    verificar_carpeta
    eliminar_temporales
}

main
read -p "Presione cualquier tecla para continuar..."
clear
exec bash "./Menu.sh"
