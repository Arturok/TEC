const express = require('express');
const router = express.Router();

const enfermedad = require('../controllers/enfermedad.controller');

router.get('/', enfermedad.getEnfermedades);
router.post('/', enfermedad.createEnfermedad);
router.get('/:id', enfermedad.getEnfermedad);
router.put('/:id', enfermedad.editEnfermedad);
router.delete('/:id', enfermedad.deleteEnfermedad);


module.exports = router;
