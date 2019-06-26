export class DoctorAtenderPaciente {
    constructor(_id = '', cedulaDoctor = null, cedulaPaciente = null, idCita = '', nombreDiagnostico = '', nivelDiagnostico= '',
     observaciones= '', nombreTratamiento= '',dosisTratamiento= '', cantidadDias= null, efectosSecundarios= '') {
        this._id = _id;
        this.cedulaDoctor = cedulaDoctor;
        this.cedulaPaciente = cedulaPaciente;
        this.idCita = idCita;
        this.nombreDiagnostico = nombreDiagnostico;
        this.nivelDiagnostico = nivelDiagnostico;
        this.observaciones = observaciones;
        this.nombreTratamiento = nombreTratamiento;
        this.dosisTratamiento = dosisTratamiento;
        this.cantidadDias = cantidadDias;
        this.efectosSecundarios = efectosSecundarios;
    }

    _id: String;
    cedulaDoctor: String;
    cedulaPaciente: Number;
    idCita: String;
    nombreDiagnostico: String;
    nivelDiagnostico: String;
    observaciones: String;
    nombreTratamiento: String;
    dosisTratamiento: String;
    cantidadDias: Number;
    efectosSecundarios: String;

}
