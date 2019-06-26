const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const doctorAtenderPacientes = Schema({
    cedulaDoctor: Number,
    cedulaPaciente: Number,
    idCita: String,
    nombreDiagnostico: String,
    nivelDiagnostico: String,
    observaciones: String,
    tipoTratamiento: String,
    nombreTratamiento: String,
    dosisTratamiento: String,
    cantidadDias: Number,
    efectosSecundarios: String
});

module.exports = mongoose.model('doctorAtenderPacientes', doctorAtenderPacientes);