
app.controller('listUser', function($window, $scope, $rootScope, $localStorage, $http, sentiOrg, $timeout) {
	$scope.loader = true;
	$scope.uAccess=$localStorage.uAccess;
	$scope.loginUserId = USR_ID;
	
	
	$scope.newPassCode = '';
	$scope.confirmPassCode = '';
	$scope.oldPassCode = '';
	$scope.formSecurity = false;

	
	$scope.currentUserApiKey = "";
	
	if($localStorage.orgDatum != ""){	
		var dar = $localStorage.orgDatum;
		sentiOrg.getOrgtznDetails(ORG_ID).success(function(resp){
			$scope.orgDetails = resp.result;
			$scope.currentUserApiKey = $scope.orgDetails.apikey; 
			console.log($scope.orgDetails);
		});
	}
	
	
	$scope.getUserDets = function(usrId){

		if(usrId != undefined || usrId != ""){
			sentiOrg.getusrDetls(usrId).success(function(response){
				console.log(response);
				$scope.userDetls = response.results;
				if(response.status != "failure") {
					$scope.usrGroup = $scope.userDetls.groups;
					$scope.usrRoles = $scope.userDetls.roles;
					$scope.usrDirFunctn = $scope.userDetls.directFunction;
					$scope.userDetails = true;
					$scope.loader = false;
				}
				else {
					alert(response.message);
				}
			})
		}
	}
	
	$scope.getUserDets($scope.loginUserId);
	
	

	/*-------------------- VALIDATING PASSWORD - REJAX  ------------------*/ 
	
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
	
	
	
	/*-------------------- SUBMIT - PASSWORD------------------*/ 
		$scope.confirmPwd = function(oldPwd, newPwd){
		
		if (newPwd != undefined && newPwd != ""){
				
			
			var code = {
					"apikey"		:   $scope.userDetls.userApiKey,
				    "oldPassword"	: 	oldPwd,
				    "newPassword"	: 	newPwd
			}
			console.log(code);
			
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
							$scope.newPassCode =  $scope.confirmPassCode = $scope.oldPassCode ="";
							$scope.sucsMsg = true;
							$timeout(function(){
								$scope.sucsMsg = false;
							},5000)
						}else{
			 				$scope.errorShow = true;
			 				$scope.responseMsg  = response.data.message;
			 				$timeout(function(){
								$scope.errorShow = false;
								$scope.newPassCode =  $scope.confirmPassCode = $scope.oldPassCode ="";
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
		}else{
			$scope.formSecurity = true;
		}
	}
	
	
	
	
	
	jQuery('#topMenu').css("display", "block");
});

