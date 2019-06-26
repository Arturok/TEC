const express = require('express');
const router = express.Router();

const tratamiento = require('../controllers/tratamiento.controller');

router.get('/', tratamiento.getTratamientos);
router.post('/', tratamiento.createTratamiento);
router.get('/:id', tratamiento.getTratamiento);
router.put('/:id', tratamiento.editTratamiento);
router.delete('/:id', tratamiento.deleteTratamiento);


module.exports = router;