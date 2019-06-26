<?php 
    if($_COOKIE['IdSucursal'] == 3){
        $serverName = "RONNY\PRUEBAS"; //serverName\instanceName
        $connectionInfo = array( "Database"=>"Cartago_courierTEC", "UID"=>"sa", "PWD"=>"zxcvbnm", "CharacterSet"=>"UTF-8");
        $conn = sqlsrv_connect( $serverName, $connectionInfo);
        
        if( $conn == false ){
            echo "Connection could not be established.<br/>";
            die( print_r( sqlsrv_errors(), true));
        }
      }else if($_COOKIE['IdSucursal'] == 2){
        $serverName = "R2D2\MSSQLSERVER1"; //serverName\instanceName
        $connectionInfo = array( "Database"=>"Central_courierTEC", "UID"=>"sa", "PWD"=>"zxcvbnm", "CharacterSet"=>"UTF-8");
        $conn = sqlsrv_connect( $serverName, $connectionInfo);
        
        if( $conn == false ){
            echo "Connection could not be established.<br/>";
            die( print_r( sqlsrv_errors(), true));
        }
      }else if($_COOKIE['IdSucursal'] == 1){
        $serverName = "DESKTOP-FEHR364"; //serverName\instanceName
        $connectionInfo = array( "Database"=>"courierTEC", "UID"=>"sa", "PWD"=>"elpisuicas", "CharacterSet"=>"UTF-8");
        $conn = sqlsrv_connect( $serverName, $connectionInfo);
        
        if( $conn == false ){
            echo "Connection could not be established.<br/>";
            die( print_r( sqlsrv_errors(), true));
        }
      }


?>