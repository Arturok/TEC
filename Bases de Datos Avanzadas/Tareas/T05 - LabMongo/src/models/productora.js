const mongoose =require('mongoose');
const Schema = mongoose.Schema;

const ProductoraSchema = new Schema({
    nombre: String,
    ano: Number,
    sitio: String
});

module.exports = mongoose.model('productora', ProductoraSchema);