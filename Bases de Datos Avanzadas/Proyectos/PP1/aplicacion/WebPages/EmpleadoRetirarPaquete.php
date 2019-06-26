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
                    <a class="nav-link" href="../WebPages/EmpleadoHome.php">
                      <span data-feather="home"></span>
                      Principal
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" href="../WebPages/EmpleadoRetirarPaquete.php">
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
                      Monto Promedio Paquetes por Periodo (Clientes)
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

        <!-- Opción para retirar un paquete de la tienda clase: retiro-->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4"  >
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom" hidden>
            <h1 class="h2">Retirar paquete</h1>
          </div>

          <div class="mb-3">
            <div class="card">
              <div class="card-header bg-primary text-white h4">
                Buscar paquete
              </div>
              <div class="card-body">
                <h5 class="card-title">Información del cliente</h5>
                <form class="needs-validation" novalidate>
                  <div class="container-fluid">
                      <div class="mb-3">
                        <label for="cedula">Cédula del cliente</label>
                        <input type="text" class="form-control" name="Cedula" id="Cedula" placeholder="x-xxxx-xxxx" value="" required>
                        <div class="invalid-feedback">
                          Debe especificar un numero de cédula
                        </div>
                      </div>
                  </div>
                  <button id="buscar-paqs" onclick="showListPaq" method="GET" name="Buscar" type="submit" class="btn btn-primary">Buscar paquetes del cliente</button>
                </form>
              </div>
            </div>
          </div>

          <h4>Lista de paquetes</h4>

          <table class="mt-4 table table-striped table-sm">
            <thead class="thead-dark">
              <tr>
                <th class="text-center w-25">Número de Paquete </th>
                <th class="text-center w-25">Descripción</th>
                <th class="text-center w-25">Recoger</th>
              </tr>
            </thead>
            <tbody>

              <?php 
                if(isset($_GET['Buscar'])){
                    $Cedula = $_GET['Cedula'];

                    $GetPaquetesCliente = "EXECUTE SP_DESCRIPCION_PAQUETES_PENDIENTES_CLIENTE $Cedula";

                    $ejecutar1 = sqlsrv_query($conn, $GetPaquetesCliente);

                    if($ejecutar1 == false){
                        die( print_r( sqlsrv_errors(), true) );
                    }else{

                        while($row = sqlsrv_fetch_array( $ejecutar1, SQLSRV_FETCH_ASSOC) ){
                            $IdPaquete = $row['IdPaquete'];
                            $Descripcion =  $row['Descripcion'];
                        
                    
              ?>

              <tr>
                <td class="text-center align-middle w-25" ><?php echo $IdPaquete; ?></td>
                <td class="text-center align-middle w-25"><?php echo $Descripcion; ?></td>
                <td class="text-center align-middle w-25"><a href="EmpleadoRetirarPaquete.php?Boton=<?php echo $IdPaquete; ?>">Retirar Paquete</a></td>
              </tr>

              <?php
                        }
                    }
                }
              ?>
              
            </tbody>
          </table>

        </main>
        <!-- fin de la opción de retirar un paquete -->
        <?php 
            if(isset($_GET['Boton'])){
                
                $IdPaquete = $_GET['Boton'];

                $Venta = "EXECUTE SP_VENTA '$IdPaquete'";

                $ejecutar2 = sqlsrv_query($conn, $Venta);

                if($ejecutar2 == false){
                    die( print_r( sqlsrv_errors(), true) );
                }else{
                    echo "<script> window.alert('Se retiro el paquete') </script>";
                    echo '<script> window.location = "EmpleadoRetirarPaquete.php"</script>';
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

        $("#buscar-paqs").click(function(){
          $("#lista-paq-cli").attr("hidden", false);
        });

      });
    </script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  </body>
</html>
