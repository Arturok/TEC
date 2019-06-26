import { Component, OnInit } from '@angular/core';
import { ConsultaService } from '../../services/consulta.service'
import { AdminCantidadCitas } from '../../models/admin-cantidad-citas';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-admin-cantidad-citas',
  templateUrl: './admin-cantidad-citas.component.html',
  styleUrls: ['./admin-cantidad-citas.component.css'],
  providers: [ ConsultaService ]
})
export class AdminCantidadCitasComponent implements OnInit {

  adminCantidadCitas: AdminCantidadCitas[];
  constructor(private adminCantidadCitasService: ConsultaService, private cookieService: CookieService) { }

  ngOnInit() {
  }

  getCantidadCitasPaciente(paciente: number) {
    this.adminCantidadCitasService.getCantidadCitasPaciente(paciente)
      .subscribe(res => {
        this.adminCantidadCitas = res as AdminCantidadCitas[];
      });

  }

  getCantidadCitasEspecialidad(especialidad: string) {
    this.adminCantidadCitasService.getCantidadCitasEspecialidad(especialidad)
      .subscribe(res => {
        this.adminCantidadCitas = res as AdminCantidadCitas[];
      });

  }

  getCantidadCitasEstado(estado: string) {
    this.adminCantidadCitasService.getCantidadCitasEstado(estado)
      .subscribe(res => {
        this.adminCantidadCitas = res as AdminCantidadCitas[];
      });

  }
  

  

}


