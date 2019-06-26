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
        .when('/register', {
            controller: 'RegisterController',
            templateUrl: 'Register/RegisterView.html',
            controllerAs: 'vm'
        })
        .when('/client', {
            controller: 'ClientController',
            templateUrl: 'Client/ClientView.html',
            controllerAs: 'vm'
        })
        .when('/etapa', {
            controller: 'etapaController',
            templateUrl: 'etapa/etapaView.html',
            controllerAs: 'vm'
        })
        .when('/material', {
            controller: 'MaterialController',
            templateUrl: 'Material/MaterialView.html',
            controllerAs: 'vm'
        })
        .when('/proyecto', {
            controller: 'ProyectoController',
            templateUrl: 'Proyecto/ProyectoView.html',
            controllerAs: 'vm'
        })
        .when('/architect', {
            controller: 'ArchitectController',
            templateUrl: 'Architect/ArchitectView.html',
            controllerAs: 'vm'
        })

    /*COMPLETE*/
    /*Complete all the routes*/

        .otherwise({ redirectTo: '/login' });


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
        var restrictedPage = $.inArray($location.path(), ['/home','/login', '/register']) === -1;
        var loggedIn = $rootScope.globals.currentUser;
        if (restrictedPage && !loggedIn) {
            $location.path('/login');
        }
    })
}
