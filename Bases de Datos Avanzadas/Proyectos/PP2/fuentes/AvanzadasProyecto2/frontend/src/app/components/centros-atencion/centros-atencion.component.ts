import { Component, OnInit } from '@angular/core';
import { CentroAtencionService } from '../../services/centro-atencion.service'
import { NgForm } from '@angular/forms';
import { CentroAtencion } from '../../models/centro-atencion';
declare var M: any;

@Component({
  selector: 'app-centros-atencion',
  templateUrl: './centros-atencion.component.html',
  styleUrls: ['./centros-atencion.component.css'],
  providers: [ CentroAtencionService ]
})
export class CentrosAtencionComponent implements OnInit {

  constructor(private centroAtencionService: CentroAtencionService) { }


  ngOnInit() {
    this.getcentrosAtencion();
  }

  addcentroAtencion(form?: NgForm) {
    console.log(form.value);
    if(form.value._id) {
      this.centroAtencionService.putcentroAtencion(form.value)
        .subscribe(res => {
          this.resetForm(form);
          this.getcentrosAtencion();
          M.toast({html: 'Updated Successfully'});
        });
    } else {
      this.centroAtencionService.postcentroAtencion(form.value)
      .subscribe(res => {
        this.getcentrosAtencion();
        this.resetForm(form);
        M.toast({html: 'Save successfully'});
      });
    }
    
  }

  getcentrosAtencion() {
    this.centroAtencionService.getcentrosAtencion()
      .subscribe(res => {
        this.centroAtencionService.centrosAtencion = res as CentroAtencion[];
        console.log(this.centroAtencionService.centrosAtencion);
      });
  }

  editcentroAtencion(centroMedico: CentroAtencion) {
    this.centroAtencionService.selectedcentroAtencion = centroMedico;
  }

  deletecentroAtencion(_id: string, form: NgForm) {
    if(confirm('Are you sure you want to delete it?')) {
      this.centroAtencionService.deletecentroAtencion(_id)
        .subscribe(res => {
          this.getcentrosAtencion();
          this.resetForm(form);
          M.toast({html: 'Deleted Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.centroAtencionService.selectedcentroAtencion = new CentroAtencion();
    }
  }

}


