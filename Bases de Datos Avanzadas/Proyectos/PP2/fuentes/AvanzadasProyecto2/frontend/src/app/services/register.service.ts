import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Register } from '../models/register';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {

  selectedRegister: Register;
  registers: Register[];
  
  readonly URL_API = 'http://localhost:3000/register/paciente';

  constructor(private http: HttpClient) {
    this.selectedRegister = new Register();
  }

  getPacientePassword(correo:string , contrasena: string){
    return this.http.get(this.URL_API+ '/login'+ `/${correo}`+'&'+`${contrasena}`);
  }

  getPaciente(correo:string ){
    return this.http.get(this.URL_API+ '/getlogin'+ `/${correo}`);
  }
  postRegister(register: Register) {
    return this.http.post(this.URL_API, register);
  }

  getRegisters() {
    return this.http.get(this.URL_API);
  }

  getInfoPaciente(cedulaPaciente: string){
    return this.http.get(this.URL_API + '/getInfoPaciente'+ `/${cedulaPaciente}`);
  }

  putRegister(register: Register) {
    return this.http.put(this.URL_API + `/${register._id}`, register);
  }

  deleteRegister(_id: string) {
    return this.http.delete(this.URL_API + `/${_id}`);
  }


}




