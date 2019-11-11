app.controller('contractdetailController',function($scope,$timeout, $localStorage, $http, $interval){
	
	$scope.currentdate=new Date();
	
	$scope.uAccess=$localStorage.uAccess;

	$scope.contractStatusAllOptions = [];
	
	$scope.isProducer = false;
	
	$scope.hideForm = false;
	
	$scope.newdesc = "";
	
	$scope.loadeer = true;
	
	$scope.currentLogin = ORG_ID+"";
	
	$scope.sendButtonStatus = false;
	
	$scope.autoRefresh = true;
	
	$scope.numberofCheck = 0;
	
	$scope.numberofMaxCheck = 5;
	
	$scope.loadChatData = false;
	
	$scope.prevStatus = "";
	
	$scope.accountData = [];
	
	$scope.colspanClass = "col-md-8";
	
	$scope.priceDisabled = true;
	
	$scope.currentContractId = "";
	
	$scope.prePublicKey = "";

	$scope.newStatusObj = {};
	
	$scope.statusFlexyCode = "DA_CST_CONF_CONT"; 	//"DA_CST_CONT_INIT";
	
	$scope.disableProviderEmail = false;
	
	$scope.disableConsumerEmail = false;
	
	$scope.confirmcontractrequired = false;
	
	$scope.showEncryptmsg = false;
	
	$scope.hideEncryptedRadios = false;
	
	$scope.isEncryptSelected = false;
	
	$scope.selectedContractData = {};
	
	$scope.encryptionValue = "yes";
	
	$scope.encryptedValue = "";
	
	$scope.requiredEncrytion = false;
	
	$scope.setReadOnlyConsumerKey = false;
	
	$scope.negoPrice = 0;
	
	$scope.showEncryptionRadioBtns = false;
	
	$scope.showMsgAndRadioBtns = false;
	
	$scope.showDdlRadioBtns = false;
	
	$scope.showspinner = false;
	
	$scope.showWithdrawnBtn = false;
	
	$scope.hideBtnsWhileSend = false;
	
	$scope.hideAllBtns = false;
	
	$scope.loadeerBtn = false;
	
	$scope.placeHolderMsg == "";
	
	$scope.msgDpCode = "";
	
	$scope.msgDcCode = "";
	
	$scope.transCode = "";
	
	
	$scope.addEndpointInfo = function(){

		
		if($scope.selectedContractData.Record.statuscode == "DA_CST_NEGO_CONF"){
			
			$scope.selectedContractData.Record.finalprice = $scope.negoPrice;
			var originalPrice = $scope.selectedContractData.Record.finalprice.toString();
			if (!originalPrice.includes(".")){
				$scope.selectedContractData.Record.finalprice = originalPrice+".00";
			}
		}
		else if($scope.selectedContractData.Record.statuscode == "DA_CST_NEGO") {
			$scope.priceDisabled = false;
		}
		else{
			$scope.priceDisabled = true;
			var originalPrice = $scope.selectedContractData.Record.finalprice.toString();
			if (!originalPrice.includes(".")){
				$scope.selectedContractData.Record.finalprice = originalPrice+".00";
			}
		}
		
			
	}
	
	var OWNER_API_KEY = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$http ({
		url : 'getFlexyList?code=CONTRACT_STATUS_S10',
		method : 'GET'
	}).then(function(response) {
		
		for(var indexStatus in response.data.result){
			$scope.contractStatusAllOptions.push(response.data.result[indexStatus].value);
			$scope.newStatusObj[(response.data.result[indexStatus].code)] = {"value": response.data.result[indexStatus].value, 
																			 "code" : response.data.result[indexStatus].code};
		}
	
	})
	
	//NEW CODES
	$scope.contractStatusFlexy = [];
	
	$scope.getStatusFlexi=function(){
		$http ({
			url : SUB_LIST_VALPAIR_URL,
			method : 'POST',
			data:{"code":"CONTRACT_DETAILS_STATUS_MSG"},
			contentType : 'application/json',
		}).then(function(response) {
			//console.log(response);
			$scope.contractStatusFlexy=response.data.result;
		})
	}
	var flexicount=0;
	if(flexicount==0){
		$scope.getStatusFlexi();
		flexicount++;
	}
	
	//FLEXI CODE VALUES FOR STATUS MESSAGES
	$scope.getStatusChat=function(code,msg){
		var statusMsg=code;
		angular.forEach($scope.contractStatusFlexy, function(value, key) {
			if (value["code"]==code){
				statusMsg=value[code];
			}
		});
		return statusMsg +" "+msg;
	}
	
	//Open dataset price 0 check for display hide
	$scope.isOpenDataMessage=false;
	$scope.isOpenDatasetCheck=function(data,valuedata){
		var isTrue=true;
		$scope.isOpenDataMessage=false;	
		if(data.price==0 && data.opendataset== "yes"){
			if(valuedata.statuscode=='DA_CST_CONF_CONT'){
				isTrue=false;
				$scope.isOpenDataMessage=true;
			}else if(valuedata.statuscode=='DA_CST_CONT_INIT'){
				isTrue=false;
				$scope.isOpenDataMessage=true;
			}else if(valuedata.statuscode=='DA_CST_TRAN_SUCC'){
				isTrue=false;
				$scope.isOpenDataMessage=true;
			}else if(valuedata.statuscode=='DA_CST_PAYM_PEND'){
				isTrue=false;
				$scope.isOpenDataMessage=true;
			}else if(valuedata.statuscode=='DA_CST_CONT_ACCE'){
				isTrue=false;
				$scope.isOpenDataMessage=true;
			}
		}
		return isTrue;
	}
	
	
	
	$scope.contractStatusOptions = [];
		
	$scope.dropDownReadOnly = false;

	
	$scope.filterObj = function(newStatusCodeObj, val){
		
		for (var i in newStatusCodeObj) {
			if (newStatusCodeObj[i].code == val) {
				return newStatusCodeObj[i].code;
			  }
			}
	};
	
	
	$scope.refreshContractData = function() {
			$http({
				url : API_CONTRACT_LIST,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
				contentType : 'application/json',
				data :{"selector": {"id":$scope.currentContractId+""}, "sort": [{"datecreated": "desc"}]}
				}).then(function(response) {
					if (response.data){
						$scope.selectedContractData = response.data.Data[0];
						console.log($scope.selectedContractData)
						if ($scope.selectedContractData.Record.isencrypted != ""){
							$scope.showEncryptmsg = true;
						}
						$scope.negoPrice = parseFloat($scope.selectedContractData.Record.finalprice);
						
						var disableConsulerKey = $scope.selectedContractData.Record.statuscode;
						
						if (disableConsulerKey == "DA_CST_CONT_INIT" || disableConsulerKey == "DA_CST_NEGO" 
							|| disableConsulerKey == "DA_CST_NEGO_CONF" || disableConsulerKey == "DA_CST_NEGO_CANC"){
							$scope.setReadOnlyConsumerKey = true;
						}
						
						if('statuscode' in $scope.selectedContractData.Record && $scope.selectedContractData.Record.statuscode != ""){
							$scope.statusFlexyCode = $scope.filterObj($scope.newStatusObj, $scope.selectedContractData.Record.statuscode);
						}
						
						$scope.selectedContractData.Record.statuscode = $scope.statusFlexyCode;
						
						$scope.selectedContractData.Record.finalprice = ($scope.selectedContractData.Record.finalprice).toFixed(2);
						$scope.prevStatus = angular.copy($scope.selectedContractData.Record.status);
						$scope.prePublicKey = angular.copy($scope.selectedContractData.Record.publickey);
						$scope.getContractHistory();
						if($scope.selectedContractData.Record.dporgid == $scope.currentLogin) {
							$scope.isProducer = true;
						}

						if($scope.prevStatus == $scope.newStatusObj['DA_CST_NEGO'].value ) {		
							$scope.priceDisabled = false;
						}
						else {
							$scope.	priceDisabled = true;
						}

						if($scope.selectedContractData.Record.statuscode=="DA_CST_CLOS_SUCC_CONT" || $scope.selectedContractData.Record.statuscode == "DA_CST_CLOS_UNSU_CONT"
								) {
							$scope.hideAllBtns = true;
							$scope.colspanClass = "col-md-12";
							$scope.hideForm = true;
							$scope.stopInterval();
						}
						
					}
					else{
						console.log('not found');
					}
			})
	};
	
	
	if($localStorage.selectedContractData != undefined && $localStorage.selectedContractData != null) {
		
		$scope.currentContractId = $localStorage.selectedContractData.Record.id;
		
		$scope.refreshContractData();
		
	}
	
	
	$scope.setScrollBottom = function(){
		var chatContantDivObj = document.getElementById("ChatContant");
		chatContantDivObj.scrollTop = chatContantDivObj.scrollHeight - chatContantDivObj.clientHeight;
	}
	var newCode = "";
	
	$scope.isDDL = true;
	$scope.checkDDL = function(ddl){
//		alert(ddl)
		
		if (ddl == "yes"){
			newCode = "DA_CST_DATA_DOWN_SUCC";
		}
		else{
			newCode = "DA_CST_DATA_DOWN_FAIL";
		}
//		alert(newCode);
	}
	
	
	$scope.contractHistoryData = [];
	
	$scope.previousLength = 0;
	
	$scope.placeHolderConsumer = "";
	$scope.placeHolderProducer = "";
	$scope.prevLengthOfContractHistory = 0;

	$scope.producerWithdrawn = false;
	$scope.consumerWithdrawn = false;
	
	$scope.getContractHistory = function() {
		

		//		alert($scope.selectedContractData.Record.statuscode);
		if ($scope.selectedContractData.Record.statuscode != "DA_CST_CLOS_SUCC_CONT" 
			|| $scope.selectedContractData.Record.statuscode != "DA_CST_CLOS_UNSU_CONT" ){
		
			if($scope.selectedContractData.Key != "") {
				$scope.loadChatData = true;
				var postData = '"'+$scope.selectedContractData.Key+'"'; //[$scope.selectedContractData.Key]; //["fb12468d33722507f650e3a279ebdcd9"];
				$http({
					url : API_CONTRACT_HISTORY,
					method : 'POST',
					headers : {
				        'x-api-key': API_USER_KEY
				    },
					contentType : 'application/json',
					data : postData
					}).then(function(response) {
						if (response.data){
							console.log(response.data);
							console.log("************History*******")
							$scope.contractHistoryData = response.data;
							for (var i=0; i<$scope.contractHistoryData.length; i++){
								
								//$scope.contractHistoryData[i].Value.message=$scope.contractHistoryData[i].Value.message+"<br> Hello";
								
								$scope.contractHistoryData[i].Value.dateformatted=new Date($scope.contractHistoryData[i].Value.dateformatted);
								
								if ($scope.contractHistoryData[i].Value.statuscode == "DA_CST_CLOS_SUCC_CONT" 
									|| $scope.contractHistoryData[i].Value.statuscode == "DA_CST_CLOS_UNSU_CONT" ){
									$scope.colspanClass = "col-md-12";
									$scope.hideForm = true;

									$scope.stopInterval();
								}
							}
							$scope.setSteps();
							var last = $scope.contractHistoryData[$scope.contractHistoryData.length - 1]
							
							$scope.selectedContractData.Record.statuscode = last.Value.statuscode;			
							$scope.placeHolderConsumer = "";
							$scope.placeHolderProducer = "";
							
							if (last.Value.statuscode == "DA_CST_CONF_CONT"){
								$scope.placeHolderConsumer = "Your payment is under processing...";
								$scope.placeHolderProducer = "Your payment is under processing...";
							}
							else if (last.Value.statuscode == "DA_CST_TRAN_SUCC"){
								$scope.placeHolderConsumer = "Waiting for Data Producer to confirm the contract";
								$scope.placeHolderProducer = "Would you like to accept the contract";
								checkBalanceMethod();
							}
							else if (last.Value.statuscode == "DA_CST_CONT_ACCE"){
								$scope.placeHolderConsumer = "Kindly check the API details send and verify you can download the data";
								$scope.placeHolderProducer = "Waiting for Data consumer to confirm the data download";
							}
							else if (last.Value.statuscode == "DA_CST_DATA_DOWN_FAIL"){
								$scope.placeHolderConsumer = "We have send your issue report to Data producer, kindly stay tune for update";
								$scope.placeHolderProducer = "Kindly advice the Data consumer on the data download";
							}
							/*else if (last.Value.statuscode == "DA_CST_DATA_DOWN_SUCC" || last.Value.statuscode == "DA_CST_CRED_PAYM" || last.Value.statuscode == "DA_CST_CLOS_SUCC_CONT"){*/
						    else if (last.Value.statuscode == "DA_CST_CLOS_SUCC_CONT"){	
								$scope.placeHolderConsumer = "Contract is been closed successfully. Thank you from your interest. Do check out our other datasets";
								$scope.placeHolderProducer = "Contract is been closed successfully";
								checkBalanceMethod();
							}
							else if (last.Value.statuscode == "DA_CST_WITH"){
								if ($scope.selectedContractData.Record.dporgid == last.Value.lastmessageby){
									$localStorage.lastid = last.Value.lastmessageby;
									$scope.producerWithdrawn = true;
								}
								else if($scope.selectedContractData.Record.dporgid != last.Value.lastmessageby){
									$localStorage.lastid = last.Value.lastmessageby;
									$scope.consumerWithdrawn = true;
								}
							}
							
							else if (last.Value.statuscode == "DA_CST_PAYM_PEND"){
								$scope.placeHolderConsumer = "In-sufficient balance, kindly top-up your credits";
								$scope.placeHolderProducer = "In-sufficient balance at data consumer, waiting for payment to be processed";
								checkBalanceMethod();
							}

							else if (last.Value.statuscode == "DA_CST_PAYM_REFU"){
								if ($scope.selectedContractData.Record.dporgid == $localStorage.lastid){
									$scope.producerWithdrawn = true;
								}
								else{
									$scope.consumerWithdrawn = true;
								}
								checkBalanceMethod();
							}
							
							
							else if (last.Value.statuscode == "DA_CST_CLOS_UNSU_CONT"){
								if ($scope.selectedContractData.Record.dporgid == $localStorage.lastid){
									$scope.producerWithdrawn = true;
								}
								else{
									$scope.consumerWithdrawn = true;
								}
								checkBalanceMethod();
							}
							
							if (last.Value.statuscode == "DA_CST_TRAN_SUCC"){
								$scope.showEncryptionRadioBtns = true;
								checkBalanceMethod();
							}
							else{
								$scope.showEncryptionRadioBtns = false;
							}
							
							if (last.Value.statuscode == "DA_CST_CONT_INIT" ||
								last.Value.statuscode == "DA_CST_CONF_CONT" || last.Value.statuscode == "DA_CST_PAYM_PEND" ||
									last.Value.statuscode == "DA_CST_NEGO" || last.Value.statuscode == "DA_CST_NEGO_CONF"
									|| last.Value.statuscode == "DA_CST_NEGO_CANC" || last.Value.statuscode == "DA_CST_CLOS_SUCC_CONT"
									|| last.Value.statuscode == "DA_CST_CLOS_UNSU_CONT" || last.Value.statuscode == "DA_CST_PAYM_REFU"
										|| last.Value.statuscode == "DA_CST_CRED_PAYM" || last.Value.statuscode == "DA_CST_CONT_ACCE"
											|| last.Value.statuscode == "DA_CST_DATA_DOWN_SUCC" || last.Value.statuscode == "DA_CST_DATA_DOWN_FAIL" || last.Value.statuscode =="DA_CST_WITH"
												
//						|| last.Value.statuscode == "DA_CST_TRAN_SUCC"
							){
								$scope.showMsgAndRadioBtns = false;
							}
							else{
								$scope.showMsgAndRadioBtns = true;
							}
							
							if (last.Value.statuscode == "DA_CST_CONT_ACCE" || last.Value.statuscode == "DA_CST_DATA_DOWN_FAIL"){
								$scope.showDdlRadioBtns = true;
							}else{
								$scope.showDdlRadioBtns = false;
							}
							
							if (last.Value.statuscode == "DA_CST_CONT_INIT"  || last.Value.statuscode == "DA_CST_CONF_CONT"
								||last.Value.statuscode == "DA_CST_TRAN_SUCC"){
								$scope.showWithdrawnBtn = true;
							}
							else{
								$scope.showWithdrawnBtn = false;
							}
							
							$scope.numberofCheck = 0;
							$scope.loadeer = false;
							$scope.setScrollBottom();
						}
						else{
							console.log('not found');
							$scope.loadeer = false;
						}
						$scope.loadChatData = false;
						
				})
			}
		}
	}
	
	$scope.resetPublicKey = function(){
		$scope.selectedContractData.Record.publickey = $scope.prePublicKey;
		jQuery('#publicKeyModal').modal('hide');
	}
	
	
	$scope.getAutoContractHistory = function() {
		
//		if ($scope.numberofCheck < $scope.numberofMaxCheck ){
		if ($scope.selectedContractData.Record.statuscode != "DA_CST_CLOS_SUCC_CONT" 
			|| $scope.selectedContractData.Record.statuscode != "DA_CST_CLOS_UNSU_CONT" ){
			
		
			if($scope.selectedContractData.Key != "") {
				$scope.loadChatData = true;
				var postData = [$scope.selectedContractData.Key]; //["fb12468d33722507f650e3a279ebdcd9"];
				$http({
					url : API_CONTRACT_HISTORY,
					method : 'POST',
					headers : {
				        'x-api-key': API_USER_KEY
				    },
					contentType : 'application/json',
					data : postData
					}).then(function(response) {
						if (response.data){
							console.log(response.data);
							$scope.contractHistoryData = response.data;
							
							for (var i=0; i<$scope.contractHistoryData.length; i++){
								$scope.contractHistoryData[i].Value.dateformatted=new Date($scope.contractHistoryData[i].Value.dateformatted);
								if ($scope.contractHistoryData[i].Value.statuscode == "DA_CST_CLOS_SUCC_CONT" 
									|| $scope.contractHistoryData[i].Value.statuscode == "DA_CST_CLOS_UNSU_CONT" ){
									$scope.colspanClass = "col-md-12";
									$scope.hideForm = true;
									$scope.stopInterval();
								}
							}
							if ($scope.previousLength == $scope.contractHistoryData.length){
								$scope.numberofCheck++;
							}
							else{
//								$scope.loadChat = false;
								$scope.previousLength = response.data.length;
								$scope.numberofCheck = 0;
							}
							$scope.loadChatData = false;							
							$scope.loadeer = false;
							$scope.setScrollBottom();
							
						}
						else{
							console.log('not found');
							$scope.loadeer = false;
						}
				})
			}
			}
//		}
	}
	
	$scope.isKeyUpdate = false;
	
	$scope.updateContractPublicKey = function(newdesc) {
		
		$scope.isKeyUpdate = true;
		
		var postData = { "lastmessageby": ORG_ID+"", "id":$scope.selectedContractData.Record.id,"message":newdesc, "publickey" : $scope.selectedContractData.Record.publickey};
		
		$scope.updateContractToBc(postData);
		
	}
	
	$scope.updateContractToBc = function(postData){
	
		$scope.sendButtonStatus = true;
		
		//var postData = { "lastmessageby": ORG_ID+"", "id":$scope.selectedContractData.Record.id,"message":newdesc, "status":$scope.selectedContractData.Record.status, "finalprice":parseFloat($scope.selectedContractData.Record.finalprice), "publickey" : $scope.selectedContractData.Record.publickey};
		$http({
			url : API_UPDATE_CONTRACT,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : postData
			}).then(function(response) {
				if (response.data){
					console.log("*******UPDATE CONTRACT********");
					console.log(response.data);
					$scope.loadeer = false;						
					$scope.newdesc = "";
					$scope.sendButtonStatus = false;
					$scope.refreshContractData();
					$scope.getContractHistory();
					$scope.showspinner = false;
					$scope.loadeerBtn = false;
					if ($scope.hideBtnsWhileSend){
						$scope.hideBtnsWhileSend = false;
					}
					if ($scope.loadeer){
						$scope.loadeer = false;
					}
					
				}
				else{
					console.log('not found');
					$scope.loadeer = false;
					$scope.sendButtonStatus = false;
					$scope.showspinner = false;
					$scope.loadeerBtn = false;
					
					if ($scope.hideBtnsWhileSend){
						$scope.hideBtnsWhileSend = false;
					}
					if ($scope.loadeer){
						$scope.loadeer = false;
					}
				}
				$scope.isKeyUpdate = false;
				newdesc = "";
				jQuery('#publicKeyModal').modal('hide');
				jQuery('#contact').modal('hide');
				jQuery('#withdraw').modal('hide');
				
		})
		
	}

	

	$scope.updateConsumermail = function(newdesc, dcmail){
		$scope.selectedContractData.Record.dcemail = dcmail;
		$scope.updateContract(newdesc);
	}
	
	$scope.updateProducermail = function(newdesc, dpmail){
		$scope.selectedContractData.Record.dpemail = dpmail;
		$scope.updateContract(newdesc);
	}
	
	
	$scope.withdrawnContract = function(newDesc){
		$timeout(function(){
			jQuery('#withdraw').modal('hide');
			newCode = "DA_CST_WITH";
			$scope.msgDpCode = "DA_CD_WITH_DP_MSG";
			$scope.msgDcCode = "DA_CD_WITH_DC_MSG";
			$scope.transCode = "";
			$scope.selectedContractData.Record.statuscode = newCode;
			$scope.updateContract(newDesc);
			$scope.startInterval();
		}, 1000)
	}


	$scope.updateContract1 = function(newdesc){
		jQuery('#contact').modal('hide');
		$scope.updateContract(newdesc);
		$scope.startInterval();
	}

	$scope.updateContractBtnAction = function(newdesc,action){
		
		if(action=='accept'){
			newCode = "DA_CST_CONT_ACCE";
			$scope.msgDpCode = "DA_CD_CONT_ACCE_DP_MSG";
			$scope.msgDcCode = "DA_CD_CONT_ACCE_DP_MSG";
			$scope.transCode = "DA_CD_CONT_ACCE";
			newdesc = "DA_CD_CONT_ACCE_DP_MSG";
		}else if(action=='acceptcancel'){
			newCode = "DA_CST_WITH";
			$scope.msgDpCode = "DA_CD_WITH_DP_MSG";
			$scope.msgDcCode = "DA_CD_WITH_DC_MSG";
			$scope.transCode = "";
			newdesc = "DA_CD_WITH_DP_MSG";
			
		}else if(action=='download'){
			newCode = "DA_CST_DATA_DOWN_SUCC";
			$scope.msgDpCode = "DA_CD_DDL_SUCC_DC_MSG";
			$scope.msgDcCode = "DA_CD_DDL_SUCC_DC_MSG";
			$scope.transCode = "DA_CD_DOWN_EXPI";
			newdesc = "DA_CD_DDL_SUCC_DC_MSG";
			
		}else if(action=='downloadcancel'){
			newCode = "DA_CST_DATA_DOWN_FAIL";
			$scope.msgDpCode = "DA_CD_DDL_UNSU_DC_MSG";
			$scope.msgDcCode = "DA_CD_DDL_UNSU_DC_MSG";
			$scope.transCode = "DA_CD_DOWN_EXPI";
			newdesc = "DA_CD_DDL_UNSU_DC_MSG";
			
		}else if(action=='message'){
			newCode = $scope.selectedContractData.Record.statuscode;
			$scope.msgDpCode = newdesc;
			$scope.msgDcCode = newdesc;
			$scope.transCode = "";
		}
	
		$timeout(function(){
			$scope.selectedContractData.Record.statuscode = newCode;
			$scope.updateContract(newdesc);
			$scope.startInterval(); 
		}, 2000)
	}
	

	
	$scope.ddlUpdateContractBtn = function(newdesc){
		if (newCode!= undefined && newCode == "DA_CST_DATA_DOWN_FAIL"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_DATA_DOWN_FAIL";
			newCode == "DA_CST_DATA_DOWN_FAIL";
		}
		else if (newCode!= undefined && newCode == "DA_CST_DATA_DOWN_SUCC"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_DATA_DOWN_SUCC";
			newCode == "DA_CST_DATA_DOWN_SUCC";
		}
//		$scope.loadeerBtn = true;
//		$scope.hideBtnsWhileSend = true;
		$scope.updateContract(newdesc);
	}
	
	
	$scope.updateContract = function(newdesc) {

		/*$scope.hideBtnsWhileSend = true;
		
		$scope.showspinner = true;
		$scope.confirmcontractrequired = false;*/
		

		if($scope.selectedContractData.Record.statuscode == undefined || $scope.selectedContractData.Record.statuscode == ""){
			$scope.selectedContractData.Record.statuscode = $scope.prevStatus;
		}
		else if($scope.selectedContractData.Record.statuscode == "DA_CST_CONF_CONT"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_CONF_CONT";
			newCode = $scope.selectedContractData.Record.statuscode;
			$scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value = "Contract confirmed";
		}
		
		else if($scope.selectedContractData.Record.statuscode == "DA_CST_TRAN_SUCC"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_TRAN_SUCC";
			newCode = $scope.selectedContractData.Record.statuscode;
			$scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value = "Payment transaction successfully";
		}
		
		else if($scope.selectedContractData.Record.statuscode == "DA_CST_CONT_ACCE"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_CONT_ACCE";
			newCode = $scope.selectedContractData.Record.statuscode;
			$scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value = "Contract accepted";
		}
		
		else if(newCode !="" && newCode == "DA_CST_DATA_DOWN_FAIL" || $scope.selectedContractData.Record.statuscode == "DA_CST_DATA_DOWN_FAIL"){
			newCode = "DA_CST_DATA_DOWN_FAIL";
			$scope.selectedContractData.Record.statuscode = "DA_CST_DATA_DOWN_FAIL";
			$scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value = "Data Downloaded Failure";
		}
		
		else if(newCode !="" && newCode == "DA_CST_DATA_DOWN_SUCC" || $scope.selectedContractData.Record.statuscode == "DA_CST_DATA_DOWN_SUCC"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_DATA_DOWN_SUCC";
			newCode = "DA_CST_DATA_DOWN_SUCC";
			$scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value = "Data Downloaded Successful";
		}
		
		else if(newCode !="" && newCode == "DA_CST_WITH"){
			$scope.selectedContractData.Record.statuscode = "DA_CST_WITH";
			newCode = "DA_CST_WITH";
			$scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value = "Withdrawn";
		}
		
		if (newdesc == ""){
			jQuery('#msgEmptyModal').modal('show');
			
		}
		else if (newdesc != ""){
			$scope.loadeerBtn = true;
			$scope.hideBtnsWhileSend = true;
			
			$scope.showspinner = true;
			$scope.confirmcontractrequired = false;
			
			$scope.sendButtonStatus = true;
			$http({
				url : API_CONTRACT_LIST,
				method : 'POST',
				headers : {
					'x-api-key': API_USER_KEY
				},
				contentType : 'application/json',
				data :{"selector": {"id":$scope.currentContractId+""}, "sort": [{"datecreated": "desc"}]}
				}).then(function(response) {
//				
					if (response.data){
//						alert('--------------------3333--------------------')
//						alert(newCode);
						$scope.newStatusFromBc = response.data.Data[0].Record.status;
						if ($scope.prevStatus==$scope.newStatusFromBc){

							if ($scope.encryptedValue != ""){
								$scope.encryptionValue = $scope.encryptedValue;
							}
							$scope.selectedContractData.Record.statuscode = newCode;
							
							if($scope.transCode==""){
								$scope.transCode=$scope.selectedContractData.Record.transactionstatus;
							}

							var postData = { "lastmessageby": ORG_ID+"", 
											"id":$scope.selectedContractData.Record.id, //$scope.selectedContractData.Record.id
											"message":newdesc, 
//											"status":$scope.selectedContractData.Record.status,
											"status": $scope.newStatusObj[$scope.selectedContractData.Record.statuscode].value,
											"finalprice":parseFloat($scope.selectedContractData.Record.finalprice), 
											"publickey" : $scope.selectedContractData.Record.publickey,
											"dpemail" : $scope.selectedContractData.Record.dpemail,
											"dcemail" : $scope.selectedContractData.Record.dcemail,
											"statuscode" : $scope.selectedContractData.Record.statuscode,
											"isencrypted": $scope.encryptionValue,
											"messagedp" : $scope.msgDpCode,
											"messagedc" : $scope.msgDcCode,
											"transactionstatus" : $scope.transCode
							};
				
							$scope.updateContractToBc(postData);
							$scope.selectedContractData.Record.statuscode = "";

						}
						else{
//							alert('--------------------44444444444----------------------')
							$scope.sendButtonStatus = false;
							jQuery('#refreshModal').modal('show');
//							alert('Your update has been canceled due to status has been updated by someone, Plese check and update again.')
							$scope.selectedContractData = response.data.Data[0];
							$scope.selectedContractData.Record.finalprice = ($scope.selectedContractData.Record.finalprice).toFixed(2);
							$scope.prevStatus = angular.copy($scope.selectedContractData.Record.status);
							$scope.getContractHistory();
							if($scope.selectedContractData.Record.dporgid == $scope.currentLogin) {
								$scope.isProducer = true;
							}
							//if($scope.prevStatus == "Contract Initiated" || $scope.prevStatus == "Negotiation" ) {
//							if($scope.prevStatus == $scope.newStatusObj['DA_CST_CONT_INIT'].value || $scope.prevStatus == $scope.newStatusObj['DA_CST_NEGO'].value ) {
							if($scope.prevStatus == $scope.newStatusObj['DA_CST_NEGO'].value ) {	
								$scope.priceDisabled = false;
							}
							else {
								$scope.priceDisabled = true;
							}
							
//							$scope.setCaegoryOptions();
							//if($scope.selectedContractData.Record.status=="Closed" || $scope.selectedContractData.Record.status == "Data Downloaded Successful") {
							if($scope.selectedContractData.Record.statuscode=="DA_CST_CLOS_SUCC_CONT" || 
								$scope.selectedContractData.Record.statuscode == "DA_CST_CLOS_UNSU_CONT"
//									||$scope.selectedContractData.Record.statuscode=="DA_CST_CRED_PAYM" || 
//									$scope.selectedContractData.Record.statuscode == "DA_CST_CLOS_UNSU_CONT"
										) {
								$scope.colspanClass = "col-md-12";
								$scope.hideForm = true;
								$scope.stopInterval();
								}
							
						}
						
					}
					else{
						console.log('not found');
						
					}
				
			})
			
		}	
		
	}
	
		
	
   //Below timeout function switch off the page loader after 5 seconds.
	
	$scope.showPublicKeyModal =function() {
		//
		jQuery('#publicKeyModal').modal();
	}

	
	$scope.autoRefreshPopupIsVisible = false;
	
	$scope.autoPageReloader = function(){
		location.href = location.href;
	}
	
	$scope.autoPageReload = function() {
//		$scope.autoRefreshPopupIsVisible = true;
		$scope.autoRefreshPopupIsVisible = false;
//		jQuery('#autoPageReloadModal').modal('show');
	}
	
	var inactivityTime = function () {
	    var time;
	    window.onload = resetTimer;
	    // DOM Events
	    document.onmousemove = resetTimer;
	    document.onkeypress = resetTimer;

	    function logout() {
	    	if ($scope.prevStatus != $scope.newStatusObj['DA_CST_CLOS_SUCC_CONT'].value && !$scope.autoRefreshPopupIsVisible){
	    		$scope.autoPageReload();
	    	}
	        //location.href = 'logout.html'
	    }

	    function resetTimer() {
	        clearTimeout;
	        time = setTimeout(logout, 1000*300)
	        // 1000 milliseconds = 1 second
	    }
	};
	
	inactivityTime();
	
	
	$scope.copytoclipboard = function(){
		jQuery('#testkey').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
		var copyText = document.getElementById("copykey");
		copyText.select();
		document.execCommand("copy");
	};
	
	$scope.copytoclipboard1 = function(){
		jQuery('#testkey1').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
		var copyText = document.getElementById("copykey1");
		copyText.select();
		document.execCommand("copy");
	};
	
	
	$scope.copyContractNum = function(id){
		var copyText = document.getElementById(id);
	    var textArea = document.createElement("textarea");
	    textArea.value = copyText.textContent;
	    document.body.appendChild(textArea);
	    textArea.select();
	    document.execCommand("Copy");
	    textArea.remove();
	    jQuery('#copyContract').attr('title', 'Copied to clipboard').tooltip('fixTitle').tooltip('show');
	};
	
	

	$scope.ifRadioYes = true;
	$scope.radioVal = "yes";
	
	$scope.chooseRadiobtns = function(val){
		if (val == "yes"){
			$scope.ifRadioYes = true;
		}
		else{
			$scope.ifRadioYes = false;
		}
	}
	
	$scope.isencrypted = "yes";
	$scope.isEncrypted = function(val){
		$scope.encryptionValue = val;
	}
	
	
//	CONFIRM CONTARCT-------------------------------
	
	$scope.startTimeUpdate = function(){
		$scope.refreshContractData();
		$timeout(function(){
			if($scope.selectedContractData.Record && $scope.selectedContractData.Record.statuscode == "DA_CST_CONT_INIT") {
				$scope.selectedContractData.Record.statuscode = "DA_CST_CONF_CONT";	
				$scope.updateContract("");
			}
		},8000)
		
	}

	
// -----------------------------PROGRESS BAR CODE START--------------------------------------
	
	$scope.showConfirm = true;
	$scope.showAccept = false;
	$scope.showDdlsucc = false;
	$scope.showcredit = false;
	$scope.showContClosd = false;
	$scope.showAPIExch = false;
	
	$scope.showConfirmDate = "";
	$scope.showPayProcDate = "";
	$scope.showAcceptDate = "";
	$scope.showDdlsuccDate = "";
	$scope.showcreditDate = "";
	$scope.showContClosdDate = "";
	$scope.showAPIExchDate = "";
	
	$scope.setSteps = function(){
	
		for (var i=0; i<$scope.contractHistoryData.length; i++){
			
			var statusObj = $scope.contractHistoryData[i].Value;
			
			if (statusObj.transactionstatus == 'DA_CD_CONF_CONT'){
				$scope.showConfirmDate = new Date(statusObj.dateformatted);
			}
			if(statusObj.transactionstatus == 'DA_CD_CONT_ACCE'){
				$scope.showConfirm = true;
				$scope.showAccept = true;
				$scope.showAcceptDate = new Date(statusObj.dateformatted);
			}
			if(statusObj.transactionstatus == 'DA_CD_API_EXCH'){
				$scope.showConfirm = true;
				$scope.showAccept = true;
				$scope.showAPIExch = true;
				$scope.showAPIExchDate = new Date(statusObj.dateformatted);
			}
			if(statusObj.transactionstatus == 'DA_CD_DOWN_EXPI'){
				$scope.showConfirm = true;
//				$scope.showPayProc = true;
				$scope.showAccept = true;
				$scope.showDdlsucc = true;
				$scope.showDdlsuccDate = new Date(statusObj.dateformatted);
			}
			
			if(statusObj.transactionstatus == 'DA_CD_CLOS_SUCC_CONT' || statusObj.transactionstatus == 'DA_CD_CLOS_UNSU_CONT'){
				$scope.showConfirm = true;
//				$scope.showPayProc = true;
				$scope.showAccept = true;
				$scope.showDdlsucc = true;
				$scope.showcredit = true;
				$scope.showContClosd = true;
				$scope.showContClosdDate = new Date(statusObj.dateformatted);
			}
			
		}
	}
	// -----------------------------PROGRESS BAR CODE END--------------------------------------

	
	$scope.updateSettings = function(from){
		jQuery('#con-setting').modal('hide');
		var oldcode = $scope.selectedContractData.Record.statuscode;
		
			if ($scope.selectedContractData.Record.dpemail == undefined || $scope.selectedContractData.Record.dpemail == null || $scope.selectedContractData.Record.dpemail == ""){
				$scope.selectedContractData.Record.dpemail = "-NA-";
			}
			
			if ($scope.selectedContractData.Record.dcemail == undefined || $scope.selectedContractData.Record.dcemail == null || $scope.selectedContractData.Record.dcemail == ""){
				$scope.selectedContractData.Record.dcemail = "-NA-";
			}
			
			if(from=='DC'){
				$scope.msgDpCode = "DA_CD_SETTING_UP_DC_MSG";
				$scope.msgDcCode = "DA_CD_SETTING_UP_DC_MSG";
			}else{
				$scope.msgDpCode = "DA_CD_SETTING_UP_DP_MSG";
				$scope.msgDcCode = "DA_CD_SETTING_UP_DP_MSG";
			}
			
			$scope.updateContract(oldcode);
			$scope.startInterval();
		
	}
	
	
	
	$scope.startInterval = function(){
		$scope.myInterval = $interval(function(){
			if ($scope.selectedContractData.Record){
				if ($scope.selectedContractData.Record.statuscode != "DA_CST_CLOS_SUCC_CONT" || $scope.selectedContractData.Record.statuscode != "DA_CST_CLOS_UNSU_CONT" ){
					if(!$scope.hideForm){
						$scope.refreshContractData();
						$scope.getContractHistory();
					}
					
				}
			}
		}, 60000);
	}
	
	$scope.stopInterval= function(){
	  if($scope.myInterval)
		  $interval.cancel($scope.myInterval);
	}
	
	$scope.startInterval();
	
	
	$scope.getAccountData = function() {
	
		$http({
			url : API_DA_ACCOUNTLIST,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":ORG_ID}
			}).then(function(response) {
				if (response.data){
					$scope.accountData = response.data.result;
					if ($scope.accountData[0].acType == 'Earning'){
						$scope.disableProviderEmail = false;
						$scope.disableConsumerEmail = true;
					}else{
						$scope.disableProviderEmail = true;
						$scope.disableConsumerEmail = false;
					}
				}				
		})
	}
	$scope.getAccountData();
	
	
	$scope.disableStatusAfterOnce = function(stat){

		$scope.disableStatusInUI = {};
		stat = stat.toLowerCase();
		
		if (!(stat in $scope.disableStatusInUI)){
			$scope.disableStatusInUI[stat] = 1;
			$scope.showStatus = true;
		}
		else{
			$scope.showStatus = false;
		}
		
	}
	
	jQuery('#topMenu').css("display", "block");
	
})
