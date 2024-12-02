#!/bin/bash

clear

GREEN="\e[32m"
BLUE="\e[34m"
RESET="\e[0m"

DIRECTORIO_ORIGEN="./ejemploRespaldo/directorio"
DIRECTORIO_RESPALDOS="./ejemploRespaldo/respaldos"

if ! command -v zip &> /dev/null; then
    echo "El paquete 'zip' no está instalado. Intentando instalarlo..."
    sudo apt-get update && sudo apt-get install -y zip || { echo "Error al instalar 'zip'."; exit 1; }
    echo "'zip' ha sido instalado correctamente."
fi

if [ ! -d "$DIRECTORIO_ORIGEN" ]; then
    echo "Error: El directorio de origen no existe."
    exit 1
fi

if [ ! -d "$DIRECTORIO_RESPALDOS" ]; then
    mkdir -p "$DIRECTORIO_RESPALDOS" || { echo "Error al crear el directorio de respaldos."; exit 1; }
fi

CONTADOR=1

iniciar_respaldo() {
    clear
    echo -e "${BLUE}Ejecutando respaldos automáticos del directorio...${RESET}"
    echo "Aprete 'q' para realizar un último respaldo y detener la ejecución"

    while true; do
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
        BACKUP_FILE="$DIRECTORIO_RESPALDOS/respaldo_$TIMESTAMP_($CONTADOR).zip"
        
        zip -r "$BACKUP_FILE" "$DIRECTORIO_ORIGEN"

        CONTADOR=$((CONTADOR + 1))

        for i in {15..1}; do
            echo -ne "Siguiente respaldo en: $i segundos\r"
            sleep 1
        done
        
        read -t 1 -n 1 INPUT
        if [[ "$INPUT" == "q" ]]; then
            clear
            echo "Realizando el último respaldo antes de salir..."
            TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
            BACKUP_FILE="$DIRECTORIO_RESPALDOS/respaldo_$TIMESTAMP_($CONTADOR).zip"
            zip -r "$BACKUP_FILE" "$DIRECTORIO_ORIGEN"
            echo "Último respaldo completado. Saliendo..."
            sleep 2
            return
        fi
    done
}

borrar_respaldos() {
    ls -1t "$DIRECTORIO_RESPALDOS"/*.zip | tail -n +2 | xargs rm -f
    echo "Respaldos anteriores eliminados, excepto el más reciente."
}

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
            exec bash "./Menu.sh"
            ;;
        *)
            echo "Opción inválida. Intente nuevamente."
            read -p "Presione cualquier tecla para continuar..."
            ;;
esac
done
