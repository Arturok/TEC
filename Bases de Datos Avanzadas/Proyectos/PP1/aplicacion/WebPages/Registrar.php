<!doctype html>
<?php 
//include("Connection.php");

?>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="">

  <title>Registrarse</title>

  <!-- Bootstrap core CSS -->
  <link href="../WebPages/bootstrap/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../WebPages/css/form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">

  <div class="container">
    <div class="py-5 text-center">
      <h1 class="display-1">CourierTEC</h1>
      <p class="lead">Aca el usuario definira los datos que quiere que nuestra empresa tenga acerca de el, asegurese de
        que estos datos
        esten correctamente escritos y que sean los correctos.
      </p>
    </div>

    <div class="row">
        

      <div class="col-md-12">
        <div class="text-center">
          <h3 class="mb-3">Registrarse</h3>
        </div>
        <hr class="mb-4">
        <form class="needs-validation" method="GET" novalidate>
          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="Nombre">Nombre</label>
              <input type="text" class="form-control" name="Nombre" id="Nombre" placeholder="Juanito" value="" required>
              <div class="invalid-feedback">
                Por favor ingrese un Nombre.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="Apellido">Apellido</label>
              <input type="text" class="form-control" name="Apellido" id="Apellido" placeholder="Alvarez" value="" required>
              <div class="invalid-feedback">
                Por favor ingrese un Apellido.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="Telefono">Telefono</label>
              <input type="text" class="form-control" name="Telefono" id="Telefono" placeholder="88888888" value="" required>
              <div class="invalid-feedback">
                Por favor ingrese un Telefono.
              </div>
            </div>

          </div>

          <div class="row">
            <div class="col-md-4 mb-3">
              <label for="Identificacion">Identificacion</label>
              <input type="text" class="form-control" name="Identificacion" id="Identificacion" placeholder="123456789" required>
              <div class="invalid-feedback">
                Por favor ingrese una Identificacion.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="email">Correo</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="ejemplo@ejemplo.com" required>
              <div class="invalid-feedback">
                Por favor ingrese un Correo valido.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="Contraseña">Contraseña</label>
              <input type="password" class="form-control" name="Contraseña" id="password" placeholder="Contraseña" required>
              <div class="invalid-feedback">
                Por favor ingrese una Contraseña.
              </div>
            </div>

          </div>

          <div class="mb-3">
            <label for="Cuenta">Cuenta Bancaria</label>
            <input type="text" class="form-control" name="Cuenta" id="Cuenta" placeholder="72222333322221111" required>
            <div class="invalid-feedback">
              Por favor ingrese una Cuenta Bancaria.
            </div>
          </div>

          <div class="mb-3">
              <label for="Provincia">Provincia</label>
              <select class="custom-select d-block w-100" name="Provincia" id="Provincia" required>
                <option value="">Escoja...</option>
                <option>San Jose</option>
                <option>Alajuela</option>
                <option>Cartago</option>
                <option>Heredia</option>
                <option>Guanacaste</option>
                <option>Puntarenas</option>
                <option>Limon</option>
              </select>
              <div class="invalid-feedback">
                Por favor seleccione una Provincia.
              </div>
            </div>

          <hr class="mb-4">
          <button class="btn btn-primary btn-lg btn-block" name="Registrar"  type="submit">Registrarse</button>
        </form>
      </div>
    </div>

    <?php 
      if(isset($_GET['Registrar'])){
        $Nombre = $_GET['Nombre'];
        $Apellido = $_GET['Apellido'];
        $Identificacion = $_GET['Identificacion'];
        $Telefono = $_GET['Telefono'];
        $Contraseña = $_GET['Contraseña'];
        $email = $_GET['email'];
        $Provincia = $_GET['Provincia'];
        $Cuenta = $_GET['Cuenta'];


        if($Provincia == 'Cartago'){
          $IdSucursal = 2;
        }else if($Provincia == 'San Jose'){
          $IdSucursal = 3;
        }else{
          $IdSucursal = 1;
        }

        if($IdSucursal == 3){
          $serverName = "RONNY\PRUEBAS"; //serverName\instanceName
          $connectionInfo = array( "Database"=>"Cartago_courierTEC", "UID"=>"sa", "PWD"=>"zxcvbnm", "CharacterSet"=>"UTF-8");
          $conn = sqlsrv_connect( $serverName, $connectionInfo);
          
          if( $conn == false ){
              echo "Connection could not be established.<br/>";
              die( print_r( sqlsrv_errors(), true));
          }
        }else if($IdSucursal == 2){
          $serverName = "R2D2\MSSQLSERVER1"; //serverName\instanceName
          //$serverName = "EHV\PRUEBAS";
          $connectionInfo = array( "Database"=>"Central_courierTEC", "UID"=>"sa", "PWD"=>"zxcvbnm", "CharacterSet"=>"UTF-8");
          //$connectionInfo = array( "Database"=>"Central_courierTEC", "UID"=>"sa", "PWD"=>"HVjose28", "CharacterSet"=>"UTF-8");
          $conn = sqlsrv_connect( $serverName, $connectionInfo);
          
          if( $conn == false ){
              echo "Connection could not be established.<br/>";
              die( print_r( sqlsrv_errors(), true));
          }
        }else if($IdSucursal == 1){
          $serverName = "DESKTOP-FEHR364"; //serverName\instanceName
          $connectionInfo = array( "Database"=>"courierTEC", "UID"=>"sa", "PWD"=>"elpisuicas", "CharacterSet"=>"UTF-8");
          $conn = sqlsrv_connect( $serverName, $connectionInfo);
          
          if( $conn == false ){
              echo "Connection could not be established.<br/>";
              die( print_r( sqlsrv_errors(), true));
          }
        }

        
        $insert = "EXECUTE SP_INSERT_CLIENTE_SUCURSAL $Identificacion,$IdSucursal,'$Nombre','$Apellido',$Cuenta,$Telefono,'$Provincia','$email','$Contraseña'";


        $ejecutar = sqlsrv_query($conn, $insert);

        if($ejecutar){
          echo "<script>window.alert('SI se registro correctamente')</script>";
          echo '<script>window.location = "InicioSesion.php"</script>';
        }else{
          echo "<script>window.alert('NO se registro correctamente')</script>";
          echo '<script>window.location = "Registrar.php"</script>';
        }
      }
    ?>

    <footer class="my-5 pt-5 text-muted text-center text-small">
      <p class="mb-1">&copy; 2017-2018 CourierTEC</p>
      <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
      </ul>
    </footer>
  </div>


  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->



  <script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
      'use strict';

      window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');

        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();
  </script>
</body>

</html>