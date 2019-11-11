
// FUNCTIONS

app.controller('functions', function($localStorage, $window, $scope, $rootScope, $http, sentiOrg,$timeout,Upload,flexyFactry) {
	$scope.loadShow = true;
	$scope.uAccess=$localStorage.uAccess;
	$scope.editOrg2 = false;
	//$scope.selectedFunction = "";
	
	var OWNER_ORG_ID = 0;
	
//	$scope.orgAssignFunctionList = [];
	
	  $http.get('./app-config-prop.json').then(function (response) {
		  //console.log(response);
	      //console.log('ID is ', response.data.ID);
	      //console.log('API_KEY is ', response.data.API_KEY);
		  OWNER_ORG_ID = response.data.ID;
	      
	      //alert(OWNER_API_KEY);
	  });	
	
	$scope.setOrgEditMode = function() {
		$scope.editOrg2 = !$scope.editOrg2;
	}	
	
	var orgIsD = $localStorage.orgDatum.id;
	sentiOrg.getOrgtznDetails(orgIsD).success(function(resp){
		$scope.orgDetails = resp.result;
		 $localStorage.orgDatum = resp.result;
		
		$scope.setOrgAssignFunctions = function() {
			
			$scope.orgAssignFunctionList = [];
			sentiOrg.getOrgAssignFunctionList($scope.orgDetails.id).success(function(data){
				console.log('data.result');
				console.log(data.result);
				console.log('data.result');
				$scope.orgAssignFunctionList=data.result;
//				console.log('$scope.orgAssignFunctionList');
//				console.log(data.result);
//				console.log('$scope.orgAssignFunctionList');
			})
		}
		 
	 
		$scope.getSelectedFunction = function(functionId) {
			var funDropDownObj = document.getElementById(functionId);
			functionId = funDropDownObj.value;
			if(functionId > 0) {
				sentiOrg.assignFunction($scope.orgDetails.id, functionId).success(function(data){
					$scope.selectedFunction = "";
					funDropDownObj.value = "";
					$scope.setOrgAssignFunctions();	

				})			
			}
		}
		$scope.delfunId = 0;
		$scope.removeFunFrmOrg = function (id) {
			
			$scope.delfunId = id;
			jQuery('#deleLang').modal();
			
			
		}
		
		$scope.removeFunctionAccess = function() {
			sentiOrg.removeFunctionFromOrg($scope.delfunId).success(function(data){
				$scope.delfunId = 0;
				$scope.setOrgAssignFunctions();
				jQuery('#deleLang').modal("hide");
			})			
		}
		
		$scope.setOrgAssignFunctions();
		
		$scope.getFunctionList();
	})
	
	/*$scope.getFunctionList = function(id) {
		sentiOrg.getFunctionDetails(id).success(function(data){
			$scope.functionDatas=data;		
		})
	}*/
	
	$scope.getFunctionList = function() {
		sentiOrg.getOrgAssignFunctionList(OWNER_ORG_ID).success(function(data){
			//console.log(data.result);
			$scope.functionDatas=data.result;			
		})
	}	
	
	
	$scope.disableRepeat = function(name){
		for(var k in $scope.orgAssignFunctionList){
			if(name === $scope.orgAssignFunctionList[k].name){
				return true;
			}
		}
	}

	$scope.updateOrgz = function(){
		  var data = {
		   orgId : $scope.orgDetails.id,
		   orgName : $scope.orgDetails.name,
		   desc    : $scope.orgDetails.desc,
		   functionIds:[0],
		   dateUpdated : "",
		   upDatedBy : ""
		  }
		   $http({
		    url : 'addOrg',
		    dataType : 'json',
		    contentType : "application/json",
		    method : 'POST',
		    data : JSON.stringify(data)
		   }).success(function(respo){
		    console.log(respo);
		    $scope.succesUpdat = true;
		    $scope.editOrg2 = false;
		    
		    $timeout(function(){
		     $scope.succesUpdat = false;
		    },2000);

		   })
		}	
	
	
	$scope.deleteOrg = function(){
		sentiOrg.deleteOrg($scope.orgDetails.id).success(function(resp){
			//alert(JSON.stringify(resp));
			if(resp.status == "success"){
				location.href="addorg";
			}
		})
	}
	jQuery('#topMenu').css("display", "block");
});
