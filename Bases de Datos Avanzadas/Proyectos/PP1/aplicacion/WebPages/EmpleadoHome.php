<!doctype html>
<?php
    include('ConnectionSucursal.php');
    //include('ConnectionPrueba.php');

?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Empleado</title>

    <!-- Bootstrap core CSS -->
    <link href="../WebPages/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../Webpages/css/dashboard.css" rel="stylesheet">

    <!-- date picker -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />

  </head>

  <body>

    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Nombre de Empleado</a>
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="../WebPages/InicioSesion.php">Cerrar sesión</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <ul class="nav flex-column">
                  <li class="nav-item">
                    <a class="nav-link active" href="../WebPages/EmpleadoHome.php">
                      <span data-feather="home"></span>
                      Principal
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../WebPages/EmpleadoRetirarPaquete.php">
                      <span data-feather="shopping-bag"></span>
                      Retirar Paquete
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link " href="../WebPages/EmpleadoDineroRecaudado.php">
                      <span data-feather="dollar-sign"></span>
                      Dinero Recaudado
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../WebPages/EmpleadoPaquetesMes.php">
                      <span data-feather="calendar"></span>
                      Cantidad Paquetes por Periodo (Clientes)
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../WebPages/EmpleadoMontoPromedio.php">
                      <span data-feather="trending-up"></span>
                      Monto Promedio de Paquetes
                    </a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="../WebPages/EmpleadoMontoSucursal.php">
                      <span data-feather="dollar-sign"></span>
                      Monto por Sucursal
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../WebPages/EmpleadoMontoSucursalPaquete.php">
                      <span data-feather="dollar-sign"></span>
                      Monto Sucursal por Paquete
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="../WebPages/EmpleadoMejoresClientes.php">
                      <span data-feather="users"></span>
                      Mejores Clientes
                    </a>
                  </li>
                </ul>
          </div>
        </nav>

        <!-- Opción de agregar paquetes clase: principal-->
        <main id="main-principal" role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4 principal">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom ">
            <h1 class="h1">Principal</h1>
          </div>

          <h2>Agregar un paquete</h2>
          <form class="needs-validation" method="POST" novalidate>
            <div class="row principal">

              <!--<div class="col-md-4 mb-3 ">
                <label  for="sucursal">Sucursal</label>
                <select class="custom-select d-block w-100" id="sucursal" name="Sucursal" required>
                  <option value="">Escoja una sucursal...</option>
                  <option>Heredia</option>
                  <option>Cartago</option>
                  <option>San José</option>
                </select>
                <div class="invalid-feedback">
                  Seleccione una sucursal
                </div>
              </div>-->

              <div class="col-md-12 mb-3">
                <label for="cedula">Cédula del cliente</label>
                <input type="text" class="form-control" name="Cedula" id="Cedula" placeholder="x-xxxx-xxxx" value="" required>
                <div class="invalid-feedback">
                  Un numero de cédula válido
                </div>
              </div>
              <!--<div class="col-md-4 mb-3">
                <label for="email">Email </label>
                <input type="email" class="form-control" id="Email" name="email" placeholder="you@example.com" value="" required>
                <div class="invalid-feedback">
                  Un correo válido
                </div>
              </div>-->
            </div>

            <div class="mb-3">
              <div class="form-group">
                <label for="descripcion">Descripción del paquete</label>
                <textarea class="form-control" id="descripcion" name="Descripcion" rows="3" required></textarea>
              </div>
            </div>

            <div class="row principal">
              <div class="col-md-4 mb-3">
                <label for="pesoPaq">Peso del paquete</label>
                <input type="number" class="form-control" name="Peso" id="pesoPaq" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Debe especificar el peso
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="valorPaq">Valor del paquete</label>
                <input type="number" class="form-control" name="ValorPaquete" id="valorPaq" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Debe especificar el valor del paquete
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="montoPaq">Monto a pagar </label>
                <input type="number" class="form-control" name="MontoPaquete" id="montoPaq" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Debe especificar un monto a pagar
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="tipoPaq">Tipo de paquete</label>
                <select class="custom-select d-block w-100" name="TipoPaquete" id="tipoPaq" required>
                  <option value="">Escoja un Tipo...</option>
                  <option>Electronica</option>
                  <option>Ropa</option>
                  <option>Juguetes</option>
                  <option>Hogar</option>
                  <option>Comida</option>
                  <option>Baterias</option>
                  <option>Quimicos</option>
                  <option>Herramientas</option>
                  
                </select>
                <div class="invalid-feedback">
                  Seleccione un tipo de paquete
                </div>
              </div>

              <div class="col-md-6 mb-3">
                <label for="catPaq">Categoría del paquete</label>
                <select class="custom-select d-block w-100" name="CategoriaPaquete" id="catPaq" required>
                  <option value="">Escoja una Categoría...</option>
                  <option>Regular</option>
                  <option>Especial</option>
                </select>
                <div class="invalid-feedback">
                  Seleccione una categoría de paquete
                </div>
              </div>

              
            </div>

            <hr class="mb-4">

            <button id="btn-agregarPaq" class="btn btn-primary btn-lg btn-block mb-5" name="AgregarPaquete" type="submit">Agregar paquete</button>
          </form>
        </main>
        <!-- fin de la parte principal -->
        <?php
            if(isset($_POST['AgregarPaquete'])){

                if($_POST['Sucursal'] == "Heredia"){
                    $IdSucursal = 1;
                }else if($_POST['Sucursal'] == "Cartago"){
                    $IdSucursal = 2;
                }else if($_POST['Sucursal']== "San Jose"){
                    $IdSucursal = 3;
                }

                if($_POST['TipoPaquete'] == "Electronica"){
                    $IdTipoPaquete = 1;
                }else if($_POST['TipoPaquete'] == "Ropa"){
                    $IdTipoPaquete = 2;
                }else if($_POST['TipoPaquete'] == "Juguetes"){
                    $IdTipoPaquete = 3;
                }else if($_POST['TipoPaquete'] == "Hogar"){
                    $IdTipoPaquete = 4;
                }else if($_POST['TipoPaquete'] == "Comida"){
                    $IdTipoPaquete = 5;
                }else if($_POST['TipoPaquete'] == "Baterias"){
                    $IdTipoPaquete = 6;
                }else if($_POST['TipoPaquete'] == "Quimicos"){
                    $IdTipoPaquete = 7;
                }else if($_POST['TipoPaquete'] == "Herramientas"){
                    $IdTipoPaquete = 8;
                }

                if($_POST['CategoriaPaquete']== "Regular"){
                    $CategoriaPaquete = 1;
                }else if($_POST['CategoriaPaquete']== "Especial"){
                    $CategoriaPaquete = 2;
                }

                
                $MontoPaquete = $_POST['MontoPaquete'];
                $ValorPaquete = $_POST['ValorPaquete'];
                $Peso = $_POST['Peso'];
                $Descripcion = $_POST['Descripcion'];
                $email = $_POST['email'];
                $Identificacion = $_POST['Cedula'];
                $Cedula = intval($Identificacion);

                
                
                $CrearPaquete = "EXECUTE SP_CREAR_PAQUETE $Cedula,$CategoriaPaquete,$IdTipoPaquete,'$Descripcion',$Peso,$ValorPaquete,$MontoPaquete";
                
                $ejecutar = sqlsrv_query($conn, $CrearPaquete);

                if($ejecutar == false){
                    die( print_r( sqlsrv_errors(), true) );
                }else{
                    echo "<script>window.alert('SI se registro correctamente')</script>";
                    echo '<script>window.location = "EmpleadoHome.php"</script>';
                }
                


            }
        ?>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script>window.jQuery || document.write('<script src="../Webpages/scripts/jquery-slim.min.js"><\/script>')</script>
    <script src="../WebPages/scripts/popper.min.js"></script>
    <script src="../Webpages/scripts/bootstrap.min.js"></script>

    <!-- scripts para forms -->
    <script src="../Webpages/scripts/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
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

    <script>
      $(document).ready(function(){

      });
    </script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  </body>
</html>
