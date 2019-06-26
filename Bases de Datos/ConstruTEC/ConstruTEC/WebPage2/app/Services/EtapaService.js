/**
 * @Author - Arturo Chinchilla
 * @Date - 25/10/2016
 */


angular
    .module('app')
    .factory('EtapaService', EtapaService);

EtapaService.$inject = ['$http','WebConfig'];
function EtapaService($http, WebConfig) {
    var service = {};

    service.GetAll = GetAll;
    service.GetById = GetById;
    service.CreateEtapa = CreateEtapa;
    service.UpdateEtapa = UpdateEtapa;
    service.DeleteEtapa = DeleteEtapa;
    return service;

    //Getting all the stages
    function GetAll(project) {
        return $http.get(WebConfig.apiconstrutec + '/Etapa/Get').data(project).then(handleSuccess, handleError('Error obteniendo todas las Etapas'));
    }

    //Getting stage by ID
    function GetById(id) {
        return $http.get(WebConfig.apiconstrutec + '/etapa/get?id=' + id).then(handleSuccess, handleError('Error obteniendo Etapa por ID'));
    }

    //Create a stage
    function CreateEtapa(content) {
        return $http.post(WebConfig.apiconstrutec + '/etapa/add/').data(content).then(handleSuccess, handleError('Error creando Etapa'));
    }

    //Updating stage
    function UpdateEtapa(content) {
        return $http.post(WebConfig.apiconstrutec +'/etapa/update/').data(content).then(handleSuccess, handleError('Error actualizando Etapa'));
    }

    //Deleting stage
    function DeleteEtapa(id) {
        return $http.delete(WebConfig.apiconstrutec + '/etapa/del?ID=' + id).then(handleSuccess, handleError('Error eliminando Etapa'));
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