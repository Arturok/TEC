/**
 * @Author Arturo Chinchilla
 * @Date 11/1/16
 */

angular
    .module('app')
    .controller('AssignMaterialsController', AssignMaterialsController);

AssignMaterialsController.$inject = ['$location','ProjectService', 'EtapaService', 'MaterialService'];
function AssignMaterialsController($location, ProjectService, EtapaService, MaterialService) {
    $location.path('/materials');
    var vm = this;
    vm.AllProjects = [];
    vm.AllStages = [];


    vm.loadProjects = loadProjects;
    vm.loadStages = loadStages;
    vm.loadMaterials = loadMaterials;
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

    //Loading All the Materials
    function loadMaterials() {
    //    MaterialService.GetAll()
    //        .then(function (materials) {
    //            vm.AllMaterials = materials;
        vm.AllMaterials = [{"Nombre": "Cemento", "Precio": "7000"},
                            {"Nombre": "Zinc", "Precio": "10000"},
                            {"Nombre": "Perlin", "Precio": "4000"},
                            {"Nombre": "Arena", "Precio": "3000"}];
    }
}