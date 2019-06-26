/**
 * @Author - Arturo Chinchilla
 * @Date - 26/10/2016
 */


angular
    .module('app')
    .factory('UserService', UserService);

UserService.$inject = ['$http', 'WebConfig'];
function UserService($http, WebConfig) {
    var service = {};

    service.GetAll = GetAll;
    service.GetById = GetById;
    service.Create = Create;
    service.Update = Update;
    service.Delete = Delete;
    return service;

    //Getting all the users
    function GetAll() {
        return $http.get(WebConfig.apiconstrutec + '/user/getAllUsers').then(handleSuccess, handleError('Error obteniendo todos los Usuarios'));
    }

    //Getting user by ID
    function GetById(id) {
        return $http.get(WebConfig.apiconstrutec + '/api/user/get?id=' + id).then(handleSuccess, handleError('Error obteniendo Usuario por ID'));
    }

    // Create user
    function Create() {

    }

    function Update() {

    }

    function Delete() {

    }

    // Success handler
    function handleSuccess(res) {
        return res.data;
    }

    //Error handler
    function handleError(error) {
        return function () {
            return {success: false, message: error};
        };
    }
}