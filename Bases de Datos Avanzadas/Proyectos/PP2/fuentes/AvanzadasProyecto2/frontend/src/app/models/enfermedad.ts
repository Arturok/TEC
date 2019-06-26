export class Enfermedad {
    constructor(_id = '', nombre = '', descripcion = '', sintomas = '', tratamientos= '') {
        this._id = _id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.sintomas = sintomas;
        this.tratamientos = tratamientos;
    }

    _id: string;
    nombre: String;
    descripcion: String;
    sintomas: String;
    tratamientos: String;
}