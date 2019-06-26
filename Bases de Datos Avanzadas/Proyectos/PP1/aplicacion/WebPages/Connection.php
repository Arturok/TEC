<?php
        
        
        $serverName = "DESKTOP-FEHR364"; //serverName\instanceName
        $connectionInfo = array( "Database"=>"courierTEC", "UID"=>"sa", "PWD"=>"elpisuicas", "CharacterSet"=>"UTF-8");
        $conn = sqlsrv_connect( $serverName, $connectionInfo);
        
        if( $conn == false ) {
             echo "Connection could not be established.<br/>";
             die( print_r( sqlsrv_errors(), true));
        }

        /*$serverName = "EHV\PRUEBAS"; //serverName\instanceName
        $connectionInfo = array( "Database"=>"Central_courierTEC", "UID"=>"sa", "PWD"=>"HVjose28", "CharacterSet"=>"UTF-8");
        $conn = sqlsrv_connect( $serverName, $connectionInfo);
        
        if( $conn == false ) {
             echo "Connection could not be established.<br/>";
             die( print_r( sqlsrv_errors(), true));
        }*/

        /*$serverName = "R2D2\MSSQLSERVER1"; //serverName\instanceName
        $connectionInfo = array( "Database"=>"Central_courierTEC", "UID"=>"sa", "PWD"=>"zxcvbnm", "CharacterSet"=>"UTF-8");
        $conn = sqlsrv_connect( $serverName, $connectionInfo);
        
        if( $conn == false ) {
             echo "Connection could not be established.<br/>";
             die( print_r( sqlsrv_errors(), true));
        }*/
        /*
        $tsql = "SELECT * FROM apellidos";
        $stmt = sqlsrv_query($conn , $tsql);
        
        
        if( $stmt === false) {
            die( print_r( sqlsrv_errors(), true) );
        }
        
        while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
              echo $row['id'].", ".$row['apellidos']."<br />";
        }
        
        sqlsrv_free_stmt( $stmt);  
        sqlsrv_close( $conn);*/
        
        ?>