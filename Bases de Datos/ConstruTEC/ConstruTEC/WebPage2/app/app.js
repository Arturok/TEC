/*
 @Author: Arturo Chinchilla
 @Date: 10/16/16
 */
angular
    .module('app',['ngRoute', 'ngCookies'])
    .config(config)
    .run(run);

config.$inject = ['$routeProvider', '$locationProvider'];
function config($routeProvider, $locationProvider) {
  $routeProvider
      .when('/home', {
        controller: 'HomeController',
        templateUrl: "Home/HomeView.html",
        controllerAs: 'vm'
      })
      .when('/login', {
        controller: 'LoginController',
        templateUrl: 'Login/LoginView.html',
        controllerAs: 'vm'
      })
      .when('/register',{
          controller: 'RegisterController',
          templateUrl: 'Register/RegisterView.html',
          controllerAs: 'vm'
      })
      .when('/client', {
          controller: 'ClientHomeController',
          templateUrl: 'ClientHome/ClientHomeView.html',
          controllerAs: 'vm'
      })
      .when('/architect', {
          controller: 'ArchitectHomeController',
          templateUrl: 'ArchitectHome/ArchitectHomeView.html',
          controllerAs: 'vm'
      })
      .when('/admin', {
          controller: 'AdminHomeController',
          templateUrl: 'AdminHome/AdminHomeView.html',
          controllerAs: 'vm'
      })
      .when('/materials', {
          controller: 'AssignMaterialsController',
          templateUrl: 'AssignMaterials/AssignMaterialsView.html',
          controllerAs: 'vm'
      })
      .when('/project', {
          controller: 'ProjectRegisterController',
          templateUrl: 'ProjectRegister/ProjectRegisterView.html',
          controllerAs: 'vm'
      })
      .when('/stages', {
          controller: 'AssignStagesController',
          templateUrl: 'AssignStages/AssignStagesView.html',
          controllerAs: 'vm'
      })
      .when('/comment', {
          controller: 'CommentStageController',
          templateUrl: 'CommentStage/CommentStageView.html',
          controllerAs: 'vm'
      })
      .when('/stagereg', {
          controller: 'StageRegisterController',
          templateUrl: 'StageRegister/StageRegisterView.html',
          controllerAs: 'vm'
      })
      .when('/request', {
          controller: 'RequestController',
          templateUrl: 'Request/RequestView.html',
          controllerAs: 'vm'
      })
      .when('/budget',{
          controller: 'BudgetController',
          templateUrl: 'Budget/BudgetView.html',
          controllerAs: 'vm'
      })
      /*COMPLETE*/
      /*Complete all the routes*/

      .otherwise({ redirectTo: '/login'});


}

run.$inject = ['$rootScope','$location', '$cookieStore', '$http'];
function run($rootScope, $location, $cookieStore, $http) {
  //This keep the user logged in after page refresh
  $rootScope.globals = $cookieStore.get('globals') || {};
  if ($rootScope.globals.currentUser) {
    $http.defaults.headers.common['Authorization'] = 'Basic' + $rootScope.globals.currentUser.authdata;
  }
  $rootScope.$on('$locationChangeStart', function (event, next, current) {
    // redirect to login page if not logged in and trying to access a restricted page
    var restrictedPage = $.inArray($location.path(), ['/home','/login','/register','/client','/architect', '/materials', '/project', '/stages', '/comment', '/stagereg', '/admin', '/request', '/budget']) === -1;
    var loggedIn = $rootScope.globals.currentUser;
    if (restrictedPage && !loggedIn) {
      $location.path('/login');
    }
  })
}
