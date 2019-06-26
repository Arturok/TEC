import { Component, OnInit } from '@angular/core';
import { PacienteCitaService } from '../../services/paciente-cita.service'
import { NgForm } from '@angular/forms';
import { Cita } from '../../models/cita';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-cita-especialidad',
  templateUrl: './cita-especialidad.component.html',
  styleUrls: ['./cita-especialidad.component.css'],
  providers: [ PacienteCitaService ]
})
export class CitaEspecialidadComponent implements OnInit {

  constructor(private citaService: PacienteCitaService, private cookieService: CookieService) { }

  ngOnInit() {
  }

  getCitaEspecialidad(especialidad: string) {
    this.citaService.getCitaEspecialidad(this.cookieService.get('_id'),especialidad)
      .subscribe(res => {
        this.citaService.citas = res as Cita[];
      });

  }
}
