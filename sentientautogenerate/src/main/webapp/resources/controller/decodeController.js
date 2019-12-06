app.controller('decodeController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	var OWNER_API_KEY = "";
	
	$scope.loadeer = false;
	$scope.keypairs = {};
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$scope.encodedtext = "";
	
	$scope.privatekey = "";
	
	$scope.decryptedtext = "";
	$scope.errorMessage = "";
	$scope.statusMessage = "";
	$scope.isloading = true;
	
	$scope.decodetext = function () {
		$scope.isloading = false;
		$http({
	        url: RSA_DECODE,
	        method: "POST",
	        headers : {
		        'x-api-key': API_USER_KEY
		    },
	        contentType : "application/json",
			data : {"encodeText" : $scope.encodedtext,"key" : $scope.privatekey}
	    }).then(function(response) {
	    	console.log(response);
	    	$scope.decryptedtext = response.data.result;
	    	$scope.errorMessage = response.data.message;
	    	$scope.statusMessage = response.data.status;
	    	$scope.isloading = true;
	    });
		
	}
	
	$scope.myCopy2 = function(){
    	var copyText = document.getElementById("origtext");
    	copyText.select();
		document.execCommand("copy");
		jQuery('#txtpubkey1').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
	};
	
	jQuery('#topMenu').css("display", "block");
	
})