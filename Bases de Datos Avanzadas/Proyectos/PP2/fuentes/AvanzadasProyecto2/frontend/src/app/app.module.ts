import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';

import { Routes, RouterModule } from '@angular/router';
import { appRoutes } from './app.routing';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FuncionariosComponent } from './components/funcionarios/funcionarios.component';
import { TopNavBarAdminComponent } from './components/top-nav-bar-admin/top-nav-bar-admin.component';
import { TratamientosComponent } from './components/tratamientos/tratamientos.component';
import { EnfermedadesComponent } from './components/enfermedades/enfermedades.component';
import { AdminTratamientosAsigComponent } from './components/admin-tratamientos-asig/admin-tratamientos-asig.component';
import { AdminRangoEnfermedadesComponent } from './components/admin-rango-enfermedades/admin-rango-enfermedades.component';
import { CentrosAtencionComponent } from './components/centros-atencion/centros-atencion.component';
import { PacienteCitaComponent } from './components/paciente-cita/paciente-cita.component';
import { AdminComponent } from './components/admin/admin.component';
import { LoginComponent } from './components/login/login.component'
import { CookieService } from 'ngx-cookie-service';
import { AuthGuard } from './auth.guard';
import { TopNavBarPacienteComponent } from './components/top-nav-bar-paciente/top-nav-bar-paciente.component';
import { PacienteComponent } from './components/paciente/paciente.component';
import { RegisterComponent } from './components/register/register.component';
import { CitaRangoFechaComponent } from './components/cita-rango-fecha/cita-rango-fecha.component';
import { CitaEstadoComponent } from './components/cita-estado/cita-estado.component';
import { CitaEspecialidadComponent } from './components/cita-especialidad/cita-especialidad.component';
import { DoctorAtenderPacienteComponent } from './components/doctor-atender-paciente/doctor-atender-paciente.component';
import { DoctorComponent } from './components/doctor/doctor.component';
import { TopNavBarDoctorComponent } from './components/top-nav-bar-doctor/top-nav-bar-doctor.component';
import { DoctorInfoPacienteComponent } from './components/doctor-info-paciente/doctor-info-paciente.component';
import { AdminEnfermedadesDiagComponent } from './components/admin-enfermedades-diag/admin-enfermedades-diag.component';
import { AdminCantidadCitasComponent } from './components/admin-cantidad-citas/admin-cantidad-citas.component';

@NgModule({
  declarations: [
    AppComponent,
    FuncionariosComponent,
    TopNavBarAdminComponent,
    TratamientosComponent,
    EnfermedadesComponent,
    AdminTratamientosAsigComponent,
    AdminRangoEnfermedadesComponent,
    CentrosAtencionComponent,
    PacienteCitaComponent,
    LoginComponent,
    AdminComponent,
    TopNavBarPacienteComponent,
    PacienteComponent,
    RegisterComponent,
    CitaRangoFechaComponent,
    CitaEstadoComponent,
    CitaEspecialidadComponent,
    DoctorAtenderPacienteComponent,
    DoctorComponent,
    TopNavBarDoctorComponent,
    DoctorInfoPacienteComponent,
    AdminEnfermedadesDiagComponent,
    AdminCantidadCitasComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [CookieService, AuthGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }
