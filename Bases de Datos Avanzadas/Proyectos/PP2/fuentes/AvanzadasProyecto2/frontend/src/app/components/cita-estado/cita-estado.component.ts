import { Component, OnInit } from '@angular/core';
import { PacienteCitaService } from '../../services/paciente-cita.service'
import { NgForm } from '@angular/forms';
import { Cita } from '../../models/cita';
import { CookieService } from 'ngx-cookie-service';


@Component({
  selector: 'app-cita-estado',
  templateUrl: './cita-estado.component.html',
  styleUrls: ['./cita-estado.component.css'],
  providers: [ PacienteCitaService ]
})
export class CitaEstadoComponent implements OnInit {
  constructor(private citaService: PacienteCitaService, private cookieService: CookieService) { }

  ngOnInit() {
    
    
  }

  getCitaEstado(estado: string) {
    this.citaService.getCitaEstado(this.cookieService.get('_id'),estado)
      .subscribe(res => {
        this.citaService.citas = res as Cita[];
      });

  }


}
