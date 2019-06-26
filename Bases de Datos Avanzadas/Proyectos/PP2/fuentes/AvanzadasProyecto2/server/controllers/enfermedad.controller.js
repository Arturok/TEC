const Enfermedad = require('../models/enfermedades');

const enfermedadCtrl = {};

enfermedadCtrl.getEnfermedades = async (req, res, next) => {
    const enfermedades = await Enfermedad.find();
    res.json(enfermedades);
};

enfermedadCtrl.createEnfermedad = async (req, res, next) => {
    const enfermedad = new Enfermedad({
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        sintomas: req.body.sintomas,
        tratamientos: req.body.tratamientos
    });
    await enfermedad.save();
    res.json({status: 'Enfermedad created'});
};

enfermedadCtrl.getEnfermedad = async (req, res, next) => {
    const { id } = req.params;
    const enfermedad = await Enfermedad.findById(id);
    res.json(enfermedad);
};

enfermedadCtrl.editEnfermedad = async (req, res, next) => {
    const { id } = req.params;
    const enfermedad = {
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        sintomas: req.body.sintomas,
        tratamientos: req.body.tratamientos
    };
    await Enfermedad.findByIdAndUpdate(id, {$set: enfermedad}, {new: true});
    res.json({status: 'Enfermedad Updated'});
};

enfermedadCtrl.deleteEnfermedad = async (req, res, next) => {
    await Enfermedad.findByIdAndRemove(req.params.id);
    res.json({status: 'Enfermedad Deleted'});
};


module.exports = enfermedadCtrl;