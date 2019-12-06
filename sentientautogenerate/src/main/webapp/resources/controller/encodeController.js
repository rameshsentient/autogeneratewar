app.controller('encodeController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	var OWNER_API_KEY = "";
	
	$scope.loadeer = false;
	$scope.keypairs = {};
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$scope.inputtext = "";
	
	$scope.publickey = "";
	
	$scope.encryptedkey = "";
	$scope.errorMessage = "";
	$scope.statusMessage = "";
	$scope.isloading = true;
	
	$scope.encodetext = function (){
		$scope.isloading = false;
		$http({
	        url: RSA_ENCODE,
	        method: "POST",
	        headers : {
		        'x-api-key': API_USER_KEY
		    },
	        contentType : "application/json",
			data : {"text" : $scope.inputtext,"key" : $scope.publickey}
	    }).then(function(response) {
	    	console.log(response);
	    	$scope.encryptedkey = response.data.result;
	    	$scope.errorMessage = response.data.message;
	    	$scope.statusMessage = response.data.status;
	    	$scope.isloading = true;
	    });
	}
	
	$scope.myCopy2 = function(){
    	var copyText = document.getElementById("encrytedkeytext");
    	copyText.select();
		document.execCommand("copy");
		jQuery('#txtpubkey1').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
	};

	
	
	$scope.alreadyFoundPopup = function(){
		jQuery('#displayKeyError').modal('toggle');
	};
	
	
	jQuery('#topMenu').css("display", "block");
	
})