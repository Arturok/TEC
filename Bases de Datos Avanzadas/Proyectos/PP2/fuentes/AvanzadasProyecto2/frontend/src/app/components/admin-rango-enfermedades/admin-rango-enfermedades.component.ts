import { Component, OnInit } from '@angular/core';
import { ConsultaService } from '../../services/consulta.service'
import { AdminRangoEnfermedades } from '../../models/admin-rango-enfermedades';


@Component({
  selector: 'app-admin-rango-enfermedades',
  templateUrl: './admin-rango-enfermedades.component.html',
  styleUrls: ['./admin-rango-enfermedades.component.css']
})
export class AdminRangoEnfermedadesComponent implements OnInit {

  adminRangoEnfermedades: AdminRangoEnfermedades[];
  constructor(private consultaService: ConsultaService) { }

  ngOnInit() {
    this.getAdminRangoEnfermedades()
  }

  getAdminRangoEnfermedades() {
    this.consultaService.getAdminRangoEnfermedades()
      .subscribe(res => {
        this.adminRangoEnfermedades = res as AdminRangoEnfermedades[];
      });
  }

}