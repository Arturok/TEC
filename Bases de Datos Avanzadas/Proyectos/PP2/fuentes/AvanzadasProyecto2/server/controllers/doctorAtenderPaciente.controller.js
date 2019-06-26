const DoctorAtenderPaciente = require('../models/doctorAtenderPacientes');
const Cita = require('../models/citas');

const doctorAtenderPacienteCtrl = {};



doctorAtenderPacienteCtrl.createDoctorAtenderPaciente = async (req, res, next) => {
    const CedulaDoctor = parseInt(req.params.cedulaDoctor);
    const IdCita = req.body.idCita;
    const doctorAtenderPaciente = new DoctorAtenderPaciente({
        cedulaDoctor: CedulaDoctor,
        cedulaPaciente: req.body.cedulaPaciente,
        idCita: IdCita,
        nombreDiagnostico: req.body.nombreDiagnostico,
        nivelDiagnostico: req.body.nivelDiagnostico,
        observaciones: req.body.observaciones,
        tipoTratamiento: req.body.tipoTratamiento,
        nombreTratamiento: req.body.nombreTratamiento,
        dosisTratamiento: req.body.dosisTratamiento,
        cantidadDias: req.body.cantidadDias,
        efectosSecundarios: req.body.efectosSecundarios
    });
    await doctorAtenderPaciente.save();
    await Cita.findByIdAndUpdate(IdCita, {$set: {
        estado: "Realizada"
    }});

    res.json({status: 'DoctorAtenderPaciente created'});
};

doctorAtenderPacienteCtrl.getDoctorAtenderPacientes = async (req, res, next) => {
    const  CedulaDoctor  = req.params.cedulaDoctor;
    console.log(CedulaDoctor)
    const doctorAtenderPaciente = await DoctorAtenderPaciente.find({cedulaDoctor: CedulaDoctor});
    res.json(doctorAtenderPaciente);
};

doctorAtenderPacienteCtrl.getDoctorAtenderPaciente = async (req, res, next) => {
    const { id } = req.params.id;
    const doctorAtenderPaciente = await DoctorAtenderPaciente.findById(id);
    res.json(doctorAtenderPaciente);
};


doctorAtenderPacienteCtrl.editDoctorAtenderPaciente = async (req, res, next) => {
    const { id } = req.params;
    const doctorAtenderPaciente = {
        cedulaPaciente: req.body.cedulaPaciente,
        idCita: req.body.idCita,
        nombreDiagnostico: req.body.nombreDiagnostico,
        nivelDiagnostico: req.body.nivelDiagnostico,
        observaciones: req.body.observaciones,
        tipoTratamiento: req.body.tipoTratamiento,
        nombreTratamiento: req.body.nombreTratamiento,
        dosisTratamiento: req.body.dosisTratamiento,
        cantidadDias: req.body.cantidadDias,
        efectosSecundarios: req.body.efectosSecundarios
    };
    await DoctorAtenderPaciente.findByIdAndUpdate(id, {$set: doctorAtenderPaciente}, {new: true});
    res.json({status: 'DoctorAtenderPaciente Updated'});
};

doctorAtenderPacienteCtrl.deleteDoctorAtenderPaciente = async (req, res, next) => {
    await DoctorAtenderPaciente.findByIdAndRemove(req.params.id);
    res.json({status: 'DoctorAtenderPaciente Deleted'});
};


module.exports = doctorAtenderPacienteCtrl;