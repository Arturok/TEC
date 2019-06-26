export class Cita {
    constructor(_id = '', idPaciente = '', especialidad = '', fechaH = null, observacion= '',estado= '') {
        this._id = _id;
        this.idPaciente = idPaciente;
        this.especialidad = especialidad;
        this.fechaH = fechaH;
        this.observacion = observacion;
        this.estado = estado;
    }

    _id: string;
    idPaciente: string;
    especialidad: String;
    fechaH: Date;
    observacion: String;
    estado: String;
}