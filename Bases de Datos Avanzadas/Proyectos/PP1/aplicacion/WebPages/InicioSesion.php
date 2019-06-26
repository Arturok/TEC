<!doctype html>
<?php 
include('Connection.php');
//include('ConnectionPrueba.php');

?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <title>Inicio de Sesion</title>

    <!-- Bootstrap core CSS -->
    <link href="../WebPages/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../WebPages/css/floating-labels.css" rel="stylesheet">
  </head>

  <body>
    <?php
        setcookie("Nombre","",time()-3600);
        setcookie("Apellido","",time()-3600);
        setcookie("Cedula","",time()-3600);
        setcookie("IdSucursal","",time()-3600);
        setcookie("Correo","",time()-3600);
        setcookie("Telefono","",time()-3600);
        setcookie("IdTipoCliente","",time()-3600);
        setcookie("Provincia","",time()-3600);
        setcookie("Cuenta","",time()-3600);
    ?>
    <div class="container">
      <div class="text-center">
        <h1 class="display-1 py-5">CourierTEC</h1>
      </div>

      <form class="form-signin" method="POST" action=" " onSubmit="window.location.reload()">

        <div class="text-center mb-4">
          <h1 class="h3 mb-5 font-weight-normal">Iniciar Sesión</h1>
        </div>

        <div class="form-label-group">
          <input type="email" id="inputEmail"name="Correo"  class="form-control" placeholder="Correo electrónico" required autofocus>
          <label for="inputEmail">Correo Electronico</label>
        </div>

        <div class="form-label-group">
          <input type="password" id="inputPassword" name="Password" class="form-control" placeholder="Contraseña" required>
          <label for="inputPassword">Contraseña</label>
        </div>

        <div class="form-label-group">
        <div class="mb-3">
              <label for="Rol"></label>
              <select class="custom-select d-block w-100" name="Rol" id="Rol" required>
                <option>Cliente</option>
                <option>Empleado</option>
                <option>Administrador</option>
              </select>
              <div class="invalid-feedback">
                Por favor seleccione una Provincia.
              </div>
            </div>
        </div>

        
          

        <button class="btn btn-lg btn-primary btn-block mt-5" name="InicioSesion" type="submit">Iniciar Sesión</button>

        <div class="text-center mt-5">
          <a href="Registrar.php" class="font-weight-normal">Registrar</a>
          
        </div>

      </form>

    </div>

    <?php 
        if(isset($_POST['InicioSesion'])){
          $Password = $_POST['Password'];
          $Correo = $_POST['Correo'];
          $Rol = $_POST['Rol'];
            
            if($Rol == "Cliente"){
              $Rol = 3;
            }else if($Rol == "Empleado"){
              $Rol = 2;
            }else if($Rol == "Administrador"){
              $Rol = 1;
            }
            
            
            if($Rol == 3){
              $GetUsuarios = "EXECUTE SP_LOGINCLIENTE '$Correo','$Password'";

              $ejecutar = sqlsrv_query($conn, $GetUsuarios);

              if( $ejecutar == false) {
                die( print_r( sqlsrv_errors(), true) );
              }else{
                $row = sqlsrv_fetch_array( $ejecutar, SQLSRV_FETCH_ASSOC);
                
                
                setcookie("Nombre",$row['NombreCliente'],time()+3600);
                setcookie("Apellido",$row['ApellidosCliente'],time()+3600);
                setcookie("Cedula",$row['CedulaCliente'],time()+3600);
                setcookie("IdSucursal",$row['IdSucursalCliente'],time()+3600);
                setcookie("Correo",$row['CorreoCliente'],time()+3600);
                setcookie("Telefono",$row['TelefonoCliente'],time()+3600);
                setcookie("IdTipoCliente",$row['IdTipoCliente'],time()+3600);
                setcookie("Provincia",$row['ProvinciaCliente'],time()+3600);
                setcookie("Cuenta",$row['NumeroCuentaCliente'],time()+3600);
                    
                echo "<script>window.location = 'ClienteHome.php'</script>";
               
              }
            }else{
              $GetUsuarios = "EXECUTE SP_LOGINEMPLEADO '$Correo','$Password'";

              $ejecutar = sqlsrv_query($conn, $GetUsuarios);

              if( $ejecutar == false) {
                die( print_r( sqlsrv_errors(), true) );
              }else{
                $row = sqlsrv_fetch_array( $ejecutar, SQLSRV_FETCH_ASSOC);


                setcookie("Nombre",$row['NombreEmpleado'],time()+3600);
                setcookie("Apellido",$row['ApellidosEmpleado'],time()+3600);
                setcookie("Cedula",$row['CedulaEmpleado'],time()+3600);
                setcookie("IdSucursal",$row['IdSucursalEmpleado'],time()+3600);
                setcookie("Correo",$row['CorreoEmpleado'],time()+3600);
                setcookie("Telefono",$row['TelefonoEmpleado'],time()+3600);

                echo "<script>window.location = 'EmpleadoHome.php'</script>";

                
              }

              
          }   
        }
    ?>

    


  </body>
</html>
