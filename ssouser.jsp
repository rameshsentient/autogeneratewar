<%
String sessionKey = "";
if(request.getParameter("sessionKey") != null) {
	sessionKey = request.getParameter("sessionKey").toString();	
}
System.out.println("sessionKey = " + sessionKey);
%>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

		
		
		
	</head>
	<body ng-app="myApp" ng-controller="ssoCtrl"></body>
	
		<script>
		var sessionKey = "<%=sessionKey%>";
		var app = angular.module('myApp', []);
		app.controller('ssoCtrl', function($scope, $http) {
			
			//alert("sessionKey = " + sessionKey);
			
			$http({
				url : 'ssoAuth?sessionKey='+sessionKey, 
				method : 'GET'
			}).then(function(data){
				console.log(data);
				//alert(data.data);
				if(data.data != undefined &&  data.data > 0){
					location.href = "dashboard";
				}
				else{
					alert("Access Denied");
					location.href = "http://google.com";
				}
			});			
		
		});
		</script>	
</html>