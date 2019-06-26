import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Enfermedad } from '../models/enfermedad';

@Injectable({
  providedIn: 'root'
})
export class EnfermedadService {

  selectedEnfermedad: Enfermedad;
  enfermedades: Enfermedad[];
  
  readonly URL_API = 'http://localhost:3000/admin/enfermedades';

  constructor(private http: HttpClient) {
    this.selectedEnfermedad = new Enfermedad();
  }

  postEnfermedad(enfermedad: Enfermedad) {
    return this.http.post(this.URL_API, enfermedad);
  }

  getEnfermedades() {
    return this.http.get(this.URL_API);
  }

  putEnfermedad(enfermedad: Enfermedad) {
    return this.http.put(this.URL_API + `/${enfermedad._id}`, enfermedad);
  }

  deleteEnfermedad(_id: string) {
    return this.http.delete(this.URL_API + `/${_id}`);
  }
}



