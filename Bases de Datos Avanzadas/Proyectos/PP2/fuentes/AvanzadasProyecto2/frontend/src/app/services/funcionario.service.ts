import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Funcionario } from '../models/funcionario';

@Injectable({
  providedIn: 'root'
})
export class FuncionarioService {
  
  selectedFuncionario: Funcionario;
  funcionarios: Funcionario[];
  private isLogged = false;
  
  readonly URL_API = 'http://localhost:3000/admin/funcionarios';

  constructor(private http: HttpClient) {
    this.selectedFuncionario = new Funcionario();
  }

  setisLogged(value: boolean){
    this.isLogged = true;
  }

  getisLogged(){
    return this.isLogged;
  }

  getUsuarioPassword(usuario:string , password: string){
    return this.http.get(this.URL_API+ '/login'+ `/${usuario}`+'&'+`${password}`);
  }

  getFuncionario(usuario:string ){
    return this.http.get(this.URL_API+ '/getlogin'+ `/${usuario}`);
  }

  postFuncionario(funcionario: Funcionario) {
    return this.http.post(this.URL_API, funcionario);
  }

  getFuncionarios() {
    return this.http.get(this.URL_API);
  }

  putFuncionario(funcionario: Funcionario) {
    return this.http.put(this.URL_API + `/${funcionario._id}`, funcionario);
  }

  deleteFuncionario(_id: string) {
    return this.http.delete(this.URL_API + `/${_id}`);
  }
}

