export class AdminEnfermedadesDiag {
    constructor(_id  = '', cantidadDiag  = null) {
        this._id = _id;
        this.cantidadDiag  = cantidadDiag ;
    }

    _id: String;
    cantidadDiag : Number;
}
