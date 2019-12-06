app.controller('invoiceController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.loadeer = false;
	
	$scope.invoiceData = []
	
	$scope.loadData = function() {
		
		$scope.loadeer = true;	
		$scope.barchartData = []
		$http({
	        url: API_INVOICE_LIST,
	        method: "POST",
	        data: {"orgId" : ORG_ID }
	    }).then(function(response) {
            console.log(response.data.invoiceData);
            $scope.invoiceData = response.data.invoiceData;
            $scope.loadeer = false;
	    });	
	}
	
	$scope.getDownloadURL = function(fileName) {
		$http({
	        url: API_DWN_INVOICE+"?fileName=Invoice-"+fileName+".pdf",
	        method: "GET",
	        headers: {"x-api-key" : API_USER_KEY }
	    }).then(function(response) {
            console.log(response);
            $scope.loadeer = false;
            window.open(response.data);
	    });
		
	}
	
	$scope.loadData();
	
	
	$scope.getApiTotal=function(data){
		var total=0;
		angular.forEach(data, function(value, key) {
			
			total=total+value["TOAL_API_AMOUNT"];
			
		});
		return total;
	}
	
	$scope.getRefundTotal=function(data){
		var total=0;
		angular.forEach(data, function(value, key) {
			
			total=total+value["CREDIT"];
			
		});
		return total;
	}
	
	$scope.getPostiveEntryTotal=function(data){
		var total=0;
		angular.forEach(data, function(value, key) {
			
			total=total+value["CREDIT"];
			
		});
		return total;
	}
	
	$scope.getSpendingTotal=function(data){
		
		var total=0;
		angular.forEach(data, function(value, key) {
			
			total=total+value["CREDIT"];
			
		});
		return total;
	}
	
	
	$scope.getClosingBalance=function(invoice,refunds,negative){
		
		console.log(refunds);
		console.log(negative);
		var mcre=0;
		var ctop=0;
		var ref=refunds;
		var adj=0;
		var spend=negative;
		var exp=0;
		var mfee=0;
		
		if(invoice.MARKETINGFEE.length>0){
			mcre=invoice.MARKETINGFEE[0].CREDIT;
		}
		if(invoice.TOPUPS.length>0){
			ctop=invoice.TOPUPS[0].CREDIT;
		}
		if(invoice.ADJUSTMENTS.length>0){
			adj=invoice.ADJUSTMENTS[0].CREDIT;
		}
		if(invoice.EXPIRED.length>0){
			exp=invoice.EXPIRED[0].CREDIT;
		}
		if(invoice.MEMBERSHIPFEE.length>0){
			mfee=invoice.MEMBERSHIPFEE[0].CREDIT;
		}
		
		return (mcre+ctop+ref+adj+spend+exp+mfee);
	}
	
	
	
	
	jQuery('#topMenu').css("display", "block");
	
})