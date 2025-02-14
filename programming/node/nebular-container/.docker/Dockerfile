ARG NODE_IMAGE_TAG=23.7-alpine3.20 

# Usar una imagen base de Node.js
FROM node:${NODE_IMAGE_TAG} AS development

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar los archivos de configuración del proyecto
COPY ../app/package.json ../app/angular.json ./

# Instalar Angular CLI globalmente
RUN npm install -g @angular/cli@18.1.2

# Instalar dependencias del proyecto
RUN npm install

# Copiar el resto del código fuente
COPY ../app/ .

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 4200

# Comando para iniciar la aplicación
CMD CMD ["ng", "serve", "--host", "0.0.0.0", "--disable-host-check", "true", "--poll", "2000"]