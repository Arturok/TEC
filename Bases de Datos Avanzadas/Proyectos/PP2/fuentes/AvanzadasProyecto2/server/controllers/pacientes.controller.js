const Paciente = require('../models/pacientes');

const pacienteCtrl = {};

pacienteCtrl.getPacientes = async (req, res, next) => {
    const pacientes = await Paciente.find();
    res.json(pacientes);
};

pacienteCtrl.createPaciente = async (req, res, next) => {
    const paciente = new Paciente({
        cedula: req.body.cedula,
        nombre: req.body.nombre,
        fechaNacimiento: req.body.fechaNacimiento,
        tipoSangre: req.body.tipoSangre,
        nacionalidad: req.body.nacionalidad,
        residencia: req.body.residencia,
        telefonos: req.body.telefonos,
        correo: req.body.correo,
        contrasena: req.body.contrasena
    }); 
    await paciente.save();
    res.json({status: 'Paciente created'});
};

pacienteCtrl.getPaciente = async (req, res, next) => {
    const { correo } = req.params;
    const paciente = await Paciente.findOne({correo: correo});
    res.json(paciente);
};

pacienteCtrl.getPacientePassword = async (req , res, next) => {
    Paciente
    .findOne({correo: req.params.correo})
    .exec(function(err, respuesta){
        console.log(respuesta);
        if(err){
            res.send("El usuario no esta registrado");
        }else{
            console.log(respuesta)
            if(respuesta.contrasena == req.params.contrasena){
                res.json(true);
            }else{
                res.json(false);
            }
        }
    });
};


pacienteCtrl.editPaciente = async (req, res, next) => {
    const { id } = req.params;
    const paciente = {
        cedula: req.body.cedula,
        nombre: req.body.nombre,
        fechaNacimiento: req.body.fechaNacimiento,
        tipoSangre: req.body.tipoSangre,
        nacionalidad: req.body.nacionalidad,
        residencia: req.body.residencia,
        telefonos: req.body.telefonos,
        correo: req.body.correo,
        contrasena: req.body.contrasena
    };
    await Paciente.findByIdAndUpdate(id, {$set: paciente}, {new: true});
    res.json({status: 'Paciente Updated'});
};

pacienteCtrl.deletePaciente = async (req, res, next) => {
    await Paciente.findByIdAndRemove(req.params.id);
    res.json({status: 'Paciente Deleted'});
};

pacienteCtrl.getInfoPaciente = async (req, res, next) => {
    const  CedulaPaciente  = parseInt(req.params.cedulaPaciente);
    const paciente = await Paciente.find({cedula:CedulaPaciente});
    res.json(paciente);
};



module.exports = pacienteCtrl;