var myApp = angular.module("triptec", ['lbServices']);
myApp.controller("myClients", function($scope, $http, Client){
    $scope.clients = Client.find();
    $scope.idNumber = '';
    $scope.name = '';
    $scope.lastname = '';
    $scope.phone = '';
    $scope.birthdate = '';
    $scope.email = '';
    $scope.password = '';
    $scope.pushClient = function() {
        if($scope.idNumber != '') {
            Client.create({idNumber: $scope.idNumber, name: $scope.name, lastname: $scope.lastname,
                phone: $scope.phone, birthdate: $scope.birthdate, email: $scope.email,
                password: $scope.password}).$promise.then(function(){
                                $scope.idNumber = '';
                                $scope.name = '';
                                $scope.lastname = '';
                                $scope.phone = '';
                                $scope.birthdate = '';
                                $scope.email = '';
                                $scope.password = '';
                                window.location = 'http://localhost:3000/login.html';
                               //window.location.reload();
                            });
        }
    }
});

myApp.controller("mySites", function($scope, $http, Site){
    $scope.sites = Site.find();
    $scope.name = '';
    $scope.description = '';
    $scope.latitude = '';
    $scope.longitude = '';
    $scope.address = '';
    $scope.activities = '';
    $scope.price = '';
    $scope.pushSite = function() {
        if($scope.name != '') {
            Site.create({name: $scope.name, description: $scope.description,
                latitude: $scope.latitude, longitude: $scope.longitude, address: $scope.address,
                activities: $scope.activities, price: $scope.price}).$promise.then(function(){
                                $scope.idNumber = '';
                                $scope.name = '';
                                $scope.lastname = '';
                                $scope.phone = '';
                                $scope.birthdate = '';
                                $scope.email = '';
                                $scope.password = '';
                                window.location = 'http://localhost:3000/siteRegister.html';
                               //window.location.reload();
                            });
        }
    }
});



myApp.controller("clientReservation", function($scope, $http, Site){
    $scope.sites = Site.find();
    $scope.amountCostumers = 0;
    $scope.checkInDate = '';
    $scope.checkOutDate = '';
    $scope.specialNeeds = '';
    $scope.extraServices = '';
    $scope.siteSelected = 0;
    $scope.addWishlist = function(index) {
        console.log("index: " + index);
    }
    $scope.makeReservation = function() {

    }

});

myApp.controller("history", function($scope, $http, Reservation){
    $scope.reservations = {};
    $scope.pullHistory = function(idNumber) {

        const url = 'http://localhost:3000/api/reservations?filter={"where":{"clientId":"'+idNumber+'"}}';
        
       $http.get(url)
        .then(function (res) {
            $scope.reservations = res.data;

            console.log(res);

        });
    }
});

myApp.controller("history2", function($scope, $http, Reservation){
    $scope.reservations = {};
    $scope.idNumber = '';
    const idclient = window.localStorage.getItem("idNumber");
    console.log(idclient);

        const url = 'http://localhost:3000/api/reservations?filter={"where":{"clientId":"'+idclient+'"}}';
        
       $http.get(url)
        .then(function (res) {
            $scope.reservations = res.data;

            console.log(res);
        });
});

myApp.controller("places", function($scope, $http, Reservation){
    $scope.reservations = Reservation.find();
});

myApp.controller("ranking", function($scope, $http, Site, Reservation){

    var i = 0;
    var arreglo = [];
    const sitesUrl = 'http://localhost:3000/api/sites';
    $http.get(sitesUrl)
        .then(function(res) {
            $scope.sites = res.data;
            for (i; i < $scope.sites.length; i++) {
                const url = 'http://localhost:3000/api/reservations?filter={"where":{"name":"'+$scope.sites[i].name+'"}}';
                
                
                
                $http.get(url).then(function(res) {
                    var nombre = $scope.sites[i].name;
                    $scope.reservation = res.data;
                    var cantidad = $scope.reservation.length;
                    arreglo.push({name: nombre, ammount: cantidad});

                });
                
            }

    });
    console.log(arreglo);
       

    
});