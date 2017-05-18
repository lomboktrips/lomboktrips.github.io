
app.service('mainService', function() {
    this._checkConnection = function () {

    	if(navigator.onLine) {
    		//Materialize.toast('You are now Online', 1000, '', function(){window.location.href = "#/"});
    		window.location.href = "#/";
	    }else{
	    	Materialize.toast('Please make sure you are connected with WIFI or your Mobile Data', 2000);
	    }
    }

    this._setTitle  = function (title) {
    	title = title;
		
		if(title == "Home") window.document.title = "Lombok Trips | Lombok Tourism Guide";
		else window.document.title = title + " - Lombok Tourism Guide";
    }

    this._isGoBack  = function (active = true) {
    	if(active){
			$('#menu').hide();
			$('#back').show();
		}else{
			$('#menu').show();
			$('#back').hide();
		}
    }
});

app.service('mapService', function() {
	

	this.initialize = function (element='map', mapOptions) {
	    map = new google.maps.Map(document.getElementById(element), mapOptions);
	}

	this.init = function() {
        var options = {
            center: new google.maps.LatLng(40.7127837, -74.00594130000002),
            zoom: 13,
            disableDefaultUI: true    
        }
        this.map = new google.maps.Map(
            document.getElementById("single-map"), options
        );
        this.places = new google.maps.places.PlacesService(this.map);
    }

    this._getCurrentLocation = function () {
    	if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(function(position) {
	            var pos = position.coords.latitude+", "+position.coords.longitude;
	            document.getElementById('posisi').value = pos;
	        }, function() {
	            console.log("Unable to load Geolocation!");
	        });
	    } else {
	        // Browser doesn't support Geolocation
	        console.log("Browser doesn't support Geolocation");
	    }
    }

    this._setSingleMarker = function(location){
    	var geocoder = new google.maps.Geocoder();
    	var latlong = new google.maps.LatLng(lat, long);

        if(location.title != '')
        {
            geocoder.geocode( {'address': location.title + ", " + location.location_title}, function(results, status) {
              if (status == 'OK') {

                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 18,
                    zoomControl: false,
                    scaleControl: false,
                    scrollwheel: false,
                    disableDoubleClickZoom: true,
                    disableDefaultUI: true,
                    draggable: true,
                    center: results[0].geometry.location
                });

                marker = new google.maps.Marker({
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: icon,
                    position: results[0].geometry.location
                });

                desc = '<h5>'+location.title+'</h5><div class="infoWindowContent">'+
                results[0].formatted_address+'</div>';

                if(location.lat_long == '' || location.lat_long == null)
                	var destinasi = location.title+", "+location.location_title+", Nusa Tenggara Barat, Indonesia";
                else
                	var destinasi = location.lat_long;
                document.getElementById('destinasi').value = destinasi;

                info = new google.maps.InfoWindow({
                    content: desc
                });

                info.open(map, marker);

                marker.addListener('click', function() {
                    info.open(map, marker);
                });
                
              } else {
                alert('Geocode was not successful for the following reason: ' + status);
              }
            });
        }
    }

    this._getGelolocationByLatLong = function () {}
    
    this._getGelolocationByAddress = function () {}
});