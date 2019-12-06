
app.controller('listUser', function($window, $scope, $rootScope, $localStorage, $http, sentiOrg, $timeout) {
	$scope.loader = true;
	$scope.uAccess=$localStorage.uAccess;
	$scope.editOrg2 = false;
	$scope.showDeletedList=false;
	
	$scope.loginUserId = USR_ID;
	
	$scope.showSuccess = false;
	$scope.successMessage = '';
	$scope.showError = false;
	$scope.errorMessage = '';
	
	$scope.minLenError = false;

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
	
	$scope.currentUserApiKey = "";
	
	if($localStorage.orgDatum != ""){	
		var dar = $localStorage.orgDatum;
		sentiOrg.getOrgtznDetails(dar.id).success(function(resp){
			$scope.orgDetails = resp.result;
			//console.log($localStorage.orgDatum);
			$scope.currentUserApiKey = $scope.orgDetails.apikey;
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
	
	var strongPasswordRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
	$scope.passwordStrong = true;
	$scope.Email_password_dif = true;
	
	$scope.checkPasswordStrong = function() {
		console.log($scope.userPassword);
		$scope.passwordStrong = strongPasswordRegex.test($scope.userPassword);
		
		if( !$scope.passwordStrong) {
			$scope.formValidate = true;
		}
		
		console.log($scope.passwordStrong );
	}
	
	$scope.oldPassCode = '';
	
	$scope.checkPasswordStrong1 = function() {
		$scope.disableForCustomPwd = false;
		console.log($scope.oldPassCode);
		document.getElementById('showText').value = $scope.oldPassCode;
		$scope.passwordStrong = strongPasswordRegex.test($scope.oldPassCode);
		console.log($scope.passwordStrong);
//		if( !$scope.passwordStrong) {
//			$scope.formValidate = true;
//		}
		
		/*console.log($scope.passwordStrong );*/
	}
	
	
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
		
		$scope.passwordStrong = strongPasswordRegex.test($scope.userPassword);

		if (($scope.userName == undefined || $scope.userName == "") ||
				($scope.userPassword == undefined || $scope.userPassword == "")) {
			$scope.formValidate = true;
		}else if ($scope.userName.length<5){
			$scope.minLenError = true;
		}else if(!$scope.passwordStrong) {
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
					$scope.minLenError = false;
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
		console.log(res);
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
		
		var totalCountExcpt_Rootusr = 0;  
	  
	    var count = 0;
		if(!$scope.showDeletedList){
			angular.forEach($scope.UserDatas, function(value) {
				
				if (value.rootUser=="yes"){
					totalCountExcpt_Rootusr++;
				}
				
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
		
		if (count + totalCountExcpt_Rootusr == $scope.UserDatas.length){
			$('#checkboxall').prop('checked', true);
		}else{
			$('#checkboxall').prop('checked', false);
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
			$('#checkboxall').prop('checked', false);
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
			$('#checkboxall').prop('checked', false);
			$scope.advSpan=false;
			$scope.getDeletedUserList($scope.orgDetails.id);
			$scope.getUserList($scope.orgDetails.id);
			
		}, 
		function(response) { // optional
			console.log(response);
			
		});
		
		
	}

	$scope.generatPwd = function(val){
		/*
		if(val === 'autoPwd'){
			var randomstring = Math.random().toString(36).slice(-8).toUpperCase();
			$scope.userPassword = randomstring;
		}else{
			$scope.userPassword = "";
		}
		
		*/
		
		if(val === 'autoPwd'){
			//var randomstring = Math.random().toString(36).slice(-8).toUpperCase();
			var len = 8;
			var length = (len)?(len):(10);
            var string = "abcdefghijklmnopqrstuvwxyz"; //to upper 
            var numeric = '0123456789';
            var punctuation = '!@#$%^&*()_+~`|}{[]\:;?><,./-=';
            var password = "";
            var character = "";
            var crunch = true;
            while( password.length<length ) {
                entity1 = Math.ceil(string.length * Math.random()*Math.random());
                entity2 = Math.ceil(numeric.length * Math.random()*Math.random());
                entity3 = Math.ceil(punctuation.length * Math.random()*Math.random());
                hold = string.charAt( entity1 );
                hold = (password.length%2==0)?(hold.toUpperCase()):(hold);
                character += hold;
                character += numeric.charAt( entity2 );
                character += punctuation.charAt( entity3 );
                password = character;
            }
            password=password.split('').sort(function(){return 0.5-Math.random()}).join('');
            $scope.userPassword = password.substr(0,len);
            $scope.checkPasswordStrong();
            
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

	
	$scope.checkBxForMail = 'NO';
	$scope.ischecked = function(val){
		if (val){
			$scope.checkBxForMail = 'YES';
		}else{
			$scope.checkBxForMail = 'NO';
		}
	}
	
    $scope.disableForCustomPwd = false;
	
	$scope.confirmPwd2 = function(oldPwd, newPwd){
		
		var data = {'userName' : $scope.orgDetails.userName,
					'userId': $scope.UserID.id,
					'password': oldPwd,
					'emailAddress': $scope.orgDetails.email,
					'clientId':$scope.orgDetails.clientid,
					'checkBox': $scope.checkBxForMail
		}
		console.log(strongPasswordRegex.test(oldPwd));
		console.log(!(strongPasswordRegex.test(oldPwd)));
		console.log(data);
		
		if (strongPasswordRegex.test(oldPwd)){
			$http({
				url : RESET_PASSWORD_EMAIL,
				method : 'POST',
				headers : {'x-api-key': API_USER_KEY},
				contentType : 'application/json',
				data : data
				}).then(function(response) {
					console.log(response);
					if (response.data.status == "success"){
						document.getElementById('showText').value = '';
						$scope.showSuccess = true;
						$scope.successMessage = response.data.message;
					}
					else{
						$scope.showError = true;
						$scope.errorMessage = response.data.message;
					}
					$timeout(function(){
						$scope.showSuccess = false;
						$scope.successMessage = '';
						$scope.showError = false;
						$scope.errorMessage = '';
						$scope.disabl = true;
						
					},3000)
					
			})
		}else{
			document.getElementById('showText').value = '';
			$scope.showError = true;
			$scope.disableForCustomPwd = true;
			$scope.errorMessage = 'Password must contain uppercase letter, number, special character.'
			$timeout(function(){
				$scope.showError = false;
				$scope.errorMessage = '';
			},3000)
		}
		
	}
	
	$scope.checkZerosts = function(len){
		if (len.length>0){
			$scope.disableForCustomPwd = false;
		}
		else{
			$scope.disableForCustomPwd = true;
		}
	}
	
	
	
	$scope.confirmPwd = function(oldPwd, newPwd){
		
		var code = {
//				"id"			:	$scope.UserID.id,
				"apikey"		:   $scope.currentUserApiKey, //$scope.userDetls.userApiKey,
			    "oldPassword"	: 	oldPwd,
			    "newPassword"	: 	newPwd
		}
		
		if(strongPasswordRegex.test(newPwd)) {
			$http({
				url : CHANGE_PASSWORD_URL,
				method : 'POST',
				headers : {'x-api-key': API_USER_KEY},
				contentType : 'application/json',
				data : code
				}).then(function(response) {
					console.log(response);
					if(response.data.status == "success"){
						$scope.successMsg = 'Password Changed Successfully !!';
//						$scope.newPassCode =  $scope.confirmPassCode = $scope.oldPassCode ="";
						document.getElementById('newPassCodeId').value='';
						document.getElementById('confirmPassCodeId').value='';
						document.getElementById('oldPassCodeId').value='';
						$scope.sucsMsg = true;
						$timeout(function(){
							$scope.sucsMsg = false;
						},5000)
		
					}else{
		 				$scope.errorShow = true;
		 				$scope.responseMsg  = response.data.message;
		 				$timeout(function(){
							$scope.errorShow = false;
//							$scope.newPassCode =  $scope.confirmPassCode = $scope.oldPassCode ="";
							document.getElementById('newPassCodeId').value='';
							document.getElementById('confirmPassCodeId').value='';
							document.getElementById('oldPassCodeId').value='';
						},5000)
		 			}
			})
			
			
			
		} else {
			$scope.errorShow = true;
			$scope.responseMsg  = "Password must contain at least 8 characters and mixture of alphanumeric characters with at least one or more special characters, numbers, upper and lower case";
			
			$timeout(function(){
			$scope.errorShow = false;
			},5000)
		}
	}
	
	
	$scope.cancelUsr = function(){
		$scope.passwordStrong = true;
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
	
	$scope.disabl = true;
	
	$scope.generatPwd2 = function(val){
		
		$scope.disabl = false;
		
		document.getElementById('showText').value = '';
		
		if (val === 'keepPwd'){
			document.getElementById('showText').value = '';
			$scope.disabl = true;
		}
		
		else if(val === 'autoPwd'){
			var len = 8;
			var length = (len)?(len):(10);
            var string = "abcdefghijklmnopqrstuvwxyz"; //to upper 
            var numeric = '0123456789';
            var punctuation = '!@#$%^&*()_+~`|}{[]\:;?><,./-=';
            var password = "";
            var character = "";
            var crunch = true;
            while( password.length<length ) {
                entity1 = Math.ceil(string.length * Math.random()*Math.random());
                entity2 = Math.ceil(numeric.length * Math.random()*Math.random());
                entity3 = Math.ceil(punctuation.length * Math.random()*Math.random());
                hold = string.charAt( entity1 );
                hold = (password.length%2==0)?(hold.toUpperCase()):(hold);
                character += hold;
                character += numeric.charAt( entity2 );
                character += punctuation.charAt( entity3 );
                password = character;
            }
            password=password.split('').sort(function(){return 0.5-Math.random()}).join('');
            $scope.oldPassCode = password.substr(0,len);
            $scope.checkPasswordStrong1();
            
		}
		else{
			document.getElementById('showText').value = '';
			$scope.oldPassCode = "";
		}
	}
	

	$scope.clear = function (val) {
        document.getElementById('showText').value = '';
        $scope.showError = false;
        $scope.showSuccess = false;
        $scope.successMessage = '';
		$scope.errorMessage = '';
    };
    
    $scope.checkMinLen = function(val){
		if (val.length<=5){
			$scope.minLenError = true;
		}else{
			$scope.minLenError = false;
		}
		
	}
	
	
	
	jQuery('#topMenu').css("display", "block");
});

