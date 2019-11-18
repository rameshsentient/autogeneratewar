app.controller('registrationcontroller',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.regList = [];
	
	$scope.getList=function(){
		$http({
			url: REGISTRATIONLIST,
			method: "GET",
		}).then(function(response) {
			console.log(response);
			$scope.regList=response.data.results;
		}, 
		function(response) { // optional
			console.log(response);
		});
	}
	
	$scope.getList();
	
	
	$scope.selectedIds = [];
	$scope.selectedRows = [];
	
	$scope.toggleAll = function(res) {
	    var toggleStatus = res;
	    angular.forEach($scope.regList, function(itm){ itm.check_bx = toggleStatus; });	
	    
		$scope.selectedIds = [];
		$scope.selectedRows = [];
	    if(toggleStatus){
	    	angular.forEach($scope.regList, function(itm){
	    		$scope.selectedIds.push(itm.id);
	    		$scope.selectedRows.push(itm);
	    	});	
	    }
	    
	    console.log($scope.regList);


	    if(res){
	    	$scope.advSpan =true
	    	$scope.advEditSpan = false;
	    }else{
	    	$scope.advSpan = false;
	    	$scope.advEditSpan = false;
	    }
	}
	
	$scope.$watch(function(){
	  	 if($scope.selectedIds < 1){
	  	 	$scope.advSpan = false;
	  	 	$scope.advEditSpan = false;
	  	 }
	})

	$scope.optionToggled = function(){

		$scope.selectedIds = [];
		$scope.selectedRows = [];
	    angular.forEach($scope.regList, function(value) {
	        if(value.check_bx){
	        	$scope.selectedIds.push(value.id);
	        	$scope.selectedRows.push(value);
	        }
	    });

		
	    if($scope.selectedIds < 2){
	    	$scope.advEditSpan = true;
	    }else{
	    	$scope.advEditSpan = false;
	    }
	    $scope.advSpan = true;
	}
	
	
	
	$scope.approvedRows=function(){
		
		var count=0;
		if($scope.email_content==undefined){
			 $scope.email_content="";
		 }
		 angular.forEach($scope.selectedRows, function(itm){
			 
			 var address="";
			 if(itm.addressone !=undefined && itm.addressone !="" && itm.addresstwo !=undefined && itm.addresstwo !=""){
				 address=itm.addressone+","+itm.addresstwo;
			 }else if(itm.addressone !=undefined && itm.addressone !=""){
				 address=itm.addressone;
			 }else if(itm.addresstwo !=undefined && itm.addresstwo !=""){
				 address=itm.addresstwo;
			 }
			 
			 var data = {
					 	orgId:0,
						orgName : itm.orgname,
						desc    : address,
						dateUpdated : "",
						upDatedBy : "",
						upDatedBy : "",
						functionIds : [122,123,124,125,126,266],
						userId:itm.id,
						userName :itm.username,
						userPwd:itm.password,
						userEmail:itm.email,
						mailContent:$scope.email_content
					}
			
			 $http({
					url : REGISTRATIONAPPROVED,
					method : 'POST',
					headers:{'x-api-key':'OaYpCkgRDn1DBbh4HGO4m4fKaX4RrX82tqepCb3d'},
					data : JSON.stringify(data)
				}).then(function(response) {
					console.log(response);
					
					for(i in $scope.regList){
						if(itm.id==$scope.regList[i].id){
							$scope.regList.splice(i,1);
						}
					}
					count++;
					
					if(count==$scope.selectedRows.length){
						$("#confimationPop").modal("hide");
						$scope.selectedRows=[];
						$scope.email_content="";
					}
				});
		 });	
	}
	
	$scope.removeRows=function(){
		
		$scope.selectedEmails=[];
		 angular.forEach($scope.selectedRows, function(itm){
			 $scope.selectedEmails.push(itm.email)
		 });
		 
		 if($scope.reject_content==undefined){
			 $scope.reject_content="";
		 }
		
		var data={ids:$scope.selectedIds,emails:$scope.selectedEmails,content:$scope.reject_content}
		
		$http({
			url: REGISTRATIONCANCEL,
			method: "POST",
			data:JSON.stringify(data),
		}).then(function(response) {
			console.log(response);
			$scope.getList();
			$("#deleteconfimationPop").modal("hide");
			$scope.selectedIds=[];
			$scope.reject_content="";
		}, 
		function(response) { // optional
			console.log(response);
		});
		
		
	}
	
	
	jQuery('#topMenu').css("display", "block");
});