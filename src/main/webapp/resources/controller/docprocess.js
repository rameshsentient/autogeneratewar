
app.controller('docProcessController',function($window,$scope,$rootScope,Upload,$timeout,editDocument, $localStorage, $http){
	
	
	var OWNER_API_KEY = "";
	
	  $http.get('./app-config-prop.json').then(function (response) {
		  //console.log(response);
	      //console.log('ID is ', response.data.ID);
	      //console.log('API_KEY is ', response.data.API_KEY);
	      OWNER_API_KEY = response.data.API_KEY;
	      
	      //alert(OWNER_API_KEY);
	  });		
	
	//$scope.loaderS = true;
	//alert(DOC_CONVERSION);
	$scope.uAccess=$localStorage.uAccess;
	//alert(USER_API_KEY);
	
	editDocument.getCodeList("DOC_LIST").success(function(data){
		$scope.docTypes=data.result;
		console.log($scope.docTypes);
	});
	
	$scope.uploadFiles = function (files) {
		
		//alert(files[0].size)
		if(files[0] != undefined){
			var fSiz = files[0].size / 1000000;
			if(fSiz < 5){ 
		 		var format = files[0].name.split('.').pop();
		 		//alert(format);
		 		var formatCheck=false;
		 		var avlFormat = [];
				angular.forEach($scope.docTypes,function(value){
					if(value.value !="url") {
						avlFormat.push(value.value);
					}
					
					if(value.value==format){
						formatCheck=true;
					}
				});
		 			if(formatCheck){					
						$scope.updateData(files[0]);
				       
			 		} else{
			 			$scope.popUpMsg = "Valid file formats are "+avlFormat ;
			 			jQuery('#errorModal').modal();
			 		}
			}else{
				$scope.popUpMsg = "Given" + " " + files[0].name + " " + "size should be less than 5 mb";
	 			jQuery('#errorModal').modal();
			}	
		}
	 			
	 			
    };
    
      
    $scope.updateData = function(file){
    	
    	document.getElementById("docTextDiv").innerHTML = "";
    	document.getElementById("loadr").style.display = "block";
    		
		var formdata = new FormData();
		formdata.append( 'filePath', file);
		formdata.append( 'fileName', file.name );
		 formdata.append('f', 'json');
		 
		 console.log(formdata);
				 
    	jQuery.ajax({
    	    method: 'POST',
    	    headers:{'x-api-key':OWNER_API_KEY},
    	    enctype: 'multipart/form-data',
    	    processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
    	    url: DOC_CONVERSION,
    	    data: formdata,
    	  
    	    success: function(res){
    	    	
    	    	console.log(JSON.stringify(res));
    	    	var fileContent = "";
    	    	if(res.results == undefined) {
    	    		fileContent = res.message;
    	    	}
    	    	else {
    	    		fileContent = res.results.fileContent;
    	    	}
    	    	
    	    	document.getElementById("docTextDiv").innerHTML = fileContent;
    	    	document.getElementById("loadr").style.display = "none";
    	    	$scope.loaderS = false;
    	    	
    	    },
    	    error:function(err){
    	    	console.log(err);
    	    	document.getElementById("loadr").style.display = "none";
    	    	
    	    }
    		
    	});
    	//$scope.loaderS = false;
    }
    
    jQuery('#topMenu').css("display", "block");
    
})