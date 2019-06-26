const express = require('express');
const router = express.Router();

const doctorAtenderPaciente = require('../controllers/doctorAtenderPaciente.controller');



router.post('/:cedulaDoctor', doctorAtenderPaciente.createDoctorAtenderPaciente);
router.get('/:cedulaDoctor', doctorAtenderPaciente.getDoctorAtenderPacientes);
router.put('/:id', doctorAtenderPaciente.editDoctorAtenderPaciente);
router.delete('/:id', doctorAtenderPaciente.deleteDoctorAtenderPaciente);

module.exports = router;