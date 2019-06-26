const Tratamiento = require('../models/tratamientos');
const DoctorAtenderPaciente = require('../models/doctorAtenderPacientes');

const tratamientoCtrl = {};

tratamientoCtrl.getTratamientos = async (req, res, next) => {
    const tratamientos = await Tratamiento.find();
    res.json(tratamientos);
};

tratamientoCtrl.createTratamiento = async (req, res, next) => {
    const tratamiento = new Tratamiento({
        nombre: req.body.nombre,
        tipo: req.body.tipo,
        dosis: req.body.dosis,
        monto: req.body.monto
    });
    await tratamiento.save();
    res.json({status: 'Tratamiento created'});
};


tratamientoCtrl.getTratamiento = async (req, res, next) => {
    const { id } = req.params;
    const tratamiento = await Tratamiento.findById(id);
    res.json(tratamiento);
};

tratamientoCtrl.editTratamiento = async (req, res, next) => {
    const { id } = req.params;
    const tratamiento = {
        nombre: req.body.nombre,
        tipo: req.body.tipo,
        dosis: req.body.dosis,
        monto: req.body.monto
    };
    await Tratamiento.findByIdAndUpdate(id, {$set: tratamiento}, {new: true});
    res.json({status: 'Tratamiento Updated'});
};

tratamientoCtrl.deleteTratamiento = async (req, res, next) => {
    await Tratamiento.findByIdAndRemove(req.params.id);
    res.json({status: 'Tratamiento Deleted'});
};




module.exports = tratamientoCtrl;