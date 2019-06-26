export class Funcionario {
    constructor(_id = '', cedula = null, nombre = '', tipo = '', fechaIngreso = null, area= '', password='', usuario='') {
        this._id = _id;
        this.cedula = cedula;
        this.nombre = nombre;
        this.tipo = tipo;
        this.fechaIngreso = fechaIngreso;
        this.area = area;
        this.password = password;
        this.usuario = usuario;
    }

    _id: string;
    cedula: Number;
    nombre: String;
    tipo: String;
    fechaIngreso: Date;
    area: String;
    password: string;
    usuario: string;
}




