app.controller('userActivityController',function($scope, $timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	var OWNER_API_KEY = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$scope.userActivityDetails = [];
	
	$scope.fileUrl = "";
	
	$scope.getUserActivityDetails = function () {
		$scope.loadeer = true;
		
		$http({
	        url: API_LOGIN_HISTORY,
	        method: "POST",
	        headers : {
		        'x-api-key': API_USER_KEY
		    },
	        contentType : "application/json",
			data : {"orgId" : ORG_ID,"duration":$scope.duration}
	    }).then(function(response) {
	    	console.log(response);
	    	$scope.userActivityDetails = response.data.result;
	    	$scope.loadeer = false;
	    });
		
	}
	
	
	
	$scope.getFileUrl = function () {
		
		$http({
	        url: API_DOWNLOAD_LOGIN_CSV,
	        method: "POST",
	        headers : {
		        'x-api-key': API_USER_KEY
		    },
	        contentType : "application/json",
			data : {"orgId" : ORG_ID,"duration":$scope.duration}
	    }).then(function(response) {
	    	console.log(response);
	    	$scope.fileUrl = response.data.fileurl;
	    	window.location.assign($scope.fileUrl);
	    });
		
	}
	
	
	$scope.getUserActivityDetails();
	
	jQuery('#topMenu').css("display", "block");
	
})