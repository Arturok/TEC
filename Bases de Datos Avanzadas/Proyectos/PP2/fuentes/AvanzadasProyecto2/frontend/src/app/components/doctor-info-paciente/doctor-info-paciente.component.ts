import { Component, OnInit } from '@angular/core';
import { RegisterService } from '../../services/register.service'
import { Register } from '../../models/register';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-doctor-info-paciente',
  templateUrl: './doctor-info-paciente.component.html',
  styleUrls: ['./doctor-info-paciente.component.css']
})
export class DoctorInfoPacienteComponent implements OnInit {

  constructor(private registerService: RegisterService, private cookieService: CookieService) { }

  ngOnInit() {
  }

  getInfoPaciente(cedulaPaciente: string) {
    this.registerService.getInfoPaciente(cedulaPaciente)
      .subscribe(res => {
        this.registerService.registers = res as Register[];
      });

  }

}

