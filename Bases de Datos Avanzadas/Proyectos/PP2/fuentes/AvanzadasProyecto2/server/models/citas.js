const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const citasSchema = Schema({
  idPaciente: String,
  especialidad: String,
  fechaH: Date,
  observacion: String,
  estado: String
});

module.exports = mongoose.model('citas', citasSchema);