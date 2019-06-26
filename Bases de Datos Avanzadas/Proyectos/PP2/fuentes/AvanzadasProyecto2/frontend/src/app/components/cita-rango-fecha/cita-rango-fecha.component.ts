import { Component, OnInit } from '@angular/core';
import { PacienteCitaService } from '../../services/paciente-cita.service'
import { NgForm } from '@angular/forms';
import { Cita } from '../../models/cita';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-cita-rango-fecha',
  templateUrl: './cita-rango-fecha.component.html',
  styleUrls: ['./cita-rango-fecha.component.css'],
  providers: [ PacienteCitaService ]
})
export class CitaRangoFechaComponent implements OnInit {

  constructor(private citaService: PacienteCitaService, private cookieService: CookieService) { }

  ngOnInit() {
  }

  getCitaRango(primerFecha: string, segundaFecha: string) {
    this.citaService.getCitaRango(this.cookieService.get('_id'),primerFecha, segundaFecha)
      .subscribe(res => {
        this.citaService.citas = res as Cita[];
      });

  }

}
