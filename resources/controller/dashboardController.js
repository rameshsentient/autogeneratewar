app.controller('dashController',function($scope,$timeout, $localStorage, $http){
	
	$scope.loadeer = true;
	
	$scope.uAccess=$localStorage.uAccess;
	$localStorage.orgDatum={id:orgid};
	$scope.orgid = orgid;
	
	$scope.planyType = "";
	$scope.planTypes = {};
	
	//**************************USER ACCESS API  START***************************
	if($localStorage.uAccess == undefined || $localStorage.uAccess==''){
		$http({
			url : ACCESS_INFO+'?xApiKey='+API_USER_KEY, 
			method : 'GET',
			headers:{'x-api-key':API_USER_KEY},
		}).success(function(res){
			console.log(res)
			$localStorage.uAccess=res;
			$scope.uAccess=$localStorage.uAccess;
			jQuery('#topMenu').css("display", "block");
		});
		
    }else{
    	jQuery('#topMenu').css("display", "block");
    }
	//**************************USER ACCESS API END***************************

	/* --************** CHECK ORG INFO FOR DA *************--*/
	$scope.getDaAccessinformation = function(){
		$http({
			url : ACCESS_INFO_ORG_DA+'?xApiKey='+API_USER_KEY, 
			method : 'GET',
			headers:{'x-api-key':API_USER_KEY},
		}).success(function(res){
//			alert('11')
			console.log(res);
			if (res.planType){
				$scope.planyType = res.planType;
			}
			$timeout(function(){
				$scope.loadeer = false;
			},2000);
		});
	}
	
	
		$timeout(function(){
			$scope.getDaAccessinformation();
		}, 300)
	
	
	$scope.gotoDashboard = function(typ){
		$localStorage.menuTab = typ;
		$timeout(function(){
			location.href="catalog";
		}, 100)
	}
});