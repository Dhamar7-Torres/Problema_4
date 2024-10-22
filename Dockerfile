# Usar la imagen oficial de Node.js como base.
FROM node:14

# Establecer el directorio de trabajo dentro del contenedor.
WORKDIR /usr/src/app

# Copiar el archivo package.json y package-lock.json para instalar dependencias.
COPY package*.json ./

# Instalar las dependencias de la aplicación.
RUN npm install

# Copiar el resto de los archivos de la aplicación al contenedor.
COPY . .

# Exponer el puerto que utilizará la aplicación.
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación.
CMD [ "npm", "start" ]
