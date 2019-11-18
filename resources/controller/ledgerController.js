app.controller('ledgerController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.addTransaction = true;
	
	//alert(API_ENDPOINT_LEDGER);
	
	console.log('ORG_ID',ORG_ID);
	$scope.isSuperAdmin = false;
	
	if(ORG_ID == 1) {
		$scope.isSuperAdmin = true;
	}
	//alert(ORG_NAME);
	$scope.organisationId = ORG_ID;
	
	$scope.selectedORGName = ""; //ORG_NAME
	
	$scope.loadeer = true;
	
	$scope.acBalance = 0;
	
	$scope.acId = 0;
	
	$scope.item = "";
	
	$scope.ledgerData = [];
	
	$scope.accountData = [];
	
	$scope.items = [];
	
	$scope.itemRequired = true;
	$scope.creditRequired = true;
	$scope.descriptionRequired = true;
	
	$scope.creditFound = true;
	$scope.creditDescpFound = true;
	$scope.itemFound = true;
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	
	$scope.clearFields = function(){

		$scope.creditAmount = "";
		$scope.creditDescription = "";
		$scope.item = "";
		$scope.creditFound = true;
		$scope.creditDescpFound = true;
		$scope.itemFound = true;
		$scope.itemRequired = true;
		$scope.creditRequired = true;
		$scope.descriptionRequired = true;
	}
	
	$scope.addCreditToAccount = function(){
		$scope.clearFields();
		jQuery('#addModal').modal();
	}
	
	$scope.creditAmount = "";
	
	$scope.creditDescription = "";
	
	$scope.items = [];
	
	$scope.getItemsList = function(){
		
		$http ({
    		url : 'getFlexyList?code=ITEM_LIST',
    		method : 'GET'
    	}).then(function(response) {
//    		$scope.items = response.data.result;
    		console.log('$scope.items');
    		$.map(response.data.result, function(obj){
    			if (obj.code != "ADD_BAL_MARK_CRED" && obj.code != "ADD_BAL_CRED_TOP"){
    				$scope.items.push(obj);
    				return obj;
    			}
    		})
    		console.log($scope.items);
    	})
    		
	};
	
	$scope.getItemsList();
	
	
	$scope.addLedgerTrans = function(){
		
		if ($scope.creditAmount== undefined || $scope.creditAmount == null|| $scope.creditAmount== "" || $scope.creditAmount== 0){
			$scope.creditFound = false;
			$scope.creditRequired = false;
		}
		else{
			$scope.creditFound = true;
			$scope.creditRequired = true;
		}
		if ($scope.creditDescription== undefined || $scope.creditDescription == null|| $scope.creditDescription== ""){
			$scope.creditDescpFound = false;
			$scope.descriptionRequired = false;
		}
		else{
			$scope.creditDescpFound = true;
			$scope.descriptionRequired = true;
		}
		if ($scope.item== undefined || $scope.item == null|| $scope.item== ""){
			$scope.itemFound = false;
			$scope.itemRequired = false;
		}
		else{
			$scope.itemFound = true;
			$scope.itemRequired = true;
		}

		//'https://api.sentient.io/microservices/dev/da/addledger'
		if ($scope.creditFound && $scope.creditDescpFound && $scope.itemFound){
			var newLegData = {"credit":$scope.creditAmount,"orgId":$scope.organisationId, "orgName":$scope.selectedORGName, "acId": $scope.acId, "acName":$scope.selectedORGName, "item" : $scope.item, "description":$scope.creditDescription}
			$scope.addTransaction = false;
			$http({
				url : API_ENDPOINT_ADD_LEDGER,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
				contentType : 'application/json',
				data : newLegData
				}).then(function(response) {
					console.log(response);
					if (response.data){
						$scope.getLedgerTransaction();
						$scope.creditAmount = "";
						$scope.creditDescription = "";
						jQuery('#addModal').modal('hide');
					}
					else{
						console.log('not found');
						//alert("Error");
					}
					$scope.addTransaction = true;
					
			})
		}

	}
	
	
	
	//https://api.sentient.io/microservices/dev/org/accountlist
	//'https://api.sentient.io/microservices/dev/org/accountlist'
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
				console.log(response);
				if (response.data){
					console.log(response.data.result);
					$scope.accountData = response.data.result;
					if($scope.accountData.length > 0){
						$scope.acId = $scope.accountData[0].id+"";
						$scope.getLedgerTransaction();
					}
				}
				else{
					console.log('not found');
					$scope.loadeer = false;
				}
				
		})
		
	}
	
	$scope.orgList = [];
	$scope.vals = []
	//'https://api.sentient.io/microservices/dev/org/allaccountlist'
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
				
		})
		
	}
	
	
	$scope.setAccountData = function(selectedOrgId) {
		
		$scope.organisationId = selectedOrgId;
		//alert($scope.organisationId);
		
		$scope.accountData = [];
		for(var index=0; index < $scope.vals.length; index ++){
			if($scope.vals[index].orgId == selectedOrgId){
				$scope.accountData.push($scope.vals[index]);
				$scope.selectedORGName = $scope.vals[index].orgName;
			}
		}
		
		$scope.acId = $scope.accountData[0].id+"";		
		$scope.getLedgerTransaction();
	}
	
	
	//'https://api.sentient.io/microservices/dev/da/ledger'	
	$scope.getLedgerTransaction = function() {
		$scope.loadeer = true;		
		var tempOrgId = ORG_ID;
		if($scope.isSuperAdmin){
			tempOrgId = $scope.organisationId;
		}
		$scope.acntType = '';
		for (var i=0; i<$scope.accountData.length; i++){
			if ($scope.accountData[i].id == $scope.acId){
				$scope.acntType = $scope.accountData[i].acType;
			}
		} 
		
		var dataPrint = {"orgId":tempOrgId, "acId":$scope.acId,"duration":$scope.duration};
		console.log('dataPrint');
		console.log(dataPrint);
		console.log('dataPrint');
		$http({
			url : API_ENDPOINT_LEDGER,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":tempOrgId, "acId":$scope.acId,"duration":$scope.duration}
			}).then(function(response) {
				
				if (response.data){
					console.log(response.data.results);
					$scope.acBalance = (response.data.results.accountBalance).toFixed(2);
					$scope.ledgerData = response.data.results.ledger;
					$scope.loadeer = false;
				}
				else{
					console.log('not found');
					$scope.loadeer = false;
				}
				
		})
	};
	
	
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
	  
	  
	  
	  
	  
$scope.getLedgerTransactionDownload = function() {
	$scope.loadeer = true;		
	var tempOrgId = ORG_ID;
	if($scope.isSuperAdmin){
		tempOrgId = $scope.organisationId;
	}
	
	$http({
		url : API_DWN_LEDGER,
		method : 'POST',
		headers : {
	        'x-api-key': API_USER_KEY
	    },
		contentType : 'application/json',
		data : {"orgId":tempOrgId, "acId":$scope.acId,"duration":$scope.duration}
		}).then(function(response) {
			console.log(response);
			if (response.data.url){
				$scope.loadeer = false;
				location.href=response.data.url;
			}
			else{
				console.log('not found');
				$scope.loadeer = false;
			}
			
	})
};
	  

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


$scope.payOutRequest = function(){
	
	var data = {};
	data['cMail'] = $scope.clientEmail;
	data['cName'] = $scope.clientName;
	data['cOrgId'] = ORG_ID+"";
	data['cUserId'] = loginUsrId;
	data['parameter'] = "Payout";
	
	$http({
		url : "https://api.sentient.io/microservices/prod/da/supportteammail",
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



	
	
	jQuery('#topMenu').css("display", "block");
	
});