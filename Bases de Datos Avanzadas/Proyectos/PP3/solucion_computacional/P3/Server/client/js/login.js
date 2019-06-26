var mA = angular.module('Login', ['lbServices']);

mA.controller('LoginController', function ($scope, $http, Client) {
    
    window.localStorage.clear();

    $scope.ingresar = function (email, password) {
        
        
        const urlclient = 'http://localhost:3000/api/clients?filter={"where":{"email":"'+email+'"}}';
        const urlemployee = 'http://localhost:3000/api/employees?filter={"where":{"email":"'+email+'"}}';
        
        console.log($scope.Tipo);


        if($scope.Tipo == "Client"){
            $http.get(urlclient)
            .then(function (res) {
                $scope.cliente = res.data;

                pass = $scope.cliente[0].password;

                if(pass == password){
                    if(window.confirm("Los datos son correctos")){
                        window.localStorage.setItem("name",$scope.cliente[0].name);
                        window.localStorage.setItem("birthdate",$scope.cliente[0].birthdate);
                        window.localStorage.setItem("email",$scope.cliente[0].email);
                        window.localStorage.setItem("idNumber",$scope.cliente[0].idNumber);
                        window.localStorage.setItem("password",$scope.cliente[0].password);
                        window.localStorage.setItem("phone",$scope.cliente[0].phone);
                        window.localStorage.setItem("lastname",$scope.cliente[0].lastname);
                        window.localStorage.setItem("id",$scope.cliente[0].id);
    
    

                        window.location = 'http://localhost:3000/history.html';

                    }
                }else{
                    window.alert("Los datos del usuario no coinciden");
                }

            });
        }else if($scope.Tipo == "Employee"){
            $http.get(urlemployee)
            .then(function (res) {
                $scope.empleado = res.data;
                
                pass = $scope.empleado[0].password;

                if(pass == password){
                    if(window.confirm("Los datos son correctos")){
                        window.localStorage.setItem("name",$scope.empleado[0].name);
                        window.localStorage.setItem("email",$scope.empleado[0].email);
                        window.localStorage.setItem("password",$scope.empleado[0].password);
                        window.localStorage.setItem("lastname",$scope.empleado[0].lastname);
                        window.localStorage.setItem("id",$scope.empleado[0].id);
    
    
                        window.location = 'http://localhost:3000/siteRegister.html';
                    }
                }else{
                    window.alert("Los datos del usuario no coinciden");
                }

            });
        }else{
            window.alert("No se escogio un tipo");
        }

       
        
        
        
    }
    
});