export class Tratamiento {
    constructor(_id = '', nombre = '', tipo = '', dosis = '', monto= null) {
        this._id = _id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.dosis = dosis;
        this.monto = monto;
    }

    _id: string;
    nombre: String;
    tipo: String;
    dosis: String;
    monto: Number;
}
