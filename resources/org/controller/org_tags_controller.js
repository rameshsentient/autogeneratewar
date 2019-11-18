
//GROUPS

app.controller('orgtags', function($localStorage,$window, $scope, $rootScope, $http,$q, sentiOrg,$timeout) {
	$scope.uAccess=$localStorage.uAccess;
	$scope.orgDetails = [];
	
	$scope.loader = false;
	
	$scope.addTagButton = false;
	
	$scope.editOrg2 = false;
	
	$scope.setOrgEditMode = function() {
		$scope.editOrg2 = !$scope.editOrg2;
	}
	
	if($localStorage.orgDatum != ""){
		var dar = $localStorage.orgDatum;
		sentiOrg.getOrgtznDetails(dar.id).success(function(resp){
			$scope.orgDetails = resp.result;
			$scope.loader = false;
		});
	}
	
	$scope.orgId = 0;
	if($localStorage.orgDatum != ""){
		var dar = $localStorage.orgDatum;
		$scope.orgId = dar.id;
	}
	
	$scope.tagList = [];
	
	$scope.setTags = function(){
		
		$http({
			url : ORG_TAGGROUP_LIST_URL+'?orgId='+$scope.orgId, 
			method : 'GET',
			headers:{'x-api-key':API_USER_KEY},
		}).success(function(returnData){
			$scope.tagList = returnData.results;
			
			//console.log($scope.tagList.results);
		})
		
	}

	$scope.setTags();
	
	$scope.addParentTag = function(){
		$scope.newParentKey = document.getElementById("newParentKey").value;
		$scope.newParentValue = document.getElementById("newParentValue").value;
		//alert($scope.newParentKey);
		//alert($scope.newParentValue);
		var data ={
			  "id": 0,
			  "orgId": $scope.orgDetails.id,
			  "key": $scope.newParentKey,
			  "value": $scope.newParentValue,
			  "updatedBy":USR_ID
			}
		console.log(data);
		$http({
			url : ORG_TAG_PARENT_UPDATE_URL,
			method : 'POST',
			headers:{'x-api-key':API_USER_KEY},
            data:JSON.stringify(data),
            processData: false,
			contentType: false,
			cache: false,
		}).success(function(respo){
			data.excp=true;
			console.log(respo);
			$scope.tagList.unshift({id:respo.results.id,key:$scope.newParentKey,value:$scope.newParentValue,childTags:[]});
			
			$scope.newParentKey = "";
			$scope.newParentValue = "";
			document.getElementById("newParentKey").value = "";
			document.getElementById("newParentValue").value = "";
		})
		
	}

	$scope.delPTagObj = {};
	$scope.delPTagIndex = -1;
	$scope.deleteParent = function(tag, index) {
		
		$scope.delPTagObj = tag;
		$scope.delPTagIndex = index;
		$("#deleParentTag").modal("show");
	}
	
	$scope.deleteParentTag = function()
	{
		if($scope.delPTagIndex > -1){			
			$http({
				url : ORG_TAG_PARENT_DELETE_URL+'?id='+$scope.delPTagObj.id, 
				headers:{'x-api-key':API_USER_KEY},
				method : 'GET'
			}).success(function(returnData){
				
				$scope.tagList.splice($scope.delPTagIndex, 1);
				$scope.delPTagObj = {};
				$scope.delPTagIndex = -1;
				$("#deleParentTag").modal("hide");
			})
		}
	}
	
	$scope.delCTagObj = {};
	$scope.delCPTagObj = {};
	$scope.delCTagIndex = -1;
	
	$scope.deleteChild = function(childTag, parentTag, index) {
		
		$scope.delCTagObj = childTag;
		$scope.delCPTagObj = parentTag;
		$scope.delCTagIndex = index;
		
		$("#deleChildTag").modal("show");
		
	}
	
	$scope.deleteChildTag = function()
	{
		if($scope.delCTagIndex > -1) {			
			$http({
				url : ORG_TAG_CHILD_DELETE_URL+'?id='+$scope.delCTagObj.childid, 
				headers:{'x-api-key':API_USER_KEY},
				method : 'GET'
			}).success(function(returnData){
				$scope.delCPTagObj.childTags.splice($scope.delCTagIndex, 1);
				$("#deleChildTag").modal("hide");
				
			})
		}
	}
	
	$scope.updateOrgz = function(){
		var data = {
			orgId : $scope.orgDetails.id,
			orgName : $scope.orgDetails.name,
			desc    : $scope.orgDetails.desc,
			functionIds:[0],
			dateUpdated : "",
			upDatedBy : ""
		}
			$http({
				url : 'addOrg',
				dataType : 'json',
				contentType : "application/json",
				method : 'POST',
				data : JSON.stringify(data)
			}).success(function(respo){
				console.log(respo);
				$scope.succesUpdat = true;
				$scope.editOrg2 = false;
				
				$timeout(function(){
					$scope.succesUpdat = false;
				},2000);
				
			})
}
	
	
	
	$scope.TagsArray=[];
	
	$scope.addTag = function(){
		jQuery("#tagsModal").modal();
	}
	
	$scope.getTagList=function(){
		
		$http({
			url : ORG_TAG_LIST_URL+'?orgId='+$scope.orgId, 
			headers:{'x-api-key':API_USER_KEY},
			method : 'GET',
		}).success(function(returnData){
			console.log(returnData);
			$scope.tagsArray=returnData.results;
		})
	};
	
	$scope.getTagList();
	
	$scope.updateTags = function(data){
		
		$http({
	 		url: ORG_TAG_CHILD_UPDATE_URL,
            method: 'POST',
            headers:{'x-api-key':API_USER_KEY},
            data:JSON.stringify(data),
            processData: false,
			contentType: false,
			cache: false,
		   	}).success(function(response){
		   		//console.log(response);
		   		$timeout(function(){
			   		jQuery("#tagsModal").modal('hide');
			   		$scope.getTagList();
			   		$scope.id=0;$scope.uniqueKey=$scope.uniqueValue='';
		   		},1500);
		   		
		   	});
		   		
		
	}
	
	$scope.addTagsRow = function(){
		
		if($scope.id==undefined){
			$scope.id=0;
		}
		var data={
				orgId:$scope.orgDetails.id,
				id:$scope.id,
				key:$scope.uniqueKey,
				value:$scope.uniqueValue,
				upDatedBy:USR_ID
		}
		
		var allow = true;
		for(var i in $scope.tagsArray){
			 angular.forEach($scope.tagsArray, function(itm){
				 if(itm.key == $scope.uniqueKey &&  itm.value == $scope.uniqueValue){
						allow = false;
					} 
				 });	
		}
		
		if(allow){
			$scope.updateTags(data);
		}else{
			$scope.errorKey=true;
				
		}
		
	}
	
	$scope.tagUpdate = function(data){
		$scope.id=data.id;
		$scope.uniqueKey=data.key;
		$scope.uniqueValue=data.value;
		jQuery("#tagsModal").modal();
	}
	
	
	
	$scope.selectedRowObj = [];
	$scope.toggleAll = function(res) {
	    var toggleStatus = res;
	    angular.forEach($scope.tagsArray, function(itm){ itm.check_bx = toggleStatus; });	 

	    var count = 0;

	    angular.forEach($scope.tagsArray, function(value) {
	        if(value.check_bx){
	          count++;
	        }
	        $scope.selectedRowObj= $scope.tagsArray;
	        
	    });
	    
	    $scope.selectedList = count;

	    if(res){
	    	$scope.advSpan =true
	    	$scope.advEditSpan = false;
	    }else{
	    	$scope.advSpan = false;
	    	$scope.advEditSpan = false;
	    }
	}
	
	$scope.$watch(function(){
	  	 if($scope.selectedList < 1){
	  	 	$scope.advSpan = false;
	  	 	$scope.advEditSpan = false;
	  	 }
	})

	$scope.optionToggled = function(){
		var count = 0;

	    angular.forEach($scope.tagsArray, function(value) {
	    	
	    //	alert(value.check_bx);
	        if(value.check_bx){
	          count++;
	          $scope.selectedRowObj.push(value);
	        }
	    });
	    $scope.selectedList = count;

		$scope.isAllSelected = $scope.tagsArray.every(function(itm){ 
	    		return itm.check_bx; 
	    	}
	    )

	    if($scope.selectedList < 2){
	    	$scope.advEditSpan = true;
	    }else{
	    	$scope.advEditSpan = false;
	    }
	    $scope.advSpan = true;
	}
	
	
	$scope.deleteTableList = function(){
		
		$scope.addTagButton = true;
		
		var loop=0;
		
	    angular.forEach($scope.selectedRowObj, function(value) {
	    	var deferred = $q.defer();
			$http({
				url : 'deleteorgtag?id='+value.id, 
				method : 'GET'
			}).success(function(returnData){
				loop++;
				if($scope.selectedList==loop){
					$scope.getTagList();
					$scope.selectedRowObj=[];
				    $scope.selectedList=0;
				    $timeout(function(){
				    	$scope.addTagButton = false;
				    	jQuery("#confimationPop").modal('hide');
					},2000)
				}
				deferred.resolve(returnData);
				
			});
			
			return deferred.promise;
			
		    });
	    
	    
	}
	
	
	
	/*TAG GROUPING */
	   
	$scope.sortableOptions = {
		    placeholder: "app",
		    connectWith: ".apps-container"
		  };
	
	$scope.addChildTags = function(list,index){
		$scope.tempArray=list;
		$scope.tempIndex=index;
		angular.forEach($scope.tagsArray, function(value) {
			value.checkedStatus='';
			angular.forEach($scope.tempArray, function(oldvalue) {
				if(value.id==oldvalue.id){
					value.checkedStatus='checked';
				}
				
			});
			
		});
		jQuery("#tagsModal").modal();
	}
	
	$scope.upadteTagsGroup = function(tag){
		tag.orgId=$scope.orgDetails.id;
		tag.updatedBy=USR_ID;
		
		$http({
	 		url: ORG_TAG_PARENT_UPDATE_URL,
	        method: 'POST',
	        headers:{'x-api-key':API_USER_KEY},
	        data:JSON.stringify(tag),
	        processData: false,
			contentType: false,
			cache: false,
		   	}).success(function(response){
		   		angular.forEach(tag.childTags, function(child) {
					if(child.parentid==undefined){
						child.parentid=response.results.id;
						child.childid=response.results.childid;
					}
					
				});
		   		//location.reload();
		   	});
	}
	
	$scope.setOnOffTag = function(tag){
		if(tag.checkedStatus=='checked'){
			tag.checkedStatus='';
			for(i in $scope.tempArray){
				if($scope.tempArray[i].id==tag.id){
					$http({
						url : ORG_TAG_CHILD_DELETE_URL+'?id='+$scope.tempArray[i].childid, 
						headers:{'x-api-key':API_USER_KEY},
						method : 'GET'
					}).success(function(returnData){
						$scope.tagList[$scope.tempIndex].childTags.splice(i,1);
					});
					
				}
			}
		}else{
			delete tag.parentid;
			tag.checkedStatus='checked';
			$scope.tagList[$scope.tempIndex].childTags.push(tag);
			console.log($scope.tagList[$scope.tempIndex]);
			$scope.upadteTagsGroup($scope.tagList[$scope.tempIndex]);
		}
	}
	
	
    // Watch , if items in ng-repeat change length then reload
    $scope.$watch(
            function () {
                return $scope.tagList;
            },
            function (newValue, oldValue) {
                if (!angular.equals(oldValue, newValue)) {
                
                	for(i in oldValue){
                		var newList=newValue[i].childTags;
                		if(oldValue.length>0){
                			var oldList=oldValue[i].childTags;
                			if(newList.length>oldList.length){
                			
                    			//console.log(newList[i]);
                    			
                    		}
                		}
                	}
                	
                    }
            },
            true);
    
    $scope.deleteOrg = function(){
		sentiOrg.deleteOrg($scope.orgDetails.id).success(function(resp){
			//alert(JSON.stringify(resp));
			if(resp.status == "success"){
				location.href="addorg";
			}
		})
	}
    
   
    jQuery('#topMenu').css("display", "block");
});
