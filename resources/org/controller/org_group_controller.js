
//GROUPS

app.controller('gropus', function($localStorage,$window, $scope, $rootScope, $http, sentiOrg,$timeout) {
	$scope.orgDetails = [];
	$scope.loader = true;
	$scope.uAccess=$localStorage.uAccess;
	$scope.isSuperAdmin=false;
	
	if(USR_ID==2){
		$scope.isSuperAdmin=true;
	}
	
	$scope.editOrg2 = false;
	
	$scope.setOrgEditMode = function() {
		$scope.editOrg2 = !$scope.editOrg2;
	}
	
	if($localStorage.orgDatum != ""){
		var dar = $localStorage.orgDatum;
		sentiOrg.getOrgtznDetails(dar.id).success(function(resp){
			$scope.orgDetails = resp.result;
			$scope.loader = false;
		});
	}
	
	$scope.updateOrgz = function(){
			var data = {
				orgId : $scope.orgDetails.id,
				orgName : $scope.orgDetails.name,
				desc    : $scope.orgDetails.desc,
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
	
	$scope.loadGroupFunction=function(){
		sentiOrg.getOrgAssignFunctionList($localStorage.orgDatum.id).success(function(data){
			$scope.functioninGroup = data.result;			
		});
	}
	
	$scope.tempGroupData = [];
	
	$scope.createGrou = function(tempId){
		for(var i in $scope.functionDatas){
			if(tempId == $scope.functionDatas[i].functionId){
				$scope.tempGroupData.push($scope.functionDatas[i]);
			}
		}
		$scope.grpFunctn = "";
	}
	
	$scope.deleteOrg = function(){
		sentiOrg.deleteOrg($scope.orgDetails.id).success(function(resp){
			if(resp.status == "success"){
				location.href="addorg";
			}			
		})
	}
	
	
	
	$scope.groupId = {};
	
	//GROUPS add
	$scope.addGroup = function() {				
		if(($scope.orgGroupName == undefined || $scope.orgGroupName == "") || 
				($scope.descrpition == undefined || $scope.descrpition == "")){
			$scope.formValidate = true;
		}else{
			$scope.formValidate = false;
			gFunctn = [];
			
			for(var j in $scope.tempGroupData){
				gFunctn.push($scope.tempGroupData[j].functionId);
				
			}
			console.log(gFunctn);
			var data = {
				id : $scope.id,
				orgId:$scope.orgDetails.id,
				orgGroupName : $scope.orgGroupName,
				description:$scope.descrpition,
				dateUpdated : "",
				updatedBy : "",
				gFunctions:gFunctn	
			}

			$http({
					url : 'addGroup',
					dataType : 'json',
					contentType : "application/json",
					method : 'POST',
					data : JSON.stringify(data)
				}).then(function(response) {
					//alert(JSON.stringify(response));
					if (response.data.status != "success") {				
						$scope.errorShow = true;
						$scope.errMessage = response.data.message;
						$timeout(function(){
							$scope.errorShow = false;
							$scope.errMessage = "";
						},3000)
					}else{
						$scope.sucsMsg = true;		
						$scope.successMsg = 'Group Created Successfully';
						
						$scope.orgGroupName = $scope.descrpition = $scope.grpFunctn = "";
						$scope.tempGroupData = [];
						 $scope.groupForm.$setPristine();
						 
						 $timeout(function(){
							 jQuery('#createGroup').modal('hide');
							 $scope.sucsMsg = false;
							 $scope.getGroupList($scope.orgDetails.id);
						 },3000);
						
						/*$timeout(function(){
							$scope.sucsMsg = false;							
							jQuery('#createGroup').modal('hide');
							$scope.groupDetails = true;
							$scope.groupId.id = response.data.result.id;
							$scope.getGroupList($scope.orgDetails.id);
							
							sentiOrg.getgroupsDetls(response.data.result.id).success(function(data){
								$scope.groupDa = data.result;
							})
						 },3000)*/
						
						
					}

				});	
		}

	}
	
/////////////	
	$scope.getFunctionList = function(id) {
		sentiOrg.getOrgAssignFunctionList(id).success(function(data){
			$scope.functionDatas=data.result;
//			console.log($scope.functionDatas)
		})
	}
	
	$scope.loadFunctionDropdown=function() {
		$scope.getFunctionList($localStorage.orgDatum.id);
		
	}
	
	
	$scope.getGroupList = function(id) {
		sentiOrg.getGroupDetails(id).success(function(data){
//			console.log(data);
			//alert(">>");
			$scope.groupDatas=data.result;
		})
	}
	
	$scope.getGroupList($localStorage.orgDatum.id);
	
	
	$scope.toggleAll = function(res) {
		$scope.deleID = [];
	    var toggleStatus = res;
	    
	    var integr = 0;
	    angular.forEach($scope.groupDatas, function(itm){ 
	    	$scope.deleID.push(itm.id);
	    	itm.check_bx = toggleStatus; 
	    	integr++;
	    });	 
	    
	    if(res){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	    
	}
	
	$scope.optionToggled = function(value){
		$scope.deleID = [];
		$scope.isAllSelected = $scope.groupDatas.every(function(itm){ 
	    		return itm.check_bx; 
	    	}
	    )
	     var count = 0;

	    angular.forEach($scope.groupDatas, function(value) {
	        if(value.check_bx){
	        	$scope.deleID.push(value.id);
	          count++;
	        }
	    });
	    	 
	    
	    $scope.selectedList = count;
	    if($scope.selectedList > 0){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	   
	}

	$scope.deleteGroup = function(){
		for(var j in $scope.deleID){
			var idd = $scope.deleID[j];
			sentiOrg.deleteGroupTablz(idd).success(function(){

			})
		}
		
		$timeout(function(){
			$scope.getGroupList($scope.orgDetails.id);
			$scope.advSpan = false;
			jQuery('#deleUssr').modal('hide');
		},1500);
	}
	
	$scope.removeGroupInd = function(index){
		$scope.tempGroupData.splice(index,1);
	}
	
	$scope.getGroupDets = function(value){
		$scope.groupId = value;
		if(value.id != undefined || value.id != ""){
			for(var i in $scope.groupDatas){
				if(value.id == $scope.groupDatas[i].id){
					$scope.groupDetls = $scope.groupDatas[i];					
					
					$scope.groupDetails = true;
					
					sentiOrg.getgroupsDetls(value.id).success(function(data){
						console.log(data);
						$scope.groupDa = data.result;
						$scope.grpFnctn = $scope.groupDa.gFunction;
					})

				}
			}
		}
	}
	
	jQuery(document).on("click", ".delePopId", function () {
	     $scope.deleteMe = jQuery(this).data('id');
	});
	
	$scope.removeFninGroup = function(code){
		sentiOrg.removeFninGroup(code).success(function(dara){
			$timeout(function(){
				if(dara.status == "success"){
					//alert($scope.groupId);
					$scope.getGroupDets($scope.groupId);
					jQuery('#deleteRolFn').modal('hide');
				}
		},1000);
		})
	}
	
	$scope.addFntoGroup = function(sele){
		sentiOrg.addFntoGrouLi(sele, $scope.groupId.id).success(function(dataa){
			//alert(JSON.stringify(dataa));
			//alert($scope.groupId);
			$timeout(function(){
				if(dataa.status == "success"){
					$scope.getGroupDets($scope.groupId);
					$scope.selectedFninGroup = "";
					jQuery('#groupFn').modal('hide');
				}
			},1000);
		})
	}
	
	$scope.cancelGrou = function(){
		$scope.orgGroupName =  "";
		$scope.descrpition =  "";
		$scope.grpFunctn =  "";
		$scope.tempGroupData = [];
		$scope.formValidate = false;
		$scope.groupForm.$setPristine();
	}
	
	$scope.disableFunc = function(name){
		for(var k in $scope.grpFnctn){
			if(name === $scope.grpFnctn[k].value){
				return true
			}
		}
	}
	
	/*$scope.customDateFormat = function(dateString){
		console.log(dateString);
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
	
	$scope.ownerPredefinedGroups = [];
	$scope.selectedPredefinedGroupId = 0;
	
	$scope.getOwnerPredefinedGroups = function() {
		$http({
			url : 'https://api.sentient.io/microservices/prod/org/listpredefinedgroup?ownerId='+OWNER_ID,
			method : 'GET',
		}).then(function(response) {
			console.log('response.data');
			console.log(response.data);
			$scope.ownerPredefinedGroups = response.data.data;
		});
	}
	
	$scope.getOwnerPredefinedGroups();
	
	$scope.addPredefinedGroup = function(){
		
		$scope.ownerPredefinedSelectedGroup = {};
		for(var i in $scope.ownerPredefinedGroups){
			if ($scope.selectedPredefinedGroupId == $scope.ownerPredefinedGroups[i].id){
				$scope.ownerPredefinedSelectedGroup  = $scope.ownerPredefinedGroups[i];
			}
		}
		console.log($scope.ownerPredefinedSelectedGroup);
		gFunctn = [];
		
		for(var j in $scope.ownerPredefinedSelectedGroup.functions){
			/*console.log($scope.ownerPredefinedSelectedGroup.functions[j].fId);*/
			gFunctn.push($scope.ownerPredefinedSelectedGroup.functions[j].fId);
		}

		
		var data = {
				id : 0,
				orgId: $scope.orgDetails.id,
				orgGroupName : $scope.ownerPredefinedSelectedGroup.name,
				description: $scope.ownerPredefinedSelectedGroup.desc,
				dateUpdated : "",
				updatedBy : "",
				gFunctions: gFunctn
			}
		


		$http({
				url : 'addGroup',
				dataType : 'json',
				contentType : "application/json",
				method : 'POST',
				data : JSON.stringify(data)
			}).then(function(response) {
				//alert(JSON.stringify(response));
				if (response.data.status != "success") {				
					$scope.errorShow = true;
					$scope.errMessage = response.data.message;
					$timeout(function(){
						$scope.errorShow = false;
						$scope.errMessage = "";
					},3000)
				}else{
					$scope.sucsMsg = true;		
					$scope.successMsg = 'Group Created Successfully';
					
					$scope.orgGroupName = $scope.descrpition = $scope.grpFunctn = "";
					$scope.tempGroupData = [];
					 $scope.groupForm.$setPristine();
					 
					 $timeout(function(){
						 jQuery('#assignPreDefinedGroupPopUp').modal('hide');
						 $scope.sucsMsg = false;
						 $scope.getGroupList($scope.orgDetails.id);
					 },3000);

										
				}

			});
		
	}

	
	jQuery('#topMenu').css("display", "block");
	
});