export class CentroAtencion {
    constructor(_id = '', nombre = '', ubicacion = '', capacidad = null, tipo= '') {
        this._id = _id;
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.capacidad = capacidad;
        this.tipo = tipo;
    }

    _id: string;
    nombre: String;
    ubicacion: String;
    capacidad: Number;
    tipo: String;
}
