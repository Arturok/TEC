/**
 * Created by damar on 10/25/2016.
 */
(function () {
    'use strict';

    angular
        .module('app')
        .factory('MaterialService', MaterialService);

    MaterialService.$inject = ['$http', 'WebConfig'];
    function MaterialService($http, WebConfig) {
        var service = {};

        service.GetAll = GetAll;
        service.GetById = GetById;

        return service;

        function GetAll() {
            return $http.get(WebConfig.apiconstrutec + '/materiales').then(handleSuccess, handleError('Error obteniendo todos los materiales'));
        }

        function GetById(id) {
            return $http.get(WebConfig.apiconstrutec + '/material//get?id=' + id).then(handleSuccess, handleError('Error obteniendo Material por ID'));
        }

        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
    }

})();