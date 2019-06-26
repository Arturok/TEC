/*
*@Author - Arturo Chinchilla
* @Date - 10/16/2016
 */

angular
    .module('app')
    .controller('LoginController', LoginController);

LoginController.$inject = ['$location', 'AuthService', 'FlashService'];
function LoginController($location, AuthService, FlashService) {
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
                alert("Set Credentials pass");
                $location.path('/client');
                alert("location path pass");
            })
            .error(function (response) {
                alert("Error");
                FlashService.Error("Verifique sus datos");
                vm.dataLoading = false;
            });

    }

    function login2() {
        vm.dataLoading = true;
        AuthService.Login(vm.username, vm.password, function (response) {
            alert(response.status);
            if (response.status==-1) {
                AuthService.SetCredentials(vm.username, vm.password);
                $location.path('/client');
            } else {
                FlashService.Error(response.data.message);
                vm.dataLoading = false;
            }
        });
    }
}