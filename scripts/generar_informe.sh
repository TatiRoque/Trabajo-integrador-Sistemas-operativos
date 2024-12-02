LOG_DIR="Log_Files"
mkdir -p $LOG_DIR  
LOG_FILE="$LOG_DIR/informe_sistema_$(date +%Y%m%d_%H%M%S).log"
echo "------------- Informe de uso del sistema ------------" > $LOG_FILE
echo "Fecha: $(date)" >> $LOG_FILE
echo "Uso de CPU:" >> $LOG_FILE
top -b -n1 | grep "Cpu(s)" >> $LOG_FILE
echo "-----------------------------------------------------" >> $LOG_FILE
echo "Uso de Memoria:" >> $LOG_FILE
free -h >> $LOG_FILE
echo "-----------------------------------------------------" >> $LOG_FILE
echo "Espacio en Disco:" >> $LOG_FILE
df -h >> $LOG_FILE
echo "Informe generado en $LOG_FILE"
read -p "Presione cualquier tecla para continuar..."
clear
exec bash "./Menu.sh"
