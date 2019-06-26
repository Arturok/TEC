const centroAtencion = require('../models/centrosAtencion');

const centroMedicoCtrl = {};

centroMedicoCtrl.getcentrosAtencion = async (req, res, next) => {
    const centroMedicos = await centroAtencion.find();
    res.json(centroMedicos);
};

centroMedicoCtrl.createcentroAtencion = async (req, res, next) => {
    const centroMedico = new centroAtencion({
        nombre: req.body.nombre,
        ubicacion: req.body.ubicacion,
        capacidad: req.body.capacidad,
        tipo: req.body.tipo
    });
    await centroMedico.save();
    res.json({status: 'centroAtencion created'});
};

centroMedicoCtrl.getcentroAtencion = async (req, res, next) => {
    const { id } = req.params;
    const centroMedico = await centroAtencion.findById(id);
    res.json(centroMedico);
};

centroMedicoCtrl.editcentroAtencion = async (req, res, next) => {
    const { id } = req.params;
    const centroMedico = {
        nombre: req.body.nombre,
        ubicacion: req.body.ubicacion,
        capacidad: req.body.capacidad,
        tipo: req.body.tipo
    };
    await centroAtencion.findByIdAndUpdate(id, {$set: centroMedico}, {new: true});
    res.json({status: 'centroAtencion Updated'});
};

centroMedicoCtrl.deletecentroAtencion = async (req, res, next) => {
    await centroAtencion.findByIdAndRemove(req.params.id);
    res.json({status: 'centroAtencion Deleted'});
};


module.exports = centroMedicoCtrl;