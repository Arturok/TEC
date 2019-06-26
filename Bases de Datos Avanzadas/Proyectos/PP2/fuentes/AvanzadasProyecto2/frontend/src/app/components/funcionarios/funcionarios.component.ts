import { Component, OnInit } from '@angular/core';
import { FuncionarioService } from '../../services/funcionario.service'
import { NgForm } from '@angular/forms';
import { Funcionario } from '../../models/funcionario';

declare var M: any;

@Component({
  selector: 'app-funcionarios',
  templateUrl: './funcionarios.component.html',
  styleUrls: ['./funcionarios.component.css'],
  providers: [ FuncionarioService ]
})
export class FuncionariosComponent implements OnInit {

  constructor(private funcionarioService: FuncionarioService) { }


  ngOnInit() {
    this.getFuncionarios();
  }

  addFuncionario(form?: NgForm) {
    console.log(form.value);
    if(form.value._id) {
      this.funcionarioService.putFuncionario(form.value)
        .subscribe(res => {
          this.resetForm(form);
          this.getFuncionarios();
          M.toast({html: 'Updated Successfully'});
        });
    } else {
      this.funcionarioService.postFuncionario(form.value)
      .subscribe(res => {
        this.getFuncionarios();
        this.resetForm(form);
        M.toast({html: 'Save successfully'});
      });
    }
    
  }

  getFuncionarios() {
    this.funcionarioService.getFuncionarios()
      .subscribe(res => {
        this.funcionarioService.funcionarios = res as Funcionario[];
      });
  }

  editFuncionario(funcionario: Funcionario) {
    this.funcionarioService.selectedFuncionario = funcionario;
  }

  deleteFuncionario(_id: string, form: NgForm) {
    if(confirm('Are you sure you want to delete it?')) {
      this.funcionarioService.deleteFuncionario(_id)
        .subscribe(res => {
          this.getFuncionarios();
          this.resetForm(form);
          M.toast({html: 'Deleted Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.funcionarioService.selectedFuncionario = new Funcionario();
    }
  }

}
