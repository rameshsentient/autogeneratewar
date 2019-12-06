app.controller('marketplaceController',function($scope,$timeout, $localStorage, $http, filterFilter){
	
	$scope.uAccess=$localStorage.uAccess;
	
	var isHaveContractsignAccess = $scope.uAccess.ADDCONTRACT;
	
	var OWNER_API_KEY = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$scope.categoryOptions = [];
	
	$scope.dataProviderOptions = [];
	
	$scope.marketPlaceDataAll = [];
	
	$scope.marketPlaceData = [];
	
	$scope.category = "";
	
	$scope.dataProvider = "";
	
	$scope.existContractDataAll = [];
	
	$scope.existContractData = [];
	
	$scope.marketPlaceView = {}
	
	$scope.loadeer = true;
	
	$scope.buyPopupStatusLoad = false;
	
	$scope.isAlreadyPurchased = false;
	
	$scope.buttonStatus = false;
	
	$scope.emails = {0:"", 0:""};
	
	$scope.startDate = "";
	
	$scope.endDate = "";
	
	$scope.filtered = [];
	
	$scope.tableView = false;
	
	$scope.isDateFound = false;
	
	$scope.FailReturnMsg = "";
	
	$scope.signContractPopupMessages = {};
	
	$scope.consumerEmail = "";
	
	$scope.afterPurchasedBtn = false;

	$scope.afterPurchasedContId = "";
	
	$scope.tmpdsName = "";

	$scope.showLoadmoretext = false;	

	$scope.scrolleloader = false;
	
	$scope.skipCount = 0;
	
	$scope.showEndPagetext = false;
	
	$scope.paginationPageCount = 0;
	
	$scope.isScrollingActive = false;
	
	$scope.rowObjOfDs = {};
	
	$scope.showBalBeforePurchase = "";
	
	$scope.remainingAmnt = 0;
	
	$scope.dsCost = "";
	
	$scope.currentBalance = "";
	
	$scope.isBuynowActive = false;
	
//	$scope.marketplaceIndex = "";
	
	$scope.showSpinnerBtn = false;
	
	$scope.countries = [];
	
	$scope.limitlength = 4;
	
	$scope.getSignContractPopupMsg = function(){
		
		$scope.signContractPopupMessages = {};
		$http ({
    		url : 'getFlexyList?code=SIGN_CONTRACT',
    		method : 'GET'
    	}).then(function(response) {
    		for(var indexval in response.data.result){
    			$scope.signContractPopupMessages[(response.data.result[indexval].code)] = {"value": response.data.result[indexval].value, 
																						   "code" : response.data.result[indexval].code,
																						   "id" : response.data.result[indexval].id
																						  };
			}
    		console.log($scope.signContractPopupMessages);	
    	})
	};
	$scope.getSignContractPopupMsg();
	
	
	$scope.gotoDetailPage = function(){
		location.href="contractdetail";
		
	}
	
	$scope.setTableViewStatus = function() {
		if($scope.tableView){
			$scope.tableView = false;
		}
		else {
			$scope.tableView = true;
		}
		
	}
	
	$scope.gotoDetailView = function(id) {
		$localStorage.selectedContractData = {"Record":{"id":id}};
		$timeout(function(){		
			location.href="contractdetail";			
		},700)
	};
	
	$scope.viewMore = function(viewData){
		
		$scope.marketPlaceView = viewData;
		jQuery('#moreDetailModal').modal();
	}
	
	$scope.alreadyExitsiInContractList = [];
	
	
	$scope.getExpiryDaSetting = function(data) {
		$http({
			url : API_GET_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"expiry": "yes"}
			}).then(function(response) {
				console.log('----expiry da setting res----');
				console.log(response.data);
				$scope.idResults = response.data.result;
				$scope.idresul = []; // [245, 216, 177];
				for (var i=0; i<$scope.idResults.length; i++){
					$scope.idresul.push({"orgid":$scope.idResults[i]+""});
				}
				$localStorage.expiryContracts = $scope.idresul; 
				console.log($localStorage.expiryContracts);
				console.log('****expiry da setting res****');
			})
	};
	
	if ($localStorage.expiryContracts == undefined || $localStorage.expiryContracts.length == 0){
		$scope.getExpiryDaSetting();
	}
	else{
		console.log($localStorage.expiryContracts);
	}
	
	
	$scope.setViewDetailData = function(data, newKey) {
		data.Record.alreadypurchased = true;		
		data.Record.contractid = newKey;
		$localStorage.selectedContractData = {"Record":{"id":newKey}};
		$timeout(function(){
			$scope.buyPopupStatusLoad = false;			
		},1000);
	}
	
	
	$scope.refreshPage = function(){
		location.href = location.href;
	}
	
	
	$scope.ifItemAlreadyPurchased = function() {
		jQuery('#alreadyPurchasedModal').modal('show');
	}
	
	/*$scope.signContract11 = function(data) {
		$scope.showSpinnerBtn = false;
		jQuery('#thanksModalSuccess').modal('show');
	}*/

	$scope.hideUnwantedTxt = false;
	
	$scope.signContract = function(data) {
		jQuery('#spinnerpurchase').modal('show');
		data = $scope.rowObjOfDs;
		console.log('signcontract');
		console.log(data);
		$scope.buyPopupStatusLoad = true;
		
		if(publicKey == "") {
			jQuery('#spinnerpurchase').modal('hide');
			jQuery('#pubKeyMandatoryModal').modal();
		}
		else {
			$scope.endpoint = "";
			if ("endpointurl" in data.Record){
				$scope.endpoint = data.Record.endpointurl;
			}
			var buyDataInfo = {
					"dpname":data.Record.dataprovidername, "dporgid":data.Record.orgid+"",	"dpclientid":data.Record.clientid, 
					"dcname":ORG_NAME, "dcorgid":ORG_ID+"", "dcclientid":CLIENT_ID,
					"message":"",	"lastmessageby":ORG_ID+"", "status":"Contract confirmed", 
					"finalprice":data.Record.price,"price":data.Record.price,"currency":data.Record.currency, "dsname":data.Record.name,
					"publickey":publicKey,"negotiation":data.Record.negotiation, "statuscode":"DA_CST_CONF_CONT",
					"dcemail":$scope.emails[ORG_ID+""], "dpemail":$scope.emails[data.Record.orgid+""], "endpointurl" :$scope.endpoint,
					"opendataset":data.Record.opendataset, "messagedp":"DA_CD_CONF_CONT_MSG", "messagedc":"DA_CD_CONF_CONT_MSG", "transactionstatus":"DA_CD_CONF_CONT"
			};
			
			
			if (data.Record.opendataset == "yes"){
				$scope.hideUnwantedTxt = true;
			}
			
			$scope.tmpdsName = buyDataInfo.dsname;
			console.log('buyDataInfo-------------');
			console.log(JSON.stringify(buyDataInfo));
			console.log('buyDataInfo*************');
			$http({
				url : API_ADD_CONTRACT,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
				contentType : 'application/json',
				data : buyDataInfo
				}).then(function(response) {
					$scope.showLoadmoretext = false;
					$scope.emails = {"dpId":0, "dcId":0};
					if (response.data){
						$timeout(function(){
							console.log('****** sing contract result ******');
							console.log(response);
							console.log('****** sing contract result ******');
							if (response.data.status != 200){
								jQuery('#spinnerpurchase').modal('hide');
								$scope.buyPopupStatusLoad = false;
								$scope.isAlreadyPurchased = true;
								$scope.FailReturnMsg = response.data.message;
								jQuery('#errorpurchase').modal('show');
								
								/*if (response.data.message in $scope.signContractPopupMessages){
									$scope.FailReturnMsg = $scope.signContractPopupMessages[response.data.message].value
									$scope.FailReturnMsg = $scope.signContractPopupMessages[response.data.message].value
								}
								else{
									$scope.FailReturnMsg = response.data.message;
								}*/
							}
							else{
								jQuery('#spinnerpurchase').modal('hide');
								$scope.FailReturnMsg = "";
								$scope.buyPopupStatusLoad = false;
								$scope.afterPurchasedBtn = true;
								$scope.afterPurchasedContId = response.data.message;
								$scope.setViewDetailData(data, response.data.message);
								checkBalanceMethod();
								$scope.rowObjOfDs = {};
								jQuery('#thanksModalSuccess').modal('show');
							}
						},1500)
					}
					else{
						jQuery('#spinnerpurchase').modal('hide');
						jQuery('#error').modal('show');
						console.log('buyNow Error');
					}
				})
		}
	};
	
	
	$scope.nonOpendatasetRecords = function(data){
		data.Record.dcEmailId = $scope.consumerEmail;
		data.Record.userId = loginUsrId;
		data.Record.dcorgId = ORG_ID;
		data.Record['parameterType'] = "InvalidPurchase";
		console.log(data);
		$http({
			url : API_NON_OPENDATASET,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : data
			}).then(function(response) {
				console.log(data);
			})
	};

$scope.upgradingPlanType = function(data){
		
//		jQuery('#spinnerpurchase').modal('show');
		jQuery('#upgradePlantypeModal').modal('show');
		
		data = $scope.rowObjOfDs;
		console.log(data);
		data.Record.dcEmailId = $scope.consumerEmail;
		data.Record.userId = loginUsrId;
		data.Record.dcorgId = ORG_ID;
		data.Record['parameterType'] = "";
		console.log(data);
		$http({
			url : API_NON_OPENDATASET,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : data
			}).then(function(response) {
				console.log(data);
			})
	};
	
	$scope.typeForDownload = "";
	$scope.checkPlantype = function(data) {
		$http({
			url : API_GET_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":ORG_ID}
			}).then(function(response) {
				if (response.data.result.planType != undefined && response.data.result.planType != null){
					$scope.typeForDownload = response.data.result.planType;
				}
			})
	};
	
	/*
	$scope.upgradingPlanType = function(data){
		
		data = $scope.rowObjOfDs;
		console.log(data);
		data.Record.dcEmailId = $scope.consumerEmail;
		data.Record.userId = loginUsrId;
		data.Record.dcorgId = ORG_ID;
		data.Record['parameterType'] = "";
		console.log(data);
		$http({
			url : API_NON_OPENDATASET,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : data
			}).then(function(response) {
				console.log(data);
			})
	}
	
	$scope.typeForDownload = "";
	$scope.checkPlantype = function(data) {
		$http({
			url : API_GET_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":ORG_ID}
			}).then(function(response) {
				if (response.data.result.planType != undefined && response.data.result.planType != null){
					$scope.typeForDownload = response.data.result.planType;
				}
			})
	}
	*/
	
	
	$scope.getDaSetting = function(data) {
		$http({
			url : API_GET_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":ORG_ID}
			}).then(function(response) {
				console.log('----PlantType----');
				console.log(response);
				$scope.res = response.data.result;
				console.log('****PlantType****');
				
				if (response.data.result.planType != undefined && response.data.result.planType != null && response.data.result.planType != "" && response.data.result.planType != "DA_PT_BASIC"){
					jQuery('#spinnerpurchase').modal('hide');
					$scope.isBuynowActive = false;
					jQuery('#initiatepurchase').modal('show');
					$scope.typeForDownload = response.data.result.planType;
				}
				else{
					jQuery('#spinnerpurchase').modal('hide');
					$scope.isBuynowActive = false;
					jQuery('#plantypeModal').modal('show');
					$scope.nonOpendatasetRecords(data);
				}
			})
	};
	
	$scope.curBal = "";
	$scope.dsPrice = "";
	
	
	$scope.checkIsEnoughBalance = function(data){
		$scope.isBuynowActive = true;
		$http({
			method: "POST",
		    url: CHECK_ENOUGH_BALANCE,
		    contentType : 'application/json',
		    headers : {
		        'x-api-key': API_USER_KEY
		    },
		    data: JSON.stringify({"orgId": ORG_ID+""})
			}).then(function(response) {
				console.log(response)
			    if (response.data.balance){
			    	$scope.dsCost = data.Record.price;
//			    	$scope.dsCost = 1000;
//			    	$scope.remainingAmnt = response.data.balance.toFixed(2) - $scope.dsCost.toFixed(2);
			    	$scope.remainingAmnt = response.data.balance - $scope.dsCost;
			    	$scope.curBal = response.data.balance;
			    	$scope.dsPrice = $scope.dsCost.toFixed(2);
			    	
			    	$scope.showBalBeforePurchase = response.data.balance+" - "+ $scope.dsCost+" = "+$scope.remainingAmnt;
			    	if (parseFloat(response.data.balance) < parseFloat($scope.dsCost)){
			    		jQuery('#spinnerpurchase').modal('hide');
			    		$scope.remainingAmnt = - $scope.remainingAmnt;
			    		$scope.isBuynowActive = false;
			    		$scope.rowObjOfDs = {};
			    		jQuery('#insufficient').modal('show');
			    	}else{
			    		$scope.getDaSetting(data);
			    	}
			    }
			});
	} 

	$scope.successPopUpPrice = "";
	
	$scope.buyNow = function(data) {
//		data.Record.spinnerForBuynow = true;
		jQuery('#moreDetailModal').modal('hide');
		jQuery('#spinnerpurchase').modal('show');
		$scope.rowObjOfDs = data;
		console.log($scope.rowObjOfDs);
		$scope.successPopUpPrice = $scope.currentBalance;
		$scope.idForEmails = {"dpId": data.Record.orgid, "dcId":ORG_ID};

		$http({
			url : API_DA_GETEMAILID,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data :$scope.idForEmails
			}).then(function(response) {
				if (response.data){
					$scope.emails = response.data;
					console.log($scope.emails);
					if (ORG_ID in $scope.emails){
						$scope.consumerEmail = $scope.emails[ORG_ID];
					}
					if ((data.Record.opendataset == true || data.Record.opendataset == "yes") && data.Record.price < 1){
						$scope.signContract(data); 
					}
					else {
						$scope.checkIsEnoughBalance(data);
					}
				}
		});
	}

	
	$scope.existingContarct = function() {
		
		var dataObj = {"selector": {"$not": {"statuscode":"DA_CST_CLOS_UNSU_CONT"},"dcname": ORG_NAME+""},"fields": ["dsname", "id"], "sort": [{"datecreated": "asc"}]}
		$http({
			url : API_DA_AVAILABLECONTRACTS,
			method : 'POST',
			headers : {
		        "x-api-key": API_USER_KEY
		    },
			contentType : 'application/json',
			data :dataObj
			}).then(function(response) {
				if (response.data){
					console.log('response.data');
					console.log(response.data);
					console.log('response.data');
					$scope.alreadyExitsiInContractList = response.data;

					/*$scope.alreadyExitsiInContractList = $.map(response.data,function(key){
						return (key.dsname);
					});*/
				}
			});
	}
	
	
	
	$scope.newArrayObj = [];
	
	$scope.getMarketPlaceData = function() {
		
			var startTime = performance.now();
			if (!$scope.isScrollingActive){
				$scope.loadeer = true;
			}
			
			
			if ($localStorage.expiryContracts == undefined){
				$localStorage.expiryContracts = [];
				/*$localStorage.expiryContracts.push({"orgid" : ORG_ID+""});*/
			}
			console.log($localStorage.expiryContracts);
//			var a1 = ["4","177","216","2","7","3","1", ORG_ID+""];
			var a1 = ["4","177","2","7","3","1", ORG_ID+""];
			var jsonFilterData = {"selector": {"$not": {"orgid":{"$in": a1}}, "status":"active"},"skip": $scope.skipCount, "sort": [{"datecreated": "desc"}]};
			                    
			if( $scope.category != "") {
				jsonFilterData.selector.category = $scope.category;
			}
			
			if( $scope.dataProvider != "") {
				jsonFilterData.selector.dataprovidername = $scope.dataProvider;
			}
			console.log("=================");
			console.log(jsonFilterData);
			console.log("=================");
			
			
			$http({
				url : API_MARKET_PLACE,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
			    contentType : 'application/json',
				data : jsonFilterData
				}).then(function(response) {
					
					$scope.loadeer = false;
					var endTime = performance.now();
					/*alert("time taken " + (endTime - startTime) + " milliseconds.");*/
					
					if (response.data){
						console.log('**************')
						console.log(response.data.ResponseMetadata.RecordsCount);
						console.log(response.data);
						console.log('-------------')
						
						/*for (var j=0; j<response.data.Data.length; j++){
							$scope.newArrayObj.push(response.data.Data[j])
						}*/
						
						//	REPLACING ABOVE FOR LOOP :-
						$.map(response.data.Data, function(obj){
							var datFor = new Date();
							var mon = (datFor.getMonth()+1)
							var startDateBt = new Date(datFor.getFullYear()+'-'+mon+'-'+datFor.getDate());
							var endDateBt = new Date(obj.Record.dateformatted.split(' ')[0]);
							obj.Record['dateUpdatedOn'] = $scope.days_between(startDateBt, endDateBt);
							
							var cntryCde = [];
							if (obj.Record.countries){
								$.map(obj.Record.countries, function(obj1){
									if (obj1.code){
										cntryCde.push(obj1.code);
									}
								});
							}
							obj.Record['countryCode'] = cntryCde.join(', ');

							$scope.newArrayObj.push(obj);
							return (obj);
						});
						
						$scope.marketPlaceData = $scope.newArrayObj;
						$scope.marketPlaceDataAll = $scope.newArrayObj;
						
						// TIMEOUT 500 MILLISECS FOR  - SETTING PURCHASED TRUE OR NOT :- 
						$timeout(function(){
							for(var index = 0; index < $scope.marketPlaceDataAll.length; index++) {
	//							$scope.marketObj = $scope.marketPlaceDataAll[index];
								$scope.marketObj = $scope.marketPlaceData[index];
								var dataprovidername = $scope.marketObj.Record.dataprovidername;
								var dataSetName = $scope.marketObj.Record.name;
								
								if(dataprovidername != "" && $scope.dataProviderOptions.indexOf(dataprovidername) == -1 ) {
									$scope.dataProviderOptions.push(dataprovidername);
								}
	
								var isAlreadyPurchased = false;
								var exContractId = "";
								
								// REPLACING FOR LOOP :-
								$.map($scope.alreadyExitsiInContractList, function(obj){
									if (obj['dsname'] == dataSetName){
										isAlreadyPurchased = true;
										exContractId = obj.id
										return ($scope.isAlreadyPurchased, $scope.exContractId);
								    }
								});
	
								$scope.marketObj.Record.purchased = isAlreadyPurchased;
								$scope.marketObj.Record.contractid = exContractId;
							}
						},800);

						$scope.isScrollingActive = false;
						$scope.paginationPageCount = response.data.ResponseMetadata.RecordsCount;
						if ($scope.paginationPageCount < 80){
							$scope.showEndPagetext = true;
							$scope.showLoadmoretext = false;
						}
						$scope.filterAllData();
					}
					else{
						console.log('not found');
						$scope.loadeer = false;
					}
			})
	};
	
	$scope.countryname = "";
	
	$scope.filterAllData = function() {
		
		console.log($scope.countryname,'----------');
		
		$scope.marketPlaceDataAllnew = [];
		console.log($scope.countryname);
		$scope.marketPlaceDataAllnew = $scope.marketPlaceDataAll;
		
		var tempFil = {}
	
		$scope.filteredCountry = [];
		if( $scope.countryname != "") {
			for (var i=0; i<$scope.marketPlaceDataAllnew.length; i++){
				if ($scope.marketPlaceDataAllnew[i].Record.countries != undefined && $scope.marketPlaceDataAllnew[i].Record.countries != null && $scope.marketPlaceDataAllnew[i].Record.countries.length>0){
					for (var j=0; j<$scope.marketPlaceDataAllnew[i].Record.countries.length; j++){
						if ($scope.marketPlaceDataAllnew[i].Record.countries[j].code == $scope.countryname){
							$scope.filteredCountry.push($scope.marketPlaceDataAllnew[i]);
						}
					}
				}
			}
		}else{
			console.log('coming');
			$scope.filteredCountry = $scope.marketPlaceDataAll;
		}
		$scope.marketPlaceDataAllnew = $scope.filteredCountry;

		if( $scope.category != "") {
			tempFil.category = $scope.category;
		}
		if( $scope.dataProvider != "") {
			tempFil.dataprovidername = $scope.dataProvider;
		}
		if( $scope.type != "") {
			tempFil.type = $scope.type;
		}
		
		$scope.marketPlaceData = filterFilter($scope.marketPlaceDataAllnew, {'Record':tempFil});
		
		$scope.filtered = [];
		$scope.isDateFound = false;
		if ($scope.startDate != "" && $scope.endDate != ""){
			$scope.isDateFound = true;
			angular.forEach($scope.marketPlaceData, function(item) {
				var fileDate = item.Record.dateformatted.split(" ")[0];
	        	if(Date.parse($scope.startDate) <= Date.parse(fileDate) && Date.parse($scope.endDate) >= Date.parse(fileDate)) {
	        		$scope.filtered.push(item);
	            }
	        });
	    }
		
		if ($scope.filtered.length > 0 || $scope.isDateFound){
			$scope.marketPlaceData = $scope.filtered;
		}
		
		console.log($scope.marketPlaceDataAllnew);
	}
	
	
	$scope.setCaegoryOptions = function(){
		
		$scope.categoryOptions = [];
		
		$http ({
    		url : 'getFlexyList?code=DATA_CATEGORY',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.categoryOptions = response.data.result;
    	})
		
	};

	$scope.setCaegoryOptions();
	
	
	/*DATE RANGE PICKER*/
	var start = {};
	var end = {};

	function initialDate(start,end){
		
		$scope.isDateFound = false;
		
		$("#reportrange .dateElm").html('');
		
		if(start == 0 || '_i' in start && typeof start._i === 'string' || start._i instanceof String){

			$("#reportrange .dateElm").append("<span style='color:#aaa'>Date Range</span>");
			
			if ($scope.$root.$$phase != '$apply' && $scope.$root.$$phase != '$digest') {
			    $scope.$apply(function(){
					$scope.startDate = "";
					$scope.endDate = "";
					resetDateFilter();
		        });
			}	
		}else{
			
			$('#reportrange .dateElm').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
			
			$scope.$apply(function(){
				$scope.startDate = start.format('YYYY-MM-DD');
				$scope.endDate = end.format('YYYY-MM-DD');
				$scope.filterAllData();
	        });
		}
	}
	
	function resetDateFilter(){
		if($scope.loadeer){
			
		}
		else {
			$scope.startDate = "";
			$scope.endDate = "";
			$scope.filterAllData();
		}
	}

	
	
jQuery('#reportrange').daterangepicker({

	startDate: start,
	endDate: end,
	ranges: {
	   'Reset':[moment().subtract(1, 'day').format('MM/DD/YYYY HH:MM:SS'), moment()],
	   'Today': [moment(), moment()],
	   'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	   'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	   'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	   'This Month': [moment().startOf('month'), moment().endOf('month')],
	   'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	}
	
}, initialDate);

initialDate(0, end);
//initialDate(Invalid Date, end);



$scope.scrollingIsActiveRightNow = function(){
	$scope.showLoadmoretext = false;
	if (!$scope.isScrollingActive){
		$scope.isScrollingActive = true;
		if ($scope.paginationPageCount == 80){
			$scope.skipCount += 80;
			$scope.showLoadmoretext = true;
//			$scope.existingContarct();
			$scope.getMarketPlaceData();
		}
		else{
			$scope.showEndPagetext = true;
			$scope.skipCount = parseInt($scope.skipCount);
			$scope.paginationPageCount = parseInt($scope.paginationPageCount);
			$scope.skipCount += $scope.paginationPageCount;
		}
	}
}


$scope.currentBal = function(){
	$http({
		method: "POST",
	    url: CHECK_ENOUGH_BALANCE,
	    contentType : 'application/json',
	    headers : {
	        'x-api-key': API_USER_KEY
	    },
	    data: JSON.stringify({"orgId": ORG_ID+""})
		}).then(function(response) {
			console.log('balance');
			console.log(response);
			console.log('balance');
		    if (response.data.balance){
		    	$scope.currentBalance = response.data.balance.toFixed(2);
	    }
	});
}
$scope.currentBal();


$scope.gotoTopup = function(){
	location.href="creditmanagement";
	
}

$scope.splitNumber = function(val){
	var strPric = val.toString();
	if ('.' in strPric){
		var numarray = strPric.split('.');
		val = numarray[0];
	}
	return val
	
};


$scope.days_between = function(date1, date2) {
	const ONE_DAY = 1000 * 60 * 60 * 24;
	const differenceMs = Math.abs(date1 - date2);
	return Math.round(differenceMs / ONE_DAY);
};

$scope.getTypesOfSchema = function(){
	$scope.schemaTypes = [];
	$http ({
		url : 'getFlexyList?code=SCHEMA_TYPES',
		method : 'GET'
	}).then(function(response) {
		$scope.schemaTypes = response.data.result;

	})
};
$scope.getTypesOfSchema();


$scope.checkPlantype();
$scope.existingContarct();
$scope.getMarketPlaceData();


$scope.countriesListObj = [{"name":"Afghanistan","dial_code":"+93","code":"AF"},{"name":"Albania","dial_code":"+355","code":"AL"},{"name":"Algeria","dial_code":"+213","code":"DZ"},{"name":"AmericanSamoa","dial_code":"+1 684","code":"AS"},{"name":"Andorra","dial_code":"+376","code":"AD"},{"name":"Angola","dial_code":"+244","code":"AO"},{"name":"Anguilla","dial_code":"+1 264","code":"AI"},{"name":"Antigua and Barbuda","dial_code":"+1268","code":"AG"},{"name":"Argentina","dial_code":"+54","code":"AR"},{"name":"Armenia","dial_code":"+374","code":"AM"},{"name":"Aruba","dial_code":"+297","code":"AW"},{"name":"Australia","dial_code":"+61","code":"AU"},{"name":"Austria","dial_code":"+43","code":"AT"},{"name":"Azerbaijan","dial_code":"+994","code":"AZ"},{"name":"Bahamas","dial_code":"+1 242","code":"BS"},{"name":"Bahrain","dial_code":"+973","code":"BH"},{"name":"Bangladesh","dial_code":"+880","code":"BD"},{"name":"Barbados","dial_code":"+1 246","code":"BB"},{"name":"Belarus","dial_code":"+375","code":"BY"},{"name":"Belgium","dial_code":"+32","code":"BE"},{"name":"Belize","dial_code":"+501","code":"BZ"},{"name":"Benin","dial_code":"+229","code":"BJ"},{"name":"Bermuda","dial_code":"+1 441","code":"BM"},{"name":"Bhutan","dial_code":"+975","code":"BT"},{"name":"Bosnia and Herzegovina","dial_code":"+387","code":"BA"},{"name":"Botswana","dial_code":"+267","code":"BW"},{"name":"Brazil","dial_code":"+55","code":"BR"},{"name":"British Indian Ocean Territory","dial_code":"+246","code":"IO"},{"name":"Bulgaria","dial_code":"+359","code":"BG"},{"name":"Burkina Faso","dial_code":"+226","code":"BF"},{"name":"Burundi","dial_code":"+257","code":"BI"},{"name":"Cambodia","dial_code":"+855","code":"KH"},{"name":"Cameroon","dial_code":"+237","code":"CM"},{"name":"Canada","dial_code":"+1","code":"CA"},{"name":"Cape Verde","dial_code":"+238","code":"CV"},{"name":"Cayman Islands","dial_code":"+ 345","code":"KY"},{"name":"Central African Republic","dial_code":"+236","code":"CF"},{"name":"Chad","dial_code":"+235","code":"TD"},{"name":"Chile","dial_code":"+56","code":"CL"},{"name":"China","dial_code":"+86","code":"CN"},{"name":"Christmas Island","dial_code":"+61","code":"CX"},{"name":"Colombia","dial_code":"+57","code":"CO"},{"name":"Comoros","dial_code":"+269","code":"KM"},{"name":"Congo","dial_code":"+242","code":"CG"},{"name":"Cook Islands","dial_code":"+682","code":"CK"},{"name":"Costa Rica","dial_code":"+506","code":"CR"},{"name":"Croatia","dial_code":"+385","code":"HR"},{"name":"Cuba","dial_code":"+53","code":"CU"},{"name":"Cyprus","dial_code":"+537","code":"CY"},{"name":"Czech Republic","dial_code":"+420","code":"CZ"},{"name":"Denmark","dial_code":"+45","code":"DK"},{"name":"Djibouti","dial_code":"+253","code":"DJ"},{"name":"Dominica","dial_code":"+1 767","code":"DM"},{"name":"Dominican Republic","dial_code":"+1 849","code":"DO"},{"name":"Ecuador","dial_code":"+593","code":"EC"},{"name":"Egypt","dial_code":"+20","code":"EG"},{"name":"El Salvador","dial_code":"+503","code":"SV"},{"name":"Equatorial Guinea","dial_code":"+240","code":"GQ"},{"name":"Eritrea","dial_code":"+291","code":"ER"},{"name":"Estonia","dial_code":"+372","code":"EE"},{"name":"Ethiopia","dial_code":"+251","code":"ET"},{"name":"Faroe Islands","dial_code":"+298","code":"FO"},{"name":"Fiji","dial_code":"+679","code":"FJ"},{"name":"Finland","dial_code":"+358","code":"FI"},{"name":"France","dial_code":"+33","code":"FR"},{"name":"French Guiana","dial_code":"+594","code":"GF"},{"name":"French Polynesia","dial_code":"+689","code":"PF"},{"name":"Gabon","dial_code":"+241","code":"GA"},{"name":"Gambia","dial_code":"+220","code":"GM"},{"name":"Georgia","dial_code":"+995","code":"GE"},{"name":"Germany","dial_code":"+49","code":"DE"},{"name":"Ghana","dial_code":"+233","code":"GH"},{"name":"Gibraltar","dial_code":"+350","code":"GI"},{"name":"Greece","dial_code":"+30","code":"GR"},{"name":"Greenland","dial_code":"+299","code":"GL"},{"name":"Grenada","dial_code":"+1 473","code":"GD"},{"name":"Global", "code":"Global"},{"name":"Guadeloupe","dial_code":"+590","code":"GP"},{"name":"Guam","dial_code":"+1 671","code":"GU"},{"name":"Guatemala","dial_code":"+502","code":"GT"},{"name":"Guinea","dial_code":"+224","code":"GN"},{"name":"Guinea-Bissau","dial_code":"+245","code":"GW"},{"name":"Guyana","dial_code":"+595","code":"GY"},{"name":"Haiti","dial_code":"+509","code":"HT"},{"name":"Honduras","dial_code":"+504","code":"HN"},{"name":"Hungary","dial_code":"+36","code":"HU"},{"name":"Iceland","dial_code":"+354","code":"IS"},{"name":"India","dial_code":"+91","code":"IN"},{"name":"Indonesia","dial_code":"+62","code":"ID"},{"name":"Iraq","dial_code":"+964","code":"IQ"},{"name":"Ireland","dial_code":"+353","code":"IE"},{"name":"Israel","dial_code":"+972","code":"IL"},{"name":"Israel","dial_code":"+972","code":"IL"},{"name":"Italy","dial_code":"+39","code":"IT"},{"name":"Jamaica","dial_code":"+1 876","code":"JM"},{"name":"Japan","dial_code":"+81","code":"JP"},{"name":"Jordan","dial_code":"+962","code":"JO"},{"name":"Kazakhstan","dial_code":"+7 7","code":"KZ"},{"name":"Kenya","dial_code":"+254","code":"KE"},{"name":"Kiribati","dial_code":"+686","code":"KI"},{"name":"Kuwait","dial_code":"+965","code":"KW"},{"name":"Kyrgyzstan","dial_code":"+996","code":"KG"},{"name":"Latvia","dial_code":"+371","code":"LV"},{"name":"Lebanon","dial_code":"+961","code":"LB"},{"name":"Lesotho","dial_code":"+266","code":"LS"},{"name":"Liberia","dial_code":"+231","code":"LR"},{"name":"Liechtenstein","dial_code":"+423","code":"LI"},{"name":"Lithuania","dial_code":"+370","code":"LT"},{"name":"Luxembourg","dial_code":"+352","code":"LU"},{"name":"Madagascar","dial_code":"+261","code":"MG"},{"name":"Malawi","dial_code":"+265","code":"MW"},{"name":"Malaysia","dial_code":"+60","code":"MY"},{"name":"Maldives","dial_code":"+960","code":"MV"},{"name":"Mali","dial_code":"+223","code":"ML"},{"name":"Malta","dial_code":"+356","code":"MT"},{"name":"Marshall Islands","dial_code":"+692","code":"MH"},{"name":"Martinique","dial_code":"+596","code":"MQ"},{"name":"Mauritania","dial_code":"+222","code":"MR"},{"name":"Mauritius","dial_code":"+230","code":"MU"},{"name":"Mayotte","dial_code":"+262","code":"YT"},{"name":"Mexico","dial_code":"+52","code":"MX"},{"name":"Monaco","dial_code":"+377","code":"MC"},{"name":"Mongolia","dial_code":"+976","code":"MN"},{"name":"Montenegro","dial_code":"+382","code":"ME"},{"name":"Montserrat","dial_code":"+1664","code":"MS"},{"name":"Morocco","dial_code":"+212","code":"MA"},{"name":"Myanmar","dial_code":"+95","code":"MM"},{"name":"Namibia","dial_code":"+264","code":"NA"},{"name":"Nauru","dial_code":"+674","code":"NR"},{"name":"Nepal","dial_code":"+977","code":"NP"},{"name":"Netherlands","dial_code":"+31","code":"NL"},{"name":"Netherlands Antilles","dial_code":"+599","code":"AN"},{"name":"New Caledonia","dial_code":"+687","code":"NC"},{"name":"New Zealand","dial_code":"+64","code":"NZ"},{"name":"Nicaragua","dial_code":"+505","code":"NI"},{"name":"Niger","dial_code":"+227","code":"NE"},{"name":"Nigeria","dial_code":"+234","code":"NG"},{"name":"Niue","dial_code":"+683","code":"NU"},{"name":"Norfolk Island","dial_code":"+672","code":"NF"},{"name":"Northern Mariana Islands","dial_code":"+1 670","code":"MP"},{"name":"Norway","dial_code":"+47","code":"NO"},{"name":"Oman","dial_code":"+968","code":"OM"},{"name":"Pakistan","dial_code":"+92","code":"PK"},{"name":"Palau","dial_code":"+680","code":"PW"},{"name":"Panama","dial_code":"+507","code":"PA"},{"name":"Papua New Guinea","dial_code":"+675","code":"PG"},{"name":"Paraguay","dial_code":"+595","code":"PY"},{"name":"Peru","dial_code":"+51","code":"PE"},{"name":"Philippines","dial_code":"+63","code":"PH"},{"name":"Poland","dial_code":"+48","code":"PL"},{"name":"Portugal","dial_code":"+351","code":"PT"},{"name":"Puerto Rico","dial_code":"+1 939","code":"PR"},{"name":"Qatar","dial_code":"+974","code":"QA"},{"name":"Romania","dial_code":"+40","code":"RO"},{"name":"Rwanda","dial_code":"+250","code":"RW"},{"name":"Samoa","dial_code":"+685","code":"WS"},{"name":"San Marino","dial_code":"+378","code":"SM"},{"name":"Saudi Arabia","dial_code":"+966","code":"SA"},{"name":"Senegal","dial_code":"+221","code":"SN"},{"name":"Serbia","dial_code":"+381","code":"RS"},{"name":"Seychelles","dial_code":"+248","code":"SC"},{"name":"Sierra Leone","dial_code":"+232","code":"SL"},{"name":"Singapore","dial_code":"+65","code":"SG"},{"name":"Slovakia","dial_code":"+421","code":"SK"},{"name":"Slovenia","dial_code":"+386","code":"SI"},{"name":"Solomon Islands","dial_code":"+677","code":"SB"},{"name":"South Africa","dial_code":"+27","code":"ZA"},{"name":"South Georgia and the South Sandwich Islands","dial_code":"+500","code":"GS"},{"name":"Spain","dial_code":"+34","code":"ES"},{"name":"Sri Lanka","dial_code":"+94","code":"LK"},{"name":"Sudan","dial_code":"+249","code":"SD"},{"name":"Suriname","dial_code":"+597","code":"SR"},{"name":"Swaziland","dial_code":"+268","code":"SZ"},{"name":"Sweden","dial_code":"+46","code":"SE"},{"name":"Switzerland","dial_code":"+41","code":"CH"},{"name":"Tajikistan","dial_code":"+992","code":"TJ"},{"name":"Thailand","dial_code":"+66","code":"TH"},{"name":"Togo","dial_code":"+228","code":"TG"},{"name":"Tokelau","dial_code":"+690","code":"TK"},{"name":"Tonga","dial_code":"+676","code":"TO"},{"name":"Trinidad and Tobago","dial_code":"+1 868","code":"TT"},{"name":"Tunisia","dial_code":"+216","code":"TN"},{"name":"Turkey","dial_code":"+90","code":"TR"},{"name":"Turkmenistan","dial_code":"+993","code":"TM"},{"name":"Turks and Caicos Islands","dial_code":"+1 649","code":"TC"},{"name":"Tuvalu","dial_code":"+688","code":"TV"},{"name":"Uganda","dial_code":"+256","code":"UG"},{"name":"Ukraine","dial_code":"+380","code":"UA"},{"name":"United Arab Emirates","dial_code":"+971","code":"AE"},{"name":"United Kingdom","dial_code":"+44","code":"GB"},{"name":"United States","dial_code":"+1","code":"US"},{"name":"Uruguay","dial_code":"+598","code":"UY"},{"name":"Uzbekistan","dial_code":"+998","code":"UZ"},{"name":"Vanuatu","dial_code":"+678","code":"VU"},{"name":"Wallis and Futuna","dial_code":"+681","code":"WF"},{"name":"Yemen","dial_code":"+967","code":"YE"},{"name":"Zambia","dial_code":"+260","code":"ZM"},{"name":"Zimbabwe","dial_code":"+263","code":"ZW"},{"name":"land Islands","dial_code":"","code":"AX"},{"name":"Antarctica","dial_code":null,"code":"AQ"},{"name":"Bolivia, Plurinational State of","dial_code":"+591","code":"BO"},{"name":"Brunei Darussalam","dial_code":"+673","code":"BN"},{"name":"Cocos (Keeling) Islands","dial_code":"+61","code":"CC"},{"name":"Congo, The Democratic Republic of the","dial_code":"+243","code":"CD"},{"name":"Cote d'Ivoire","dial_code":"+225","code":"CI"},{"name":"Falkland Islands (Malvinas)","dial_code":"+500","code":"FK"},{"name":"Guernsey","dial_code":"+44","code":"GG"},{"name":"Holy See (Vatican City State)","dial_code":"+379","code":"VA"},{"name":"Hong Kong","dial_code":"+852","code":"HK"},{"name":"Iran, Islamic Republic of","dial_code":"+98","code":"IR"},{"name":"Isle of Man","dial_code":"+44","code":"IM"},{"name":"Jersey","dial_code":"+44","code":"JE"},{"name":"Korea, Democratic People's Republic of","dial_code":"+850","code":"KP"},{"name":"Korea, Republic of","dial_code":"+82","code":"KR"},{"name":"Lao People's Democratic Republic","dial_code":"+856","code":"LA"},{"name":"Libyan Arab Jamahiriya","dial_code":"+218","code":"LY"},{"name":"Macao","dial_code":"+853","code":"MO"},{"name":"Macedonia, The Former Yugoslav Republic of","dial_code":"+389","code":"MK"},{"name":"Micronesia, Federated States of","dial_code":"+691","code":"FM"},{"name":"Moldova, Republic of","dial_code":"+373","code":"MD"},{"name":"Mozambique","dial_code":"+258","code":"MZ"},{"name":"Palestinian Territory, Occupied","dial_code":"+970","code":"PS"},{"name":"Pitcairn","dial_code":"+872","code":"PN"},{"name":"Russia","dial_code":"+7","code":"RU"},{"name":"Saint Barthelemy","dial_code":"+590","code":"BL"},{"name":"Saint Helena, Ascension and Tristan Da Cunha","dial_code":"+290","code":"SH"},{"name":"Saint Kitts and Nevis","dial_code":"+1 869","code":"KN"},{"name":"Saint Lucia","dial_code":"+1 758","code":"LC"},{"name":"Saint Martin","dial_code":"+590","code":"MF"},{"name":"Saint Pierre and Miquelon","dial_code":"+508","code":"PM"},{"name":"Saint Vincent and the Grenadines","dial_code":"+1 784","code":"VC"},{"name":"Sao Tome and Principe","dial_code":"+239","code":"ST"},{"name":"Somalia","dial_code":"+252","code":"SO"},{"name":"Svalbard and Jan Mayen","dial_code":"+47","code":"SJ"},{"name":"Syrian Arab Republic","dial_code":"+963","code":"SY"},{"name":"Taiwan, Province of China","dial_code":"+886","code":"TW"},{"name":"Tanzania, United Republic of","dial_code":"+255","code":"TZ"},{"name":"Timor-Leste","dial_code":"+670","code":"TL"},{"name":"Venezuela, Bolivarian Republic of","dial_code":"+58","code":"VE"},{"name":"Viet Nam","dial_code":"+84","code":"VN"},{"name":"Virgin Islands, British","dial_code":"+1 284","code":"VG"},{"name":"Virgin Islands, U.S.","dial_code":"+1 340","code":"VI"}];

$scope.monthName = {};
$scope.getMonthName = function(num){
	num = num+""
	var mnthName = "";
	$scope.monthName = {"1":"Jan", "2":"Feb", "3":"Mar", "4":"Apr", "5":"May", "6":"Jun", "7":"Jul", "8":"Aug", "9":"Sep", "10":"Oct", "11":"Nov", "12":"Dec"};
	if (num in $scope.monthName){
		mnthName = $scope.monthName[num];
	}
	return mnthName.trim();
}

jQuery('#topMenu').css("display", "block");
});




