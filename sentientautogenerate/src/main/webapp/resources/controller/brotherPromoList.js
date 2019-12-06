app.controller('brotherlist', function($localStorage,$window, $scope, $rootScope, $http,$timeout) {
	$scope.uAccess=$localStorage.uAccess;
	$scope.promotionData = [];
	
	$scope.showActiveORG = true;
	
	
	
	$scope.getList = function() {
		$http({
   		 		url: 'https://n1ec9w31ki.execute-api.ap-southeast-1.amazonaws.com/dev/listpromotion',
	            method: 'POST',
	            data:JSON.stringify({}),
	            dataType : 'json',
	            contentType : "application/json"
		   	}).then(function(response) {
		   		console.log(response);
		   		$scope.promotionData=response.data.results;
			},function(response) { // optional
				console.log(response);
			});
		
	}
	
	$scope.getList();
	
	$scope.deleID = [];
	
	$scope.toggleAll = function(res) {
		$scope.deleID = [];
	    var toggleStatus = res;
	    var integr = 0;
	    	angular.forEach($scope.promotionData, function(itm){
		    	itm.check_bx = toggleStatus;
		    	integr++;
		    	 $scope.deleID.push(itm.id);
		    });
	    
	   
	    if(res){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	}



	$scope.optionToggled = function(){		
		$scope.deleID = [];
	
			$scope.isAllSelected = $scope.promotionData.every(function(itm){
	    		return itm.check_bx;
	    	})
	     var count = 0;
			angular.forEach($scope.promotionData, function(value) {
		        if(value.check_bx){
		          count++;
		          $scope.deleID.push(value.id);
		        }
		    });
	    $scope.selectedList = count;
	    if($scope.selectedList > 0){
	    	$scope.advSpan =true
	    }else{
	    	$scope.advSpan = false;
	    }
	}
	
	$scope.deletePromo=function(){
		$http({
	 		url: 'https://n1ec9w31ki.execute-api.ap-southeast-1.amazonaws.com/dev/deletepromotion',
            method: 'POST',
            data:JSON.stringify({'ids':$scope.deleID}),
            dataType : 'json',
            contentType : "application/json"
	   	}).then(function(response) {
	   		console.log(response);
	   		$timeout(function() {
	   			$scope.getList();
		   		jQuery('#deletePromo').modal("hide");
		   		$scope.deleID = [];
		   		$scope.advSpan = false;
	   	    }, 1000);
	   		
		},function(response) { // optional
			console.log(response);
		});
	}
	
	
	$scope.gotoAdd=function(){
		$localStorage.fromEdit=false;
		location.href="brotherpromo";
	}
	
	$scope.gotoUpdate=function(data){
		$localStorage.fromEdit=true;
		$localStorage.promo=data;
		location.href="brotherpromo";
		
	}
	
	
	
	jQuery('#topMenu').css("display", "block");
});


