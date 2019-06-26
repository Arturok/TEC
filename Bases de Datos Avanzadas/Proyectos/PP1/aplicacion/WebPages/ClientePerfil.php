<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Perfil</title>

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
                            <a class="nav-link active" href="ClientePerfil.php">
                                <span data-feather="users"></span>
                                Perfil
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ClienteOrdenes.php">
                                <span data-feather="file"></span>
                                Ordenes
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-1 px-4">

                <div class="table-responsive">
                    <div class="my-3 p-3 bg-white rounded box-shadow">
                        <h2 class="border-bottom border-gray pb-2 mb-0">Datos del Usuario</h2>
                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Nombre Completo</strong>
                                <?php echo $_COOKIE['Nombre']." ".$_COOKIE['Apellido'];?>
                            </p>
                        </div>

                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Identificacion</strong>
                                <?php echo $_COOKIE['Cedula'];?>
                            </p>
                        </div>
                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Correo</strong>
                                <?php echo $_COOKIE['Correo'];?>
                            </p>
                        </div>
                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Telefono</strong>
                                <?php echo $_COOKIE['Telefono'];?>
                            </p>
                        </div>
                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Tipo de Cliente</strong>
                                <?php 
                                
                                if($_COOKIE['IdTipoCliente'] == 1){
                                    echo "Bronce";
                                }else if($_COOKIE['IdTipoCliente'] == 2){
                                    echo "Platino";
                                }else{
                                    echo "Oro";
                                }
                                ?>
                            </p>
                        </div>
                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Cuenta Bancaria</strong>
                                <?php echo $_COOKIE['Cuenta']?>
                            </p>
                        </div>
                        <div class="media text-muted pt-3">
                            <img data-src="holder.js/32x32?theme=thumb&bg=6f42c1&fg=6f42c1&size=1" alt="" class="mr-2 rounded">
                            <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">Provincia</strong>
                                <?php echo $_COOKIE['Provincia'];?>
                            </p>
                        </div>
                    </div>
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