/**
 * Created by damar on 10/24/2016.
 */
angular
    .module('app')
    .controller('etapaController', etapaController);

etapaController.$inject = ['$location', 'FlashService', '$rootScope', 'EtapaService', 'ProjectService'];
function etapaController($location, FlashService, $rootScope, EtapaService, ProjectService) {
    var vm = this;
    vm.etapa = null;
    vm.proyecto = null;
    vm.create = create;
    vm.allEtapas = [];
    initController();
    $location.path('/etapa');

    //Init some variables
    function initController() {
        LoadAllEtapas();
        
    }

    //Load all the projects
    function LoadAllEtapas() {
        EtapaService.GetAll()
            .then(function (etapas) {
                vm.allEtapas = etapas;
            })
    }

    function LoadProyecto() {
        ProjectService.GetById()
            .then(function (project) {
                vm.proyecto = project;
            })

    }
    function create() {
        vm.dataLoading  = true;
        LoadAllEtapas();
    }

}