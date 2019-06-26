/**
 * @Author Arturo Chinchilla
 * @Date 11/1/16
 */

angular
    .module('app')
    .controller('CommentStageController', CommentStageController);

CommentStageController.$inject = ['$location','ProjectService', 'EtapaService', 'MaterialService'];
function CommentStageController($location, ProjectService, EtapaService, MaterialService) {
    $location.path('/comment');
    var vm = this;
    vm.AllProjects = [];
    vm.AllStages = [];

    vm.loadProjects = loadProjects;
    vm.loadStages = loadStages;
    vm.createComment = createComment;
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

    function createComment() {

    }

}