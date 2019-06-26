export class AdminCantidadCitas {
    constructor(_id  = '', cantidadCita  = null) {
        this._id = _id;
        this.cantidadCita  = cantidadCita ;
    }

    _id: String;
    cantidadCita : Number;
}
