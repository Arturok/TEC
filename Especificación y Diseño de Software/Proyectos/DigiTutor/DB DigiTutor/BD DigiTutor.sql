



create table Usuario (
IdUsuario int identity(1,1) primary key,
Nombre varchar(100) not null,
Apellido1 varchar(100) not null,
Apellido2 varchar(100) not null,
Email varchar(100) not null,
Carnet varchar(100) not null,
Contrasena varchar(100) not null,
IdRol int not null,
FechaInscripcion datetime not null
)

create table DetalleTutor (
IdUsuario int primary key,
IdPais int not null,
IdUniversidad int not null,
Email2 varchar(100),
TelefonoMovil varchar(100) not null,
TelefonoFijo varchar(100),
Foto varchar(max),
FechaInscripcion datetime not null,
DescripcionPersonal varchar(500),
Puntuacion int not null default 0
)

create table Universidad (
IdUniversidad int identity(1,1) primary key,
Nombre varchar(100) not null,
NombrePais varchar(100) not null
)

create table Rol (
IdRol int identity(1,1) primary key,
Nombre varchar(50) not null
)

create table Categoria (
IdCategoria int identity(1,1) primary key,
Nombre varchar(100) not null
)

create table Habilidad (
IdHabilidad int identity(1,1) primary key,
Nombre varchar(100) not null,
IdCategoria int not null
)

create table HabilidadXTutor (
IdHabilidadXTutor int identity(1,1) primary key,
IdUsuario int not null,
IdHabilidad int not null
)

create table ApoyoXTutor (
IdApoyoXTutor int identity(1,1) primary key,
IdUsuario int not null,
IdHabilidadXTutor int not null
)

create table Publicacion (
IdPublicacion int identity(1,1) primary key,
IdUsuario int not null,
IdTipoPublicacion int not null,
Titulo varchar(100) not null,
Descripcion varchar(500) not null,
FechaPublicacion datetime not null,
Curso varchar(100) not null
)

create table DetalleTutoria (
IdDetalleTutoria int identity(1,1) primary key,
IdPublicacion int not null,
Virtual bit not null,
Costo bit not null,
FechaInicio datetime not null,
Sitio varchar(500) not null,
IdUniversidad int not null
)

create table ComentarioXPublicacion (
IdComentario int identity(1,1) primary key,
IdUsuario int not null,
IdPublicacion int not null,
DetalleComentario varchar(500) not null,
Fecha datetime not null
)

create table PuntoXPublicacion (
IdPuntoXPublicacion int identity(1,1) primary key,
IdPublicacion int not null,
IdUsuario int not null
)

create table AsistenteXTutoria (
IdAsistenteXTutoria int identity(1,1) primary key,
IdUsuario int not null,
IdDetalleTutoria int not null
)

create table DocumentoXPublicacion (
IdDocumentoXPublicacion int identity(1,1) primary key,
IdPublicacion int not null,
NombreContainer varchar(100) not null
)

create table UsuarioXSeguidor(
IdUsuarioXSeguidor int identity(1,1) primary key,
IdUsuario int not null,
IdSeguido int not null
)






--Foreign Keys --
alter table DetalleTutor
add constraint Fk_DetalleTutor_Usuario foreign key(IdUsuario) references Usuario(IdUsuario)

alter table DetalleTutor
add constraint Fk_DetaleTutor_Universidad foreign key(IdUniversidad) references Universidad(IdUniversidad)

alter table Usuario
add constraint Fk_Usuario_Rol foreign key (IdRol) references Rol(IdRol)

alter table Usuario
add constraint UniqueCarnet unique(Carnet)

alter table Habilidad 
add constraint Fk_Habilidad_Categoria foreign key (IdCategoria) references Categoria(IdCategoria)

alter table Habilidad
add constraint UniqueHabilidad unique(Nombre, IdCategoria)

alter table HabilidadXTutor
add constraint Fk_HabilidadXTutor_DetalleTutor foreign key(IdUsuario) references DetalleTutor(IdUsuario)

alter table HabilidadXTutor
add constraint Fk_HabilidadXTutor_Habilidad foreign key(IdHabilidad) references Habilidad(IdHabilidad)

alter table ApoyoXTutor
add constraint Fk_ApoyoXTutor_DetalleTutor foreign key (IdUsuario) references DetalleTutor(IdUsuario)

alter table ApoyoXTutor
add constraint Fk_ApoyoXTutor_HabilidadXTutor foreign key (IdHabilidadXTutor) references HabilidadXTutor(IdHabilidadXTutor)

alter table ApoyoXTutor
add constraint Unique_ApoyoXTutor unique(IdUsuario, IdHabilidadXTutor)

alter table DetalleTutoria
add constraint Fk_DetalleTutoria_Publicacion foreign key(IdPublicacion) references Publicacion(IdPublicacion)

alter table DetalleTutoria
add constraint Fk_DetalleTutoria_Universidad foreign key(IdUniversidad) references Universidad(IdUniversidad)

alter table ComentarioXPublicacion
add constraint Fk_ComentarioXPublicacion_DetalleTutor foreign key(IdUsuario) references DetalleTutor(IdUsuario)

alter table ComentarioXPublicacion
add constraint Fk_ComentarioXPublicacion_Publicacion foreign key(IdPublicacion) references Publicacion(IdPublicacion)

alter table PuntoXPublicacion
add constraint PuntoXPublicacion_Publicacion foreign key(IdPublicacion) references Publicacion(IdPublicacion)

alter table PuntoXPublicacion
add constraint PuntoXPublicacion_DetalleTutor foreign key(IdUsuario) references DetalleTutor(IdUsuario)

alter table PuntoXPublicacion
add constraint Unique_PuntoXPublicacion unique(IdUsuario, IdPublicacion)

alter table AsistenteXTutoria
add constraint Fk_AsistenteXTutoria_DetalleTutor foreign key(IdUsuario) references Usuario(IdUsuario)

alter table AsistenteXTutoria
add constraint Fk_AsistenteXTutoria_DetalleTutoria foreign key(IdDetalleTutoria) references DetalleTutoria(IdDetalleTutoria)

alter table AsistenteXTutoria
add constraint Unique_AsistenteXTutoria unique(IdUsuario, IdDetalleTutoria)

alter table DocumentoXPublicacion
add constraint Fk_DocumentoXPublicacion_Publicacion foreign key(IdPublicacion) references Publicacion(IdPublicacion)

alter table DocumentoXPublicacion
add constraint Unique_DocumentoXPublicacion unique(IdPublicacion)

alter table UsuarioXSeguidor
add constraint UniqueUsuarioXSeguidor unique(IdUsuario, IdSeguidor)

alter table UsuarioXSeguidor
add constraint Fk_UsuarioXSeguidor_Usuario foreign key(IdUsuario) references DetalleTutor(IdUsuario)

alter table UsuarioXSeguidor
add constraint Fk_UsuarioXSeguidor_Seguidor foreign key(IdSeguido) references DetalleTutor(IdUsuario)

alter table Publicacion
add constraint Fk_Publicacion_DetalleTutor foreign key(IdUsuario) references DetalleTutor(IdUsuario)

alter table DetalleTutoria
add constraint Unique_DetalleTutoria unique(IdPublicacion)



--Procedimientos almacenados--


alter procedure RegistroUsuario
@Nombre varchar(100),
@Apellido1 varchar(100),
@Apellido2 varchar(100),
@Email varchar(100),
@Carnet varchar(100),
@Contrasena varchar(100),
@IdRol int,
@IdUniversidad int,
@Email2 varchar(100),
@TelefonoMovil varchar(100),
@TelefonoFijo varchar(100),
@Foto varchar(max),
@Descripcion varchar(500)
as
begin
	begin try
	if exists(select * from Usuario where Usuario.Carnet = @Carnet)
	begin
		return 101; --No se puede insertar, el carnet ya existe
	end
	else
	begin
		begin tran TransUsuario
			if @IdRol = 1
			begin
				insert into Usuario values(@Nombre, @Apellido1, @Apellido2, @Email, @Carnet, @Contrasena, @IdRol, getdate(), 0)
			end
			if @IdRol = 2
			begin
				insert into Usuario values(@Nombre, @Apellido1, @Apellido2, @Email, @Carnet, @Contrasena, @IdRol, getdate(), 0)
				declare @IdUsuario int 
				select @IdUsuario = Usuario.IdUsuario from Usuario where Carnet = @Carnet
				insert into DetalleTutor(IdUsuario, IdUniversidad, Email2, TelefonoMovil, TelefonoFijo, Foto,  FechaInscripcion, DescripcionPersonal) 
				values (@IdUsuario, @IdUniversidad, @Email2, @TelefonoMovil, @TelefonoFijo, @Foto, getdate(), @Descripcion)
			end
		commit tran TransUsuario
		return 100; --Transacci󮠣ompleta, usuario registrado correctamente
	end
	end try
	begin catch
		rollback tran TransUsuario
		return 102; --No se pudo completar la transacci󮠡decuadamente
	end	catch
end
go

/*
exec RegistroUsuario
@Nombre = 'Arturo',
@Apellido1 = 'Chinchilla',
@Apellido2 = 'Sᮣhez',
@Email  = 'mchinchilla@email.com',
@Carnet  = '2013009344',
@Contrasena  = '2013009344',
@IdRol = 2,
@IdUniversidad = 1,
@Email2 = 'mchinchilla11@email.com',
@TelefonoMovil = '88888888',
@TelefonoFijo = '88888888',
@Foto = null,
@Descripcion = 'Holi khe ase?'*/


create procedure getIdUsuario
@Carnet varchar(100),
@Contrasena varchar(100)
as
begin
declare @IdUsuario int
select @IdUsuario = Usuario.IdUsuario from Usuario
where (Usuario.Carnet = @Carnet and Usuario.Contrasena = @Contrasena)
if @IdUsuario > 0
begin
	return @IdUsuario;
end
else 
begin
	return 101; --Usuario y Contrase񡠮o coinciden
end
end
go

/*declare @result int
exec @result = InicioSesion
@Carnet = '20130093445',
@Contrasena= '2013009344'
select @result*/


/* Procedimiento que retorna la  */
alter procedure getSesionActiva
@IdUsuario int
as
begin
declare @SesionActiva bit
select @SesionActiva = Usuario.SesionActiva from Usuario
where Usuario.IdUsuario = @IdUsuario
if exists(select * from Usuario where IdUsuario = @IdUsuario)
begin
	return @SesionActiva;
end
else
begin
	return 101; --No existe el usuario
end
end
go

/*declare @result int
exec @result = getSesionActiva
@IdUsuario = 7
select @result*/

/* Procedimiento para actualizar la sesion del usuario */
create procedure CambiarSesionActiva
@IdUsuario int
as
begin
declare @Sesion bit
select @Sesion = Usuario.SesionActiva from Usuario
where Usuario.IdUsuario = @IdUsuario
if exists(select * from Usuario where IdUsuario = @IdUsuario)
begin
	if @Sesion = 0
	begin
		update Usuario set Usuario.SesionActiva = 1
		where Usuario.IdUsuario = @IdUsuario
		return 100; -- Actualizaci󮠣orrecta
	end
	if @Sesion = 1
	begin
		update Usuario set Usuario.SesionActiva = 0
		where Usuario.IdUsuario = @IdUsuario
		return 100; -- Actualizaci󮠣orrecta
	end
end
else
begin
	return 101; --No existe el usuario
end
end
go

/*declare @result int
exec @result = CambiarSesionActiva
@IdUsuario = 7
select @result*/

/* Procedimiento para obtener el Rol del Usuario */
create procedure getRol
@IdUsuario int
as
begin
declare @IdRol int
select @IdRol = Usuario.IdRol from Usuario
where Usuario.IdUsuario = @IdUsuario
if exists (select * from Usuario where Usuario.IdUsuario = @IdUsuario)
begin
	return @IdRol;
end
else
begin
	return 101; --Usuario no existe
end
end
go

/*declare @result int
exec @result = getRol
@IdUsuario = 8
select @result*/


/* Procedure que agrega una habilidad a un tutor */
create procedure insertHabilidadUsuario
@IdUsuario int,
@IdHabilidad int
as
begin
if exists (select * from DetalleTutor where DetalleTutor.IdUsuario = @IdUsuario)
	begin
		if exists(select * from Habilidad where Habilidad.IdHabilidad = @IdHabilidad)
			begin 
				if exists(select * from HabilidadXTutor where (IdUsuario = @IdUsuario and IdHabilidad = @IdHabilidad))
					begin	
						return 103; -- Error al a񡤩r habilidad a usuario, suario ya tiene la habilidad agregada
					end
				else
					begin
						insert into HabilidadXTutor values(@IdUsuario, @IdHabilidad)
						return 100;
					end			
			end	
		else
			begin
				return 102; -- Habilidad no existe
			end
	end
else
	begin
		return 101; -- Usuario no existe o no es tutor
	end
end
go

/*
declare @result int
exec @result = insertHabilidadUsuario
@IdUsuario = 8,
@IdHabilidad = 6
select @result
*/

select * from Habilidad

/* Obtiene el feed que se mostrarᠡ un Usuario */
alter procedure getFeed
@IdUsuario int
as
begin
begin try
	if exists(select * from DetalleTutor where IdUsuario = @IdUsuario)
		begin
			select Usuario.Nombre, UsuarioXSeguidor.IdSeguido, Publicacion.IdPublicacion, Publicacion.TipoContenido, Publicacion.Titulo, Publicacion.Descripcion, Publicacion.FechaPublicacion, Publicacion.Curso, Publicacion.IdContenedor, Virtual, Costo, FechaInicio, Sitio, Universidad.IdUniversidad, Universidad.Nombre
			from Usuario join (UsuarioXSeguidor join 
			(Publicacion left join (DetalleTutoria join Universidad on Universidad.IdUniversidad = DetalleTutoria.IdPublicacion) on Publicacion.IdPublicacion = DetalleTutoria.IdPublicacion) on UsuarioXSeguidor.IdSeguido = Publicacion.IdUsuario) on Usuario.IdUsuario = Publicacion.IdUsuario
			where UsuarioXSeguidor.IdUsuario = @IdUsuario
		end
	else
		begin
			return 101; -- Usurio no existe o no es tutor
		end
end try
begin catch
return 102 -- No se pudo realizar la consulta
end catch
end 
go

exec getFeed
@IdUsuario = 9

/* 
declare @result int
exec @result = getFeed
@IdUsuario = 9
select @result
*/

/* Obtener datos del Perfil */





/*obtener comentarios de un usuario*/
create procedure getComentarios
@idPublicacion int
as
begin
	if exists(select * from Publicacion where Publicacion.IdPublicacion=@idPublicacion )
	begin
		select IdComentario, Usuario.IdUsuario, DetalleComentario, ComentarioXPublicacion.Fecha, DetalleTutor.Foto from ComentarioXPublicacion join (Usuario join DetalleTutor on Usuario.IdUsuario = DetalleTutor.IdUsuario) 
		on ComentarioXPublicacion.IdUsuario = Usuario.IdUsuario
		where IdPublicacion = @idPublicacion
	end
	else
	begin
		return 101
	end
end
go

/* Obtiene las habilidades de un Usuario */
alter procedure getUserAbilities
@UserId int
as
begin
if exists(select * from DetalleTutor where IdUsuario = @UserId)
	begin
		select Habilidad.IdHabilidad, Nombre, IdCategoria, Estado from 
		(Habilidad join HabilidadXTutor on Habilidad.IdHabilidad = HabilidadXTutor.IdHabilidad) 
		where HabilidadXTutor.IdUsuario = @UserId
	end
else
	return 101;
end
go
/* 
declare @result int
exec @result = getUserAbilities
@UserId = 9
select @result
*/







select * from (Habilidad join HabilidadXTutor on Habilidad.IdHabilidad = HabilidadXTutor.IdHabilidad) 
		 join ApoyoXTutor on HabilidadXTutor.IdHabilidadXTutor = ApoyoXTutor.IdHabilidadXTutor
select * from Usuario
select * from ComentarioXPublicacion where IdPublicacion = 
select * from ComentarioXPublicacion

select IdHabilidadXTutor, cantidad = count(IdHabilidadXTutor) from ApoyoXTutor
where IdHabilidadXTutor = 5


select UsuarioXSeguidor.IdSeguido, Publicacion.IdPublicacion, Publicacion.TipoContenido, Publicacion.Titulo, Publicacion.Descripcion, Publicacion.FechaPublicacion, Publicacion.Curso, Publicacion.IdContenedor, Virtual, Costo, FechaInicio, Sitio, IdUniversidad
			from (UsuarioXSeguidor join 
			(Publicacion join DetalleTutoria on Publicacion.IdPublicacion = DetalleTutoria.IdPublicacion) on Publicacion.IdUsuario = UsuarioXSeguidor.IdUsuario)
			