app.controller('directorysearchCtrl',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.searchMain=true;
	$scope.searchResult=false;
	$scope.loader = false;
	
	var OWNER_API_KEY = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});	
	
	$scope.resultData = []
	
	$scope.getDirectorySearchData = function() {
		
		$scope.searchMain=false;
		$scope.searchResult=true;
		$scope.loader = true;
		
		$http({
	        url: "https://api.sentient.io/DaaS/prod/directories/searchdir?limit=20&offset=0&querystring="+$scope.searchKey,
	        method: "GET",
	        headers:{'x-api-key':OWNER_API_KEY}
	    })
	    .then(function(response) {
	    	$scope.loader = false;
	    	console.log("THEN >>>");
	        console.log(JSON.stringify(response));
	    	$scope.resultData = response.data.results.hits;
	        console.log($scope.resultData.length);
	        console.log(JSON.stringify($scope.resultData));
	    }, 
	    function(response) { // optional
	    	$scope.loader = false;
	    	console.log("RESP OP >>>");
	    	console.log(JSON.stringify(response));
	    });
	}
	
	$scope.getShotDesc = function(rowObj) {
		
		var temp = "";
		
		try {
			temp = rowObj._source.descshort[Object.keys(rowObj._source.descshort)[0]];
		}
		catch(E){
			
			temp = "";
			
		}
		
		return temp;
		
	}
	
	
	jQuery('#topMenu').css("display", "block");
});
