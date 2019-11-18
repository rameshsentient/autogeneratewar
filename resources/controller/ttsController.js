app.controller('ttsController',function($scope,$timeout, $localStorage, $http){
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.text = "";
	
	var OWNER_API_KEY = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});	
	
	$scope.getSpeech = function() {
		
		if($scope.text !="") {
			$http({
		        url: TTS,
		        method: "POST",
		        headers:{'x-api-key':OWNER_API_KEY},
		        
		        data: { 'text' : $scope.text }
		    })
		    .then(function(response) {
		            console.log(JSON.stringify(response));
		        	var source = document.getElementById('mySource');
		        	source.src = response.data.audio;
		        	var audioContent = response.data.audioContent;
		        	
		        	console.log(OWNER_API_KEY);
		        	
		        	source.src = "data:audio/wav;base64,"+audioContent;
		        	
		        	
		        	var x = document.getElementById("myAudio"); 
		        	x.load();
		            x.play();
		    }, 
		    function(response) { // optional
		    	console.log(JSON.stringify(response));
		    });
		}
	}
	
	$scope.temp = function() {		
		var ttsJSonData = { 
		  "input" : {"text":"hello world"}, 
		  "voice" : {"languageCode":"en-US", "name":"en-US-Wavenet-C", "ssmlGender":"FEMALE"},
		  "audioConfig" : {"audioEncoding":"MP3"}
		};
		
		
		 $.ajax({
	     url : 'https://texttospeech.googleapis.com/v1beta1/text:synthesize?key=AIzaSyBaIMKeLT6pprE-1xHVoaZ3AJyAa8PfdDU', 
	     method : 'POST',
		 data : JSON.stringify(ttsJSonData),
	     contentType: 'application/json',
		 success: function(result){
			
			console.log(result.audioContent); 
	     var snd = new Audio("data:audio/mp3;base64," + result.audioContent);
		 snd.play();
		 
		 }
	    });		
	
	}
	
	jQuery('#topMenu').css("display", "block");
	
});