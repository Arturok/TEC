/**
* @Author Arturo Chinchilla
* @Date 11/1/16
*/

angular
    .module('app')
    .controller('RequestController', RequestController);

RequestController.$inject = ['$location','ProjectService', 'EtapaService'];
function RequestController($location, ProjectService, EtapaService) {
    $location.path('/request');
    var vm = this;
    vm.AllProjects = [];
    vm.AllStages = [];

    vm.loadProjects = loadProjects;
    vm.loadStages = loadStages;
    vm.sendRequest = sendRequest;
    initController();

    //Initialize the Controller Variables
    function initController() {
        loadProjects();
    }

    //Loading All the Projects
    function loadProjects() {
        //ProjectService.GetAll()
        //    .then(function (projects) {
        //        //vm.AllProjects = projects;
        vm.AllProjects = [{"Nombre": "Casa Arturo"}, {"Nombre": "Cochera Arturo"}];
        //loadStages();
        //    })
    }

    //Loading All the Stages from a Project
    function loadStages() {
        //EtapaService.GetAll(vm.proyecto)
        //    .then(function (stages) {
        //        vm.AllStages = stages;
        vm.AllStages = [{"Nombre": "Techo"}, {"Nombre": "Paredes"}];
        //    })
    }

    function sendRequest() {

    }
}