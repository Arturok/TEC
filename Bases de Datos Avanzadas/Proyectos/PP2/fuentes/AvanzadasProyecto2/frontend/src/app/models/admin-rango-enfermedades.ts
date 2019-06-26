export class AdminRangoEnfermedades {
    constructor(cedulaPaciente = null, nombrePaciente = '', valorMayor = null, valorMenor = null ) {
        this.cedulaPaciente = cedulaPaciente;
        this.nombrePaciente = nombrePaciente;
        this.valorMayor = valorMayor;
        this.valorMenor = valorMenor;

    }

    cedulaPaciente: Number;
    nombrePaciente: String;
    valorMayor: Number;
    valorMenor: Number;
}
