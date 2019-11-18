app.controller('mycontractController',function($scope,$timeout, $localStorage, $http){

	$scope.uAccess=$localStorage.uAccess;
	
	var OWNER_API_KEY = "";
	
	$scope.loadeer = true;
	
	$scope.showLoadmoretext = false;
	
	$scope.isScrollingActive = false;
	
	$scope.paginationPageCount = 0;
	
	$scope.skipCount = 0;
	
	$scope.showEndPagetext = false;
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$scope.contractData = [];
	
	$scope.newArrayObj = [];
	
	$scope.getContractData = function() {
		
		if($scope.category != "") {			
			$http({
				url : API_CONTRACT_LIST,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
				contentType : 'application/json',
				data :{"selector": {"dcorgid":ORG_ID+""}, "skip": $scope.skipCount, "sort": [{"datecreated": "desc"}]}
				}).then(function(response) {
					
					console.log('response');
					console.log(response);
					console.log('response');
					
					$scope.isScrollingActive = false;
					$scope.paginationPageCount = response.data.ResponseMetadata.RecordsCount;
					
					if (response.data.Data){
						for (var j=0; j<response.data.Data.length; j++){
							$scope.newArrayObj.push(response.data.Data[j])
						}
						$scope.contractData = $scope.newArrayObj;
						if ($scope.paginationPageCount < 80){
							$scope.showLoadmoretext = false;
							$scope.showEndPagetext = true;
						}
						$timeout(function(){
							if($scope.loadeer) {
								$scope.loadeer = false;
							}
						},200)

					}
					else{
						console.log('not found');
					}

					
			})
		
		}
	};
	
	$localStorage.selectedContractData ={};
	
	$scope.goToDetailPage = function(rowData){
		
		$localStorage.selectedContractData = rowData;
		console.log("++++++++++++++++++++==");
		console.log($localStorage.selectedContractData);
		
		$timeout(location.href="contractdetail", 2000);
		
	}
	
	$scope.statusColor = {
			"Contract Initiated":"Contract_initiated",
			"Negotiation":"Negotiation",
			"Contract confirmed":"Confirmed",
			"Payment transaction successfully":"Received",
			"Contract accepted" :"Contract_accepted",
			"Contract Accepted" :"Contract_accepted",
			"API Endpoint & Key Exchange":"Key_exchanged",
			"Data Downloaded Successful":"Completed",
			"Data Downloaded Failure":"Data",
			"Withdrawn":"Key_received",
			"Payment Refunded":"Exchange",
			"Credit Payment":"Key_received",
			"Closed Unsuccessful Contract":"Closed",	
			"Payment pending" : "Payment_pending",
			"Closed Successful Contract" : "Closed_Successful_Contract",
	}
	
	$scope.getStatusClass = function(status){
		var returnText = $scope.statusColor[status];
		
		if(returnText == undefined || returnText == "") {
			returnText = "newStatus";
		}
		
		return returnText;
	};
	
	
	
	$scope.getContractData();
	
	$timeout(function(){
		
		if($scope.loadeer) {
			$scope.loadeer = false;
		}
		
	},8000)
	
	$scope.customDateFormat = function(dateString){
		if (dateString){
			var dateTimeStr = dateString.split(' ');
			var dateStr = dateTimeStr[0];
			var timeStr = dateTimeStr[1].split(':');
			var timeStrFormat = timeStr[0]+":"+timeStr[1];
			return dateStr+" "+timeStrFormat;
		}
	};
	
	
	$scope.scrollingIsActiveRightNow = function(){
		$scope.showLoadmoretext = false;
		if (!$scope.isScrollingActive){
			$scope.isScrollingActive = true;
			if ($scope.paginationPageCount == 80){
				$scope.skipCount += 80;
				$scope.showLoadmoretext = true;
				$scope.getContractData();
			}
			else{
				$scope.showEndPagetext = true;
				$scope.skipCount = parseInt($scope.skipCount);
				$scope.paginationPageCount = parseInt($scope.paginationPageCount);
				$scope.skipCount += $scope.paginationPageCount;
			}
		}
	}
	
	
	
	
	//NEW CODES
	$scope.contractStatusFlexy = [];
	
	$scope.getStatusFlexi=function(){
		$http ({
			url : SUB_LIST_VALPAIR_URL,
			method : 'POST',
			data:{"code":"CONTRACT_DETAILS_STATUS_MSG"},
			contentType : 'application/json',
		}).then(function(response) {
			//console.log(response);
			$scope.contractStatusFlexy=response.data.result;
		})
	}
	var flexicount=0;
	if(flexicount==0){
		$scope.getStatusFlexi();
		flexicount++;
	}
	
	//FLEXI CODE VALUES FOR STATUS MESSAGES
	$scope.getStatusChat=function(code){
		var statusMsg=code;
		angular.forEach($scope.contractStatusFlexy, function(value, key) {
			if (value["code"]==code){
				statusMsg=value[code];
			}
		});
		return statusMsg;
	}
	
	
	jQuery('#topMenu').css("display", "block");
	
})