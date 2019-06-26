/**
 * @Author - Arturo Chinchilla
 * @Date 16/10/2016
 */

angular
    .module('app')
    .factory('WebConfig', WebConfig);

WebConfig.$inject = ['$http'];
function WebConfig($http) {
    var vm = this;
    vm.apiepatec  = "http://localhost:59401/api";
    vm.apiconstrutec = "http://localhost:50799/api";
    return vm;
}