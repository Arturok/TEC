/**
 * Created by mchin on 2/11/2016.
 */
/**
 * @Author Arturo Chinchilla
 * @Date 11/1/16
 */

angular
    .module('app')
    .controller('StageRegisterController', StageRegisterController);

StageRegisterController.$inject = ['$location','ProjectService', 'EtapaService', 'MaterialService'];
function StageRegisterController($location, ProjectService, EtapaService, MaterialService) {
    $location.path('/stagereg');
    var vm = this;

    vm.createStage = createStage;
    
    
    //Create the template of the Stage
    function createStage() {
        
    }
}