app.controller('creditExpiryCtrl',function($scope, $timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	console.log('ORG_ID',ORG_ID);
	$scope.isSuperAdmin = false;
	
	
	$scope.orgNam = ORG_NAME;
	
	if(ORG_ID == 1) {
		$scope.isSuperAdmin = true;
	}
	$scope.organisationId = ORG_ID;
	
	$scope.selectedORGName = ""; //ORG_NAME
	
	$scope.loadeer = true;
	
	
	$scope.acId = 0;
	
	$scope.activeRecords = [];

	$scope.expiryRecords = [];
	
	$scope.accountData = [];
	
	$scope.itemRequired = true;
	$scope.creditRequired = true;
	$scope.descriptionRequired = true;
	
	$scope.creditFound = true;
	$scope.creditDescpFound = true;
	$scope.itemFound = true;
	
	$scope.showbtn = false;
	
//	$scope.dropDownOrgId = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	
	$scope.creditAmount = "";
	
	$scope.creditDescription = "";
	
	$scope.itemsCreditExp = [];
	
	$scope.itemJson = {};
	
	
	$scope.getItemsList = function(){
		
		$http ({
    		url : 'getFlexyList?code=CREDIT_EXPIRY_ITME_LIST',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.itemsCreditExp = response.data.result;
    		console.log('$scope.itemsCreditExp');
    		console.log($scope.itemsCreditExp);
    		console.log('$scope.itemsCreditExp');
    		for (var i=0; i<$scope.itemsCreditExp.length; i++){
    			$scope.itemJson[$scope.itemsCreditExp[i].code] = $scope.itemsCreditExp[i];
    		}
    	})
    		
	};
	
	$scope.getItemsList();
	
	$scope.creditTypesList = [];
	$scope.getCreditTypesList = function(){
		$http ({
    		url : 'getFlexyList?code=CREDIT_TYPE',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.creditTypesList = response.data.result;
    		console.log($scope.itemsCreditExp);
    	})
    };
	
	$scope.getCreditTypesList();
	
	
	
	// SHOW POPUP FOR ADD CREDIT
	$scope.addCredit = function(){
		$scope.clearFileds();
		$scope.creditExpirySettings.expiryDate = null;
		
//	    $('#expiryDateId').val("").datepicker("update");

		jQuery('#addCreditModal').modal('show');
	}
	
	$scope.clearFileds = function(){
		$scope.creditExpirySettings = {
			"id":"",
			"orgId":ORG_ID,
			"acId":"",
			"expiryDate":"",
			"description":"",
			"credit":"",
			"reCredit":0,
			"priority":0,
			"status":"A",
			"orgName" :ORG_NAME,
			"creditType" : "",
			"startDate" : ""
		}
		$scope.creditAmountReq = false;
//		$scope.priorityReq = false;
		$scope.credTypList = false;
		$scope.formValidation = false;
	}

	$scope.clearFileds();
	
	$scope.getAccountData = function() {
		
		//alert(API_ENDPOINT_ORG_ACCOUNT_LIST);
		
		$http({
			url : API_ENDPOINT_ORG_ACCOUNT_LIST,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":ORG_ID}
			}).then(function(response) {
				$scope.loadeer = false;
				console.log(response);
				if (response.data.result){
					console.log(response.data.result);
					$scope.accountData = response.data.result;
					console.log('$scope.accountData');
					console.log($scope.accountData);
					console.log('$scope.accountData');
					
					
					if($scope.accountData.length > 0){
						$scope.acId = $scope.accountData[0].id+"";
						$scope.getListOfExpiryCredit();
					}
				}
				else{
					console.log('not found');
//					$scope.loadeer = false;
				}
				
		})
		
	}
	
	$scope.orgList = [];
	$scope.vals = []
    $scope.gettAllOrgAccountInfo = function() {
		
		$http({
			url : API_ENDPOINT_ORG_ALL_ACCOUNT_LIST,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json'
			}).then(function(response) {
				console.log(response);
				//$scope.loadeer = false;
				if (response.data){
					
					//console.log(response.data.result);
					$scope.vals = response.data.result;
					for(i=0; i < $scope.vals.length; i++){
						var isFound = false;
						for(j=0; j < $scope.orgList.length; j++){
							if($scope.orgList[j].orgId == $scope.vals[i].orgId){
								isFound = true;
								break;
							}
						}
				        if(!isFound) {
				        	$scope.orgList.push({"orgId":$scope.vals[i].orgId,"orgName":$scope.vals[i].orgName});
				        }
				    }
				    $scope.organisationId = $scope.orgList[0].orgId+"";
				    $scope.setAccountData($scope.organisationId);
				}
				else{
					console.log('not found');
					$scope.loadeer = false;
				}
				$scope.getCurrentOrgInfo();
		})
		
	}
	
	
	$scope.setAccountData = function(selectedOrgId) {
		$scope.organisationId = selectedOrgId;
		$scope.accountData = [];
		$scope.accountDataId = "";
		for(var index=0; index < $scope.vals.length; index ++){
			if($scope.vals[index].orgId == selectedOrgId && $scope.vals[index].acType == "Spending"){
				$scope.accountData.push($scope.vals[index]);
				$scope.accountDataId = $scope.accountData[0];
				
				console.log('$scope.accountData----');
				console.log($scope.accountDataId);
				console.log('$scope.accountData----');
				$scope.selectedORGName = $scope.vals[index].orgName;
			}
		}
		
		$scope.org_Id = $scope.accountData[0].orgId+"";
		$scope.acId = $scope.accountData[0].id+"";
		console.log('$scope.acId');
		console.log($scope.acId);
		console.log($scope.accountData);
		
//		$scope.creditExpirySettings.orgId = $scope.accountData[0].orgId;
//		$scope.dropDownOrgId = $scope.accountData[0].orgId;
		console.log('$scope.acId');
		$scope.getListOfExpiryCredit();
	}
	
	
	if(ORG_ID == 1) {
		$scope.gettAllOrgAccountInfo();
	}
	else {
		$scope.getAccountData();
	}
	
	$scope.customDateFormat = function(dateString){
		  //console.log(dateString);
		  if (dateString){
			  var neDateTimeArr = dateString.split(' ') 
			  var newDateFormat = neDateTimeArr[0].split("-");
			  return newDateFormat[2]+"-"+newDateFormat[1]+"-"+newDateFormat[0] +" "+ neDateTimeArr[1];
		  }
	  };
	
	
	$scope.setOneYearForExpiry = function(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();
		month = month + 1;
		if (month < 10) {
		    month = "0" + month;
		} 
		var day = date.getDate();
		if (day < 10) {
		    day = "0" + day;
		} 
		return (year + 1 + '-' + month + '-' + day); 
	}
	  
	// ADD CREDIT API ------------
	$scope.updateCreditExpiry = function(){
		$scope.creditExpirySettings.expiryDate = $('#expiryDateId').val();
		
		if ($scope.creditExpirySettings.credit == undefined || $scope.creditExpirySettings.credit == null || $scope.creditExpirySettings.credit == ""){
			$scope.formValidation = true;
		}
		
		/*if ($scope.creditExpirySettings.priority == undefined || $scope.creditExpirySettings.priority == null || $scope.creditExpirySettings.priority == ""){
			$scope.priorityReq = true;
			$scope.Isvalidated = false;
		}*/

		if ($scope.creditExpirySettings.creditType == undefined || $scope.creditExpirySettings.creditType == null || $scope.creditExpirySettings.creditType == ""){
			$scope.formValidation = true;
		}

		if ($scope.creditExpirySettings.expiryDate == undefined || $scope.creditExpirySettings.expiryDate == null || $scope.creditExpirySettings.expiryDate == ""){
			$scope.creditExpirySettings.expiryDate = $scope.setOneYearForExpiry();
		}
		
		for (var i=0; i < $scope.accountData.length; i++){
			if  ($scope.accountData[i].acType == "Spending"){
				$scope.creditExpirySettings.acId = $scope.accountData[i].id;
				$scope.creditExpirySettings.orgId = $scope.accountData[i].orgId;
				/*alert($scope.creditExpirySettings.orgId);*/
				
			}
		}
		
		/*if (!($scope.dropDownOrgId == "")){
			$scope.creditExpirySettings.orgId = $scope.dropDownOrgId;
		}*/
		
		
		if (!$scope.formValidation){
			$scope.loadeer = true;
			$scope.creditExpirySettings.reCredit = $scope.creditExpirySettings.credit;
			console.log($scope.creditExpirySettings);
			jQuery('#addCreditModal').modal('hide');
			$scope.updateApi();
		}
		
//		$scope.itemTableSort();
		
	}
	
	$scope.accId = "";
	$scope.data1 = {"credits":$scope.activeRecords};
	
	$scope.updateApi = function(){
		
		$scope.data2 =  {"credits":[$scope.creditExpirySettings]}
		/*console.log($scope.data1)
		console.log($scope.data2)*/
		
		$http({
			url : UPDATE_CREDIT_EXPIRY,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"credits":[$scope.creditExpirySettings]}
			}).then(function(response) {
				
				console.log(response);
				$scope.clearFileds();
				$scope.creditExpirySettings.acId = "";
				$scope.creditExpirySettings.orgId = "";
//				$scope.dropDownOrgId = "";
				$scope.getListOfExpiryCredit();
		})
	}

	
	$scope.activeRecordsForCompare = [];

	$scope.getListOfExpiryCredit = function() {
		$scope.loadeer = true;		
		$scope.showbtn = false;
		var tempOrgId = ORG_ID;
		if($scope.isSuperAdmin){
			tempOrgId = $scope.organisationId;
		}
		
		var Org_Id = "";
		
		for (var i=0; i < $scope.accountData.length; i++){
			if  ($scope.accountData[i].acType == "Spending"){
				$scope.accId = $scope.accountData[i].id;
				Org_Id = $scope.accountData[i].orgId;
				console.log('++++++++')
				console.log($scope.accountData[i]);
				console.log('========')
			}
		}
		
		
		var data22 = {"orgId":Org_Id+"","acId":$scope.accId+""}
		console.log('data22');
		console.log(data22);
		console.log('data22');
		if (Org_Id == undefined || Org_Id == ""){
			Org_Id = ORG_ID;
		}
		
		$http({
			url : LIST_CREDIT_EXPIRY,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
		    data : {"orgId":Org_Id+"","acId":$scope.accId+""}
			}).then(function(response) {
				if (response.data){
					$scope.loadeer = false;
					console.log(response.data);
					console.log('-----');
					if (response.data.results != undefined && response.data.results.activecredits != undefined){
						$scope.activeRecords = response.data.results.activecredits;
						$scope.activeRecordsForCompare = angular.copy($scope.activeRecords);
					}
					if (response.data.results != undefined && response.data.results.expirycredits != undefined){
						$scope.expiryRecords = response.data.results.expirycredits;
					}
					
					console.log('--')
					console.log($scope.activeRecordsForCompare)
				}
		})
	};
	
	
	$scope.isActive = true;
	
	$scope.ActiveOrExpiryBtn = function(btnStatus){
		if (btnStatus == 'E'){
			$scope.isActive = false;
		}
		else{
			$scope.isActive = true;
		}
	}

	
	
	$scope.indexRecords = {};
	$scope.expdate = "";
	$scope.creditValue = "";
	
	$scope.clearDataItself = function(){
		$scope.expdate = null;
	}
	
	$scope.updateDateMthd = function(actRecs){
		
		
		$scope.expdate = actRecs.expiryDate;
		$scope.indexRecords = {};
		$scope.indexRecords = actRecs;
		console.log($scope.itemJson[$scope.indexRecords.creditType]);
		if ($scope.indexRecords.creditType in $scope.itemJson){
			$scope.creditValue = $scope.itemJson[$scope.indexRecords.creditType].value;
		}else{
			$scope.creditValue = "";
		}
	
		jQuery('#updateCreditModal').modal('show');
		
	}
	
	$scope.updateExpiryDateMthd = function(expDate){
		$scope.indexRecords.expiryDate = $('#expiryDateId1').val();
		$scope.creditExpirySettings = $scope.indexRecords;
		console.log($scope.creditExpirySettings);
		$scope.updateApi();
	}

	
	$scope.itemTableSort = function() {
		
		
		
		var oldIndex = 0;
		var newIndex = 0;
		
		jQuery('#dragDrop').sortable(
			{
			    start: function(event, ui){
			    	console.log("START");
			    	oldIndex = ui.item.index();
			    },
			    stop: function(event, ui){
			    	console.log("END");
			    	newIndex = ui.item.index();
			    	$scope.activeRecords = $scope.movePosition($scope.activeRecords, oldIndex, newIndex);
			    	
			    	var changed = $scope.activeRecords.filter(function (item, idx) {
			    	    return !angular.equals(item, $scope.activeRecordsForCompare[idx]);
			    	});
			    	
			    	
			    	if (changed.length>0){
			    		$scope.$apply(function () {
							$scope.showbtn = true;
						});
			    	}
			    }
			}
			);
	}
	
	$scope.movePosition  = function(arr, old_index, new_index) {
	    while (old_index < 0) {
	        old_index += arr.length;
	    }
	    while (new_index < 0) {
	        new_index += arr.length;
	    }
	    if (new_index >= arr.length) {
	        var k = new_index - arr.length;
	        while ((k--) + 1) {
	            arr.push(undefined);
	        }
	    }
	     arr.splice(new_index, 0, arr.splice(old_index, 1)[0]);  
	   return arr;
	}
	
	
	$scope.updateNewShuffeledArray = function(){
		console.log('activeRecords------');
		console.log($scope.activeRecords);

		for (var i=0; i<$scope.activeRecords.length; i++){
			$scope.activeRecords[i].priority = i; //$scope.activeRecords.indexOf($scope.activeRecords[i]);
		}
		
		$scope.activeRecords = $scope.activeRecords.reverse();
		
		console.log('activeRecords******');
		console.log($scope.activeRecords);
		
		$scope.loadeer = true;	
			$http({
				url : UPDATE_CREDIT_EXPIRY,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
				contentType : 'application/json',
				data : {"credits":$scope.activeRecords}
				}).then(function(response) {
					console.log(response);
					$scope.clearFileds();
					$scope.getListOfExpiryCredit();
			})
		}
	
	
	$scope.orgDetails = function(orgid){
		$http({
			url : "https://api.sentient.io/",
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":orgid}
			}).then(function(response) {
				console.log(response);
				
		})
	}
	
	
	$scope.getCurrentOrgInfo =  function(){
		console.log('...///...')
		console.log($scope.orgList);
		$scope.org = $scope.orgList[0];
		console.log($scope.org);
//		return $scope.orgList[0].orgName;
	}
	
	$scope.clientEmail = "";
	$scope.clientName = "";
	
	$scope.getEmail = function(data) {
		$scope.idForEmails = {"dpId": ORG_ID, "dcId":ORG_ID};
		$http({
			url : API_DA_GETEMAILID,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data :$scope.idForEmails
			}).then(function(response) {
				console.log(response);
				if (response.data){
					$scope.emails = response.data;
					console.log($scope.emails);
					if (ORG_ID in $scope.emails){
						$scope.clientEmail = $scope.emails[ORG_ID];
						console.log($scope.clientEmail);
					}
				}
		});
	}
	$scope.getEmail();
	
	
	
	
	$scope.sendTopUpMail = function(){
		
		var data = {};
		data['cMail'] = $scope.clientEmail;
		data['cName'] = $scope.clientName;
		data['cOrgId'] = ORG_ID+"";
		data['cUserId'] = loginUsrId;
		data['parameter'] = "Topup";
		data['cOrgName'] = $scope.orgNam;
		
		$http({
			url : SUPPORT_EMAIL,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data :data
			}).then(function(response) {
				console.log(response);
				jQuery('#topUpBtnMdl').modal('show');
		});
	}
	
	//jQuery('#topUpBtnMdl').modal('show');
	
	
	
	jQuery('#topMenu').css("display", "block");
});


