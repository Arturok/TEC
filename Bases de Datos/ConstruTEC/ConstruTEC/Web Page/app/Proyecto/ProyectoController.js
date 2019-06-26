/**
 * Created by damar on 10/24/2016.
 */
angular
    .module('app')
    .controller('ProyectoController', ProyectoController);

ProyectoController.$inject = ['$location', 'FlashService', 'ProjectService', '$rootScope'];
function ProyectoController($location, FlashService, ProjectService, $rootScope) {
    var vm = this;
    vm.allProyectos = [];
    vm.Proyecto = null;
    vm.GetById = GetById;
    initcontroller();
    $location.path('/proyecto');

    function initcontroller(){
        LoadAllProyectos();
    }
    function LoadAllProyectos() {
        ProjectService.GetAll()
            .then(function (projects) {
                vm.allProyectos = projects;
            })
    }

    function GetById() {
        ProjectService.GetById()
            .then(function (project) {
                vm.Proyecto = project;
            })
    }
}

