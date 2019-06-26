/**
 * Created by damar on 10/24/2016.
 */
angular
    .module('app')
    .controller('MaterialController', MaterialController);

materialController.$inject = ['$location', 'FlashService', '$rootScope', 'MaterialService'];
function MaterialController($location, FlashService, $rootScope, MaterialService) {
    $location.path('/material');
    var vm = this;
    vm.allMaterial = [];
    vm.LoadMateriales = LoadMateriales;

    function LoadMateriales() {
        MaterialService.GetAll()
            .then(function (materiales){
            vm.allMaterial = materiales;
        });
    }
}