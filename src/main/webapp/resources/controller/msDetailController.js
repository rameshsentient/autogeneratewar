	app.controller('msDetailCtrl',function($scope,microFac,$localStorage, $http,$timeout){
	$scope.uAccess=$localStorage.uAccess;
	$scope.loadeer = true;
	$scope.userHaveAPIAccess = false;
	$scope.userAPIKeyText = API_USER_KEY;
	$scope.funcutionId = 0;
	$localStorage.menuTab=undefined;
	
	//********************MICROSERVICE FUNCTION DETATILAS START ********************
	
	$scope.msAiNames=$localStorage.msData.msAiNames;
	$scope.msUtNames=$localStorage.msData.msUtNames;
	$scope.msDaNames=$localStorage.msData.msDaNames;
	
	
	$scope.functionDetails = function(id){
		$scope.funcutionId = id;
		microFac.fnDetails(id).success(function(data){
			
			//***********CHECK USER HAVE API ACCESS **************
			microFac.checkUserApiAccess(API_USER_KEY, data.code).success(function(accessData){
				$scope.userHaveAPIAccess = accessData;
			});
			
			data.sourceArr = data.source.split(',');
			if(data.dataschema!=undefined && data.dataschema!=null && data.dataschema!=""){
				data.dataschema=JSON.parse(data.dataschema);
			}
			$scope.details = data;
			console.log(data);
			$timeout(function(){
				if($localStorage.msData.searchMs!=undefined && $localStorage.msData.searchMs!=""){
					$("#context").unhighlight().highlight($localStorage.msData.searchMs);
				}
				$('.servCetags').toggleClass("open-menu");
				$scope.loadeer = false;
			},1000);
			
		})
	}
	$scope.functionDetails($localStorage.msData.id);
	
	//********************MICROSERVICE FUNCTION DETATILAS END ********************
	
	
	//**************************MICROSERVICES INFO API START***************************
	$scope.msInfo=function(id){
		$localStorage.msData.id=id;
		location.reload(true);
	}
	//**************************MICROSERVICES INFO API END***************************
	
	
	$scope.viewTiers = {}
	
	$scope.showTiers = function(tierData) {
		$scope.viewTiers = tierData;
		jQuery('#tiertable').modal('show');
	}
	
	$scope.selectMe = function(index){
		$scope.selectedIndex = index;
	}
	
	//********************ADD SUBSCRIBE****************************
	$scope.subscriptionStatus="S";
	$scope.subscribe = function() {
		$http({
			url : ORG_SUBSCRIPTION+"?uId="+LOGIN_USER_ID+"&fId="+$scope.funcutionId+"&status="+$scope.subscriptionStatus, 
			method : 'GET',
			headers:{'x-api-key':API_USER_KEY},
		}).success(function(res){
			
			if(res.status == "success") {
				jQuery("#Success2").modal("show");
				$scope.userHaveAPIAccess = true;
			}else{
				$scope.userHaveAPIAccess = false;
			}
			
			$timeout(function(){
				jQuery("#Success2").modal("hide");
				jQuery("#Success1").modal("hide");
				$scope.subscriptionStatus="S";
			},2000);
			
		});		
	};
	//********************END SUBSCRIBE****************************
	
	//********************UN SUBSCRIBE****************************
	$scope.unsubscribe = function() {
		jQuery("#Success1").modal("show");
		$scope.subscriptionStatus="U";
	};
	//********************END UN-SUBSCRIBE****************************
	
	
	//*******************SET MENU TAB **********
	
	$scope.setMenu = function(type){
		if(type=='S'){
			$localStorage.menuTab='S';
		}else{
			$localStorage.menuTab='M';
		}
		location.href="catalog";
	}
	
	
    $scope.copytoclipboard = function (data) {
    	if(data=='b'){
    		jQuery('#titlemsg').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
    	}else{
    		jQuery('#titlemsgend').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
    	}
    	
    }
    
    $scope.newBoard=false;
    $scope.showClipboard = function () {
    	if($scope.newBoard){
    		$scope.newBoard=false;
    		jQuery('#titlemsg').attr('title', 'Copy').tooltip('fixTitle');
    	}
    	$scope.newBoard=true;
    }
    
    $scope.newBoardend=false;
    $scope.showClipboardend = function () {
    	if($scope.newBoardend){
    		$scope.newBoardend=false;
    		jQuery('#titlemsgend').attr('title', 'Copy').tooltip('fixTitle');
    	}
    	$scope.newBoardend=true;
    }
    
    $scope.clodeImgeModel=function(){
    	jQuery('#myModal').modal('hide');
    }
    
    $scope.openImgModel=function(img){
    	jQuery('#myModal').modal();
    	
    	$scope.newImgUrl=img;
    	
    }
    
    /* mani */
    
	 $scope.showSlides = function(n) {
   	  var i;
   	  var slides = document.getElementsByClassName("mySlides");
  
   	  var dots = document.getElementsByClassName("demo");
   	  var captionText = document.getElementById("caption");
   	  if (n > slides.length) {slideIndex = 1}
   	  if (n < 1) {slideIndex = slides.length}
   	  for (i = 0; i < slides.length; i++) {
   	      slides[i].style.display = "none";
   	  }
   	  for (i = 0; i < dots.length; i++) {
   	      dots[i].className = dots[i].className.replace(" active", "");
   	  }
   	  try {
   	   	  slides[slideIndex-1].style.display = "block";
   	   	  dots[slideIndex-1].className += " active";
   	   	  captionText.innerHTML = dots[slideIndex-1].alt;		
	} catch (e) {
		// TODO: handle exception
	}

   	}    
    
    $scope.openModal = function() {
    	jQuery('#myModal').modal();
	}

    $scope.closeModal = function() {
		jQuery('#myModal').modal('hide');
	}
    
    $scope.microserviceEnquiryMtd = function(details){
    	
    	var data={
    			fname:USER_NAME,
    			email:ORG_EMAIL,
    			companyname:ORG_NAME,
    			subject:'Microservice inquiry - '+details.funName+' for '+ORG_NAME,
    			description:'Microservice inquiry - '+details.funName+' for '+ORG_NAME,
    			sourcefrom:'microservice'
//				detail:details
    	}
    	console.log(data)
    	
    	$http({
			url: API_ZENDESK_TICKET,
			method: "POST",
			data:JSON.stringify(data),
			processData: false,
			contentType: false,
			cache: false,
		}).then(function(response) {
			console.log(response);
			jQuery("#contactsales").modal("show");
			$timeout( function(){
				jQuery("#contactsales").modal("hide");
			},3000);
		});
    }
    

    	var slideIndex = 1;
    	$scope.showSlides(slideIndex);

    	 $scope.plusSlides = function(n) {
    		 $scope.showSlides(slideIndex += n);
    	}

    	$scope.currentSlide = function(n) {
    	  $scope.showSlides(slideIndex = n);
    	}
    	jQuery('#topMenu').css("display", "block");
})