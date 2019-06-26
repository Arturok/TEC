const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const enfermedadesSchema = Schema({
  nombre: String,
  descripcion: String,
  sintomas: String,
  tratamientos: String
});

module.exports = mongoose.model('enfermedades', enfermedadesSchema);