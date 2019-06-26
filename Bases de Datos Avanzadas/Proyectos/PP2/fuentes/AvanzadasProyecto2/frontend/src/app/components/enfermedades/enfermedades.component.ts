import { Component, OnInit } from '@angular/core';
import { EnfermedadService } from '../../services/enfermedad.service'
import { NgForm } from '@angular/forms';
import { Enfermedad } from '../../models/enfermedad';
declare var M: any;

@Component({
  selector: 'app-enfermedades',
  templateUrl: './enfermedades.component.html',
  styleUrls: ['./enfermedades.component.css'],
  providers: [ EnfermedadService ]
})
export class EnfermedadesComponent implements OnInit {

  constructor(private enfermedadService: EnfermedadService) { }


  ngOnInit() {
    this.getEnfermedades();
  }

  addEnfermedad(form?: NgForm) {
    console.log(form.value);
    if(form.value._id) {
      this.enfermedadService.putEnfermedad(form.value)
        .subscribe(res => {
          this.resetForm(form);
          this.getEnfermedades();
          M.toast({html: 'Updated Successfully'});
        });
    } else {
      this.enfermedadService.postEnfermedad(form.value)
      .subscribe(res => {
        this.getEnfermedades();
        this.resetForm(form);
        M.toast({html: 'Save successfully'});
      });
    }
    
  }

  getEnfermedades() {
    this.enfermedadService.getEnfermedades()
      .subscribe(res => {
        this.enfermedadService.enfermedades = res as Enfermedad[];
      });
  }

  editEnfermedad(Enfermedad: Enfermedad) {
    this.enfermedadService.selectedEnfermedad = Enfermedad;
  }

  deleteEnfermedad(_id: string, form: NgForm) {
    if(confirm('Are you sure you want to delete it?')) {
      this.enfermedadService.deleteEnfermedad(_id)
        .subscribe(res => {
          this.getEnfermedades();
          this.resetForm(form);
          M.toast({html: 'Deleted Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.enfermedadService.selectedEnfermedad = new Enfermedad();
    }
  }

}


