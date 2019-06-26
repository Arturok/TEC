import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Tratamiento } from '../models/tratamiento';


@Injectable({
  providedIn: 'root'
})
export class TratamientoService {

  selectedTratamiento: Tratamiento;
  tratamientos: Tratamiento[];
  
  readonly URL_API = 'http://localhost:3000/admin/tratamientos';

  constructor(private http: HttpClient) {
    this.selectedTratamiento = new Tratamiento();
  }

  postTratamiento(tratamiento: Tratamiento) {
    return this.http.post(this.URL_API, tratamiento);
  }

  getTratamientos() {
    return this.http.get(this.URL_API);
  }

  putTratamiento(tratamiento: Tratamiento) {
    return this.http.put(this.URL_API + `/${tratamiento._id}`, tratamiento);
  }

  deleteTratamiento(_id: string) {
    return this.http.delete(this.URL_API + `/${_id}`);
  }

  
}


