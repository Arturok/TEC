const express = require('express');
const router = express.Router();

const adminConsultas = require('../controllers/adminConsultas.controller');


router.get('/TratamientosAsig', adminConsultas.TratamientosAsig);

router.get('/RangoEnfermedades', adminConsultas.RangoEnfermedades);

router.get('/EnfermedadesDiag', adminConsultas.EnfermedadesDiag);

router.get('/CantidadCitasPaciente/:cedulaPaciente', adminConsultas.CantidadCitasPaciente);

router.get('/CantidadCitasEspecialidad/:especialidad', adminConsultas.CantidadCitasEspecialidad);

router.get('/CantidadCitasEstado/:estado', adminConsultas.CantidadCitasEstado);


module.exports = router;