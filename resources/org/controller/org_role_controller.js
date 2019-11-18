

//ROLES

app.controller('roles', function($localStorage,$window, $scope, $rootScope, $http, sentiOrg,$timeout) {
	$scope.loader = true;
	$scope.editOrg2 = false;
	
	$scope.uAccess=$localStorage.uAccess;	

	$scope.setOrgEditMode = function() {
		$scope.editOrg2 = !$scope.editOrg2;
	}
	
	$scope.orgDetails = [];
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
//					console.log(respo);
					$scope.succesUpdat = true;
					$scope.editOrg2 = false;
					
					$timeout(function(){
						$scope.succesUpdat = false;
					},2000);
					
				})
	}
	
	$scope.tempFunRole = [];
	
	$scope.addFunctn = function(tempId){
		for(var i in $scope.functionDatas){
			if(tempId == $scope.functionDatas[i].functionId){
				$scope.tempFunRole.push($scope.functionDatas[i]);
			}
		}
		$scope.funcModel = "";
	}
	
	$scope.removeFInd = function(index){
		$scope.tempFunRole.splice(index,1);
	}
	
	$scope.deleteOrg = function(){
		sentiOrg.deleteOrg($scope.orgDetails.id).success(function(resp){
			if(resp.status == "success"){
				location.href="addorg";
			}			
		})
	}
		
	$scope.roleId = {};
	
	//ROLES add
	$scope.addRole = function() {
		
		if(($scope.orgRoleName == undefined || $scope.orgRoleName == "") || 
				($scope.roleDescrptn == undefined || $scope.roleDescrptn == "")){
			$scope.formValidate = true;
		} else{
			$scope.formValidate = false;
			rFunctn = [];
			
			for(var j in $scope.tempFunRole){
				rFunctn.push($scope.tempFunRole[j].functionId);
			}
			
			var data = {
				id : $scope.id,
				orgId:$scope.orgDetails.id,
				orgRoleName : $scope.orgRoleName,
				description:$scope.roleDescrptn,
				dateUpdated : "",
				updatedBy : "",	
				rFunctions: rFunctn	
			}
			$http({
					url : 'addRole',
					dataType : 'json',
					contentType : "application/json",
					method : 'POST',
					data : JSON.stringify(data)
				}).then(function(response) {
						console.log(response);
						if (response.data.status == "failure" ) {
					
							$scope.errMessage = response.data.message;
							$scope.errorShow = true;
						}else{
							$scope.sucsMsg = true;		
							$scope.successMsg = 'Role Created Successfully';
							
							$scope.orgRoleName = $scope.roleDescrptn = $scope.funcModel = "";
							$scope.tempFunRole= [];
							
							$scope.roleForm.$setPristine();
							
							 $timeout(function(){
									$scope.sucsMsg = false;		
									jQuery('#createRole').modal('hide');
									
									$scope.getRoleList($scope.orgDetails.id);
									
									$scope.roleId.id = response.data.id;
									sentiOrg.getroleDetails(response.data.id).success(function(response){
										$scope.roleFuncts = response.result;
										
										$scope.rollFunctn = $scope.roleFuncts.rFunction;
										$scope.roleDetails = true;
									})
							 },3000)
						}

				});
		}
	}
	
	
	
	
	$scope.editRole = function(){
		sentiOrg.getroleDetails($scope.deleID).success(function(response){
			console.log(response);
			$scope.id = response.result.id;
			$scope.orgRoleName = response.result.roleName;
			$scope.roleDescrptn = response.result.roleDesc;
			
			jQuery('#createRole').modal('show');
		})
	}
	
	$scope.updateRole = function(){
		if($scope.roleDescrptn == undefined || $scope.roleDescrptn == ""){
			$scope.formValidate = true;
		} else{
			var form = {
					id			: 	$scope.id,
					orgId		:	$scope.orgDetails.id,
					orgRoleName : 	$scope.orgRoleName,
					descrpition	:	$scope.roleDescrptn,
			}	
			console.log(form);
			$http({
				url : 'addRole',
				dataType : 'json',
				contentType : "application/json",
				method : 'POST',
				data : JSON.stringify(form)
			}).then(function(resp){
				$scope.getRoleList($scope.orgDetails.id);
				$scope.advSpan = false;
		  	 	$scope.advEditSpan = false;
		  	 	$scope.orgRoleName = $scope.roleDescrptn = "";
		  	 	$scope.id = undefined;
		  	 	$scope.roleForm.$setPristine();
		  		jQuery('#createRole').modal('hide');
			})
		}
		
	}
	
	$scope.getFunctionList = function(id) {
		sentiOrg.getOrgAssignFunctionList(id).success(function(data){
			$scope.functionDatas=data.result;			
		})
	}
	
	var orgIsD = $localStorage.orgDatum.id;
	$scope.loadFunctionDropdown=function() {
		$scope.getFunctionList(orgIsD);
	}
	
	
	
	$scope.getRoleList = function(id) {
		sentiOrg.getRoleDetails(id).success(function(data){
			$scope.roleDatas=data.results;			
		})
	}
	
	$scope.getRoleList($localStorage.orgDatum.id);
	
	$scope.toggleAll = function(res) {
		$scope.deleID = [];
	    var toggleStatus = res;
	    
	    var integr = 0;
	    angular.forEach($scope.roleDatas, function(itm){ 
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
	
	$scope.$watch(function(){
	  	 if($scope.selectedList < 1){
	  	 	$scope.advSpan = false;
	  	 	$scope.advEditSpan = false;
	  	 }
	})
	
	
	$scope.optionToggled = function(value){
		$scope.deleID = [];
		$scope.isAllSelected = $scope.roleDatas.every(function(itm){ 
	    		return itm.check_bx; 
	    	}
	    )
	     var count = 0;

	    angular.forEach($scope.roleDatas, function(value) {
	        if(value.check_bx){
	        	$scope.deleID.push(value.id);
	        	count++;
	        }
	    });
	     
	    
	    $scope.selectedList = count;
	    if($scope.selectedList < 2){
	    	$scope.advEditSpan = true;
	    }else{
	    	$scope.advEditSpan = false;
	    }
	    $scope.advSpan = true;
	   
	}

	
	$scope.deleteRole = function(){
		for(var j in $scope.deleID){
			var idd = $scope.deleID[j];
			sentiOrg.deleteRoleTablz(idd).success(function(){

			})
			
			$timeout(function(){
			$scope.getRoleList($scope.orgDetails.id);
			$scope.advSpan = false;
			$scope.advEditSpan = false;
			jQuery('#deleUssr').modal('hide');
			},1500);
		}
	}
	
	
	$scope.getRoleDets = function(value){
		$scope.roleId = value;
		if(value.id != undefined || value.id != ""){
			for(var i in $scope.roleDatas){
				if(value.id == $scope.roleDatas[i].id){
					$scope.roleDetls = $scope.roleDatas[i];	
					
					
					sentiOrg.getroleDetails($scope.roleId.id).success(function(response){
						console.log(response);
						$scope.roleFuncts = response.result;
						
						$scope.rollFunctn = $scope.roleFuncts.rFunction;
						
						$scope.roleDetails = true;
					})
					
					sentiOrg.getOrgAssignFunctionList(orgIsD).success(function(data){
						$scope.functioninRole = data.result;			
					})
										
				}
			}
		}
	}
	
	$scope.addfntoRole = function(fun){
		sentiOrg.addFntoRole(fun, $scope.roleId.id).success(function(data){
			//alert(JSON.stringify(data));
			
			$timeout(function(){
				if(data.status == "success"){
					$scope.getRoleDets($scope.roleId);
					$scope.selectedFninRole = "";
					jQuery('#groupFn').modal('hide');
				}
			},1000);
			
		})
	}
	
	
	jQuery(document).on("click", ".delePopId", function () {
	     $scope.deleteMe = jQuery(this).data('id');
	});
	
	$scope.removeFninRole = function(id){
		sentiOrg.deleteFntoRole(id).success(function(data){
			//alert(data.status);
			$timeout(function(){
				if(data.status == "success"){
					$scope.getRoleDets($scope.roleId);
					jQuery('#deleteRolFn').modal('hide');
				}
			},1000);
		})
	}
	
	$scope.cancelRole = function(){
		$scope.id = undefined;
		$scope.orgRoleName = undefined;
		$scope.roleDescrptn = undefined;
		$scope.funcModel = "";
		$scope.tempFunRole = [];
		$scope.roleForm.$setPristine();
		$scope.formValidate = $scope.errorShow = false;
	}
	
	$scope.disableFunc = function(name){
		for(var k in $scope.rollFunctn){
			if(name === $scope.rollFunctn[k].value){
				return true
			}
		}
	}
	/*$scope.customDateFormat = function(dateString){
		var dateCust = Date.parse(dateString);
		return dateCust;
	};
	*/
	
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

