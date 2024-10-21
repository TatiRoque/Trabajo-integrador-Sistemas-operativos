# Proyecto Integrador 
# Sistemas Operativos

## Descripción
Este proyecto consiste en la creación de un conjunto de scripts en Bash diseñados para automatizar tareas comunes del sistema operativo en entornos Linux. Las tareas implementadas incluyen la generación de informes sobre el uso de CPU, memoria y disco, la eliminación de archivos temporales y caché, y la automatización del respaldo de directorios. Este enfoque busca simplificar la gestión del sistema y mejorar la eficiencia.

## Instrucciones de Uso
Para utilizar los scripts, sigue los siguientes pasos:

**1. Clona el repositorio**:
   ```
   git clone https://github.com/TatiRoque/Trabajo-integrador-Sistemas-operativos.git
   ```
**2. Navega al directorio de scripts:**
```
cd Trabajo-integrador-Sistemas-operativos/scripts
```
**2. Dale permisos de ejecución a los scripts (si no lo has hecho):**
```
chmod +x generar_informe.sh eliminar_temporales.sh respaldo_directorio.sh
```
**3. Ejecuta el script deseado:**

Para generar el informe de uso del sistema:
```
./generar_informe.sh
```
Para eliminar archivos temporales:
```
./eliminar_temporales.sh
```
Para automatizar el respaldo de un directorio:
```
./respaldo_directorio.sh
```
## Instrucciones para Colaborar
Si deseas colaborar con este proyecto, sigue estos pasos:

**1. Fork del repositorio**: Haz un fork del repositorio en GitHub.

**2. Clona tu fork**: Clona tu versión del repositorio a tu máquina local.
   ```
   git clone https://github.com/tu_usuario/Trabajo-integrador-Sistemas-operativos.git
   ```
**3. Crea una nueva rama:** Crea una nueva rama para tu trabajo.
```
git checkout -b nombre_de_tu_rama
```
**4. Realiza tus cambios:** Haz las modificaciones necesarias en los scripts o la documentación.

**5. Haz commit de tus cambios:**
```
git add .
git commit -m "Descripción de los cambios"
```
**6. Envía tus cambios:** Sube tu rama al repositorio remoto.
```
git push origin nombre_de_tu_rama
```
**7. Crea un pull request:** Ve a la página del repositorio original en GitHub y crea un pull request con una descripción clara de los cambios que realizaste.

## Licencia

Este proyecto se distribuye bajo la Licencia Pública General GNU v3.0. Puedes consultar los detalles de la licencia en el archivo LICENSE.