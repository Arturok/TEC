const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const tratamientosSchema = Schema({
  nombre: String,
  tipo: String,
  dosis: String,
  monto: Number
});

module.exports = mongoose.model('tratamientos', tratamientosSchema);