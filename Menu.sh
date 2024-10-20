Color_Off='\033[0m'
Green='\033[0;32m'
Purple='\033[0;35m'
Amarillo='\e[33m'
Rojo='\033[0;31m'

echo -e "${Amarillo}¡Bienvenido al Menú!${Color_Off}"
echo -e "${Green}1. Ejecutar script 1${Color_Off}"
echo -e "${Green}2. Opción 2${Color_Off}"
echo -e "${Green}3. Opción 3${Color_Off}"
echo -e "${Rojo}4. Salir${Color_Off}"
read -p "Por favor, seleccione una opción (1, 2, 3 o 4): " opcion

case $opcion in
1) ./scripts/generar_informe.sh ;;
2) ./scripts/eliminar_temporales.sh ;;
3) ./scripts/respaldo_directorio.sh ;;
4) echo -e "${Red}Saliendo...${Color_Off}"; exit 0 ;;
*) echo -e "${Red}Opción no válida.${Color_Off}" ;;
esac

