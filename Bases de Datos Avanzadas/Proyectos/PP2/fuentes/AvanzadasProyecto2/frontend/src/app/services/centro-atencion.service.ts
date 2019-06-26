import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CentroAtencion } from '../models/centro-atencion';

@Injectable({
  providedIn: 'root'
})
export class CentroAtencionService {

  selectedcentroAtencion: CentroAtencion;
  centrosAtencion: CentroAtencion[];
  
  readonly URL_API = 'http://localhost:3000/admin/centrosAtencion';

  constructor(private http: HttpClient) {
    this.selectedcentroAtencion = new CentroAtencion();
  }

  postcentroAtencion(centroMedico: CentroAtencion) {
    return this.http.post(this.URL_API, centroMedico);
  }

  getcentrosAtencion() {
    return this.http.get(this.URL_API);
  }

  putcentroAtencion(centroMedico: CentroAtencion) {
    return this.http.put(this.URL_API + `/${centroMedico._id}`, centroMedico);
  }

  deletecentroAtencion(_id: string) {
    return this.http.delete(this.URL_API + `/${_id}`);
  }
}




