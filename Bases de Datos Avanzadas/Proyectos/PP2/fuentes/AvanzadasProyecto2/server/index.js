const express = require('express');
const cors = require('cors');
const app = express();

const { mongoose } = require('./database');

// Settings
app.set('port', process.env.PORT || 3000);

// Middlewares
app.use(cors({origin: 'http://localhost:4200'}));
app.use(express.json());

// Routes
app.use('/admin/funcionarios', require('./routes/funcionario.routes'));
app.use('/admin/tratamientos', require('./routes/tratamiento.routes'));
app.use('/admin/enfermedades', require('./routes/enfermedad.routes'));
app.use('/admin/centrosAtencion', require('./routes/centroAtencion.routes'));
app.use('/admin/consultas', require('./routes/adminConsultas.routes'));
app.use('/paciente/citas', require('./routes/cita.routes'));
app.use('/register/paciente', require('./routes/paciente.routes'));
app.use('/doctor/atenderPacientes', require('./routes/doctorAtenderPaciente.routes'));

// starting the server
app.listen(app.get('port'), () => {
    console.log(`server on port ${app.get('port')}`);
});