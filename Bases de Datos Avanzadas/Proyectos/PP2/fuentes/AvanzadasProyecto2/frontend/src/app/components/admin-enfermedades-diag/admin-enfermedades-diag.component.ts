import { Component, OnInit } from '@angular/core';
import { ConsultaService } from '../../services/consulta.service'
import { AdminEnfermedadesDiag } from '../../models/admin-enfermedades-diag';

@Component({
  selector: 'app-admin-enfermedades-diag',
  templateUrl: './admin-enfermedades-diag.component.html',
  styleUrls: ['./admin-enfermedades-diag.component.css']
})
export class AdminEnfermedadesDiagComponent implements OnInit {

  adminEnfermedadesDiag: AdminEnfermedadesDiag[];
  constructor(private consultaService: ConsultaService) { }

  ngOnInit() {
    this.getAdminEnfermedadesDiag()
  }

  getAdminEnfermedadesDiag() {
    this.consultaService.getAdminEnfermedadesDiag()
      .subscribe(res => {
        this.adminEnfermedadesDiag = res as AdminEnfermedadesDiag[];
      });
  }

}
