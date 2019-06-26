import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Cita } from '../models/cita';


@Injectable({
  providedIn: 'root'
})
export class PacienteCitaService {

  selectedCita: Cita;
  citas: Cita[];
  
  readonly URL_API = 'http://localhost:3000/paciente/citas';

  constructor(private http: HttpClient) {
    this.selectedCita = new Cita();
  }

  postCita(cita: Cita, idPaciente: string) {
    return this.http.post(this.URL_API + `/${idPaciente}`, cita);
  }

  getCitas(idPaciente: string) {
    return this.http.get(this.URL_API +`/${idPaciente}` );
  }

  cancelarCita(cita: Cita) {
    return this.http.put(this.URL_API + `/cancelarCita`+ `/${cita._id}`, cita);
  }

  getCitaEstado(idPaciente: string, estado:string) {
    return this.http.get(this.URL_API + `/getCitasEstado`+ `/${idPaciente}`+'&'+`${estado}`);
  }


  getCitaEspecialidad(idPaciente: string, especialidad:string) {
    return this.http.get(this.URL_API + `/getCitasEspecialidad`+ `/${idPaciente}`+'&'+`${especialidad}`);
  }

  getCitaRango(idPaciente: string, primerFecha:string, segundaFecha:string) {
    return this.http.get(this.URL_API + `/getCitasRango`+ `/${idPaciente}`+'&'+`${primerFecha}`+'&'+`${segundaFecha}`);
  }
  



}


