/**
 * @Author Arturo Chinchilla
 * @Date 10/16/16
 */

angular
    .module('app')
    .controller('HomeController', HomeController);

HomeController.$inject = ['$location', 'FlashService', '$rootScope'];
function HomeController($location, FlashService, $rootScope) {
    $location.path('/home');
}