const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const funcionarioSchema = Schema({
  cedula: Number,
  nombre: String,
  tipo: String,
  fechaIngreso: Date,
  area: String,
  password: String,
  usuario: String
});

module.exports = mongoose.model('Funcionario', funcionarioSchema);