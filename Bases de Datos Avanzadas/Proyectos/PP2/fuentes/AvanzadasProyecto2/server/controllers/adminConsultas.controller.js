const Tratamiento = require('../models/tratamientos');
const Paciente = require('../models/pacientes');
const DoctorAtenderPaciente = require('../models/doctorAtenderPacientes');
const Cita = require('../models/citas'); 

const adminConsultasCtrl = {};


adminConsultasCtrl.TratamientosAsig = async (req, res, next) => {
    const promedio = await Tratamiento.aggregate([{ $group: { _id: "$tipo", promedio: { $avg: "$monto" } } }]);
    const consulta = await DoctorAtenderPaciente.aggregate([{ $group: { _id: "$tipoTratamiento", cantidad: { $sum: 1 } } }]);

    var hash = Object.create(null);
    promedio.concat(consulta).forEach(function (obj) {
        hash[obj._id] = Object.assign(hash[obj._id] || {}, obj);
    });
    var resultado = Object.keys(hash).map(function (key) {
        return hash[key];
    });
    res.json(resultado);

};

adminConsultasCtrl.RangoEnfermedades = async (req, res, next) => {

    const consulta = await DoctorAtenderPaciente.aggregate([{ $group: { _id: { idCita: "$idCita", idPaciente: "$cedulaPaciente" }, cantidad: { $sum: 1 } } }]);
    consulta.sort(function (a, b) {
        if (a.cantidad > b.cantidad) {
            return 1;
        }
        if (a.cantidad < b.cantidad) {
            return -1;
        }
        // a must be equal to b
        return 0;
    });
    var ultimo = consulta.length-1
    const paciente = await Paciente.find({cedula: consulta[0]._id.idPaciente})
    var arrayResultado = [{cedulaPaciente : consulta[0]._id.idPaciente,nombrePaciente: paciente[0].nombre, valorMenor: consulta[0].cantidad, valorMayor: consulta[ultimo].cantidad}]
    res.json(arrayResultado);


};



adminConsultasCtrl.EnfermedadesDiag = async (req, res, next) => {

    const consulta = await DoctorAtenderPaciente.aggregate([{ $group: { _id: "$nombreDiagnostico" , cantidadDiag: { $sum: 1 } } }]);
   
    res.json(consulta);


};

adminConsultasCtrl.CantidadCitasPaciente = async (req, res, next) => {

    const CedulaPaciente = req.params.cedulaPaciente;
    const paciente = await Paciente.find({cedula: CedulaPaciente});
    const IdPaciente = paciente[0]._id;
    const nombrePaciente = paciente[0].nombre;
    const consulta = await Cita.find({idPaciente: IdPaciente});
    var cantidad = consulta.length
    var arrayResultado = [{_id:nombrePaciente,cantidadCita:cantidad}]
    res.json(arrayResultado);
};

adminConsultasCtrl.CantidadCitasEspecialidad = async (req, res, next) => {

    const Especialidad = req.params.especialidad;
    const consulta = await Cita.find({especialidad:Especialidad});
    var cantidad = consulta.length
    var arrayResultado = [{_id:Especialidad,cantidadCita:cantidad}]
    res.json(arrayResultado);
};

adminConsultasCtrl.CantidadCitasEstado = async (req, res, next) => {

    const Estado = req.params.estado;
    const consulta = await Cita.find({estado:Estado});
    var cantidad = consulta.length
    var arrayResultado = [{_id:Estado,cantidadCita:cantidad}]
    res.json(arrayResultado);
};



module.exports = adminConsultasCtrl;