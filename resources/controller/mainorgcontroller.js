app.controller('mainOrgController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$localStorage.orgDatum={id:orgId};
	
	$scope.uAccess=$localStorage.uAccess;
	
	if($localStorage.uAccess == undefined || $localStorage.uAccess==''){
		
		$http({
			url : ACCESS_INFO+'?xApiKey='+API_USER_KEY, 
			method : 'GET',
			headers:{'x-api-key':API_USER_KEY},
		}).success(function(res){
			console.log(res);
			$localStorage.uAccess=res;
			$scope.uAccess=$localStorage.uAccess;
			jQuery('#topMenu').css("display", "block");
		});
    }else{
    	jQuery('#topMenu').css("display", "block");
    }
	
	
	$scope.mainOrgList = []
	
	$scope.getmainOrgList = function() {
		$http.get(MAIN_ORG_LIST).then(function (data) {
			$scope.mainOrgList = data.data.results;
		     console.log(data);
		});
	}
	
	$scope.getmainOrgList();
	
	$scope.createNewOwner = function(orgInfoId) {
		$localStorage.orgInfoId = orgInfoId;
		$timeout(function(){
		location.href="ownerorgupdate";
		}, 500);
	}
	
	$scope.setOrgInfoId = function(orgInfoId) {
		$localStorage.orgInfoId = orgInfoId;
		$timeout(function(){
			location.href="ownerorginfo";
		}, 500);
	}
	
	
});