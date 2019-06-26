const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const pacienteSchema = Schema({
  cedula: Number,
  nombre: String,
  fechaNacimiento: Date,
  tipoSangre: String,
  nacionalidad: String,
  residencia: String,
  telefonos: String,
  correo: String,
  contrasena: String
});

module.exports = mongoose.model('paciente', pacienteSchema);