/**
 * @Author Arturo Chinchilla
 * @Date 11/1/16
 */

angular
    .module('app')
    .controller('AdminHomeController', AdminHomeController);

AdminHomeController.$inject = ['$location', 'EtapaService'];
function AdminHomeController($location, EtpaService) {
    $location.path('/admin');
    var vm = this;
    vm.Templates = [];


    vm.loadTemplates = loadTemplates;
    initController();

    //Initialize the Controller Variables
    function initController() {
        loadTemplates();
    }

    //Loading All the Stages from a Project
    function loadTemplates() {
        //EtapaService.GetAll(vm.proyecto)
        //    .then(function (stages) {
        //        vm.AllStages = stages;
        vm.Templates = [{"Nombre": "Techo"},{"Nombre": "Paredes"}];
        //    })
    }
}