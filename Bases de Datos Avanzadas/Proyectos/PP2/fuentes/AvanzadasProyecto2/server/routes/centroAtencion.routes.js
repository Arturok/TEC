const express = require('express');
const router = express.Router();

const centroAtencion = require('../controllers/centroAtencion.controller');

router.get('/', centroAtencion.getcentrosAtencion);
router.post('/', centroAtencion.createcentroAtencion);
router.get('/:id', centroAtencion.getcentroAtencion);
router.put('/:id', centroAtencion.editcentroAtencion);
router.delete('/:id', centroAtencion.deletecentroAtencion);

module.exports = router;