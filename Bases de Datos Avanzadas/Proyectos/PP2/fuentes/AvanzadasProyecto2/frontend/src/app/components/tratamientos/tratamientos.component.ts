import { Component, OnInit } from '@angular/core';
import { TratamientoService } from '../../services/tratamiento.service'
import { NgForm } from '@angular/forms';
import { Tratamiento } from '../../models/tratamiento';

declare var M: any;

@Component({
  selector: 'app-tratamientos',
  templateUrl: './tratamientos.component.html',
  styleUrls: ['./tratamientos.component.css']
})
export class TratamientosComponent implements OnInit {

  constructor(private tratamientoService: TratamientoService) { }

  ngOnInit() {
    this.getTratamientos();
  }

  addTratamiento(form?: NgForm) {
    console.log(form.value);
    if(form.value._id) {
      this.tratamientoService.putTratamiento(form.value)
        .subscribe(res => {
          this.resetForm(form);
          this.getTratamientos();
          M.toast({html: 'Updated Successfully'});
        });
    } else {
      this.tratamientoService.postTratamiento(form.value)
      .subscribe(res => {
        this.getTratamientos();
        this.resetForm(form);
        M.toast({html: 'Save successfully'});
      });
    }
    
  }

  getTratamientos() {
    this.tratamientoService.getTratamientos()
      .subscribe(res => {
        this.tratamientoService.tratamientos = res as Tratamiento[];
      });
  }

  editTratamiento(tratamiento: Tratamiento) {
    this.tratamientoService.selectedTratamiento = tratamiento;
  }

  deleteTratamiento(_id: string, form: NgForm) {
    if(confirm('Are you sure you want to delete it?')) {
      this.tratamientoService.deleteTratamiento(_id)
        .subscribe(res => {
          this.getTratamientos();
          this.resetForm(form);
          M.toast({html: 'Deleted Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.tratamientoService.selectedTratamiento = new Tratamiento();
    }
  }

}

