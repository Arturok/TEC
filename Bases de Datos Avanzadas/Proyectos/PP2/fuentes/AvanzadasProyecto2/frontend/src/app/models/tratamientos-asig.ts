export class TratamientosAsig {
    constructor(_id = '', cantidad = null, promedio = null) {
        this._id = _id;
        this.cantidad = cantidad;
        this.promedio = promedio;

    }

    _id: string;
    cantidad: Number;
    promedio: Number;
}
