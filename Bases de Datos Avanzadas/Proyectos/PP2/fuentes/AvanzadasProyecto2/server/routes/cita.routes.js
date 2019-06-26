const express = require('express');
const router = express.Router();

const cita = require('../controllers/cita.controller');

router.get('/:idPaciente', cita.getCitas);
router.post('/:idPaciente', cita.createCita);
router.put('/cancelarCita/:id', cita.cancelarCita);
router.get('/getCitasEstado/:idPaciente&:estado',cita.getCitasEstado);
router.get('/getCitasEspecialidad/:idPaciente&:especialidad',cita.getCitasEspecialidad);
router.get('/getCitasRango/:idPaciente&:primerFecha&:segundaFecha',cita.getCitasRango);

module.exports = router;