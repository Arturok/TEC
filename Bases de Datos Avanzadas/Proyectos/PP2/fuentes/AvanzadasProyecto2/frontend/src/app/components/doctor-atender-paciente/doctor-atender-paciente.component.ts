import { Component, OnInit } from '@angular/core';
import { DoctorAtenderPacienteService } from '../../services/doctor-atender-paciente.service'
import { NgForm } from '@angular/forms';
import { DoctorAtenderPaciente } from '../../models/doctor-atender-paciente';
import { CookieService } from 'ngx-cookie-service';

declare var M: any;

@Component({
  selector: 'app-doctor-atender-paciente',
  templateUrl: './doctor-atender-paciente.component.html',
  styleUrls: ['./doctor-atender-paciente.component.css']
})
export class DoctorAtenderPacienteComponent implements OnInit {

  constructor(private doctorAtenderPacienteService: DoctorAtenderPacienteService, private cookieService: CookieService) { }

  ngOnInit() {
    this.getDoctorAtenderPacientes();
  }

  addDoctorAtenderPaciente(form?: NgForm) {
    console.log(form.value);
    if(form.value._id) {
      this.doctorAtenderPacienteService.putDoctorAtenderPaciente(form.value)
        .subscribe(res => {
          this.resetForm(form);
          this.getDoctorAtenderPacientes();
          M.toast({html: 'Updated Successfully'});
        });
    } else {
      console.log(this.cookieService.get('cedulaDoctor'));
      this.doctorAtenderPacienteService.postDoctorAtenderPaciente(form.value,this.cookieService.get('cedulaDoctor'))
      .subscribe(res => {
        this.getDoctorAtenderPacientes();
        this.resetForm(form);
        M.toast({html: 'Save successfully'});
      });
    }
    
  }

  getDoctorAtenderPacientes() {
    this.doctorAtenderPacienteService.getDoctorAtenderPacientes(this.cookieService.get('cedulaDoctor'))
      .subscribe(res => {
        this.doctorAtenderPacienteService.doctorAtenderPacientes = res as DoctorAtenderPaciente[];
        console.log(this.doctorAtenderPacienteService.doctorAtenderPacientes);
      });
  }



  editDoctorAtenderPaciente(doctorAtenderPaciente: DoctorAtenderPaciente) {
    this.doctorAtenderPacienteService.selectedDoctorAtenderPaciente = doctorAtenderPaciente;
  }

  deleteDoctorAtenderPaciente(_id: string, form: NgForm) {
    if(confirm('Are you sure you want to delete it?')) {
      this.doctorAtenderPacienteService.deleteDoctorAtenderPaciente(_id)
        .subscribe(res => {
          this.getDoctorAtenderPacientes();
          this.resetForm(form);
          M.toast({html: 'Deleted Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.doctorAtenderPacienteService.selectedDoctorAtenderPaciente = new DoctorAtenderPaciente();
    }
  }

}
