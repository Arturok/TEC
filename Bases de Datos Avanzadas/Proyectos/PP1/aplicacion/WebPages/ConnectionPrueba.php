<?php
    $serverName = "EHV\PRUEBAS"; //serverName\instanceName
    $connectionInfo = array( "Database"=>"Central_courierTEC", "UID"=>"sa", "PWD"=>"HVjose28", "CharacterSet"=>"UTF-8");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    
    if( $conn == false ) {
         echo "Connection could not be established.<br/>";
         die( print_r( sqlsrv_errors(), true));
    }
?>