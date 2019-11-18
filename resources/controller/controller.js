app.controller('knowledgeCtrl',function($window,$scope,$rootScope,Upload, $timeout,sentiDocument, $filter, $q, $localStorage, $http){
//	$scope.loader = true;
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.showController=false;
	$scope.selectedFils = [];	
	$scope.tableObj = [];
	$scope.selectedRowObj = [];
	$scope.totalPages = 0;
	$scope.curentPage = 1;
	$scope.pageLimit = 10;
	$scope.startIndex = 0;
	
	$scope.nextPage = function() {
		if($scope.curentPage < $scope.totalPages) {
			$scope.curentPage++;
			$scope.startIndex = $scope.startIndex + $scope.pageLimit;
			$scope.getActiveDocList();
		}
	}
	
	$scope.prevPage = function() {
		if($scope.curentPage > 1) {
			$scope.curentPage--;
			$scope.startIndex = $scope.startIndex - $scope.pageLimit;
			$scope.getActiveDocList();
		}
	}
	
	$scope.tagList = [];
	
	$scope.clearFiles = function(){
		$scope.selectedFils = [];
		$scope.uploadType ='document';
	}
	
	
	$scope.setTags = function(){
		$http({
			url : 'getorgtags?orgId='+loginOrgId, 
			method : 'GET'
		}).success(function(res){
			$scope.singleTags=res.results.tags;
			var returnData=res.results.groupTags;
			console.log(res);
			
			if($scope.tagsLisArr != undefined && $scope.tagsLisArr !="" ) {
			
				angular.forEach($scope.tagsLisArr, function (tagObj, index) {
					
					if(tagObj.orgTagId > 0)
					{
						angular.forEach(returnData, function (OrgTagObj, index) {
							
							if(tagObj.fromType == "P"){
							
								if(OrgTagObj.id == tagObj.orgTagId) {
									OrgTagObj.checkedStatus = "checked";
								}
							}
							else
							{
								angular.forEach(OrgTagObj.childTags, function (OrgTagChildObj, index) {
									
									if(OrgTagChildObj.id == tagObj.orgTagId) {
										OrgTagChildObj.checkedStatus = "checked";
									}
									
								});
							}
							
						});
					}
					
					angular.forEach($scope.singleTags, function (orgSingle, index) {
						if(orgSingle.id == tagObj.orgTagId) {
							orgSingle.checkedStatus = "checked";
						}
						
					});
					
					
				});
			}
			$scope.singleTags=$scope.singleTags;
			$scope.tagList = returnData;
		})
		
	}
	
	$scope.setTagsForAll = function(){
	
		$http({
			url : 'getorgtags?orgId='+loginOrgId, 
			method : 'GET'
		}).success(function(res){
			$scope.singleTags=res.results.tags;
			var returnData=res.results.groupTags;
			console.log(res);
			
			if($scope.allTagsLisArr != undefined && $scope.allTagsLisArr !="" ) {
			
				angular.forEach($scope.allTagsLisArr, function (tagObj, index) {
					
					if(tagObj.orgTagId > 0)
					{
						angular.forEach(returnData, function (OrgTagObj, index) {
							
							if(tagObj.fromType == "P"){
							
								if(OrgTagObj.id == tagObj.orgTagId) {
									OrgTagObj.checkedStatus = "checked";
								}
							}
							else
							{
								angular.forEach(OrgTagObj.childTags, function (OrgTagChildObj, index) {
									
									if(OrgTagChildObj.id == tagObj.orgTagId) {
										OrgTagChildObj.checkedStatus = "checked";
									}
									
								});
							}
							
							angular.forEach($scope.singleTags, function (orgSingle, index) {
								if(orgSingle.id == tagObj.orgTagId) {
									orgSingle.checkedStatus = "checked";
								}
								
							});
							
						});
					}
				});
			}
			
			$scope.singleTags=$scope.singleTags;
			$scope.tagList = returnData;
		})
		
	}

	
	
	$scope.setOnOffTag = function(tag, fromType) {
		
		if(tag.checkedStatus == "checked")
		{
			tag.checkedStatus = "";
			
			var selectedDelIndex = -1;
			
			angular.forEach($scope.tagsLisArr, function (tagObj, index) {
				
				if(tagObj.fromType == "P" || tagObj.fromType == "C") {
					if(tagObj.orgTagId == tag.id)
					{
						selectedDelIndex = index;
					}
				}
				
			})
			
			if(selectedDelIndex > -1) {
				$scope.tagsLisArr.splice(selectedDelIndex,1);
				$scope.tableObj[$scope.arrayIndex].tags=$scope.tagsLisArr;
			}
		}
		else
		{
			tag.checkedStatus = "checked";
			
			$scope.addTagsRowFromOrg(fromType, tag.id, tag.tagKey, tag.tagValue);
		}
	}
	
	$scope.setOnOffTagForAll = function(tag, fromType) {
		
		if(tag.checkedStatus == "checked")
		{
			tag.checkedStatus = "";
			
			var selectedDelIndex = -1;
			angular.forEach($scope.allTagsLisArr, function (tagObj, index) {
				
				if(tagObj.fromType == "P" || tagObj.fromType == "C") {
					if(tagObj.orgTagId == tag.id)
					{
						selectedDelIndex = index;
					}
				}
				
			})
			if(selectedDelIndex > -1){
				$scope.allTagsLisArr.splice(selectedDelIndex,1);
				
				for(i in $scope.tableObj){
					for(j in $scope.tableObj[i].tags){
						if($scope.tableObj[i].tags[j].fromType == "P" || $scope.tableObj[i].tags[j].fromType == "C") {
							
							if($scope.tableObj[i].tags[j].orgTagId == tag.id){
								$scope.tableObj[i].tags.splice(j,1);
								break;
							}
						}
					}
				}				
				//$scope.removeAllTagz(selectedDelIndex,tag);
			}
		}
		else
		{
			tag.checkedStatus = "checked";
			
			$scope.allTagsSelectFromOrg(fromType, tag.id, tag.tagKey, tag.tagValue);
		}
	}
	
	
    $scope.addTagsRowFromOrg = function(fromType, tagId, key, value){
    	var allow = true;
    		for(var i in $scope.tagsLisArr){
    			if($scope.tagsLisArr[i].tag == key &&  $scope.tagsLisArr[i].value == value){
    				allow = false;
    			}
    		}
    		if(allow){
    			$scope.tagsLisArr.push({
    				id:0,
    				tag:key,
    				value:value,
    				delMark:'N',
    				orgTagId : tagId,
    				fromType :fromType
        		});
    			$scope.tableObj[$scope.arrayIndex].tags=$scope.tagsLisArr;
    		} 
    }
    
    
    $scope.allTagsSelectFromOrg = function(fromType, tagId, key, tValue){
      	var allow = true;
      		for(var i in $scope.allTagsLisArr){
      			if($scope.allTagsLisArr[i].tag == key && $scope.allTagsLisArr[i].value==tValue){
      				allow = false;
      			}
      		}
      		if(allow){
      			var newTags={
      	  				id:0,
      	  				tag:key,
      	  				value:tValue,
      	  				delMark:'N',
        				orgTagId : tagId,
        				fromType :fromType
      	      		}
      			$scope.allTagsLisArr.push(newTags);
      			//add doc object tags
      			for(var i in $scope.tableObj){
      				var isEx=false;
      				if($scope.tableObj[i].tags!=undefined && $scope.tableObj[i].tags.length>0){
      					for(j in $scope.tableObj[i].tags){
      	  					if($scope.tableObj[i].tags[j].tag==key && $scope.tableObj[i].tags[j].value==tValue){
      	  						isEx=true;
      	  						break;
      	  					}
      	  				}
      					if(!isEx){
      						$scope.tableObj[i].tags.push(newTags);
      					}
      					
      				}else{
      					$scope.tableObj[i].tags=[]; 
      					$scope.tableObj[i].tags.push(newTags);
      					
      				}
      	  		}
      		} 
      		else{
      			// ignore duplicate 
      		}  	
      }
	
	
	sentiDocument.getCodeList("DOC_LIST").success(function(data){
		$scope.docTypes=data.result;
	});
	
	sentiDocument.getCodeList("DOC_ACCESS").success(function(data){
		$scope.docAccessList=data.result;
		console.log(data);
	});

	$scope.getActiveDocList = function() {
		sentiDocument.getLisDetails($scope.startIndex, $scope.pageLimit).success(function(data){
			console.log(data);
			$scope.loaderS = false;
			
			try {
				$scope.offsetLimt = data.results.offsetLimt;
				$scope.tableDatz = data.results.hits;
				
		  			if(data.results.total > data.results.limit) {
		 	  			$scope.totalPages = data.results.total / data.results.limit;
		 	  			$scope.totalPages=$scope.totalPages+"";
		 	  			var totalArray=$scope.totalPages.split('.');
		 	  			if(totalArray.length>1){
		 	  				var totalPage=parseInt(totalArray[0])+1;
		 	  				$scope.totalPages=totalPage;
		 	  			}
	 	  			}
	 	  			else {
	 	  				if(data.results.total > 0) {
	 	  					$scope.totalPages = 1;
	 	  					$scope.curentPage = 1;
	 	  				}
	 	  			}
				
			} catch (e) {
				$scope.offsetLimt = 0;
				$scope.totalPages = 0;
				$scope.tableDatz = [];
			}
			
			
			$scope.showController=true;
		})
	}
	
	$scope.getActiveDocList();
	
	$scope.toggleAll = function(res) {
	    var toggleStatus = res;
	    angular.forEach($scope.tableDatz, function(itm){ itm.check_bx = toggleStatus; });	 

	    var count = 0;

	    angular.forEach($scope.tableDatz, function(value) {
	        if(value.check_bx){
	          count++;
	        }
	        $scope.selectedRowObj= $scope.tableDatz;
	        
	    });
	    $scope.selectedList = count;

	    if(res){
	    	$scope.advSpan =true;
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

	    angular.forEach($scope.tableDatz, function(value) {
	        if(value.check_bx){
	          count++;
	          $scope.selectedRowObj.push(value);
	        }
	    });
	    $scope.selectedList = count;

		$scope.isAllSelected = $scope.tableDatz.every(function(itm){ 
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


	$scope.uploadFiles = function (files) {
		
		for(i in files){
			console.log(files[i]);
			var fSiz = files[i].size / 1000000;
			if(fSiz < 5){ 
				var format = files[i].name.split('.').pop();
				var formatCheck=false;
				console.log($scope.docTypes);
				angular.forEach($scope.docTypes,function(value){
					if(value.value==format){
						formatCheck=true;
					}
				});
				
				if(formatCheck){
		 			  if (files && files.length) {
			        	$scope.selectedFils.push(files[i]);
			        	var fname=files[i].name.split('.');
			        	$scope.tableObj.push({
			        		docName:fname[0],
			        		fileName:files[i].name,
			        		docFormat:$scope.docFormat,
			        		uploadType:$scope.uploadType,
			        		tags:$scope.allTagsLisArr
			        		});
		 			  }
		 		}else{
		 			$scope.popUpMsg = "Please select the given format docx, doc, pdf!";
		 			jQuery('#errorModal').modal();
		 		}
			}else{				
		 		$scope.popUpMsg = "Given" + " " + files[i].name + " " + "size should be less than 5 mb";
	 			jQuery('#errorModal').modal();
				
			}
	 	}   
	 	$scope.tableLeng = $scope.selectedFils.length;
    };
    
    $scope.createEmpRw = function(type){
    	if(type == 'website'){
    		$scope.tableObj = [];
        	$scope.tableObj.push({
        		docFormat:$scope.docFormat,
        		fileName : '',
        		uploadType:$scope.uploadType,
        	});
    	}else{
    		$scope.tableObj = [];
    		$scope.selectedFils=[];
    	}    	
    }

    
	$scope.removeRows = function(index){
		$scope.selectedFils.splice(index,1);
		$scope.tableObj.splice(index,1);
	}
    
    
   /* $scope.editDoclist = function(){
    	$scope.loaderS = true;
    	angular.forEach($scope.tableDatz, function(value) {
 	        if(value.check_bx){
 	        	localStorage.id =  value.id; 	 
 	        	location.href = "docEdit"
 	        }
 	    });
    }*/
    
    $scope.editDoclist = function(id){
    	$scope.loaderS = true;
		localStorage.id = id; 	
		location.href = "docEdit"
    }
    
    $scope.deleteTableList = function(){
    	$scope.loaderS = true;
    	var arrayCount=$scope.selectedRowObj.length;
    	var loopindex=1;
    	angular.forEach($scope.selectedRowObj, function(value) {
    		console.log(value.docId);
 	        if(value.check_bx){
 	        	sentiDocument.deleteTableList(value.docId).success(function(res){
 	        		console.log(res);
 	        		console.log(arrayCount);
 	        		console.log(loopindex);
 	        		if(arrayCount==loopindex){
 	        			$scope.advSpan =false;
 	        	    	$scope.isAllSelected = false;
 	        			$scope.getActiveDocList();
 	        		}
 	        		
 	        		loopindex++;
 	        	}) 	        	
 	        }
 	    });
    	$scope.advSpan =false;
    	$scope.isAllSelected = false;
    	jQuery('#confimationPop').modal('hide');
    }

    $scope.removeFils = function(index){
    	$scope.selectedFils.splice(index, 1);
    }
   
    function saveFiles(){ 
 	   var tableRow = $scope.tableObj; 
 	   return new Promise(function(done, reject) {

 	  })
    }
    
    $scope.cancelFor = function(){
    	$scope.tableObj = [];
    	$scope.uploadType = "";
    	$scope.allTagsLisArr = [];
    }

    $scope.saveAndUpload=function(row){
    	
    	console.log(row.get("filePath")); 
    	 
    	var deferred = $q.defer();
    	$.ajax({
    	    method: 'POST',
    	    //headers:{'x-api-key':API_USER_KEY},
    	    headers:{'x-api-key':'31646687DEC445DD8117'},
    	    enctype: 'multipart/form-data',
    	    processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
    	    url: DOC_ADD_UPDATE_URL,
    	    data: row,
    	   // headers: {'Content-Type': undefined},
    	    success: function(res){
    	    	console.log(res);
    	    	deferred.resolve(res);
    	    },
    	    error:function(err){
    	    	console.log(err);
    	    	deferred.resolve(res);
    	    }
    		
    	});
    	
    	return deferred.promise;
    }
    
    $scope.createDocs = function (){
    	var tableRow = $scope.tableObj; 
    	console.log(tableRow[0]);
    		for(var i in tableRow){
				if(($scope.tableObj[i].docName == undefined || $scope.tableObj[i].docName == '') || ($scope.tableObj[i].docAccess == undefined || $scope.tableObj[i].docAccess == '')){
					$scope.popUpMsg = "Please fill all the required fields";
		    		jQuery('#errorModal').modal();
		    		return false;
		    	} 	
			}
    		
    		if(tableRow.length > 0){
    		
    			var count=0;
        		for(var i in tableRow){
        			 $scope.loaderS = true;
        			 var data=new FormData();
        			 
        			 data.append("docId", "0");
    		 		 data.append('f', 'json');
    		 		
    		 		
        			if(tableRow[i].uploadType!='website'){
    	 				var tempDocFormat=tableRow[i].fileName.split('.').pop();
    	 				tableRow[i].docFormat=tempDocFormat;
    	 				data.append('filePath',$scope.selectedFils[i]);
        			}
        			
        			tableRow[i].tags=JSON.stringify(tableRow[i].tags);
					
        			 var isHaveDocDesc = false;
					 for(key in tableRow[i]){
					
						 var val = tableRow[i][key];
					
						 if(val == undefined && key == "tags")
						 {
						 	val = [];
						 }
						 else if(val == undefined)
						 {
						 	val = "";
						 }
						 
						 if(key == "docDesc")
						 {
							 isHaveDocDesc = true;
						 }
						 
						 data.append(key,val);
					 }
					 
					 if(!isHaveDocDesc) {
						 data.append("docDesc","");
						 
					 }
						   
					 
					jQuery('#kBaseBox').hide();
    		 		$scope.saveAndUpload(data);	
    		 		
    		 	   } 
    				$timeout(function(){
    					$scope.getActiveDocList();
    	        		
    					$scope.tableObj = [];
    					$scope.allTagsLisArr = [];
    					jQuery('#kBaseBox').hide();
    					$('#creatKbase').fadeIn();
    					$scope.uploadType = '';
    	        	},4000)  
        	} else{
        		$scope.addErr = true;        		
        		$timeout(function(){
        			$scope.addErr = false;
        		},3000)
        	}
			       	
    }   
    
    
// Single Tags adding PART 

    $scope.openTagzModal = function(obj,index){
    	$scope.tagsLisArr = [];
    	if(obj.tags!=undefined && obj.tags.length>0){
    		$scope.tagsLisArr=obj.tags;
    	}
    	
    	$scope.setTags();
    	
    	$scope.arrayIndex=index;
		jQuery('#tagsModal').modal();
    }
    
    
    $scope.showOrgTagPop = function() {
    	jQuery('#orgTagPop').modal("show");
    }
    
    
    $scope.showOrgTagAllPop = function() {
    	
    	jQuery('#orgTagPop2').modal("show");
    }
    
    $scope.addTagsRow = function(){
    	var allow = true;
    	if($scope.uniqueKey!=undefined && $scope.uniqueKey!='' && $scope.uniqueValue!=undefined && $scope.uniqueValue!=''){
    		for(var i in $scope.tagsLisArr){
    			if($scope.tagsLisArr[i].tag == $scope.uniqueKey &&  $scope.tagsLisArr[i].value == $scope.uniqueValue){
    				allow = false;
    			}
    		}
    		if(allow){
    			$scope.tagsLisArr.push({
    				id:0,
    				tag:$scope.uniqueKey,
    				value:$scope.uniqueValue,
    				delMark:'N',
    				orgTagId : 0,
    				fromType :'F'
        		});
    			//add doc object tags
    			$scope.tableObj[$scope.arrayIndex].tags=$scope.tagsLisArr;
    			//console.log($scope.tableObj[$scope.arrayIndex]);
    			$scope.errorKey = false;
    			$scope.uniqueKey = $scope.uniqueValue = '';
    		}  else{
    			$scope.errorKey = true;
    			$scope.errorText = "Key and value already added in list."
    		} 
    	}
    		 	
    }
    
  $scope.removeTagz=function(index){
		$scope.tagsLisArr.splice(index,1);
    }
  
  $scope.updateTagsinClose=function(){
	  $scope.addTagsRow();
	  $scope.errorKey = false;
	  $scope.uniqueKey = $scope.uniqueValue = '';
  }
  
// END Single Tags adding PART   
  
//MULTIPLE Tags adding PART  
  $scope.tagforAll = function(obj){
	  $scope.allTagsLisArr = [];
  	if(obj!=undefined && obj.length>0){
  		$scope.allTagsLisArr=obj;
  	}
  	
  	$scope.setTagsForAll();
  	
	  jQuery('#selectAll').modal();
  }
  
  $scope.allTagsSelect = function(){
  	var allow = true;
  	if($scope.allTagKey!=undefined && $scope.allTagKey!='' && $scope.allTagValue!=undefined && $scope.allTagValue!=''){
  		for(var i in $scope.allTagsLisArr){
  			if($scope.allTagsLisArr[i].tag == $scope.allTagKey && $scope.allTagsLisArr[i].value==$scope.allTagValue){
  				allow = false;
  			}
  		}
  		if(allow){
  			var newTags={
  	  				id:0,
  	  				tag:$scope.allTagKey,
  	  				value:$scope.allTagValue,
  	  				delMark:'N',
    				orgTagId : 0,
    				fromType :'F'
  	      		}
  			$scope.allTagsLisArr.push(newTags);
  			//add doc object tags
  			for(var i in $scope.tableObj){
  				var isEx=false;
  				if($scope.tableObj[i].tags!=undefined && $scope.tableObj[i].tags.length>0){
  					for(j in $scope.tableObj[i].tags){
  	  					if($scope.tableObj[i].tags[j].tag==$scope.allTagKey){
  	  						isEx=true;
  	  						break;
  	  					}
  	  				}
  					if(!isEx){
  						$scope.tableObj[i].tags.push(newTags);
  					}
  					
  				}else{
  					$scope.tableObj[i].tags=[]; 
  					$scope.tableObj[i].tags.push(newTags);
  					
  				}
  	  		}
  			$scope.allerrorKey = false;
  			$scope.allTagKey = $scope.allTagValue = '';
  		}  else{
  			$scope.allerrorKey = true;
  			$scope.errorText = "Key and value must be unique"
  		} 
  	}
  		 	
  }
  
  $scope.updateAllTagsinClose=function(){
	  $scope.allTagsSelect();
	  $scope.allerrorKey = false;
	  $scope.allTagKey = $scope.allTagValue = '';
  }
  
  $scope.removeAllTagz=function(index,tagObj){
		$scope.allTagsLisArr.splice(index,1);
		
		for(i in $scope.tableObj){
			for(j in $scope.tableObj[i].tags){
				if($scope.tableObj[i].tags[j].tag==tagObj.tag && $scope.tableObj[i].tags[j].value == tagObj.value){
					$scope.tableObj[i].tags.splice(j,1);
					break;
				}
				
			}
		}
  }
  
 /* $scope.customDateFormat = function(dateString){
	  console.log(dateString);
	  if (dateString){
		  var newDateFormat = dateString.split("-");
		  console.log(newDateFormat);
		  var dateCust = Date.parse(newDateFormat[1]+"-"+newDateFormat[0]+"-"+newDateFormat[2]);
		  console.log(dateCust);
		  return dateCust;
	  }
  };*/
  
  $scope.customDateFormat = function(dateString){
//		console.log(dateString);
//		var dateCust = Date.parse(dateString);
//		return dateCust;
//		console.log(dateString);
		if (dateString){
			var dateTimeStr = dateString.split(' ');
			var dateStr = dateTimeStr[0].split('-');
			var newDateStr = dateStr[2]+"-"+dateStr[1]+"-"+dateStr[0]
			var timeStr = dateTimeStr[1].split(':');
			var timeStrFormat = timeStr[0]+":"+timeStr[1];
//			console.log(newDateStr+" "+timeStrFormat);
			return newDateStr+" "+timeStrFormat;
		}
		
	};
	
  
  jQuery('#topMenu').css("display", "block");
});


app.controller('editKnowledge',function($window,$scope,$rootScope,Upload,$timeout,editDocument, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.loaderS = true;
	$scope.editForm=true;
	var editId = localStorage.id;

	console.log("editId : " + editId);
	$scope.editList = [];
	
	
	editDocument.getCodeList("DOC_LIST").success(function(data){
		$scope.docTypes=data.result;
	});
	
	editDocument.getCodeList("DOC_ACCESS").success(function(data){
		$scope.docAccessList=data.result;
	});
	
	editDocument.getEditId(editId).success(function(resp){
		$scope.editList = resp.results;
		console.log(resp.results);
		if($scope.editList.uploadType!='website'){
			$scope.editList.uploadType='document';
		}
		$scope.loaderS = false;
	})
	
	$scope.uploadFiles = function (files) {	
			
		var fSiz = files[0].size / 1000000;
		if(fSiz < 5){ 
	 		var format = files[0].name.split('.').pop();
	 		var formatCheck=false;
			angular.forEach($scope.docTypes,function(value){
				if(value.value==format){
					formatCheck=true;
				}
			});
	 		
	 			if(formatCheck){
		 			$scope.editList.fileName = files[0].name;
			        $scope.updatedFile  = files[0];
			       
		 		} else{
		 			$scope.popUpMsg = "Please  select the available formats";
		 			jQuery('#errorModal').modal();
		 		}
		}else{
			
			$scope.popUpMsg = "Given" + " " + files[0].name + " " + "size should be less than 5 mb";
 			jQuery('#errorModal').modal();
		}		
	 			
	 			
    };

    $scope.$watch(function(){
    	if(($scope.editList.docName != undefined && $scope.editList.docName != '')  && ($scope.editList.docFormat != undefined && $scope.editList.docFormat != '') && ($scope.editList.docAccess != undefined && $scope.editList.docAccess != '') && ($scope.editList.uploadType=='document' && $scope.editList.fileName != undefined && $scope.editList.fileName != '')){
			$scope.hideForm = true;
    	}else{
    		$scope.hideForm = false;
    	}
    })
    
    
    $scope.deleteThis = function(id){
//    	$scope.loaderS = true;
    	editDocument.deleteId(id).success(function(response){
    		location.href="docList";   		
    	})
    }
   
    
    $scope.updateData = function(data){
    	console.log(data);
    	if(($scope.editList.docName == undefined || $scope.editList.docName == '') ||  ($scope.editList.docFormat == undefined || $scope.editList.docFormat == '') || ($scope.editList.docAccess == undefined || $scope.editList.docAccess == '') || ($scope.editList.uploadType == undefined || $scope.editList.uploadType == '') || ($scope.editList.uploadType=='document' && $scope.editList.fileName == '')){
			$scope.formvalidation = true;
    	} else{
    		$scope.editForm=false;
    		$scope.loaderS = true;
    		if(data.uploadType!='website'){
        		var tempDocFormat=data.fileName.split('.').pop();
    			data.docFormat=tempDocFormat;
    		}
    		
    		 var formdata=new FormData();
    		 formdata.append('f', 'json');
    		 if(data.isFileChanged=='Y'){
				 formdata.append('filePath',$scope.updatedFile);
			 }
	 		
			data.tags=JSON.stringify(data.tags);
			
			 for(key in data){
				 formdata.append(key,data[key]);
			 }
			 
			 console.log(formdata);
    		
		    	$.ajax({
		    	    method: 'POST',
		    	    //headers:{'x-api-key':API_USER_KEY},
		    	    headers:{'x-api-key':'31646687DEC445DD8117'},
		    	    enctype: 'multipart/form-data',
		    	    processData: false,
					contentType: false,
					cache: false,
					timeout: 600000,
		    	    url: DOC_ADD_UPDATE_URL,
		    	    data: formdata,
		    	  
		    	    success: function(res){
		    	    	console.log(res);
		    	    	location.href="docList";
		    	    },
		    	    error:function(err){
		    	    	console.log(err);
		    	    	
		    	    }
		    		
		    	});
    	}
    }
    
    $scope.addTagsRow = function(list){
    	var allow = true;
    		for(var i in list){
    			if(list[i].delMark == 'N' && list[i].tag == $scope.uniqueKey && list[i].value == $scope.uniqueValue){
    				allow = false;
    			}
    		}
    		if(allow){
    			list.push({
    				id:0,
    				tag:$scope.uniqueKey,
    				value:$scope.uniqueValue,
    				delMark:'N',
    				orgTagId : 0,
    				fromType :'F'
        		});
    			$scope.errorKey = false;
    			$scope.uniqueKey = $scope.uniqueValue = '';
    		}  else{
    			$scope.errorKey = true;
    		}  	
    }
    
    $scope.tagList = [];
	
	$scope.setTags = function(){
		
		$http({
			url : 'getorgtags?orgId='+loginOrgId, 
			method : 'GET'
		}).success(function(res){
			$scope.singleTags=res.results.tags;
			var returnData=res.results.groupTags;
			if($scope.editList.tags != undefined && $scope.editList.tags !="" ) {
			
				angular.forEach($scope.editList.tags, function (tagObj, index) {
					
					if(tagObj.delMark == 'N' && tagObj.orgTagId > 0)
					{
						angular.forEach(returnData, function (OrgTagObj, index) {
							
							if(tagObj.fromType == "P" ){
							
								if(OrgTagObj.id == tagObj.orgTagId) {
									OrgTagObj.checkedStatus = "checked";
								}
							}
							else
							{
								angular.forEach(OrgTagObj.childTags, function (OrgTagChildObj, index) {
									
									if(OrgTagChildObj.id == tagObj.orgTagId) {
										OrgTagChildObj.checkedStatus = "checked";
									}
									
								});
							}
							
							angular.forEach($scope.singleTags, function (orgSingle, index) {
								if(orgSingle.id == tagObj.orgTagId) {
									orgSingle.checkedStatus = "checked";
								}
								
							});
							
						});
					}
				});
			}
			$scope.singleTags=$scope.singleTags;
			$scope.tagList = returnData;
		})
		
	}
	
	$scope.setOnOffTag = function(tag, fromType) {
		if(tag.checkedStatus == "checked")
		{
			tag.checkedStatus = "";
			angular.forEach($scope.editList.tags, function (tagObj, index) {
				if(tagObj.delMark == 'N' && tagObj.orgTagId > 0 ) {
					if(tagObj.fromType == "P" || tagObj.fromType == "C")
					{
						if(tagObj.orgTagId == tag.id)
						{
							$scope.editList.tags[index].delMark = "Y";
						}
					}
				}
				
			})
		}
		else
		{
			tag.checkedStatus = "checked";
			
			$scope.addTagsRowFromOrg(fromType, tag.id, tag.tagKey, tag.tagValue);
		}
	}
    
    $scope.showOrgTagPop = function() {
    	
    	$scope.setTags();
    	
    	jQuery('#orgTagPop').modal("show");
    }
    
    $scope.addTagsRowFromOrg = function(fromType, tagId, key, value){
    	var allow = true;
    		for(var i in $scope.editList.tags){
    			if($scope.editList.tags[i].delMark == 'N' && 
    					$scope.editList.tags[i].tag == key && $scope.editList.tags[i].value == value){
    				allow = false;
    			}
    		}
    		if(allow){
    			$scope.editList.tags.push({
    				id:0,
    				tag:key,
    				value:value,
    				delMark:'N',
    				orgTagId : tagId,
    				fromType :fromType
        		});
    		} 
    }
    
  $scope.removeTagz=function(index,item,list){
	  if(item.id > 0){
		  item.delMark="Y";
	  }else{
		  list.splice(index,1);
	  }
    }
  
  
  // N-GRAMS DATA 
  editDocument.searchDoc(editId).success(function(data){
		console.log(data);
		var listData=data.results.hits;
		$scope.nGrams=[];
		for(i in listData){
			if(listData[i]._source.content_ngrams!=undefined){
				$scope.nGrams=listData[i]._source.content_ngrams;
			}else{
				$scope.nGrams=[];
			}
		}
		$scope.loader = false;
	}).error(function(res){
		$scope.loader = false;
		//alert('authendication failed');
	});
  
  jQuery('#topMenu').css("display", "block");
 
});

app.filter('orderObjectBy', function(){
	 return function(input, attribute) {
	    if (!angular.isObject(input)) return input;

	    var array = [];
	    for(var objectKey in input) {
	        array.push(input[objectKey]);
	    }

	    array.sort(function(a, b){
	        a = parseFloat(a[attribute]);
	        b = parseFloat(b[attribute]);
	        return b-a;
	    });
	    return array;
	 }
	});

