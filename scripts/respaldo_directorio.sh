#!/bin/bash

# Limpiar la terminal
clear

# Colores para el texto
GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

# Ruta de los directorios y archivo
DIRECTORIO_ORIGEN="/mnt/d/visualStudioCode/repos/Trabajo-integrador-Sistemas-operativos/ejemploRespaldo"
ARCHIVO_ORIGEN="texto.txt"  # Solo el nombre del archivo
DIRECTORIO_RESPALDOS="$DIRECTORIO_ORIGEN/respaldos"

# Contador de backups
CONTADOR=1

# Función para iniciar respaldos automáticos
iniciar_respaldo() {
    clear
    echo -e "${BLUE}Ejecutando respaldos automáticos de archivos...${RESET}"
    echo "Aprete 'q' para realizar un ultimo respaldo y detener la ejecución"

    while true; do
        # Comprimir y guardar el respaldo
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
        BACKUP_FILE="$DIRECTORIO_RESPALDOS/respaldo_$TIMESTAMP_($CONTADOR).tar.gz"
        
        # Cambiar al directorio de origen para evitar el mensaje de tar
        (cd "$DIRECTORIO_ORIGEN" && tar -czf "$BACKUP_FILE" "$ARCHIVO_ORIGEN")

        # Incrementar el contador de backups
        CONTADOR=$((CONTADOR + 1))

        # Contador regresivo
        for i in {30..1}; do
            echo -ne "Siguiente respaldo en: $i segundos\r"  # Sobrescribir la misma línea
            sleep 1
        done
        

        # Comprobar si se ingresó "q" para finalizar
        read -t 1 -n 1 INPUT
        if [[ "$INPUT" == "q" ]]; then
            clear
            return
        fi
    done
}

# Función para borrar respaldos excepto el último
borrar_respaldos() {
    ls -1t "$DIRECTORIO_RESPALDOS"/*.tar.gz | tail -n +2 | xargs rm -f
    echo "Respaldos anteriores eliminados, excepto el más reciente."
}

# Menú principal
while true; do
    clear
    echo -e "${GREEN}Respaldo automático de directorios, ingrese el número de la tarea:${RESET}"
    echo -e "1 - Iniciar respaldos automáticos"
    echo -e "2 - Borrar respaldos anteriores"
    echo -e "3 - Volver al menú"

    read -p "Seleccione una opción: " OPCION

    case $OPCION in
        1)
            iniciar_respaldo
            ;;
        2)
            borrar_respaldos
            read -p "Presione cualquier tecla para continuar..."
            ;;
        3)
            clear
            exec bash "D:/visualStudioCode/repos/Trabajo-integrador-Sistemas-operativos/Menu.sh" # Volver al menú inicial
            ;;
        *)
            echo "Opción inválida. Intente nuevamente."
            read -p "Presione cualquier tecla para continuar..."
            ;;
    esac
done