import { Component, OnInit } from '@angular/core';
import { ConsultaService } from '../../services/consulta.service'
import { TratamientosAsig } from '../../models/tratamientos-asig';

@Component({
  selector: 'app-admin-tratamientos-asig',
  templateUrl: './admin-tratamientos-asig.component.html',
  styleUrls: ['./admin-tratamientos-asig.component.css']
})
export class AdminTratamientosAsigComponent implements OnInit {

  tratamientosAsig: TratamientosAsig[];
  constructor(private consultaService: ConsultaService) { }

  ngOnInit() {
    this.getTratamientosAsig()
  }

  getTratamientosAsig() {
    this.consultaService.getTratamientosAsig()
      .subscribe(res => {
        this.tratamientosAsig = res as TratamientosAsig[];
      });
  }
}
