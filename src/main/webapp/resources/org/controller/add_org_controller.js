app.controller('listOrganistn', function($localStorage,$window, $scope, $rootScope, $http, sentiOrg,$timeout) {
	$scope.uAccess=$localStorage.uAccess;
	$scope.orgFun = [];
	$scope.tempGroupData = [];
	$scope.functionIds = [];
	$scope.OrgDeletedData = [];
	
	$scope.loader = true;
	
	$scope.publickey = '';
	
	$scope.provideGroup = false;
	$scope.consumerGroup = false;
	
	$scope.showActiveORG = true;
	
	//alert(ORG_TYPE);
	
	$scope.errorShow = false;
	$scope.tempGroupName = "";
	
	
	$scope.setCreateGroup = function(groupName) {		
		if(groupName == "Data Consumer") {
			$scope.consumerGroup = true;
			$scope.tempGroupName = "";
		}
		else if(groupName == "Data Producer") {
			$scope.provideGroup = true;
			$scope.tempGroupName = "";
		}
	}
	
	
	
	$scope.getList = function() {
		sentiOrg.getLisDetails().success(function(data){
			$scope.showActiveORG = true;
			$scope.OrgDatas=data.results;
			$scope.loader = false;
		})
	}
	
	$scope.getDeletedORGList = function() {
		sentiOrg.getDeletedORGList().success(function(data){
			$scope.showActiveORG = false;
			$scope.OrgDeletedData=data.results;
			$scope.loader = false;
		})
	}
	
	$scope.clearAllData = function() {
		$scope.tempGroupData = [];
		$scope.functionIds = [];
		$scope.newOrgName = '';
		$scope.newOrgUserName = '';
		$scope.newOrgTicketId = '';
		$scope.newOrgDetails = '';
		$scope.formValidate = false;
		$scope.publickey = '';
		$scope.newOrgEmail = '';
		$scope.provideGroup = false;
		$scope.consumerGroup = false;
	}

	$scope.getList();
	
	/* Begin of add Function to ORG*/
	
	$scope.getFunctionList = function() {
		sentiOrg.getOrgAssignFunctionList(ORG_ID).success(function(data){
			$scope.functionDatas=data.result;
			//console.log($scope.functionDatas);
			
		})
	}	
	
	$scope.getFunctionList();
	
	$scope.createGrou = function(tempId){
		for(var i in $scope.functionDatas){
			if(tempId == $scope.functionDatas[i].functionId){
				$scope.tempGroupData.push($scope.functionDatas[i]);
				$scope.functionIds.push($scope.functionDatas[i].functionId);
			}
		}
		$scope.grpFunctn = "";
	}	
	
	$scope.disableRepeat = function(functionId){
		for(var k in $scope.tempGroupData){
			if(functionId === $scope.tempGroupData[k].functionId){
				return true;
			}
		}
	}
	
	$scope.removeGroupInd = function(index){
		$scope.tempGroupData.splice(index,1);
		$scope.functionIds.splice(index,1);
	}
	
	/* End of add Function to ORG*/
	
	$scope.microDataPred = [];
	
	$scope.getMicroListPred = function() {

		$http({
			url : 'https://api.sentient.io/microservices/prod/org/listpredefinedgroup',
			method : 'GET',
		}).then(function(response) {
			console.log('response.data');
			console.log(response.data);
			$scope.microDataPred = response.data.data;
		});
	}
	
	$scope.getMicroListPred();
	
	
	$scope.updatePreDifGroup = function(){
		
		if($scope.tempGroupName > 0){
			for (var i=0; i<$scope.microDataPred.length; i++){
				if($scope.microDataPred[i].id == $scope.tempGroupName){
					var newPredef = {"groupId":$scope.microDataPred[i].id,"groupName":$scope.microDataPred[i].name};
					$scope.predefinedGroups.push(newPredef);
					$scope.tempGroupName = 0;
					break;
				}
			}
		}
		console.log($scope.predefinedGroups);
	}
	
	
	$scope.predefinedGroups = [];
	
	$scope.updatePreDifGroup = function(){
		
		if($scope.tempGroupName > 0){
			for (var i=0; i<$scope.microDataPred.length; i++){
				if($scope.microDataPred[i].id == $scope.tempGroupName){
					var newPredef = {"groupId":$scope.microDataPred[i].id,"groupName":$scope.microDataPred[i].name};
					$scope.predefinedGroups.push(newPredef);
					$scope.tempGroupName = 0;
					break;
				}
			}
		}
		console.log($scope.predefinedGroups);
	}
	
	$scope.setRemoveGroup = function(groupId) {
		
		console.log()
		$scope.predefinedGroups = $scope.predefinedGroups.filter(function( obj ) {
			return obj.groupId != groupId;
		});
	}
	
	$scope.disableGrp = function(id){
		for(var j in $scope.predefinedGroups){
			if(id == $scope.predefinedGroups[j].groupId){
				return true;
			}
		}		
	}
	
	$scope.addOrg = function() {
		
		//alert(JSON.stringify($scope.functionIds));
		if(($scope.newOrgName == undefined || $scope.newOrgName == "") ||($scope.newOrgUserName == undefined || $scope.newOrgUserName == "") ||
				($scope.newOrgDetails == undefined || $scope.newOrgDetails == "") ||
				($scope.newOrgEmail == undefined || $scope.newOrgEmail == "")) {
			$scope.formValidate = true;
		}else{
			$scope.formValidate = false;
			var data = {
					orgId : "",
					orgName : $scope.newOrgName,
					orgUserName : $scope.newOrgUserName,
					desc    : $scope.newOrgDetails,
					email   : $scope.newOrgEmail,
					ticket   : $scope.newOrgTicketId,
					dateUpdated : "",
					upDatedBy : "",
					functionIds : $scope.functionIds,
					publicKey : $scope.publickey,
					preDefGroups : $scope.predefinedGroups
				}
			
			console.log(data);
			
			$http({
				url : 'addOrg',
				dataType : 'json',
				contentType : "application/json",
				method : 'POST',
				data : JSON.stringify(data)
			}).then(function(response) {
				//alert(response.data);
				console.log(response);
				if (response.data.status == "failure") {
					$scope.errorShow = true;
				}else{
					$scope.functionIds = [];
					$scope.tempGroupData = [];
					var newOrgId = response.data.results.id;
					$scope.sucsMsg = true;
					$scope.successMsg = 'Created Successfully !!';
					$scope.getList();
					$scope.newOrgDetails = $scope.newOrgName= $scope.newOrgUserName = "";
					
					$scope.publickey = '';
					$scope.newOrgEmail = '';
					$scope.newOrgName = "";
					$scope.newOrgTicketId = "";
					$scope.provideGroup = false;
					$scope.consumerGroup = false;
					
					$timeout(function(){
						$scope.sucsMsg = false;
						$scope.successMsg = '';
						jQuery('#createOrg').modal('hide');
					},3000)
				}
			});
		}
	}

	//ORG DETAILS

	$scope.getOrgDets = function(data){
			$localStorage.orgDatum = data;
		//alert(JSON.stringify($localStorage.orgDatum));
		if(data != ''){
			
			if($scope.uAccess.ORG_GETUSERLIST){
				location.href = "orgdetails"
			}else if($scope.uAccess.ORG_GETORGASSIGNFUNCTIONS){
				location.href = "orgFunctionList"
			}else if($scope.uAccess.ORG_GETORGROLELIST){
				location.href = "orgrole"
			}else if($scope.uAccess.ORG_GETORGGROUPLIST){
				location.href = "orggroup"
			}else if($scope.uAccess.ORG_GETORGTAGS){
				location.href = "orgtags"
			}
			
		}
	}

	$scope.gotoFlexcy = function(value){
		$localStorage.orgIdd = value.id;
		$localStorage.orgDatum = value;
		location.href="flexylanguage";
	}
	
	$scope.deleID = [];
	
	$scope.toggleAll = function(res) {
		$scope.deleID = [];
	    var toggleStatus = res;
	    var integr = 0;
	    	angular.forEach($scope.OrgDeletedData, function(itm){
		    	itm.check_bx = toggleStatus;
		    	integr++;
		    	 $scope.deleID.push(itm.id);
		    });
	    
	   
	    if(res){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	}



	$scope.optionToggled = function(){		
		$scope.deleID = [];
	
			$scope.isAllSelected = $scope.OrgDeletedData.every(function(itm){
	    		return itm.check_bx;
	    	})
	     var count = 0;
			angular.forEach($scope.OrgDeletedData, function(value) {
		        if(value.check_bx){
		          count++;
		          $scope.deleID.push(value.id);
		        }
		    });
	    $scope.selectedList = count;
	    if($scope.selectedList > 0){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	}
	
	$scope.activateORG = function(){
		jQuery('#reActivateORG').modal('hide');
		//$scope.loader = true;
		var data={
				orgIds:$scope.deleID
		}
		
		/*alert(API_USER_KEY);
		
		alert(ACTIVATE_DELETED_ORG);
		
		alert(JSON.stringify(data));*/
		
		
		$http({
			url: ACTIVATE_DELETED_ORG,
			method: "POST",
			headers:{'x-api-key':API_USER_KEY},
			data:JSON.stringify(data),
			processData: false,
			contentType: false,
			cache: false,
		}).then(function(response) {
			console.log(response);
			$scope.getDeletedORGList();
			/*if(response.data.results.length>0){
				$scope.existUsers=response.data.results;
				console.log($scope.existUsers);
			}
			jQuery('#reActivateUssrMsg').modal('show');
			$scope.loader = false;
			deletedUsercount=0;
			$scope.getDeletedUserList($scope.orgDetails.id);
			$scope.getUserList($scope.orgDetails.id);*/
		});
		
	}
	
	$scope.selectallFun=function(){
		
		if($scope.grpFunctn=='all'){
			$scope.tempGroupData=[];
			$scope.functionIds=[];
			$scope.selectall=true;
			for(var i in $scope.functionDatas){
				$scope.tempGroupData.push($scope.functionDatas[i]);
				$scope.functionIds.push($scope.functionDatas[i].functionId);
			}
			$scope.grpFunctn="";
		}else if($scope.grpFunctn=='uall'){
			$scope.selectall=false;
			$scope.tempGroupData=[];
			$scope.functionIds=[];
			$scope.grpFunctn="";
		}
		
	}
	
	/*$scope.customDateFormat = function(dateString){
		//console.log(dateString);
		var dateCust = Date.parse(dateString);
		return dateCust;
	};*/
	
	$scope.customDateFormat = function(dateString){
		if (dateString){
			var neDateTimeArr = dateString.split('/');
			var neDateTimeArr1 = Date.parse(neDateTimeArr[0]);
//			var newDateFormat = (new Date(neDateTimeArr1).toLocaleDateString().split('-'));
//			console.log(new Date(neDateTimeArr1).toLocaleDateString().split('-'));
			var newDateFormat = (new Date(neDateTimeArr1).toLocaleDateString()).toString('YYYY-MM-DD').split('/');
//			console.log(newDateFormat);
			var dateNum = newDateFormat[1];
			if (dateNum.length == 1){
				dateNum = 0+dateNum;
			}
			var mothNum = newDateFormat[0];
			if (mothNum.length == 1){
				mothNum = 0+mothNum;
			}
			var yearNum = newDateFormat[2];
			var dateFormat = yearNum+"-"+mothNum+"-"+dateNum +" "+ neDateTimeArr[1];
			return dateFormat;
		}
		
	};
	
	
	
	
	jQuery('#topMenu').css("display", "block");
});


