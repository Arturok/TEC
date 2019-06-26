import { Component, OnInit } from '@angular/core';
import { PacienteCitaService } from '../../services/paciente-cita.service'
import { NgForm } from '@angular/forms';
import { Cita } from '../../models/cita';
import { CookieService } from 'ngx-cookie-service';


declare var M: any;


@Component({
  selector: 'app-paciente-cita',
  templateUrl: './paciente-cita.component.html',
  styleUrls: ['./paciente-cita.component.css'],
  providers: [ PacienteCitaService ]
})
export class PacienteCitaComponent implements OnInit {

  constructor(private citaService: PacienteCitaService, private cookieService: CookieService) { }


  ngOnInit() {
    this.getCitas();
  }

  addCita(form?: NgForm) {
    console.log(form.value);
    this.citaService.postCita(form.value,this.cookieService.get('_idPaciente'))
    .subscribe(res => {
      this.getCitas();
      this.resetForm(form);
      M.toast({html: 'Save successfully'});
    });
  }

  getCitas() {
    this.citaService.getCitas(this.cookieService.get('_idPaciente'))
      .subscribe(res => {
        this.citaService.citas = res as Cita[];
        console.log(this.citaService.citas);
      });
  }

  editCita(cita: Cita) {
    this.citaService.selectedCita = cita;
  }

  cancelarCita(cita: Cita) {
    console.log(cita);
    if(confirm('Are you sure you want to cancel it?')) {
      this.citaService.cancelarCita(cita)
        .subscribe(res => {
          this.getCitas();
          M.toast({html: 'Canceled Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.citaService.selectedCita = new Cita();
    }
  }

}
