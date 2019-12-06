var app = angular.module('sentiCatalog',['ngStorage','ngClickCopy'])



app.factory('documetService',function($http){
	var _0x34fc=["\x33\x31\x36\x34\x36\x36\x38\x37\x44\x45\x43\x34\x34\x35\x44\x44\x38\x31\x31\x37"];var apikey=_0x34fc[0]
	console.log(apikey);
	return{
		searchDoc : function(data){
			return $http({
	    		 url: DOC_KC_SEARCH_URL+'?querystring='+data,
		         method: 'GET',
		         headers:{'x-api-key':apikey}
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

