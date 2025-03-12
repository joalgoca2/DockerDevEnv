ARG NODE_IMAGE_TAG=3.13-alpine3.20 

# Usar una imagen base de Python
FROM python:${NODE_IMAGE_TAG} AS development

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar los archivos de configuración del proyecto
COPY ../app/requirements.txt ./

# Instalar dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código fuente
COPY ../app/ .

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 8000

# Comando para iniciar la aplicación
CMD ["python", "main.py"]