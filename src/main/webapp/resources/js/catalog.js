var app = angular.module('sentiCatalog',['ngStorage','ngClickCopy'])



app.factory('documetService',function($http){
	return{
		searchDoc : function(data){
			return $http({
	    		 url: DOC_KC_SEARCH_URL+'?querystring='+data,
		         method: 'GET',
		         headers:{'x-api-key':'31646687DEC445DD8117'}	 
	    	});
		},
		urlIndexing : function(data){
			return $http({
	    		 url: URL_INDEXING_URL,
		            method: 'POST',
		            data:JSON.stringify(data),
		            dataType : 'json',
		            contentType : "application/json",
		            headers:{'x-api-key':API_KEY}	
	    	});
		}
	}
});

app.directive('ngEnter', function () { //a directive to 'enter key press' in elements with the "ng-enter" attribute
    return function (scope, element, attrs) {

        element.bind("keydown keypress", function (event) {
            if (event.which === 13) {
                scope.$apply(function () {
                    scope.$eval(attrs.ngEnter);
                });

                event.preventDefault();
            }
        });
    };
})

app.directive('compile', compile);

function compile($compile)
{
    return {
        restrict: 'A',
        replace: true,
        link: linkFunction
    };

    function linkFunction(scope, element, attrs)
    {
        scope.$watch(
            function (scope)
            {
                return scope.$eval(attrs.compile);
            },
            function (value)
            {
                element.html(value);

                $compile(element.contents())(scope);
            }
        );
    }
}

$("#menuiconDA").hide();
$("#menuiconAI").show();

