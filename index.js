var express = require('express');
var cors = require('cors');
var multer = require('multer');
require('dotenv').config()

var app = express();

app.use(cors());
app.use('/public', express.static(process.cwd() + '/public'));

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Configuración de multer para manejar la carga de archivos
var upload = multer({ dest: 'uploads/' });

// Ruta para manejar la carga de archivos y devolver metadatos
app.post('/api/fileanalyse', upload.single('upfile'), function(req, res) {
  if (!req.file) {
    return res.status(400).json({ error: 'No se ha subido ningún archivo' });
  }
  
  res.json({
    name: req.file.originalname,
    type: req.file.mimetype,
    size: req.file.size
  });
});

const port = process.env.PORT || 3000;
app.listen(port, function () {
  console.log('Tu aplicación está escuchando en el puerto ' + port)
});
