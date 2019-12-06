
app.controller('setPassController',function($window, $scope, $timeout, $localStorage, $http){
	
	$scope.passwordRequired = false;
	$scope.confirmPasswordRequired = false;
	$scope.notMatching = false;
	$scope.showLoginBtn = false;
	$scope.resultMessage = "";
	$scope.isclicked = false;
	
	console.log(window.location.href);
	$scope.tokenUrl = "";
	
	
	$scope.pwdObj = {
		"password" : "",
		"confirmpassword" : ""
	}
	
	$scope.clearPasswords = function(){
		$scope.pwdObj = {
				"password" : "",
				"confirmpassword" : ""
			};
	};
	
	
	$scope.resetNewPassword = function(){
		$scope.patternNotMatch=false;
		var strongPasswordRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
		
		$scope.tokenUrl = (window.location.href).split("?")[1];
		
		if ($scope.pwdObj.password == undefined || $scope.pwdObj.password == null || $scope.pwdObj.password == ""){
			$scope.passwordRequired = true;
		}
		else{
			$scope.passwordRequired = false;
			
		}
		
		
		if ($scope.pwdObj.confirmpassword == undefined || $scope.pwdObj.confirmpassword == null || $scope.pwdObj.confirmpassword == ""){
			$scope.confirmPasswordRequired = true;
		}
		else{
			$scope.confirmPasswordRequired = false;
		}
		
		if ($scope.pwdObj.password != $scope.pwdObj.confirmpassword){
			$scope.notMatching = true;
		}
		else{
			$scope.notMatching = false;
		}
		
		if (!$scope.passwordRequired && !$scope.confirmPasswordRequired && !$scope.notMatching){
			
			if(!strongPasswordRegex.test($scope.pwdObj.password)) {
				$scope.patternNotMatch=true;
			}else{
				$scope.submitNewPassword();
			}
			
		}
	};
	
	
	$scope.submitNewPassword = function(){
		
//		$scope.tokenUrl = "$pbkdf2-sha256$29000$O4cQAiBEyBkDYExJ6f0/hw$AoMjomW2hYwZJK85k/vTPu0T/dC97tsMtm2aRN8FZKo";
//		$scope.tokenUrl = "$pbkdf2-sha256$29000$pFTK.R9j7P3fmxOCEILQ2g$ux09LUKfgqSAGZQKpHUIdJHFtDAKtUyKGwHTCxSiF5Q";
		$scope.isclicked = true;
		$http({
	        url: SET_PASSWORD,
	        method: "POST",
	        data : {"token":$scope.tokenUrl, "password":$scope.pwdObj.password}
	    }).then(function(response) {
	    	$scope.isclicked = false;
	    	if ('errorMessage' in  response.data){
	    		$scope.resultMessage = "Invalid token or token is missing.";
	    		$scope.showLoginBtn = false;
	    	}
	    	else{
	    		$scope.resultMessage = response.data.message;
	    		$scope.showLoginBtn = true;
	    	}
    		console.log(response);
	    	$scope.clearPasswords();
	    	
	    	jQuery('#resultModal').modal('show');
	    	
	    });
	}
	
	
	$scope.gotoLogin=function(){
		
		location.href="login";
	}
	
	
});

