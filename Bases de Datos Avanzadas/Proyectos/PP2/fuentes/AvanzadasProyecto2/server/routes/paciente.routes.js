const express = require('express');
const router = express.Router();

const paciente = require('../controllers/pacientes.controller');

router.get('/', paciente.getPacientes);
router.post('/', paciente.createPaciente);
router.get('/getlogin/:correo', paciente.getPaciente);
router.put('/:id', paciente.editPaciente);
router.delete('/:id', paciente.deletePaciente);
router.get('/login/:correo&:contrasena',paciente.getPacientePassword);
router.get('/getInfoPaciente/:cedulaPaciente',paciente.getInfoPaciente);

module.exports = router;