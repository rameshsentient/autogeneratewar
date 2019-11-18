app.factory('sentiDocument',function($http){
	return{
		saveDocument : function(data) {
	    	return $http({
	    		 url: 'updateDoc',
		            method: 'POST',
		            data:JSON.stringify(data),
		            dataType : 'json',
		            contentType : "application/json"
	    	});
	    },
	    uploadFiles : function(data){
	    	return $http({
	    		 url: 'uploadDoc',
		            method: 'POST',
		            data:JSON.stringify(data),
		            dataType : 'json',
		            contentType : "application/json"
	    	});
	    },
	    getLisDetails : function(offsetLimt, limit){
	    	//var offsetLimtIndex = offsetLimt;
	    	var docListURL = DOC_LIST_URL+"?offset="+offsetLimt+"&limit="+limit+"";
	    	console.log(docListURL);
	    	return $http ({
	    		url : docListURL,
	    		method : 'GET',
	    		//headers:{'x-api-key':API_USER_KEY}
	    		headers:{'x-api-key':'31646687DEC445DD8117'}
	    	})
	    },
	    deleteTableList : function(id){
	    	return $http ({
	    		url : DOC_DEL_URL+'?docId='+id,
	    		method : 'GET',
	    		//headers:{'x-api-key':API_USER_KEY}
	    		headers:{'x-api-key':'31646687DEC445DD8117'}
	    	})
	    },
	    getCodeList : function(code){
	    	return $http ({
	    		url : 'getFlexyList?code='+code,
	    		method : 'GET'
	    	})
	    },
	}
});

app.factory('editDocument', function ($http) {
	return {
		
		searchDoc : function(data){
			return $http({
	    		 url: DOC_KC_SEARCH_URL+'?querystring='+data,
		         method: 'GET',
		         //headers:{'x-api-key':API_USER_KEY}
				 headers:{'x-api-key':'31646687DEC445DD8117'}
	    	})
		},
		
		getEditId: function(id){
	    	return $http ({
	    		url : DOC_INFO_URL+'?docId='+id,
	    		method : 'GET',
	    		//headers:{'x-api-key':API_USER_KEY}
	    		headers:{'x-api-key':'31646687DEC445DD8117'}
	    	})
	    },
	    deleteId : function(id){
	    	return $http ({
	    		url : DOC_DEL_URL+'?docId='+id,
	    		method : 'GET',
	    		//headers:{'x-api-key':API_USER_KEY}
	    		headers:{'x-api-key':'31646687DEC445DD8117'}
	    	})
	    },
	    deleteFileId : function(id){
	    	return $http ({
	    		url : 'deleteFile?id='+id,
	    		method : 'GET',
	    		headers:{'x-api-key':API_USER_KEY}
	    	})
	    },
	    getCodeList : function(code){
	    	return $http ({
	    		url : 'getFlexyList?code='+code,
	    		method : 'GET'
	    	})
	    },
	    saveDocument : function(data) {
	    	return $http({
	    		 url: 'updateDoc',
		            method: 'POST',
		            data:JSON.stringify(data),
		            dataType : 'json',
		            contentType : "application/json"
	    	});
	    }
    };
})

app.factory('microFac',function($http){
	return{
		getMicroservices : function(){
			return $http ({
				headers:{'x-api-key':API_USER_KEY},
	    		url : API_CATALOG_SOLUTIONS_LIST,
	    		//url : 'https://api.sentient.io/catalog/prod/solutionslist',
	    		method : 'POST',
	    		data:{},
	    		dataType : 'json',
	            contentType : "application/json"
	    		
	    	})
		},
		getServiceslis : function(){
			return $http ({
				headers:{'x-api-key':API_USER_KEY},
	    		url : MICRO_SER_LIST_URL,
	    		method : 'GET'
	    	})
		},
		getMicroserviceList : function(id){
			return $http ({
				headers:{'x-api-key':API_USER_KEY},
	    		url : API_CATALOG_MICRO_LIST,
	    		//url : 'https://api.sentient.io/catalog/prod/microserviceslist',
	    		method : 'POST',
	    		data:{},
	    		dataType : 'json',
	            contentType : "application/json"
	    	})
		},
		fnDetails : function(id){
			return $http ({
				headers:{'x-api-key':API_USER_KEY},
	    		url : API_CATALOG_MICRO_DETAIL,
				//url : 'https://api.sentient.io/catalog/prod/getmsdetails',
	    		method : 'POST',
	    		data:{"id":id},
	    		dataType : 'json',
	            contentType : "application/json"
	    	})
		},
		solutionDetails : function(id){
			return $http ({
				headers:{'x-api-key':API_USER_KEY},
				url : API_CATALOG_SOLUTIONS_DETAIL,
				//url : 'https://api.sentient.io/catalog/prod/getsolutiondetails',
				method : 'POST',
				data:{"id":id,"apiKey":API_USER_KEY},
				dataType : 'json',
				contentType : "application/json"
			})
		},
		getOrgtznDetails : function(id){
	    	return $http ({
	    		headers:{'x-api-key':API_USER_KEY},
	    		url : ORG_INFO+'?orgId='+ id,
	    		method : 'GET'
	    	})
	    },
	    checkUserApiAccess : function(apiKey, code){
	    	return $http ({
	    		headers:{'x-api-key':API_USER_KEY},
	    		url : ORG_CHECK_USER_ACCESS+'?apiKey='+ apiKey+"&code="+code,
	    		method : 'GET'
	    	})
	    },
	}
});


app.service('serviceSetter',function(){
	this.setId = function(id){
		localStorage.data = id;
		return true;
	},
	this.getId = function(){
		return localStorage.data;
	}

});