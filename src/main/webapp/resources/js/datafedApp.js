var app = angular.module('datafedApp',['ngStorage'])

app.filter("trust", ['$sce', function($sce) {
	  return function(htmlCode){
	    return $sce.trustAsHtml(htmlCode);
	  }
	}]);

$("#menuiconDA").show();
$("#menuiconAI").hide();
$("#toolsdrop").css('display','inline-block');
