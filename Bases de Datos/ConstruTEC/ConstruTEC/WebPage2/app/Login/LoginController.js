/**
 * @Author - Arturo Chinchilla
 * @Date - 20/29/2016
 */


angular
    .module('app')
    .controller('LoginController', LoginController);

LoginController.$inject = ['$location', 'AuthService', 'FlashService', '$http'];
function LoginController($location, AuthService, FlashService, $http) {
    var vm = this;

    vm.login = login;



    (function initController() {
        // reset login status
        AuthService.ClearCredentials();
    })();


    function login() {
        vm.dataLoading = true;
        alert("Comienza");
        $http.post('http://localhost:50799/api/Usuario/Login', {Nombre: vm.username, Contrasena: vm.password})
            .success(function (response) {
                alert("Success");

                AuthService.SetCredentials(vm.username, vm.password);
                $location.path('/home')
            })
            .error(function (response) {
                alert("Error");
                FlashService.Error("Verifique sus datos");
                vm.dataLoading = false;
            });

    }


    function login2() {
        vm.dataLoading = true;
        var vart = JSON.stringify({"Nombre":vm.username , "Contrasena":vm.password, "confirmarContrasena":vm.password});
        $.ajax({
            type: 'post',
            url: 'http://localhost:50799/api/Usuario/loginUser',
            data: vart,
            contentType: 'application/json',
            dataType: 'json'
        })
            .done(function (response) {
                AuthService.SetCredentials(vm.username, vm.password);
                alert("Done");
                $location.path('/home');
            })
            .fail(function (response) {
                    alert("Error");
                FlashService.Error("Verifique sus datos por favor");
                vm.dataLoading = false;
            })
    }


    function login1() {
        vm.dataLoading = true;
        AuthService.Login(vm.username, vm.password, function (response) {
            alert("Pasé");
            alert("Status: " + response.status);
            if (response.success) {
                alert("Entre en el 200");
                AuthService.SetCredentials(vm.username, vm.password);
                $location.path('/home');
            } else {
                alert("No entre en el 200");
                FlashService.Error("Verifique sus datos por favor");
                vm.dataLoading = false;
            }
        });
    }
}