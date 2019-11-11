app.controller('dashCtrl',function($scope,microFac,$q,$localStorage,$http,$timeout){
	$scope.loadeer = true;
	$localStorage.orgDatum={id:orgId};
	$scope.uAccess=$localStorage.uAccess;
	$scope.showTitle = false;
	
	
	//**************************USER ACCESS API  START***************************
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
	//**************************USER ACCESS API END***************************
	
	//**************************SOLUTIONS LIST API START***************************
	$scope.solutionNames=[];
	$scope.solutionList=[];
	
	$scope.getsolutionsList = function(){
		microFac.getMicroservices().success(function(resp){
			console.log(resp);
			$scope.solutionNames = resp.names;
			$scope.solutionList = resp.solutions;
			$scope.showTitle = true;
			$scope.loadeer = false;		
		})		
		$scope.filterCate = false;
		$scope.filterFun = false;
	}
	
	$scope.getsolutionsList();
	//**************************SOLUTIONS LIST API END***************************
	
	//**************************SOLUTIONS INFO API START***************************
	$scope.solutionInfo=function(id){
		
		$localStorage.solunData={"id":id,"solunNames":$scope.solutionNames,"searchText":$scope.searchText};
		$timeout(function(){
			location.href="solndetail";
		},200);
		
		
	}
	
	$scope.solutionDemo=function(link){
	//	location.href=link;
        	window.open(link, '_blank'); 
		
	}
	//**************************SOLUTIONS INFO API END***************************
	
	
	//**************************MICROSERVICES LIST API START***************************
	$scope.msAiNames=[];
	$scope.msUtNames=[];
	$scope.msDaNames=[];
	
	$scope.msAiArray=[];
	$scope.msUtArray=[];
	$scope.msDaArray=[];
	
	$scope.getMicroserviceList = function(){
		microFac.getMicroserviceList().success(function(res){
			console.log(res);
			
			$scope.msAiNames=res.msAiNames;
			$scope.msUtNames=res.msUtilityNames;
			$scope.msDaNames=res.msDataNames;
			
			$scope.msAiArray=res.msAi;
			$scope.msUtArray=res.msUtility;
			$scope.msDaArray=res.msData;
			$scope.msArray=res.msAll;
			
			if($localStorage.msData==undefined || $localStorage.msData==null){
				$localStorage.msData={};
				$localStorage.msData.msAiNames=[];
				$localStorage.msData.msUtNames=[];
				$localStorage.msData.msDaNames=[];
				$localStorage.msData.id=0;
				$localStorage.msData.msAiNames=res.msAiNames;
				$localStorage.msData.msUtNames=res.msUtilityNames;
				$localStorage.msData.msDaNames=res.msDataNames;
			}
			$scope.loadeer = false;
		});	
	}
	
	$scope.getMicroserviceList();
	
	//**************************MICROSERVICES LIST API START***************************
	
	
	//**************************MICROSERVICES INFO API START***************************
	$scope.msInfo=function(id,from){
		$localStorage.msData={"id":id,"msAiNames":$scope.msAiNames,"msUtNames":$scope.msUtNames,"msDaNames":$scope.msDaNames,"searchMs":$scope.searchMs};
		$timeout(function(){
			location.href="fndetail";
		},200);
		
	}
	//**************************MICROSERVICES INFO API END***************************
	
	
	$scope.setMenu = function(type){
		$scope.searchMs="";
		$scope.searchText="";
		$("#context1").unhighlight();
	    $("#context2").unhighlight();
		if(type=='S'){
           jQuery("#solution").addClass("active");
           jQuery("#micro-service").removeClass("active");
           jQuery(".solution-menu").show();
           jQuery(".micro-service-menu").hide();
           jQuery(".solution-pan").show();
           jQuery(".micro-service-pan").hide();
		}else{
			jQuery("#solution").removeClass("active");
			jQuery("#micro-service").addClass("active");
			jQuery(".solution-menu").hide();
			jQuery(".micro-service-menu").show();
			jQuery(".solution-pan").hide();
			jQuery(".micro-service-pan").show();
		}
	}
	if($localStorage.menuTab==undefined || $localStorage.menuTab==null){
		$localStorage.menuTab='S';
	}
	$scope.setMenu($localStorage.menuTab);
});


