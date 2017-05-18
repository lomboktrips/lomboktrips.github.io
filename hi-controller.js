
var base_url = 'http://localhost/hi-lombok/api/';
var currentLatitude;
var currentLongitude;
var marker;
var _address = null;
var icon = "/assets/img/marker.png";
var info;
var desc = null;

var geocoder;
var map;
var lat = -8.650979;
var long = 116.32494380000003;

// HOME CONTROLLER
app.controller('homeCtrl', function($scope, $http, mainService) 
{
	mainService._isGoBack(false);
	mainService._setTitle("Home");
	$scope.loading = true;
	$("#content").hide();

	$scope.select = {
            value: "Option1",
            choices: ["Option1", "I'm an option", "This is materialize", "No, this is Patrick."]
        };

	// get locations
	$http.get(base_url + 'lokasi.php')
	.success(function(response){
		if(response.status) {
			$scope.locations = response.data;
			$scope.locationsCount = response.num;
		}
		$scope.loading = false;
		if(!$scope.loading) $("#content").fadeIn();
	});

	// get categories
	$http.get(base_url + 'kategori.php')
	.success(function(response){
		if(response.status) {
			$scope.categories = response.data;
			$scope.categoriesCount = response.num;
		}
	});
});

// HOME MAPS CONTROLLER
app.controller('homeMapsCtrl', function ($scope, $http, mainService) {
	mainService._setTitle("Trips Maps");
	mainService._isGoBack(false);
	$scope.loading = true;

    var mapOptions = {
        zoom: 10,
        center: new google.maps.LatLng(lat, long)
    }

    var map = new google.maps.Map(document.getElementById('home-map'), mapOptions);
    $scope.map = new google.maps.Map(document.getElementById('home-map'), mapOptions);

    $scope.markers = [];
    
    var infoWindow = new google.maps.InfoWindow();
    
    var createMarker = function (info){        
        var marker = new google.maps.Marker({
            map: $scope.map,
            icon: icon,
            position: new google.maps.LatLng(info.latitude, info.longitude),
            title: info.title,
            animation: google.maps.Animation.DROP
        });

        marker.title = info.title;
        marker.content = '<div class="infoWindowContent">' + info.descriptions + '</div>';
        marker.photo = '<img src="'+info.image+'" width="200" class="center">';
        marker.image = info.image;
        marker.url = '<div class="center"><a href="#/detail/'+info.location_url+'/'+info.category_url+'/'+info.name+'">See More Details</a></div>';
        
        google.maps.event.addListener(marker, 'click', function(){
            infoWindow.setContent(marker.photo+'<h6 class="center">' + info.title + '</h6>' + marker.content + marker.url);
            infoWindow.open($scope.map, marker);
        });


        $scope.markers.push(marker);
    }
    var places = null;
    var num = 0;

    $http.get(base_url + 'wisata.php?tipe=maps')
	.success(function(response){
		if(response.status) {
			places = response.data;
			num = response.num;

			for (i = 0; i < num; i++){
		        createMarker(places[i]);
		    }
		}else{
			$scope.messages = response.msg;
		}
		$scope.loading = false;
		if(!$scope.loading) $("#content").fadeIn();
	});  

    $scope.openInfoWindow = function(e, selectedMarker){
        e.preventDefault();
        google.maps.event.trigger(selectedMarker, 'click');
    }
    var mapID = "home-map";

    $scope._getCurrentLocation = function(e, selectedMarker){
        //e.preventDefault();
        _currentLocation(mapID);
    }

    $scope._openListPlaces = function(e){
        //e.preventDefault();
        $(".list-places").show('slow');
    }

    $scope._closeListPlaces = function(e){
        //e.preventDefault();
        $(".list-places").hide('slow');
    }

});

// CATEGORY CONTROLLER
app.controller('loginCtrl', function($scope) 
{
	
});

// All Items CONTROLLER
app.controller('allItemsCtrl', function($scope, $http, mainService) 
{
    mainService._isGoBack();
    $scope.type = 'location';
    $scope.loading = true;
    $("#content").hide();

    // get wisata by location
    $http.get(base_url + "wisata.php")
    .success(function(response){
        if(response.status == 1) {
            $scope.items = response.data;
            mainService._setTitle("All Items");
            $scope.page_title = "All Items";
        }else{
            $scope.messages = response.msg;
            mainService._setTitle("Not Found");
        }
        $scope.page_title = "";
        $scope.loading = false;
        if(!$scope.loading) $("#content").fadeIn();
    });     
});

// CATEGORY CONTROLLER
app.controller('locationCtrl', function($scope, $routeParams, $http, mainService) 
{
	var location = $routeParams.location;
	mainService._isGoBack();
    $scope.type = 'location';
    $scope.loading = true;
	$("#content").hide();

    // get wisata by location
	$http.get(base_url + 'wisata.php?lokasi=' + location)
	.success(function(response){
		if(response.status == 1) {
			$scope.items = response.data;
            mainService._setTitle(response.data[0].location_title);
            $scope.page_title = response.data[0].location_title;
		}else{
			$scope.messages = response.msg;
            mainService._setTitle("Not Found");
		}
		$scope.page_title = "";
		$scope.loading = false;
		if(!$scope.loading) $("#content").fadeIn();
	});     
});

// CATEGORY CONTROLLER
app.controller('categoryCtrl', function($scope, $routeParams, $http, mainService) 
{
	var category = $routeParams.category;
	mainService._isGoBack();
    $scope.type = 'category';
    $scope.loading = true;
	$("#content").hide();

    // get wisata by category
	$http.get(base_url + 'wisata.php?kategori=' + category)
	.success(function(response){
		if(response.status) {
			$scope.items = response.data;
            $scope.page_title = response.data[0].category_title;
            mainService._setTitle(response.data[0].category_title);
		}else{
			$scope.messages = response.msg;
            mainService._setTitle("Not Found");
		}
		$scope.page_title = "";
		$scope.loading = false;
		if(!$scope.loading) $("#content").fadeIn();
	});
});

// SINGLE CONTROLLER
app.controller('singleCtrl', function($scope, $routeParams, $http, mainService, mapService) 
{
	var loc = $routeParams.location;
	var cat = $routeParams.category;
	var name = $routeParams.name;
    mainService._isGoBack();
	$scope.loading = true;

	$http.get(base_url + 'detail.php?lokasi='+loc+'&kategori='+cat+'&wisata='+name)
	.success(function(response){
        if(response.status == 1){
            mainService._setTitle(response.data[0].title);
            $scope.loading = false;
            $scope.status = response.status;
            $scope.messages = response.msg;
            $scope.item = response.data[0];
            $scope.galleries = response.galleries;

            var destinasi = response.data[0].title+", "+response.data[0].location_title+", Nusa Tenggara Barat, Indonesia";
            if(response.data[0].lat_long != '' || response.data[0].lat_long != null) {
                destinasi = response.data[0].latitude+", "+response.data[0].longitude;
            }

            mapService._setSingleMarker(response.data[0]);
            mapService._getCurrentLocation();
            $scope.getDirection = function() {
                var myLocation = document.getElementById('posisi').value;
                var destination = document.getElementById('destinasi').value;

                window.open("https://maps.google.com/?saddr="+myLocation+"&daddr="+destination, '_BLANK');
            }
        }else{
            $scope.messages = response.msg;
            mainService._setTitle("Not Found");
        }
        $scope.loading = false;
		if(!$scope.loading) $("#content").fadeIn();
	});
});

app.controller('offlineCtrl', function ($scope, $interval, mainService) {
	mainService._setTitle("Offline");
	mainService._isGoBack(false);

	mainService._checkConnection();

	$scope.checkConnection = function(){
		mainService._checkConnection();
	}
});
/*
** CONTROLLERS
*/
