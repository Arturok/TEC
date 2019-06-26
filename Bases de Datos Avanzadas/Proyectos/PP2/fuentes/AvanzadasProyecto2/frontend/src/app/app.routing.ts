import { CentrosAtencionComponent } from './components/centros-atencion/centros-atencion.component';
import { FuncionariosComponent } from './components/funcionarios/funcionarios.component';
import { TratamientosComponent } from './components/tratamientos/tratamientos.component';
import { EnfermedadesComponent } from './components/enfermedades/enfermedades.component';
import { AdminTratamientosAsigComponent } from './components/admin-tratamientos-asig/admin-tratamientos-asig.component';
import { AdminRangoEnfermedadesComponent } from './components/admin-rango-enfermedades/admin-rango-enfermedades.component';
import { LoginComponent } from './components/login/login.component';
import { Routes } from '@angular/router'
import { AdminComponent } from './components/admin/admin.component';
import { AuthGuard } from './auth.guard';
import { PacienteCitaComponent } from './components/paciente-cita/paciente-cita.component';
import { PacienteComponent } from './components/paciente/paciente.component';
import { RegisterComponent } from './components/register/register.component';
import { CitaRangoFechaComponent } from './components/cita-rango-fecha/cita-rango-fecha.component';
import { CitaEstadoComponent } from './components/cita-estado/cita-estado.component';
import { CitaEspecialidadComponent } from './components/cita-especialidad/cita-especialidad.component';
import { DoctorComponent } from './components/doctor/doctor.component';
import { DoctorAtenderPacienteComponent } from './components/doctor-atender-paciente/doctor-atender-paciente.component';
import { DoctorInfoPacienteComponent } from './components/doctor-info-paciente/doctor-info-paciente.component';
import { AdminEnfermedadesDiagComponent } from './components/admin-enfermedades-diag/admin-enfermedades-diag.component';
import { AdminCantidadCitasComponent } from './components/admin-cantidad-citas/admin-cantidad-citas.component';

export const appRoutes: Routes = [
    { path: "Login", component: LoginComponent},
    { path: "Register", component: RegisterComponent},
    { path: "Admin", component: AdminComponent, canActivate: [AuthGuard], 
    children: [
        { path: "CentrosAtencion", component: CentrosAtencionComponent},
        { path: "Funcionarios", component: FuncionariosComponent},
        { path: "Tratamientos", component: TratamientosComponent},
        { path: "Enfermedades", component: EnfermedadesComponent},
        { path: "TratamientosAsig", component: AdminTratamientosAsigComponent},
        { path: "RangoEnfermedades", component: AdminRangoEnfermedadesComponent},
        { path: "EnfermedadesDiag", component: AdminEnfermedadesDiagComponent},
        { path: "CantidadCitas", component: AdminCantidadCitasComponent}
    ]},
    { path: "Paciente", component: PacienteComponent,canActivate: [AuthGuard], 
    children: [
        { path: "Cita", component: PacienteCitaComponent},
        { path: "CitaRangoFecha", component: CitaRangoFechaComponent},
        { path: "CitaEstado", component: CitaEstadoComponent},
        { path: "CitaEspecialidad", component: CitaEspecialidadComponent}
    ]},
    { path: "Doctor", component: DoctorComponent,canActivate: [AuthGuard], 
    children: [
        { path: "AtenderPaciente", component: DoctorAtenderPacienteComponent},
        { path: "InfoPaciente", component: DoctorInfoPacienteComponent}
    ]}
    


    
];

