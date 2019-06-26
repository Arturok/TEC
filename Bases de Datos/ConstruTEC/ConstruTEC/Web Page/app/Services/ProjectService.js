/**
 * @Author - Arturo Chinchilla
 * @Date - 25/10/2016
 */


angular
    .module('app')
    .factory('ProjectService', ProjectService);

ProjectService.$inject = ['$http', 'WebConfig'];
function ProjectService($http, WebConfig) {
    var service = {};

    service.GetAll = GetAll;
    service.GetById = GetById;
    service.CreateProject = CreateProject;
    service.UpdateProject = UpdateProject;
    service.DeleteProject = DeleteProject;
    return service;

    //Getting all the projects
    function GetAll() {
        return $http.get(WebConfig.apiconstrutec + '/proyecto/getAll').then(handleSuccess, handleError('Error obteniendo todos los Proyectos'));
    }

    //Getting project by ID
    function GetById(id) {
        return $http.get(WebConfig.apiconstrutec + '/proyecto/get?id='+id).then(handleSuccess, handleError('Error obteniendo Proyecto por ID'));
    }

    //Create a project
    function CreateProject(content) {
        return $http.post(WebConfig.apiconstrutec + '/proyecto/add/').data(content).then(handleSuccess, handleError('Error creando Proyecto'));
    }

    //Updating project
    function UpdateProject(content) {
        return $http.post(WebConfig.apiconstrutec + '/proyecto/update/').data(content).then(handleSuccess, handleError('Error actualizando Proyecto'));
    }

    //Deleting product
    function DeleteProject(id) {
        return $http.delete(WebConfig.apiconstrutec + '/proyecto/del?ID='+id).then(handleSuccess, handleError('Error eliminando Proyecto'));
    }

    // Success handler
    function handleSuccess(res) {
        return res.data;
    }

    //Error handler
    function handleError(error) {
        return function () {
            return { success: false, message: error };
        };
    }
}