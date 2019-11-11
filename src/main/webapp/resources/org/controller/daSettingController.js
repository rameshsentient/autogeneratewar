
app.controller('daSettingController', function($localStorage, $window, $scope, $rootScope, $http, sentiOrg,$timeout,Upload,flexyFactry) {
	$scope.loadShow = true;
	$scope.uAccess=$localStorage.uAccess;
	$scope.editOrg2 = false;
	$scope.succesUpdat = false;
	
	$scope.tempOwnerId = 0;
	
	$scope.isHaveData = false;
	
	$scope.checkBoxVal = false;
	
	$scope.isSubmited = false;
	
	$scope.isCheckedBox = false;
	
	$scope.EmailRequired = false;

	$scope.startdateRequired = false;
	
	$scope.feeRequired = false;
	
	$scope.paymentdateRequired = false;
	
	$scope.durationRequired = false;
	
	$scope.commissionRequired = false;
	
	$scope.membertypeRequired = false;
	
	$scope.plantypeRequired = false; //
	
	$scope.isSdkEndpoint = false;
	
	$scope.isSdkHosting = false;
	
	$scope.previewButtonOk = false;
	
	  $http.get('./app-config-prop.json').then(function (response) {
//		  console.log(response)
	  });	
	
	$scope.setOrgEditMode = function() {
		$scope.editOrg2 = !$scope.editOrg2;
	}	
	
	var orgIsD = $localStorage.orgDatum.id;
	sentiOrg.getOrgtznDetails(orgIsD).success(function(resp){
		$scope.orgDetails = resp.result;
		 $localStorage.orgDatum = resp.result;
		
		})

		
	$scope.isChecked = function(chkBoxVal){
		
		if(chkBoxVal == true){
			$scope.isCheckedBox = true;
			$scope.daSetting.sdkEndpoint = "";
			$scope.isSdkEndpoint = false;
			$scope.isSdkHosting = false;
		
		}
		else{
			$scope.isCheckedBox = false;
			$scope.isSdkEndpoint = false;
			$scope.isSdkHosting = false;

		}
	};
		
	$scope.memberTypes = [];
	$scope.planTypes = [];
	$scope.daSetting = {
			"id" : 0,
			"ownerId" : OWNER_ORG_ID, 
			"orgId" : orgIsD,
			"commissionPercentage" : "",
			"commissionValue" : "",
			"inviteMemberEmail" : "",
			"memberType" : "CONSUMER_PROVIDER",
			"planType" : "", 
			"startDate" : "",
			"feePaid" : "",
			"paymentDate" : "",
			"durationMonth" : "",
			"sdkEndpoint" : "",
			"sdkHosting" : "",
			"createdBy" : currentLoginId
				
			};
	$scope.disableHttp = function(){
		if($scope.daSetting.sdkHosting == "Sentient"){
			$scope.daSetting.sdkEndpoint = "";
			$scope.onlyForBasic = true;
		}
		else{
			$scope.onlyForBasic = false;
		}
	};
	
	$scope.updateDaSetting = function() {
//		console.log($scope.daSetting);
		$scope.daSetting.startDate = $('#startdate').val();
		$scope.daSetting.durationMonth = $('#enddate').val()
		$scope.daSetting.paymentDate = $('#paymentdate').val();
		
		if ($scope.daSetting.startDate == undefined || $scope.daSetting.startDate == null || $scope.daSetting.startDate == ""){
			$scope.startdateRequired = true;
		}else{
			$scope.startdateRequired = false;
		}
		
		if ($scope.daSetting.feePaid == undefined || $scope.daSetting.feePaid == null || $scope.daSetting.feePaid == ""){
			$scope.feeRequired = true;
		}
		else{
			$scope.feeRequired = false;
		}

		
		if($scope.daSetting.sdkEndpoint == undefined || $scope.daSetting.sdkEndpoint == null || $scope.daSetting.sdkEndpoint == ""){
			$scope.isSdkEndpoint = true;
		}else{
			$scope.isSdkEndpoint = false;
		}
		//------------------------------------------------------------------------------
		
		if ($scope.daSetting.planType == undefined || $scope.daSetting.planType == null || $scope.daSetting.planType == ""){
			$scope.plantypeRequired = true;
//			$scope.previewButtonOk = false;
	}	else{
			$scope.plantypeRequired = false;
//			$scope.previewButtonOk = true;
	}


		if ($scope.daSetting.commissionPercentage == undefined || $scope.daSetting.commissionPercentage == null || $scope.daSetting.commissionPercentage == ""){
			$scope.commissionRequired = true;
		}else{
			$scope.commissionRequired = false;
		}
		
		if ($scope.daSetting.commissionValue == undefined || $scope.daSetting.commissionValue == null || $scope.daSetting.commissionValue == ""){
			$scope.commissionRequired = true;
		}else{
			$scope.commissionRequired = false;
		}
		
		
		
		if ($scope.daSetting.sdkHosting == ""){
			$scope.isSdkHosting = true;
		}else if ($scope.daSetting.sdkHosting == "Sentient"){
			$scope.daSetting.sdkEndpoint = "";
			$scope.isSdkHosting = false;
			$scope.isSdkEndpoint = false;
		}else if ($scope.daSetting.sdkHosting == "Custom"){
			console.log($scope.daSetting.sdkEndpoint);
			$scope.isSdkEndpoint = true;
			$scope.isSdkHosting = false;
			$scope.pattern = /^((http|https|ftp):\/\/)/;	
			
			if($scope.pattern.test($scope.daSetting.sdkEndpoint)) {
				$scope.isSdkEndpoint = false;
			}else{
				$scope.isSdkEndpoint = true;
			}
		};
		
		
		$scope.disablePayDate = function(param){
		if ($scope.daSetting.planType != "DA_PT_BASIC" && param == "No"){
			$scope.emptyDate = true;
			$scope.daSetting.paymentDate = "";
			$scope.paymentdateRequired = false;
		} else{
			$scope.emptyDate = false;
		}
		};
		if ($scope.daSetting.feePaid == "Yes"){
				$scope.emptyDate = false;
				$scope.paymentdateRequired = true;
				if ($scope.daSetting.paymentDate.length > 1){
					$scope.paymentdateRequired = false;
				}
				
			}
			

		if (!$scope.EmailRequired && !$scope.startdateRequired && !$scope.feeRequired && !$scope.previewButtonOk
				&& !$scope.durationRequired && !$scope.commissionRequired && !$scope.membertypeRequired && !$scope.plantypeRequired && 
				!$scope.isSdkEndpoint && !$scope.isSdkHosting && !$scope.paymentdateRequired){
			
			$scope.updateDaSetting1();           
			console.log($scope.daSetting);
		}
		
	}
	
	
	$scope.updateDaSetting1 = function() {
		
		$scope.isSubmited = true;
		
		if ($scope.daSetting.commissionPercentage == undefined || $scope.daSetting.commissionPercentage == ""){
			$scope.daSetting.commissionPercentage = "15.00"; 
		}
		
		if ($scope.daSetting.commissionValue == undefined || $scope.daSetting.commissionValue == ""){
			$scope.daSetting.commissionValue = "200";
		}
//		console.log($scope.daSetting);
		
		$http({
			
			url : API_ADD_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : $scope.daSetting
			}).then(function(response) {
				console.log(response);
				$scope.isSubmited = false;
				$scope.succesUpdat = true;
				$scope.clearAll();
				$scope.getDaSetting();
				
			})
	}


	$scope.clearAll = function(){
		$scope.daSetting = {
        "id" : 0,
		"ownerId" : $scope.tempOwnerId, 
		"orgId" : orgIsD,
		"commissionPercentage" : "",
		"commissionValue" : "",
		"inviteMemberEmail" : "",
		"memberType" : "",
		"planType" : "",
		"startDate" : "",
		"feePaid" : "",
		"paymentDate" : "",
		"durationMonth" : "",
		"sdkEndpoint" : "",
		"sdkHosting" : "",
		"createdBy" : currentLoginId
		}
		$scope.isCheckedBox = false;
		$scope.EmailRequired = false;
		$scope.startdateRequired = false;
		$scope.feeRequired = false;
		$scope.paymentdateRequired = false;
		$scope.durationRequired = false;
		$scope.commissionRequired = false;
		$scope.membertypeRequired = false;
		$scope.plantypeRequired = false;
		$scope.isSdkEndpoint = false;
		$scope.isSdkHosting = false;
		
		$timeout(function(){
			$scope.succesUpdat = false;			
		},2000);
		
	};
	
	$scope.getDaSetting = function() {
		$http({
			
			url : API_GET_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":orgIsD}
			}).then(function(response) {
				console.log(JSON.stringify(response));
				if(response.data.result.id == undefined){
					$scope.isHaveData = false;
				}
				else {
					$scope.isHaveData = true;
					$scope.daSetting = response.data.result;
				}
				
			})
	}
	
	$scope.getDaSetting();
	
	$scope.memberTypes = [];
	$scope.planTypes = [];
	
	$scope.getMemberTypes = function(type){
		
		$http ({
    		url : 'getFlexyList?code='+type,
    		method : 'GET'
    	}).then(function(response) {
    		if(type=='DA_MEMBER_TYPE'){
    		$scope.memberTypes = response.data.result;
    		}
    		else{
    		$scope.planTypes = response.data.result;
    		}
    	})
		
	};
	
	$scope.getMemberTypes("DA_MEMBER_TYPE");
	$scope.getMemberTypes("DA_PLANTYPE");

	$scope.isPaid = ['Yes','No'];
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1; //January is 0!
	var yyyy = today.getFullYear();
	if (dd < 10) {
	  dd = '0' + dd;
	} 
	if (mm < 10) {
	  mm = '0' + mm;
	} 
	var today = yyyy + '-' + mm + '-' + dd;
	
	$scope.setCurrentDate = today;
	
	var dateString = today;
	var curDate = new Date(dateString);
	var nextMonth = new Date(curDate.getFullYear(), curDate.getMonth() + 1, curDate.getDate());
	$scope.nextMonthDate = moment(nextMonth).format('YYYY-MM-DD');
	var nextThreeMonth = new Date(curDate.getFullYear(),curDate.getMonth() + 3,curDate.getDate());
	$scope.nextThreeMonthDate = moment(nextThreeMonth).format('YYYY-MM-DD');
	var next12Month = new Date(curDate.getFullYear(), curDate.getMonth() + 12, curDate.getDate());
	$scope.next12MonthDate = moment(next12Month).format('YYYY-MM-DD');
	var next15Month = new Date(curDate.getFullYear(), curDate.getMonth() + 15, curDate.getDate());
	$scope.next15MonthDate = moment(next15Month).format('YYYY-MM-DD');
	
	
	$scope.getPlanStatus= function(status){
		if($scope.daSetting.planType == "DA_PT_BASIC"){
			$scope.daSetting.startDate = $scope.setCurrentDate;
			$scope.daSetting.durationMonth = "";
			$scope.durationRequired = false;
			$scope.onlyForBasic = true;
			$scope.daSetting.commissionValue = "0";
			$scope.daSetting.commissionPercentage = "0";
			$scope.daSetting.feePaid = "No";
			$scope.daSetting.paymentDate = $scope.setCurrentDate;
			$scope.daSetting.sdkHosting = "Sentient";
			if ($scope.daSetting.sdkHosting == "Sentient"){
				$scope.daSetting.sdkEndpoint = "";
			}else{
				$scope.daSetting.sdkEndpoint = "";
			}

			$scope.isSdkHosting = false;
			$scope.isSdkEndpoint = false;
			$scope.paymentdateRequired = false;
		}
		else if ($scope.daSetting.planType == "DA_PT_STARTER"){
			$scope.daSetting.startDate = $scope.setCurrentDate;
			$scope.daSetting.durationMonth = $scope.nextThreeMonthDate;
			$scope.daSetting.commissionValue = "200";
			$scope.daSetting.commissionPercentage = "15.00";
			$scope.daSetting.feePaid = "";
			$scope.daSetting.paymentDate = "";
			$scope.daSetting.sdkHosting = "";
			$scope.daSetting.sdkEndpoint = "";
			$scope.onlyForBasic = false;
			
		}
		else if ($scope.daSetting.planType == "DA_PT_PREMIER"){
			$scope.daSetting.startDate = $scope.setCurrentDate;
			$scope.daSetting.durationMonth = $scope.next12MonthDate;
			$scope.daSetting.commissionValue = "200";
			$scope.daSetting.commissionPercentage = "15.00";
			$scope.daSetting.feePaid = "";
			$scope.daSetting.paymentDate = "";
			$scope.daSetting.sdkHosting = "";
			$scope.daSetting.sdkEndpoint = "";
			$scope.onlyForBasic = false;
			
		}
		else if ($scope.daSetting.planType == "DA_PT_PIONEER"){
			$scope.daSetting.startDate = $scope.setCurrentDate;
			$scope.daSetting.durationMonth = $scope.next15MonthDate;
			$scope.daSetting.commissionValue = "200";
			$scope.daSetting.commissionPercentage = "15.00";
			$scope.daSetting.feePaid = "";
			$scope.daSetting.paymentDate = "";
			$scope.daSetting.sdkHosting = "";
			$scope.daSetting.sdkEndpoint = "";
			$scope.onlyForBasic = false;
		}
        else{
			$scope.clearAll();	
		}
	};



	jQuery('#topMenu').css("display", "block");
});
