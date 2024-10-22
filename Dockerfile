# En esta linea indicamos que vamos a usar la imagen oficial de Node.js en versión 14
# como base para construir nuestra imagen docker, esto significa que nuestra imagen docker
# empezará con un entorno ya preconfigurado para que pueda ejecutar aplicaciones de node.js
FROM node:14

# Aquí le decimos al contendedor que este será nuestro unico directorio para todas las operaciones
WORKDIR /usr/src/app

# Copia el archivo package.json y package-lock.json desde el host al contendedor, esto se hace porque
# estos archivos contienen las dependencias del proyecto Node.JS que se instalarán adelante.
COPY package*.json ./

# Esta linea instala las dependencias de la aplicación, asegurando que todas las bibiliotecas y módulos 
# sean instalados en el contendedor
RUN npm install

# Copia el resto de los archivos de la aplicación al contenedor.
COPY . .

# Expone el puerto que utilizará la aplicación con el fin de asegurar que las solicitudes http que estran al puerto 3000
# en el contenedor puedan ser gestionadas por la aplicación de Node.js que ya se encuentra ejecutando.
EXPOSE 3000

# Este comando le dice a docker que cuando el contenedor se ejecute, debe iniciar la aplicación 
# Node.js utilizando el npm start, para asegurrar que la aplicación este lista cuando se inicie el contenedor.
CMD [ "npm", "start" ]
