const express = require('express');
const mysql = require('mysql');

const app = express();
const port = 3000;

// Crear la conexión a la base de datos.
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

// Conectar a la base de datos.
db.connect((err) => {
  if (err) throw err;
  console.log('Conectado a la base de datos MySQL.');
});

// Crear una ruta simple.
app.get('/', (req, res) => {
  res.send('¡Hola, mundo!');
});

// Iniciar el servidor.
app.listen(port, () => {
  console.log(`Aplicación escuchando en http://localhost:${port}`);
});
