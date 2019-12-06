
app.controller('brotherPromo',function($window,$scope,$rootScope, $localStorage, $http, $timeout){
	
	
	
	$timeout(function() {
		$("#mainContainer").css("display", "block");
    }, 400);
	
	$scope.uAccess=$localStorage.uAccess;
	$scope.loadr=false;
	$scope.formValid=true;
	$scope.files=[];
	$scope.images=[];
	$scope.viewType=false;
	
	console.log($localStorage.promo);
	
	var OWNER_API_KEY = "";
	
	  $http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;	      
	      //alert(OWNER_API_KEY);
	  });
	  
	  $scope.setPromo=function(data){
			$scope.id=data.id;
			$scope.title=data.title;
			$scope.prdtype=data.prdtype;
			$scope.category=data.category;
			$scope.model=data.model;
			$scope.price=data.price;
			$scope.period=data.period;
			$scope.dedline=data.dedline;
			$scope.desc=data.desc;
			$scope.promotionurl = data.promotionurl;
			
			if(data.files != undefined && data.files.length>0){
				$scope.showPdf=true;
			}
			if(data.images != undefined && data.images.length>0){
				$scope.showImg=true;
			}
			
		}
	  
	  if($localStorage.fromEdit){
		  $scope.viewType=true;
		  $scope.setPromo($localStorage.promo);
	  }
	 
	 
	  $scope.addPromotion=function (){
		  
		  var models=$('#input-tags').val();
		  
		  if(models!=undefined && models!=''){
			  models=models.split(',');
			  $scope.model=models;
		  }
		  
		  var newFileName="";
		  if($scope.files.length > 0){
			   newFile=$scope.files[0];
			   newFileName=$scope.files[0].name;
		  }/*else{
			  $scope.formValid=false;
			  return false;
		  }*/
		  var newImgName="";
		  if($scope.images.length > 0){
			  var newImg=$scope.images[0];
			  newImgName=$scope.images[0].name;
		  }
		 
		  var data=new FormData();
		  data.append('f', 'json');
		  if($scope.viewType){
			  data.append('id', $scope.id);
		  }
		  data.append('title', $scope.title);
		  data.append('category', $scope.category);
		  data.append('prdtype', $scope.prdtype);
		  data.append('model', $scope.model);
		  data.append('price', $scope.price);
		  data.append('period', $scope.period);
		  data.append('dedline', $scope.dedline);
		  data.append('promotionurl', $scope.promotionurl);
		 
		  if(newFileName!=""){
			  data.append('files', newFile);
			  data.append('filename', newFileName);
		  }
		  if(newImgName!=""){
			  data.append('images', newImg);
			  data.append('imagename', newImgName);
		  }
		  
		  data.append('desc', $scope.desc);
		
		  if($scope.title==undefined || $scope.title==''){
			  $scope.formValid=false;
		  }else if($scope.category==undefined || $scope.category.length<1){
			  $scope.formValid=false;
		  }else if($scope.prdtype==undefined || $scope.prdtype.length<1){
			  $scope.formValid=false;
		  }else if($scope.model==undefined || $scope.model.length<1){
			  $scope.formValid=false;
		  }else if($scope.price==undefined || $scope.price==''){
			  $scope.formValid=false;
		  }else if($scope.period==undefined || $scope.period==''){
			  $scope.formValid=false;
		  }else if($scope.dedline==undefined || $scope.dedline==''){
			  $scope.formValid=false;
		  }/*else if($scope.desc==undefined || $scope.desc==''){
			  $scope.formValid=false;
		  }*/else{
			  $.ajax({
				  		method: 'POST',
				  		headers:{'x-api-key':''},
		    		 	url: 'https://n1ec9w31ki.execute-api.ap-southeast-1.amazonaws.com/dev/addpromotion',
			            enctype: 'multipart/form-data',
			            data:data,
			            processData: false,
						contentType: false,
						cache: false,
						timeout: 600000,
						success: function(res){
			    	    	console.log(res);
			    	    	location.href="promolist";
			    	    },
			    	    error:function(err){
			    	    	console.log(err);
			    	    }
		        });
		  }
	  }
	
	
	$scope.clearForm=function (){
		$scope.title='';
		$scope.prdtype=[];
		$scope.category=[];
		$('.tagsinput .tag').remove();
		$('#input-tags').val("");
		$scope.model=[];
		$scope.price='';
		$scope.period='';
		$scope.dedline='';
		$scope.desc='';
		$scope.removePdf();
		$scope.removeImg();
	}
	
	$scope.cancelForm=function (){
		location.href="promolist";
	}
	
	
	
	$scope.uploadFiles=function (files){
		var fileName=files[0].name;
		var extention=fileName.split(".").pop(-1);
		var fSiz = files[0].size / 1000000;
		
		var isShownPop = false;
		
		if(extention=='pdf'){
			$scope.showPdf=true;
		}else{
			isShownPop = true;
			$scope.files=[];
			$scope.popUpMsg="Not a PDF file";
			jQuery('#errorModal').modal();
		}
		
		if(!isShownPop && fSiz > 5){
			$scope.showPdf=false;
			$scope.images=[];
			$scope.popUpMsg="File size should be less than 5 mb";
			jQuery('#errorModal').modal();
		}
		
	}
	
	$scope.removePdf=function(){
		$scope.files=[];
		$scope.showPdf=false;
	}
	
	$scope.uploadImages=function (images){
		var fileName= images[0].name;
		var extention=fileName.split(".").pop(-1);
		
		var fSiz = images[0].size / 1000000;
		var isShownPop = false;
		if(extention=='png' || extention=='jpg' || extention=='jpeg'){
			$scope.showImg=true;
		}else{
			isShownPop = true;
			$scope.images=[];
			$scope.popUpMsg="Not a Image file";
			jQuery('#errorModal').modal();
		}
		
		if(!isShownPop && fSiz > 5){
			$scope.showImg=false;
			$scope.images=[];
			$scope.popUpMsg="File size should be less than 5 mb";
			jQuery('#errorModal').modal();
		}
		
	}
	
	$scope.removeImg=function(){
		$scope.images=[];
		$scope.showImg=false;
	}
	
	
	jQuery('#topMenu').css("display", "block");
});