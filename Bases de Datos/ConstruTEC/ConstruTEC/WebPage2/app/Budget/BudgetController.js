/**
 * @Author Arturo Chinchilla
 * @Date 11/1/16
 */

angular
    .module('app')
    .controller('BudgetController', BudgetController);

BudgetController.$inject = ['$location','ProjectService', 'EtapaService'];
function BudgetController($location, ProjectService, EtapaService) {
    $location.path('/budget');
    var vm = this;
    vm.AllProjects = [];
    vm.AllStages = [];

    vm.loadProjects = loadProjects;
    vm.loadStages = loadStages;
    vm.sendRequest = sendRequest;
    vm.currentProject = null;
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
        vm.AllProjects = [{"Nombre": "Casa Arturo", "Costo":5500000}, {"Nombre": "Cochera Arturo", "Costo":3500000}];
        //loadStages();
        //    })
    }

    //Loading All the Stages from a Project
    function loadStages() {
        //EtapaService.GetAll(vm.proyecto)
        //    .then(function (stages) {
        //        vm.AllStages = stages;

        vm.currentProject = vm.proyecto.Costo;
        vm.AllStages = [{"Nombre": "Techo", "Costo": 1750000}, {"Nombre": "Paredes", "Costo": 3750000}];
        //    })
    }

    function sendRequest() {

    }
}