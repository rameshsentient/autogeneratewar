
app.controller('listUser', function($window, $scope, $rootScope, $localStorage, $http, sentiOrg, $timeout) {
	$scope.loader = true;
	$scope.uAccess=$localStorage.uAccess;
	$scope.editOrg2 = false;
	$scope.showDeletedList=false;
	
	$scope.setOrgEditMode = function() {
		$scope.editOrg2 = !$scope.editOrg2;
	}
	
	
	if(ORG_ID >1 && !$scope.uAccess.ORG_GETUSERLIST){
		if($scope.uAccess.ORG_GETORGROLELIST){
			location.href = "orgrole"
		}else if($scope.uAccess.ORG_GETORGGROUPLIST){
			location.href = "orggroup"
		}else if($scope.uAccess.ORG_GETORGASSIGNFUNCTIONS){
			location.href = "orgFunctionList"
		}else if($scope.uAccess.ORG_GETORGTAGS){
			location.href = "orgtags"
		}
	}
	

	
	if($localStorage.orgDatum != ""){	
		var dar = $localStorage.orgDatum;
		sentiOrg.getOrgtznDetails(dar.id).success(function(resp){
			$scope.orgDetails = resp.result;
			//console.log($localStorage.orgDatum);
			console.log($scope.orgDetails);
		});
	}
	
	$scope.updateOrgz = function(){
			var data = {
				orgId : $scope.orgDetails.id,
				orgName : $scope.orgDetails.name,
				orgUserName : '',
				email : $scope.orgDetails.email,
				desc    : $scope.orgDetails.desc,
				publicKey : $scope.orgDetails.publicKey,
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


	//alert($localStorage.orgDatum);
	if($localStorage.orgDatum != ""){
		$scope.orgDetails = $localStorage.orgDatum;
	}
	

	$scope.UserID = {};


	$scope.deleteOrg = function(){
		sentiOrg.deleteOrg($scope.orgDetails.id).success(function(resp){
			//alert(JSON.stringify(resp));
			if(resp.status == "success"){
				location.href="addorg";
			}
		})
	}


	//ORG DETAILS
	$scope.sendEmail = false;
	$scope.addUser = function() {

		//$scope.formValidate = true;
		var emailAddress = "";
		if($scope.sendEmail) {

			if($scope.emailAddress == undefined  || $scope.emailAddress == "") {
				//$scope.formValidate = true;
			}
			else {
				emailAddress = $scope.emailAddress;
			}
		}

		var data = {
			id : $scope.id,
			orgId:$scope.orgDetails.id,
			userName : 		$scope.userName,
			userPassword:	$scope.userPassword,
			userSignin:		$scope.userSignin,
			emailAddress : emailAddress,
			dateUpdated : "",
			dateCreated:"",
			updatedBy : ""
		}

		console.log(data);

		if (($scope.userName == undefined || $scope.userName == "") ||
				($scope.userPassword == undefined || $scope.userPassword == "")) {
			$scope.formValidate = true;
		} else {
			$scope.formValidate = false;
			$http({
				url : 'addUser',
				dataType : 'json',
				contentType : "application/json",
				method : 'POST',
				data : JSON.stringify(data)
			}).then(function(response) {
				console.log(JSON.stringify(response));
				if (response.status == "failure") {
					$scope.errorShow = true;
					$scope.errMessage = response.message;
				}else{
					//$scope.getUserList($scope.orgDetails.id);
					$scope.sucsMsg = true;
					$scope.successMsg = 'User Created Successfully';
					$scope.userName = $scope.userPassword = $scope.userSignin = $scope.passwordType = "";
					$scope.sendEmail = false;
					$timeout(function(){
						$scope.getUserList($scope.orgDetails.id);
						$scope.sucsMsg = false;
						$scope.errorShow = false;
						$scope.successMsg = '';
						jQuery('#createUser').modal('hide');

						$scope.UserID.id = response.data.results.id;
						sentiOrg.getusrDetls(response.data.results.id).success(function(response){
							console.log(response);
							$scope.userDetls = response.results;
							$scope.usrGroup = $scope.userDetls.groups;
							$scope.usrRoles = $scope.userDetls.roles;
							$scope.usrDirFunctn = $scope.userDetls.directFunction;

							$scope.userDetails = true;
						})

					},3000)



				}

			});
		}

	}


	$scope.getUserList = function(id) {
		sentiOrg.getUserLisDetails(id).success(function(data){
			$scope.UserDatas=data.results;
			$scope.loader = false;
		})
	}

	$scope.getUserList($scope.orgDetails.id);

	$scope.toggleAll = function(res) {
		if(!res){
			$('#checkboxall').prop('checked', false);
		}
		
		$scope.deleID = [];
	    var toggleStatus = res;

	    var integr = 0;
	    
	    if(!$scope.showDeletedList){
	    	angular.forEach($scope.UserDatas, function(itm){
	    		if(itm.rootUser!='yes'){
			    	itm.check_bx = toggleStatus;
			    	integr++;
			    	$scope.deleID.push(itm.id);
	    		}
		    });
	    }else{
	    	angular.forEach($scope.deletedUserDatas, function(itm){
		    	itm.check_bx = toggleStatus;
		    	integr++;
		    	 $scope.deleID.push(itm.id);
		    });
	    }
	   
	    if(res){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	}



	$scope.optionToggled = function(){
		
		$scope.deleID = [];
		if(!$scope.showDeletedList){
			$scope.isAllSelected = $scope.UserDatas.every(function(itm){
	    		return itm.check_bx;
	    	})
		}else{
			$scope.isAllSelected = $scope.deletedUserDatas.every(function(itm){
	    		return itm.check_bx;
	    	})
		}
			
	  
	     var count = 0;
		if(!$scope.showDeletedList){
			angular.forEach($scope.UserDatas, function(value) {
		        if(value.check_bx){
		          count++;
		          $scope.deleID.push(value.id);
		        }
		    });
		}else{
			
			angular.forEach($scope.deletedUserDatas, function(value) {
				
		        if(value.check_bx){
		          count++;
		          $scope.deleID.push(value.id);
		        }
		    });
		}
	    

	    $scope.selectedList = count;
	    if($scope.selectedList > 0){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	}


	$scope.deleteUser = function(){
		for(var j in $scope.deleID){
			var idd = $scope.deleID[j];
			sentiOrg.deleteUsrTablz(idd).success(function(){

			})
		}
		
		$timeout(function(){
			$scope.getUserList($scope.orgDetails.id);
			$scope.advSpan = false;
			jQuery('#deleUssr').modal('hide');
			},3000)
	}
	
	$scope.deletedUserDatas=[];
	var deletedUsercount=0;
	$scope.getDeletedUserList = function(id) {
		//if(deletedUsercount==0){
			sentiOrg.getDeletedUserLisDetails(id).success(function(data){
				//console.log(data.results);
				$scope.deletedUserDatas=data.results;
				$scope.loader = false;
				//deletedUsercount++;
			});
		//}
		
	}
	
	$scope.activateUser = function(){
		jQuery('#reActivateUssr').modal('hide');
		$scope.loader = true;
		var data={
				uIds:$scope.deleID
		}
		
		$http({
			url: ACTIVATE_USER_URL,
			method: "POST",
			headers:{'x-api-key':API_USER_KEY},
			data:JSON.stringify(data),
			processData: false,
			contentType: false,
			cache: false,
		}).then(function(response) {
			console.log(response);
			if(response.data.results.length>0){
				$scope.existUsers=response.data.results;
				console.log($scope.existUsers);
			}
			jQuery('#reActivateUssrMsg').modal('show');
			$scope.loader = false;
			deletedUsercount=0;
			$scope.getDeletedUserList($scope.orgDetails.id);
			$scope.getUserList($scope.orgDetails.id);
			
		}, 
		function(response) { // optional
			console.log(response);
			
		});
		
		
	}

	$scope.generatPwd = function(val){
		if(val === 'autoPwd'){
			var randomstring = Math.random().toString(36).slice(-8).toUpperCase();
			$scope.userPassword = randomstring;
		}else{
			$scope.userPassword = "";
		}
	}

	$scope.getUserDets = function(val){
		$scope.UserID = val;
		if(val.id != undefined || val.id != ""){
			
					sentiOrg.getusrDetls($scope.UserID.id).success(function(response){
						//alert(JSON.stringify(response));
						$scope.userDetls = response.results;
						//console.log(response);
						if(response.status != "failure") {
							$scope.usrGroup = $scope.userDetls.groups;
							$scope.usrRoles = $scope.userDetls.roles;
							$scope.usrDirFunctn = $scope.userDetls.directFunction;
							$scope.userDetails = true;							
						}
						else {
							alert(response.message);
						}
					})

		}
	}



	$scope.addDirFunc = function(funId){
		//alert($scope.UserID.id);
		sentiOrg.addFuncToUser($scope.UserID.id, funId).success(function(data){
			//alert(JSON.stringify(data));
			if(data.status == "success"){
				$scope.selectdFninUser = "";
				$scope.getUserList($scope.orgDetails.id);
				$scope.getUserDets($scope.UserID);
				jQuery('#createfunction').modal('hide');
			}
			else{
				$scope.errorShw = true;
				$scope.errorMs = data.message;
				$timeout(function(){
					$scope.errorShw = false;
					$scope.errorMs = "";
				},3000)
			}

		})
	}

	$scope.addGroupToUSr = function(grpId){
		sentiOrg.addGropToUsr($scope.UserID.id, grpId).success(function(data){
			if(data.status == "success"){
				$scope.selectdGrpinUsr = "";
				$scope.getUserList($scope.orgDetails.id);
				$scope.getUserDets($scope.UserID);
				jQuery('#creategroup').modal('hide');
			}
			if(data.status == "failure"){
				$scope.errorShw = true;
				$scope.errorMs = data.message;
				$timeout(function(){
					$scope.errorShw = false;
					$scope.errorMs = "";
				},3000)
			}

		})
	}
	$scope.addRoleToUSr = function(roleId){
		sentiOrg.addRoleToUser($scope.UserID.id, roleId).success(function(data){
			if(data.status == "success"){
				$scope.selectdRolinUsr = "";
				$scope.getUserList($scope.orgDetails.id);
				$scope.getUserDets($scope.UserID);
				jQuery('#createrole').modal('hide');
			}
			else{
				$scope.errorShw = true;
				$scope.errorMs = data.message;
				$timeout(function(){
					$scope.errorShw = false;
					$scope.errorMs = "";
				},3000)
			}
		})
	}

	jQuery(document).on("click", ".delePopId", function () {
	     $scope.deleteMe = jQuery(this).data('id');
	});

	$scope.deleteThisId = function(id){
		sentiOrg.removefunToUsr(id).success(function(reponse){
			$timeout(function(){
				//$scope.getUserList($scope.orgDetails.id);
				$scope.getUserDets($scope.UserID);
				jQuery('#deleteUsrPgg').modal('hide');
			})
		})
	}

	$scope.removeGrptoUsr = function(id){
		
		sentiOrg.removeGroupToUser(id).success(function(reponse){
			$timeout(function(){
				$scope.getUserList($scope.orgDetails.id);
				$scope.getUserDets($scope.UserID);
				jQuery('#deletegrpPgg').modal('hide');
			},500)
		})
	}
	$scope.removeRoleFrmUsr = function(id){
		sentiOrg.removeRoleFrmUsr(id).success(function(reponse){
			$timeout(function(){
				$scope.getUserList($scope.orgDetails.id);
				$scope.getUserDets($scope.UserID);
				jQuery('#deleteRolePgg').modal('hide');
			},500)
		})
	}

	$scope.confirmPwd = function(oldPwd, newPwd){
	
		var code = {
				"id"			:	$scope.UserID.id,
			    "oldPassword"	: 	oldPwd,
			    "newPassword"	: 	newPwd
		}

		sentiOrg.changePwd(code).success(function(resp){
			//alert(JSON.stringify(resp));
			if(resp.status == "success"){
				$scope.successMsg = 'Password Changed Successfully !!';
				$scope.newPassCode =  $scope.confirmPassCode = $scope.oldPassCode ="";
				$scope.sucsMsg = true;
				$timeout(function(){
					$scope.sucsMsg = false;
				},2000)

			}else{
 				$scope.errorShow = true;
 				$scope.responseMsg  = resp.message;
 				$timeout(function(){
					$scope.errorShow = false;
					$scope.newPassCode =  $scope.confirmPassCode = $scope.oldPassCode ="";
				},2000)
 			}
		})
	}

	$scope.cancelUsr = function(){
		$scope.userName = "";
		$scope.passwordType = "";
		$scope.userPassword = "";
		$scope.userSignin = "";
		$scope.errorShow = false;
		$scope.formValidate = false;
	}

	$scope.disableRepeat = function(name){
		for(var k in $scope.usrDirFunctn){
			if(name === $scope.userDetls.directFunction[k].value){
				return true
			}
		}
	}
	$scope.disableRole = function(name){
		for(var k in $scope.usrRoles){
			if(name === $scope.usrRoles[k].value){
				return true
			}
		}
	}
	$scope.disableGroup = function(name){
		for(var k in $scope.usrGroup){
			if(name === $scope.usrGroup[k].value){
				return true
			}
		}
	}
	
	$scope.loadGroupDropdown=function(){
		sentiOrg.getGroupDetails($scope.orgDetails.id).success(function(data){
			$scope.groupDatas=data.result;
		});
	}
	
	$scope.loadRoleDropdown=function(){
		sentiOrg.getRoleDetails($scope.orgDetails.id).success(function(data){
			$scope.roleDatas=data.results;
		});
	}
	$scope.loadFunctionDropdown=function(){
		sentiOrg.getOrgAssignFunctionList($localStorage.orgDatum.id).success(function(data){
			$scope.functionDatas=data.result;
		});
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

	
	jQuery('#topMenu').css("display", "block");
});

