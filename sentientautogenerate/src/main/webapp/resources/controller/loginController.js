
var app = angular.module("loginApp", ['ngStorage']); 
app.controller('longCtrl',function($window,$scope,$http, $timeout, $localStorage){
	$window.localStorage.clear();
	 
	$scope.checkadmin = "";
	$scope.isAdmin = "";
	$scope.clientId = "";
	$scope.email = "";
	$scope.errorMsg = "";
	$scope.showErrorMsg = false;
	
	
	$scope.enableAndDisable = function(eProp, dProp){
		window.document.getElementById(eProp).style.display = 'block';
		window.document.getElementById(dProp).style.display = 'none';
	}
	
	
	
	$scope.changeCssprop = function(eleId, Prop){
		console.log(eleId, Prop);
		$scope.checkadmin = "";
		if (eleId == 'login'){
			$scope.enableAndDisable('admin-Qstn', eleId);
			$scope.checkadmin = "";
		}
		else if (eleId == 'if-No' && Prop=='tologin'){
			$scope.enableAndDisable('login', eleId);
		}
		/*else if (eleId == 'if-No' && Prop=='yes'){
			$scope.checkadmin = "yes";
			$scope.enableAndDisable('admin-Qstn', eleId);
		}*/
		else if (eleId == 'admin-Qstn' && Prop == 'Yes'){
			$scope.enableAndDisable('if-yes', eleId);
		}
		else if (eleId == 'admin-Qstn' && Prop == 'No'){
			$scope.enableAndDisable('if-No', eleId);
		}
		
		else if (eleId == 'if-yes' && Prop == ''){
			$scope.sendMailtoResetPasswrd('email-send', eleId);
		}
		else if ((eleId =='email-send' || eleId =='admin-Qstn' || eleId == 'if-yes') && Prop == 'gologin'){
			$scope.enableAndDisable('login', eleId);
		}
	}
	
	
	$scope.sendMailtoResetPasswrd = function(eId, dId){

		var data = {'emailAddress': $scope.email,
					'clientId':$scope.clientId,
					'forgotKey' : ''
					}
		console.log(data);
		
		$http({
			url : RESET_PASSWORD_EMAIL,
			method : 'POST',
			headers : {'x-api-key': API_USER_KEY},
			contentType : 'application/json',
			data : data
			}).then(function(response) {
				console.log(response);
				if (response.data.message == "Email sent successfully"){
					$scope.enableAndDisable(eId, dId);
					$scope.clientId = "";
					$scope.email = "";
				}
				else{
					$scope.errorMsg = response.data.message;
					$scope.showErrorMsg = true;
				}
				
			})
		
	}
	
	
});

