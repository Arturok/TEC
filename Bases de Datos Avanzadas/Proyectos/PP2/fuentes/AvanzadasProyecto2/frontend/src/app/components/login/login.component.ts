import { Component, OnInit } from '@angular/core';
import { FuncionarioService } from '../../services/funcionario.service'
import { NgForm } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
import { Funcionario } from 'src/app/models/funcionario';
import { Register } from 'src/app/models/register';
import { RegisterService } from '../../services/register.service';
import { Router } from '@angular/router';

declare var M: any;

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {




  constructor(private funcionarioService: FuncionarioService, private cookieService: CookieService, private router: Router ,
    private registerService: RegisterService) { }

  ngOnInit() {

  }

  Login(tipo: string, form?: NgForm) {

    //console.log(form.value);
    if (tipo == "Funcionario") {
      this.funcionarioService.getUsuarioPassword(form.value.usuario, form.value.password).
        subscribe(res => {
          //console.log(res);
          if (res) {

            console.log("Si es el usuario");
            if (confirm("Su usuario y contraseña son correctos :)")) {
              this.funcionarioService.getFuncionario(form.value.usuario).
                subscribe(res => {

                  console.log(res);
                  var funcionario: Funcionario;
                  funcionario = res as Funcionario;
                  this.cookieService.set('_id', funcionario._id);
                  this.cookieService.set('nombre', funcionario.nombre as string);
                  this.cookieService.set('cedulaDoctor', funcionario.cedula.toString());
                  this.cookieService.set('tipo', funcionario.tipo as string);

                  this.cookieService.set('area', funcionario.area as string);
                  this.cookieService.set('usuario', funcionario.usuario as string);
                  this.cookieService.set('password', funcionario.password as string);
                  this.funcionarioService.setisLogged(true);
                  if (funcionario.tipo == "Administrador") {
                    this.router.navigate(['Admin/Funcionarios']);
                  } else if (funcionario.tipo == "Secretaria") {
                    this.router.navigate(['Secretaria']);
                  } else if (funcionario.tipo == "Doctor") {
                    this.router.navigate(['Doctor/AtenderPaciente']);
                  }

                })
            }
          } else {
            console.log("No es el usuario");
            confirm("Su contraseña o usuario no es correcto");
          }
        });
    } else if (tipo == "Paciente") {
      this.registerService.getPacientePassword(form.value.usuario, form.value.password).
        subscribe(res => {
          //console.log(res);
          if (res) {

            console.log("Si es el usuario");
            if (confirm("Su usuario y contraseña son correctos :)")) {
              this.registerService.getPaciente(form.value.usuario).
                subscribe(res => {

                  console.log(res);
                  var paciente: Register;
                  paciente = res as Register;
                  this.cookieService.set('_idPaciente', paciente._id);
                  this.cookieService.set('nombre', paciente.nombre as string);
                  this.cookieService.set('cedula', paciente.cedula.toString());
                  this.cookieService.set('tipoSangre', paciente.tipoSangre as string);

                  this.cookieService.set('nacionalidad', paciente.nacionalidad as string);
                  this.cookieService.set('residencia', paciente.residencia as string);
                  this.cookieService.set('telefonos', paciente.telefonos as string);
                  this.cookieService.set('correo', paciente.correo as string);
                  this.cookieService.set('contrasena', paciente.contrasena as string);
                  this.funcionarioService.setisLogged(true);
                  
                  this.router.navigate(['Paciente/Cita']);
                })
            }
          } else {
            console.log("No es el usuario");
            confirm("Su contraseña o usuario no es correcto");
          }
        });
    } else {
      M.toast({ html: "No se selecciono un tipo de usuario" });
    }


  }

}