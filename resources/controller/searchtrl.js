app.controller('searchCtrl',function($scope,$timeout,documetService, $localStorage, $http,$sce){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.searchMain=true;
	$scope.searchResult=false;

			/*		PAGINATION  CODE		*/
    $scope.currentPage = 0;
	$scope.pageSize = 2;
	 
	$scope.pageNext = function(){
	 	$scope.currentPage++;
	}
	$scope.pagePrev = function(){
		$scope.currentPage--;
	}

	$scope.numberOfPages=function(){
	    return Math.ceil($scope.resultData.length/$scope.pageSize);                
	}	
	
	
	$scope.getContentOfDoc=function(){		
		
		if($scope.searchKey != undefined && $scope.searchKey != ""){
			$scope.loader = true;
			$scope.searchMain=false;
			$scope.searchResult=true;
			documetService.searchDoc($scope.searchKey).success(function(data){
				//console.log(data);
				var listData=data.results.hits;
				$scope.resultData=[];
				for(i in listData){
					if(listData[i]._source.content_profile!=undefined){
						$scope.resultData.push(JSON.parse(listData[i]._source.content_profile));
					}
					$scope.resultData[i].file_url=listData[i]._source.content_url;
					$scope.resultData[i].docIndexStatus=listData[i].docIndexStatus;
					if(listData[i]._source.content_ngrams!=undefined){
						$scope.resultData[i].nGrams=listData[i]._source.content_ngrams;
					}else{
						$scope.resultData[i].nGrams=[];
					}
				}
				console.log($scope.resultData);
				$scope.loader = false;
			}).error(function(res){
				$scope.loader = false;
				//alert('authendication failed');
			});
		}
	}
	
	 $scope.trustSrc = function(src) {
		 console.log(src);
		    return $sce.trustAsResourceUrl('https://docs.google.com/viewer?url='+src+'&embedded=true');
		  }
	 $scope.viewPreview=false;
	 
	 jQuery('#topMenu').css("display", "block");
});


app.filter('startFrom', function() {
 	return function(input, start) {
	 	if (!angular.isArray(input)) {
            return [];
        }
        start = +start; //parse to int	       
        return input.slice(start);
    };
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