var mA = angular.module('Client', ['lbServices']);

mA.controller('ClientReservationController', function ($scope, $http, Site, Wish, Reservation) {

    console.log();

    $scope.userId = window.localStorage.getItem("idNumber");

    $scope.sites = Site.find();
    $scope.amountCostumers = 0;
    $scope.checkInDate = '';
    $scope.checkOutDate = '';
    $scope.specialNeeds = '';
    $scope.extraServices = '';
    $scope.siteSelected = {
        siteId: -1
    };
    $scope.addWishlist = function(index) {
        var wish = {
            clientId: $scope.userId,
            siteId: $scope.sites[index].id,
            name: $scope.sites[index].name,
            description: $scope.sites[index].description
        }
        Wish.create(wish).$promise.then(function(){
            window.location = "http://localhost:3000/client_reservation.html"
        });
    }
    $scope.makeReservation = function() {
        var reserv = {
            clientId: $scope.userId,
            siteId: $scope.sites[$scope.siteSelected.siteId].id,
            name: $scope.sites[$scope.siteSelected.siteId].name,
            peopleAmount: $scope.amountCostumers,
            checkinDate: $scope.checkInDate,
            checkoutDate: $scope.checkOutDate,
            particularNeeds: $scope.specialNeeds,
            extraServices: $scope.extraServices
        }
        console.log(reserv);
        Reservation.create(reserv).$promise.then(function(){
            window.location = "http://localhost:3000/client_reservation.html"
        });
    }

    
});

mA.controller('ClientWishListController', function ($scope, $http, Site, Wish, Reservation) {

    var clientId = window.localStorage.getItem("idNumber");
    const urlwishes = 'http://localhost:3000/api/wishes?filter={"where":{"clientId":"'+clientId+'"}}';

    $http.get(urlwishes)
    .then(function(res){
        $scope.wishes = res.data;
        console.log($scope.wishes);

    });



});