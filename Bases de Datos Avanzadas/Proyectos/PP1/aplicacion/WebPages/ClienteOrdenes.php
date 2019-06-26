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
  <link rel="icon" href="../../../../favicon.ico">

  <title>Ordenes</title>

  <!-- Bootstrap core CSS -->
  <link href="../WebPages/bootstrap/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../WebPages/css/dashboard.css" rel="stylesheet">
</head>

<body>
  <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">CourierTEC</a>

    <ul class="navbar-nav px-3">
      <li class="nav-item text-nowrap">
        <a class="nav-link" href="InicioSesion.php">Salir</a>
      </li>
    </ul>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link" href="ClienteHome.php">
                <span data-feather="home"></span>
                Home
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ClientePerfil.php">
                <span data-feather="users"></span>
                Perfil
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link active" href="ClienteOrdenes.php">
                <span data-feather="file"></span>
                Ordenes
              </a>
            </li>
          </ul>
        </div>
      </nav>

      <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">




        <h2>Ordenes</h2>
        <div class="table-responsive">
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th class="text-center">Numero de Paquete</th>
                <th class="text-center">Sucursal</th>
                <th class="text-center">Descripcion</th>
                <th class="text-center">Tipo</th>
                <th class="text-center">Categoria</th>
                <th class="text-center">Peso (kg)</th>
                
                <th class="text-center">Monto a Pagar</th>
                <th class="text-center">Fecha Recepcion</th>
                <th class="text-center">Fecha Recojo</th>
              </tr>
            </thead>

            <?php 
                $Cedula = $_COOKIE['Cedula'];
                
                $consulta = "EXECUTE SP_DESCRIPCION_FECHARETIRO_PAQUETES_CLIENTE $Cedula";

                $paquetes = sqlsrv_query($conn,$consulta);

                if($paquetes == false){
                    die( print_r( sqlsrv_errors(), true) );
                }else{

                    while( $row = sqlsrv_fetch_array( $paquetes, SQLSRV_FETCH_ASSOC) ) {
                        
                  
            ?>
            <tbody>
              <tr>
                <td class="text-center"><?php echo $row['IdPaquete']; ?></td>
                <td class="text-center"><?php  
                    if($row['IdSucursal'] == 1){
                        echo "Heredia";
                    }else if($row['IdSucursal'] == 2){
                        echo "Cartago";
                    }else{
                        echo "San Jose";
                    }
                ?></td>
                <td class="text-center"><?php echo $row['Descripcion']; ?></td>
                <td class="text-center"><?php 
                    if($row['IdTipoPaquete'] == 1){
                        echo "Electronica";
                    }else if($row['IdTipoPaquete'] == 2){
                        echo "Ropa";
                    }else if($row['IdTipoPaquete'] == 3){
                        echo "Juguetes";
                    }else if($row['IdTipoPaquete'] == 4){
                        echo "Hogar";
                    }else if($row['IdTipoPaquete'] == 5){
                        echo "Comida";
                    }else if($row['IdTipoPaquete'] == 6){
                        echo "Baterias";
                    }else if($row['IdTipoPaquete'] == 7){
                        echo "Quimicos";
                    }else{
                        echo "Herramientas";
                    }
                ?></td>
                <td class="text-center"><?php 
                    if($row['IdCategoriaPaquete'] == 1){
                        echo "Regular";
                    }else{
                        echo "Especial";
                    }
                ?></td>
                <td class="text-center"><?php echo $row['PesoPaquete']; ?></td>
                
                <td class="text-center"><?php echo $row['MontoPagar']; ?></td>
                <td class="text-center"><?php echo date_format($row['FechaRecepcion'],'j/n/o'); ?></td>
                <td class="text-center"><?php 
                    if($row['FechaRetiro'] == NULL){
                        echo "Pendiente";
                    }else{
                        echo date_format($row['FechaRetiro'],'j/n/o') ;
                    }
                ?></td>
              </tr>
              <?php
                    }
                }
              ?>
              
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>

  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->


  <!-- Icons -->
  <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  <!-- Graphs -->

</body>

</html>