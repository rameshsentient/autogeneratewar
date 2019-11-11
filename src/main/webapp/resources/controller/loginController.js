
var app = angular.module("loginApp", ['ngStorage']); 
app.controller('longCtrl',function($window,$scope,$timeout, $localStorage){
	$window.localStorage.clear();
	
});

