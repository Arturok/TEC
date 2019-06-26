const mongoose =require('mongoose');
const Schema = mongoose.Schema;

const PeliculaSchema = new Schema({
    nombre: String,
    genero: String,
    director: String,
    franquicia: String,
    pais: String,
    ano: Number,
    duracion: Number,
    productora: String,
    actores: String
});

module.exports = mongoose.model('peliculas', PeliculaSchema);