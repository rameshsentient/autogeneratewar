app.controller('keysController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	var OWNER_API_KEY = "";
	
	$scope.loadeer = false;
	$scope.keypairs = {};
	$scope.isloading = true;
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	
	$scope.generatekeys = function(){
		$scope.isloading = false;
		$http({
	        url: 'https://api.sentient.io/keypair/prod/rsa/getkeys',
	        method: "GET",
	        headers : {
		        'x-api-key': API_USER_KEY
		    },
	    }).then(function(response) {
	    	console.log(response);
	    	$scope.keypairs = response.data;
	    	$scope.isloading = true;
	    });
	    
	}
	
    $scope.copytoclipboard = function (data) {
    	if(data=='b'){
    		jQuery('#titlemsg').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
    	}else{
    		jQuery('#titlemsgend').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
    	}
    	
    }
    
    $scope.newBoard=false;
    $scope.showClipboard = function () {
    	if($scope.newBoard){
    		$scope.newBoard=false;
    		jQuery('#titlemsg').attr('title', 'Copy').tooltip('fixTitle');
    	}
    	$scope.newBoard=true;
    }
    
    $scope.newBoardend=false;
    $scope.showClipboardend = function () {
    	if($scope.newBoardend){
    		$scope.newBoardend=false;
    		jQuery('#titlemsgend').attr('title', 'Copy').tooltip('fixTitle');
    	}
    	$scope.newBoardend=true;
    }
	
    $scope.myCopy2 = function(keypara){
    	var copyText = "";
    	if(keypara == "a"){
			copyText = document.getElementById("publickeyparam");
			jQuery('#txtpubkey1').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
			jQuery('#txtpubkey2').attr('title', 'Copy').tooltip('fixTitle');
    	}
    	else{
			copyText = document.getElementById("privatekeyparam");
			jQuery('#txtpubkey2').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
			jQuery('#txtpubkey1').attr('title', 'Copy').tooltip('fixTitle');
    	}
		copyText.select();
		document.execCommand("copy");
	};
  
	
	jQuery('#topMenu').css("display", "block");
	
})