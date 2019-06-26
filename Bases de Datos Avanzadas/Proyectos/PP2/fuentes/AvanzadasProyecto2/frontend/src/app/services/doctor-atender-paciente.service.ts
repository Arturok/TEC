import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DoctorAtenderPaciente } from '../models/doctor-atender-paciente';

@Injectable({
  providedIn: 'root'
})
export class DoctorAtenderPacienteService {

  
  selectedDoctorAtenderPaciente: DoctorAtenderPaciente;
  doctorAtenderPacientes: DoctorAtenderPaciente[];

  
  readonly URL_API = 'http://localhost:3000/doctor/atenderPacientes';

  constructor(private http: HttpClient) {
    this.selectedDoctorAtenderPaciente = new DoctorAtenderPaciente();
  }

  getDoctorAtenderPacientes(cedulaDoctor: string ){
    return this.http.get(this.URL_API + `/${cedulaDoctor}`);
  }

  postDoctorAtenderPaciente(doctorAtenderPaciente: DoctorAtenderPaciente, cedulaDoctor: string ) {
    return this.http.post(this.URL_API + `/${cedulaDoctor}`, doctorAtenderPaciente);
  }

  putDoctorAtenderPaciente(doctorAtenderPaciente: DoctorAtenderPaciente) {
    return this.http.put(this.URL_API + `/${doctorAtenderPaciente._id}`, doctorAtenderPaciente);
  }

  deleteDoctorAtenderPaciente(_id: string) {
    return this.http.delete(this.URL_API + `/${_id}`);
  }
}


