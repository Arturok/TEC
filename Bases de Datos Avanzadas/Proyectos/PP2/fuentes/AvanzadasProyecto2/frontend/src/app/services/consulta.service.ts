import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AdminCantidadCitas } from '../models/admin-cantidad-citas';

@Injectable({
  providedIn: 'root'
})
export class ConsultaService {



  readonly URL_API = 'http://localhost:3000/admin/consultas';

  constructor(private http: HttpClient) { }

  getTratamientosAsig() {
    return this.http.get(this.URL_API + `/TratamientosAsig`);
  }

  getAdminRangoEnfermedades() {
    return this.http.get(this.URL_API + `/RangoEnfermedades`);
  }

  getAdminEnfermedadesDiag(){
    return this.http.get(this.URL_API + `/EnfermedadesDiag`);
  }

  getCantidadCitasPaciente(cedulaPaciente: number) {
    return this.http.get(this.URL_API + `/CantidadCitasPaciente`+ `/${cedulaPaciente}`);
  }

  getCantidadCitasEspecialidad(especialidad: string) {
    return this.http.get(this.URL_API + `/CantidadCitasEspecialidad`+ `/${especialidad}`);
  }

  getCantidadCitasEstado(estado: string) {
    return this.http.get(this.URL_API + `/CantidadCitasEstado`+ `/${estado}`);
  }



}



