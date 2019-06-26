const Cita = require('../models/citas');

const citaCtrl = {};

citaCtrl.getCitas = async (req, res, next) => {
    const  IdPaciente = req.params.idPaciente;
    console.log("hola");
    console.log(IdPaciente);
    const citas = await Cita.find({idPaciente:IdPaciente});
    res.json(citas);
};

citaCtrl.createCita = async (req, res, next) => {
    const cita = new Cita({
        idPaciente: req.params.idPaciente,
        especialidad: req.body.especialidad,
        fechaH: req.body.fechaH,
        observacion: req.body.observacion,
        estado: "Registrada"
    });
    await cita.save();
    res.json({status: 'Cita created'});
};

citaCtrl.getCita = async (req, res, next) => {
    const { id } = req.params.id;
    const cita = await Cita.findById(id);
    res.json(cita);
};

citaCtrl.cancelarCita = async (req, res, next) => {
    const id  = req.params.id;
    await Cita.findByIdAndUpdate(id, {$set: {
        estado: "Cancelada por paciente"
    }});
    res.json({status: 'Cita Updated'});
};

citaCtrl.getCitasEstado = async (req, res, next) => {
    const  IdPaciente  = req.params.idPaciente;
    const  Estado  = req.params.estado;
    const  cita = await Cita.find({idPaciente:IdPaciente, estado:Estado});
    res.json(cita);
};

citaCtrl.getCitasEspecialidad = async (req, res, next) => {
    const  IdPaciente  = req.params.idPaciente;
    const  Especialidad  = req.params.especialidad;
    const  cita = await Cita.find({idPaciente:IdPaciente, especialidad:Especialidad});
    res.json(cita);
};

citaCtrl.getCitasRango = async (req, res, next) => {
    const  IdPaciente  = req.params.idPaciente;
    const  PrimerFecha  = req.params.primerFecha;
    const  SegundaFecha  = req.params.segundaFecha;
    const cita = await Cita.aggregate([{ $match: {idPaciente:IdPaciente,fechaH: { $gt: new Date(PrimerFecha), $lt:  new Date(SegundaFecha)}}}]);
    console.log(cita);
    res.json(cita);
};


module.exports = citaCtrl;