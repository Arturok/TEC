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
                    <a class="nav-link active" href="../WebPages/EmpleadoPaquetesMes.php">
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

        <!-- Lista de paquetes por usuario por rango de fechas -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Paquetes por Perdiodo</h1>
          </div>

          <h4 class="h4"> Seleccionar Rango de Fechas de Consulta </h4>

          <form >
            <div class="row mb-3">
              <div class="col-md-4">
                <label  for="datepicker4">Fecha Inicio</label>
                <input name="FI"  id="datepicker4" width="100%" required/>
                <script>
                    $('#datepicker4').datepicker({
                        uiLibrary: 'bootstrap4'
                    });
                </script>
                <div class="invalid-feedback principal">
                  Debe especificar una fecha
                </div>
              </div>

              <div class="col-md-4 offset-4 mb-3">
                <label  for="datepicker5">Fecha Final</label>
                <input  name="FF"  id="datepicker5" width="100%" required/>

                <script>
                    $('#datepicker5').datepicker({
                        uiLibrary: 'bootstrap4'
                    });
                </script>
                <div class="invalid-feedback principal">
                  Debe especificar una fecha
                </div>
              </div>
              <button id="btn-paq-mes" method="GET"  name="FechaConsultar" class="btn btn-primary btn-lg btn-block principal mb-3">Consultar</button>
            </div>
          </form>
          <table id="table-paq" class="mt-4 table table-striped table-sm" >
            <thead class="thead-dark">
              <tr>
                <th class="text-center w-25">Cédula</th>
                <th class="text-center w-25">Nombre</th>
                <th class="text-center w-25">Apellidos</th>
                <th class="text-center w-25">Cantidad</th>
              </tr>
            </thead>
            <?php 
            if(isset($_GET['FechaConsultar'])){
                $FI = strtotime( $_GET['FI']);
                $FF = strtotime($_GET['FF']);
                
                $FInicial = date('Y-m-d',$FI);
                $FFinal = date('Y-m-d',$FF);
                

                /*echo $FInicial;
                echo $FFinal;*/

                $GetCantidadPaq = "EXECUTE SP_CANTIDAD_PAQUETES_PERIODO '$FInicial','$FFinal'";

                $ejecutar = sqlsrv_query($conn,$GetCantidadPaq);

                if($ejecutar == false){
                    die( print_r( sqlsrv_errors(), true) );
                }else{
                    while($row = sqlsrv_fetch_array( $ejecutar, SQLSRV_FETCH_ASSOC) ){
                        $Nombre = $row['NombreCliente'];
                        $Apellido = $row['ApellidosCliente'];
                        $Cedula = $row['CedulaCliente'];
                        $Cantidad = $row['Cantidad'];
                    

                

            
          ?>
            <tbody>
              <tr>
                <td class="text-center align-middle w-25"><?php echo $Cedula ?></td>
                <td class="text-center align-middle w-25" ><?php echo $Nombre ?></td>
                <td class="text-center align-middle w-25"><?php echo $Apellido ?></td>
                <td class="text-center align-middle w-25"><?php echo $Cantidad ?></td>
              </tr>
            </tbody>
          
          <?php
                    }
                }
            }
          ?>

          </table>

        </main>
        <!-- Fin de lista de paquetes por usuario por rango de fechas -->

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

        $("#btn-paq-mes").click(function(){
          $("#table-paq").attr("hidden", false);
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
