/* ROUTING */
var app = angular.module('HIApp', ['ngRoute', 'ui.materialize']);
app.config(function($routeProvider) {
	$routeProvider
	.when("/", {
		templateUrl: "templates/home.html"
	})
	.when("/maps", {
		templateUrl: "templates/home-maps.html"
	})
	.when("/login", {
		templateUrl: "templates/login.html"
	})
	.when("/all", {
		templateUrl: "templates/all-items.html"
	})
	.when("/location/:location", {
		templateUrl: "templates/location.html"
	})
	.when("/category/:category", {
		templateUrl: "templates/category.html"
	})
	.when("/detail/:location/:category/:name", {
		templateUrl: "templates/single.html"
	})
	.when("/offline", {
		templateUrl: "templates/offline.html"
	})
	.otherwise({ redirectTo: '/' });
});