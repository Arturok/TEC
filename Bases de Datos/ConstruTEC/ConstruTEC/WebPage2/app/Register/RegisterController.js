/**
 * Created by mchin on 16/10/2016.
 */
angular
    .module('app')
    .controller('RegisterController', RegisterController);

RegisterController.$inject = ['UserService', '$location', '$rootScope', 'FlashService'];
function RegisterController(UserService, $location, $rootScope, FlashService) {
    var vm = this;

    vm.register = register;

    //Function for register users
    function register() {
        vm.dataLoading = true;
        UserService.Create(vm.user)
            .then(function (response) {
                if (!response.failed) { //case success registration
                    FlashService.Success('Registration successful', true);
                    $location.path('/login');
                } else { //case error in registration
                    FlashService.Error(response.message);
                    vm.dataLoading = false;
                }
            });
    }
}