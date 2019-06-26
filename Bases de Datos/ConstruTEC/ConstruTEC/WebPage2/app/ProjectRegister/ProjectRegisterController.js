/**
 * @Author Arturo Chinchilla
 * @Date 11/1/16
 */

angular
    .module('app')
    .controller('ProjectRegisterController', ProjectRegisterController);

ProjectRegisterController.$inject = ['$location', 'FlashService', '$rootScope','ProjectService'];
function ProjectRegisterController($location, FlashService, $rootScope, ProjectService) {
    $location.path('/project');
    var vm = this;


    vm.createProject = createProject;

    //Loading All the Projects
    function createProject() {
        ProjectService.CreateProject();
    }


}