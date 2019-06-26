import { Component, OnInit } from '@angular/core';
import { RegisterService } from '../../services/register.service'
import { NgForm } from '@angular/forms';
import { Register } from '../../models/register';
import { Router } from '@angular/router'
declare var M: any;

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
  providers: [ RegisterService ]
})
export class RegisterComponent implements OnInit {

  constructor(private registerService: RegisterService, private router: Router) { }


  ngOnInit() {
    this.getRegisters();
  }

  addRegister(form?: NgForm) {
    console.log(form.value);
    if(form.value._id) {
      this.registerService.putRegister(form.value)
        .subscribe(res => {
          this.resetForm(form);
          this.getRegisters();
          M.toast({html: 'Updated Successfully'});
        });
    } else {
      this.registerService.postRegister(form.value)
      .subscribe(res => {
        this.getRegisters();
        this.resetForm(form);
        
        M.toast({html: 'Save successfully'});
        this.router.navigate(['/Login']);
      });
    }
    
  }

  getRegisters() {
    this.registerService.getRegisters()
      .subscribe(res => {
        this.registerService.registers = res as Register[];
      });
  }

  editRegister(register: Register) {
    this.registerService.selectedRegister = register;
  }

  deleteRegister(_id: string, form: NgForm) {
    if(confirm('Are you sure you want to delete it?')) {
      this.registerService.deleteRegister(_id)
        .subscribe(res => {
          this.getRegisters();
          this.resetForm(form);
          M.toast({html: 'Deleted Succesfully'});
        });
    }
  }

  resetForm(form?: NgForm) {
    if (form) {
      form.reset();
      this.registerService.selectedRegister = new Register();
    }
  }

}


