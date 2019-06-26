export class Register {
    constructor(_id = '', cedula = null, nombre = '', fechaNacimiento = null, tipoSangre = '', nacionalidad = '', residencia = '', telefonos = '', correo = '', contrasena = '') {
        this._id = _id;
        this.cedula = cedula;
        this.fechaNacimiento = fechaNacimiento;
        this.nombre = nombre;
        this.tipoSangre  = tipoSangre;
        this.nacionalidad = nacionalidad;
        this.residencia = residencia;
        this.telefonos = telefonos;
        this.correo = correo;
        this.contrasena = contrasena;
    }

    _id: string;
    cedula: Number;
    nombre: String;
    fechaNacimiento: Date;
    tipoSangre: String;
    nacionalidad: String;
    residencia: String;
    telefonos: String;
    correo: String;
    contrasena: String;
}
