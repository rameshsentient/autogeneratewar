app.factory('sentiOrg',function($http){
	return{	
	    getLisDetails : function(){
	    	return $http ({
	    		url : 'getOrgList',
	    		method : 'GET'
	    	})
	    },
	    getDeletedORGList : function(){
	    	return $http ({
	    		url : 'getOrgDeletedList',
	    		method : 'GET'
	    	})
	    },	    
	    getOrgtznDetails : function(id){
	    	return $http ({
	    		url : 'getOrgInfo?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    getUserLisDetails : function(id){
	    	return $http ({
	    		url : 'getUserList?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    getDeletedUserLisDetails : function(id){
	    	return $http ({
	    		url : 'getDeletedUserList?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    deleteOrg : function(id){
	    	return $http ({
	    		url : 'deleteOrg?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    getFunctionDetails : function(){
	    	return $http ({
	    		url : 'getFunctionList?orgId=0',
	    		method : 'GET'
	    	})
	    },
	    getOrgAssignFunctionList : function(id){
	    	return $http ({
	    		url : 'getorgassignfunctions?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    assignFunction : function(orgId, functionId){
	    	return $http ({
	    		url : 'assignfunction?orgId='+orgId+"&functionId="+functionId,
	    		method : 'GET'
	    	})
	    },
	    removeFunctionFromOrg : function(id){
	    	return $http ({
	    		url : 'removefunctionfromorg?id='+id,
	    		method : 'GET'
	    	})
	    },
	    getRoleDetails : function(id){
	    	return $http ({
	    		url : 'getRoleList?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    getGroupDetails : function(id){
	    	return $http ({
	    		url : 'getGroupList?orgId='+id,
	    		method : 'GET'
	    	})
	    },
	    getfnDetails : function(id){
	    	return $http ({
	    		url : 'getfuncDetail?fId='+id,
	    		method : 'GET'
	    	})
	    },
	    addgrouptoFn : function(gid,fid){
	    	return $http ({
	    		url : 'addGroupToFunction?gId='+ gid + '&fId='+fid,
	    		method : 'GET'
	    	})
	    },
	    addusertoFn : function(uid,fid){
	    	return $http ({
	    		url : 'addUserToFunction?uId='+ uid + '&fId='+fid,
	    		method : 'GET'
	    	})
	    },
	    removegroupfromFn : function(id){
	    	return $http ({
	    		url : 'removeGroupFromFunction?fgId='+ id,
	    		method : 'GET'
	    	})
	    },
	    addroletoFn : function(fid,rid){
	    	return $http ({
	    		url : 'addRoleToFunction?fId=' + fid + '&rId=' + rid,
	    		method : 'GET'
	    	})
	    },
	    removerolefromFn : function(id){
	    	return $http ({
	    		url : 'removeRoleFromFunction?frId='+id,
	    		method : 'GET'
	    	})
	    },
	    getroleDetails : function(id){
	    	return $http ({
	    		url : 'getRoleDetail?rId=' + id,
	    		method : 'GET'
	    	})
	    },
	    addFntoRole : function(fid,rid){
	    	return $http ({
	    		url : 'addRoleToFunction?fId='+ fid +'&rId='+ rid,
	    		method : 'GET'
	    	})
	    },
	    deleteFntoRole : function(rid){
	    	return $http ({
	    		url : 'removeRoleFromFunction?frId='+ rid,
	    		method : 'GET'
	    	})
	    },
	    getgroupsDetls : function(id){
	    	return $http ({
	    		url : 'getGroupDetail?gId='+id,
	    		method : 'GET'
	    	})
	    },
	    removeFninGroup : function(gid){
	    	return $http ({
	    		url : 'removeGroupFromFunction?fgId='+ gid,
	    		method : 'GET'
	    	})
	    },
	    addFntoGrouLi : function(fid, gid){
	    	return $http ({
	    		url : 'addGroupToFunction?fId='+ fid +'&gId='+gid,
	    		method : 'GET'
	    	})
	    },
	    getusrDetls : function(id){
	    	return $http ({
	    		url : 'getUserInfo?uId=' + id,
	    		method : 'GET'
	    	})
	    },
	    changePwd : function(data) {
			return $http({
	    		 url: 'changePassword',
		            method: 'POST',
		            data:JSON.stringify(data),
		            dataType : 'json',
		            contentType : "application/json"
	    	});
	    },
	    addGropToUsr  : function(uid, gid){
	    	return $http ({
	    		url : 'addUserToGroup?uId='+ uid +'&gId='+gid,
	    		method : 'GET'
	    	})
	    },
	    addRoleToUser  : function(uid, rid){
	    	return $http ({
	    		url : 'addUserToRole?uId='+ uid +'&rId='+rid,
	    		method : 'GET'
	    	})
	    },
	    addFuncToUser  : function(uid, fid){
	    	return $http ({
	    		url : 'addUserToFunction?uId='+ uid +'&fId='+fid,
	    		method : 'GET'
	    	})
	    },
	    removeGroupToUser : function(id){
	    	return $http ({
	    		url : 'removeUserFromGroup?ugId='+id,
	    		method : 'GET'
	    	})
	    },
	    removeRoleFrmUsr : function(id){
	    	return $http ({
	    		url : 'removeUserFromRole?urId='+id,
	    		method : 'GET'
	    	})
	    },
	    removefunToUsr : function(id){
	    	return $http ({
	    		url : 'removeUserFromFunction?ufId='+id,
	    		method : 'GET'
	    	})
	    },
	    
	    deleteUsrTablz : function(id){
	    	return $http ({
	    		url : 'deleteUser?uId='+id,
	    		method : 'GET'
	    	})
	    },

	    deletefuncTablz : function(id){
	    	return $http ({
	    		url : 'deleteFunction?fId='+id,
	    		method : 'GET'
	    	})
	    },
	    deleteRoleTablz : function(id){
	    	return $http ({
	    		url : 'deleteRole?rId='+id,
	    		method : 'GET'
	    	})
	    },
	    deleteGroupTablz : function(id){
	    	return $http ({
	    		url : 'deleteGroup?gId='+id,
	    		method : 'GET'
	    	})
	    },
	   	    
	}
});


//FLEXY 


app.factory('flexyFactry', function($http){
	return{	}

});


