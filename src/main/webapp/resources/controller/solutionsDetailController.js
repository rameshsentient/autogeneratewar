app.controller('solutionDetailCtrl',function($scope,microFac,$localStorage, $http,$timeout){
	
	$scope.uAccess=$localStorage.uAccess;
	$scope.loadeer = true;
	$scope.userHaveAPIAccess = false;
	$scope.userAPIKeyText = API_USER_KEY;
	$scope.funcutionId = 0;
	$localStorage.menuTab=undefined;
	
	
	//********************SOLUTION FUNCTION DETATILAS START ********************
	
	$scope.solutionNames=$localStorage.solunData.solunNames;
	
	
	$scope.functionDetails = function(id){
		$scope.funcutionId = id;
		microFac.solutionDetails(id).success(function(data){
			
			//***********CHECK USER HAVE API ACCESS **************
			/*microFac.checkUserApiAccess(API_USER_KEY, data.code).success(function(accessData){
				$scope.userHaveAPIAccess = accessData;
			});*/
			
			console.log(data);
			$scope.details = data;
			$timeout(function(){
				if($localStorage.solunData.searchText!=undefined && $localStorage.solunData.searchText!=""){
					$("#context").unhighlight().highlight($localStorage.solunData.searchText);
				}
				$scope.loadeer = false;
			},1000);
			
		})
	}
	
	$scope.functionDetails($localStorage.solunData.id);
	
	//********************SOLUTION FUNCTION DETATILAS END ********************
	
	
	//**************************SOLUTIONS INFO API START***************************
	$scope.solutionInfo=function(id){
		$scope.functionDetails(id);
	}
	
	$scope.gotoMic=function(fId,solutionId){
		$localStorage.msData["id"]=fId;
		$localStorage.msData["sId"]=solutionId;
		$localStorage.menuTab='S';
		$timeout(function(){
			location.href="solnfundetail";
		},1000);
	}
	//**************************SOLUTIONS INFO API END***************************
	
	
	$scope.viewTiers = {}
	
	$scope.showTiers = function(tierData) {
		$scope.viewTiers = tierData;
		jQuery('#tiertable').modal('show');
	}
	
	$scope.selectMe = function(index){
		$scope.selectedIndex = index;
	}
	
	//********************ADD SUBSCRIBE****************************
	$scope.subscribe = function() {
		$http({
			url : ORG_SUBSCRIPTION+"?uId="+LOGIN_USER_ID+"&fId="+$scope.funcutionId, 
			method : 'GET',
			headers:{'x-api-key':API_USER_KEY},
		}).success(function(res){
			
			if(res.status == "success") {
				
				$scope.userHaveAPIAccess = true;
				
			}
			console.log(res);
		});		
	};
	//********************END SUBSCRIBE****************************
	
	
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