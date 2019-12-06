app.controller('datafedController',function($scope,$timeout, $localStorage, $http, $filter){
	
	$scope.enableCreateDsBtn = false;
	$scope.enabelopendataset=false;
	$scope.userCommisionVal = 0;
	
	$scope.getOrgdata=function(){
		$http({
			url : API_GET_DA_SETTING,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : {"orgId":ORG_ID},
			}).then(function(response) {
				console.log(response);
				if(response.data.result.commissionValue!= undefined){
					$scope.userCommisionVal = response.data.result.commissionValue;
				}
				
				console.log($scope.userCommisionVal);
				if(response.data.result.commissionValue!=undefined && response.data.result.commissionValue==0){
					$scope.enabelopendataset=true;
				}
				
		})	
	}
	$scope.getOrgdata();
	
	
	/*alert(API_ADD_SCHEMA);
	alert(API_LIST_SCHEMA);
	alert(API_DELETE_SCHEMA);*/
	
	$scope.isAllowPrice = false;
	$scope.maxToDate = 31;
	
	$scope.maxFromDate = 31;
	
	$scope.uAccess=$localStorage.uAccess;
	
	$scope.nameRequired = false;
	
	$scope.loadeer = true;
	
	$scope.descriptionRequired = false;
	
	$scope.categoryRequired = false;
	
	$scope.dataItemnameRequired = false;
	
	$scope.dataItemAtleastOne = false;
	
	$scope.descriptionMaxChar = false;
	
	$scope.dataItemnameExists = false;
	
	$scope.toggleOff = false;
	
	$scope.normalHead = true;
	
	$scope.disableForDelete = false;
	
	$scope.addFromDate = false;
	
	$scope.addToDate = false;
	
	$scope.showTrash = true;
	
	$scope.categoryOptions = [];
	
	$scope.currencyOptions = [];
	
	$scope.statusOptions = [];
	
	$scope.dataTypeOptions = [];
	
	$scope.saveButtonStatus = true;
	
	$scope.findButtonStatus = true;
	
	$scope.deleteBtn = true;
	
	$scope.noBtn = true;
	
	$scope.sourceRequired = false;
	
	$scope.uploadFile = false;
	
//	$scope.negotiationFound = true;
	
	$scope.negotiationIs = true;
	
	$scope.showLowAmount = false;
	
	$scope.isScrollingActive = false;
	
	$scope.showLoadmoretext = false;
	
	$scope.paginationPageCount = 0;
	
	//$scope.sampleFileUrlRequired = false;
	
	$scope.skipCount = 0;
	
	$scope.showEndPagetext = false;
	
//	$scope.showLoadmoretext = false;
	
	$scope.newArrayObj = [];
	
	$scope.priceVerifiedNonOenDs = false;
	
	$scope.typeRequired = false;
	
	$scope.limitlength = 4;
	
	
	
	var OWNER_API_KEY = "";
	
	$http.get('./app-config-prop.json').then(function (response) {
	      OWNER_API_KEY = response.data.API_KEY;
	});
	
	$scope.clickShow = function(){
		console.log('-----------');
		if ($scope.toggleOff){
			$scope.toggleOff = false;
		}else{
			$scope.toggleOff = true;
		}
	};
	
	$scope.showCloneData = function(rowData){
		
		console.log($scope.dataSchema.countries);
		
		if ($scope.toggleOff){
		}else{
			$scope.toggleOff = true;
		}
		var newDataFromRow = angular.copy(rowData);
		$scope.dataSchema = newDataFromRow;
		$scope.dataSchema.name = "";
		$scope.dataSchema.endpointurl = "";
		$scope.dataSchema.samplefilelocation = "";
		$scope.dataSchema.opendataset = "no";
		$scope.dataSchema.countries = [];
		$scope.priceVerifiedNonOenDs = false;
		
		$scope.dataSchema.price = rowData.price.toFixed(2);
		
		
		if(rowData.fromyear > -1 ) {
			$scope.dataSchema.fromyear = rowData.fromyear+"";
			$scope.setLastDate("FROM");
		}
		
		if(rowData.toyear > -1 ) {
			$scope.dataSchema.toyear = rowData.toyear+"";
			$scope.setLastDate("TO");
		}
		
		if(rowData.frommonth >  -1 ) {
			$scope.dataSchema.frommonth = rowData.frommonth+"";
			$scope.setLastDate("FROM");
		}
		if(rowData.fromdate >  -1 ) {
			$scope.dataSchema.fromdate = rowData.fromdate+"";
			$scope.setLastDate("FROM");
		}
		if(rowData.tomonth >  -1 ) {
			$scope.dataSchema.tomonth = rowData.tomonth+"";
			$scope.setLastDate("TO");
		}
		if(rowData.todate >  -1) {
			$scope.dataSchema.todate = rowData.todate+"";
			$scope.setLastDate("TO");
		}
		
		$scope.nameRequired = false;
		$scope.descriptionRequired = false;
		$scope.categoryRequired = false;
		$scope.descriptionMaxChar = false;
		$scope.dataItemAtleastOne = false;
		$scope.sourceRequired = false;
		$scope.priceVerifiedNonOenDs = false;
		$scope.typeRequired = false;
		
		$timeout(function(){
			$scope.itemTableSort();
			
		},1000)
		
		$timeout(function(){
			jQuery('#datasetName').focus();
			
		},200);
		
		
	};
	
	$scope.dataSchemaItems = [];
	
	$scope.itemTableSort = function() {
		
		var oldIndex = 0;
		var newIndex = 0;
		jQuery('#dragDrop').sortable(
			{
			
			    start: function(event, ui){
			    	console.log("START");
			    	oldIndex = ui.item.index();
			    	
			    },
			    update: function(event, ui){
			    	console.log("END");
			    	newIndex = ui.item.index();
			    	//console.log(oldIndex);
			    	//console.log(newIndex);
			    	//console.log($scope.dataSchema.dataitems);
			    	
			    	$scope.dataSchema.dataitems = $scope.movePosition($scope.dataSchema.dataitems, oldIndex, newIndex);
			    	
			    	//console.log($scope.dataSchema.dataitems);
			    }
			}
			);
	}
	
	$scope.movePosition  = function(arr, old_index, new_index) {
	    while (old_index < 0) {
	        old_index += arr.length;
	    }
	    while (new_index < 0) {
	        new_index += arr.length;
	    }
	    if (new_index >= arr.length) {
	        var k = new_index - arr.length;
	        while ((k--) + 1) {
	            arr.push(undefined);
	        }
	    }
	     arr.splice(new_index, 0, arr.splice(old_index, 1)[0]);  
	   return arr;
	}
	
	
	
	$scope.clearObj = function(){
		$scope.dataItemnameExists = false;
		$scope.dataItemnameRequired = false;
		$scope.itemname = "";
		$scope.datalength = "";
		$scope.itemisnull = "";
		$scope.itemtype = "";
		$scope.itemDescription = "";
		$scope.category = '';
		$scope.statusIn = '';
		$scope.isAllowPrice = false;
		$scope.dataSchema.samplefilelocation = "";
	};
	
	
	
	$scope.dataSchema = {
			"name": "",
			"description": "",
			"price": "",
			"displayprice" : "",
			"category": "",
			"currency" : "USD",
			"fromyear" : "0",
			"frommonth" : "0",
			"fromdate" : "0",
			"toyear" : "0",
			"tomonth" : "0",
			"todate" : "0",
			"recordcount": "",
			"dataitems": [],
			"dataprovidername": "",
			"clientid": "",
			"orgid": "",
			"ownerid": "",
			"source" : "",
			"negotiation" :"no",
			"opendataset" :"no",
			"samplefiletype": "document",
			"samplefilelocation" : "",
			"endpointurl" : "",
			"countries" :[],
			"type":""
	};
	
	
	
	$scope.clearAll = function(){
		$scope.dataSchema = {
				"name": "",
				"description": "",
				"price": "",
				"displayprice" : "",
				"category": "",
				"currency" : "USD",
				"fromyear" : "0",
				"frommonth" : "0",
				"fromdate" : "0",
				"toyear" : "0",
				"tomonth" : "0",
				"todate" : "0",
				"recordcount": "",
				"dataitems": [],
				"dataprovidername": "",
				"clientid": "",
				"orgid": "",
				"ownerid": "",
				"source" : "",
				"negotiation" :"no",
				"opendataset" :"no",
				"samplefiletype": "document",
				"samplefilelocation" : "",
				"endpointurl" : "",
				"countries" :[],
				"type":""
		};
		$scope.nameRequired = false;
		$scope.descriptionRequired = false;
		$scope.categoryRequired = false;
		$scope.descriptionMaxChar = false;
		$scope.dataItemAtleastOne = false;
		$scope.sourceRequired = false;
		$scope.typeRequired = false;
	};
	
	$scope.lastSelectedCategory = "";
	$scope.lastSelectedStatus = "";
	$scope.category = '';
	$scope.statusIn = '';
	
	$scope.lastSelectedStausCategory = function(){
		
		$scope.category = $scope.lastSelectedCategory;
		$scope.statusIn = $scope.lastSelectedStatus;
		
	};
	
	// FILTER CANCEL--------------
	$scope.cancel = function(val){
//		$scope.lastSelectedStausCategory();
		if (val == 'cancelfilter'){
			$scope.skipCount = 0;
			$scope.defaultFilterData(true);
		}
		$scope.clearObj();
		$scope.clearAll();
		$scope.saveButtonStatus = true;
		$scope.findButtonStatus = true;
		$scope.toggleOff = false;
		$scope.negotiationIs = true;
		$scope.chooseFileType();
		$scope.dataSchema.countries = [];
		clearCountryList();
		
		//$scope.sampleFileUrlRequired = false;
		
	};
	
	$scope.resultDataItems = [];
	
//	$scope.existingColumnName = [];
	
	
//	---------------------PERIOD DROPWDOWN----------------------------
	
	
	$scope.today = new Date();
	$scope.currentYear = $scope.today.getFullYear();
	$scope.minYear = 1940; //$scope.today.getFullYear()-50;
	$scope.maxYear = $scope.currentYear + 20;
	
	
	$scope.yearsFrom = []; 	  
	$scope.yearsTo = []; 
	
	for (x = $scope.minYear; x <= $scope.maxYear; x++) {
	    $scope.yearsFrom.push(x);
//	    $scope.yearsTo.push(x);
	}
	
	for (x = $scope.minYear; x <= $scope.maxYear; x++) {
//	    $scope.yearsFrom.push(x);
	    $scope.yearsTo.push(x);
	}
	
	$scope.monthsTo =  [];
	$scope.monthsFrom = [];
	
	for (x = 1; x <= 12; x++) {
		$scope.monthsTo.push(x);
		$scope.monthsFrom.push(x);
	}
	
	$scope.daysFrom = [];
	$scope.daysTo = [];
	
		  
	
	$scope.setLastDate = function(fot) {
		if (fot == "TO" && $scope.dataSchema.tomonth != "" ){
			$scope.maxToDate = new Date($scope.dataSchema.toyear, $scope.dataSchema.tomonth, 0).getDate();
			$scope.daysTo = [];
			for (x = 1; x <= $scope.maxToDate; x++) {
				$scope.daysTo.push(x);
			}
		}
		else if (fot == "FROM" && $scope.dataSchema.frommonth != "" ){
			$scope.maxFromDate = new Date($scope.dataSchema.fromyear, $scope.dataSchema.frommonth, 0).getDate();
			$scope.daysFrom = [];
			for (x = 1; x <= $scope.maxFromDate; x++) {
				$scope.daysFrom.push(x);
			}
		}    	
    };
	
	/*$scope.period = $scope.fromYear;*/

	
//	---------------------PERIOD DROPWDOWN END----------------------------	
	
	$scope.addDataStructure = function(){
		if ($scope.itemname == undefined || $scope.itemname == null|| $scope.itemname== ""){
			$scope.dataItemnameRequired = true;
			$scope.dataItemAtleastOne = false;
		}
		else{
			$scope.dataItemnameRequired = false;
			$scope.dataItemAtleastOne = false;
		}
		if ($scope.itemtype== undefined || $scope.itemtype == null|| $scope.itemtype== ""){
			$scope.itemtype = "";
		}
		else{
			$scope.itemtype = $scope.itemtype;
		}
		if ($scope.itemisnull== undefined || $scope.itemisnull == null|| $scope.itemisnull== ""){
			$scope.itemisnull = "no";
		}
		else{
			$scope.itemisnull = "yes";
		}
		if ($scope.datalength== undefined || $scope.datalength == null|| $scope.datalength== ""){
			$scope.datalength = "";
		}
		if ($scope.itemDescription== undefined || $scope.itemDescription == null|| $scope.itemDescription== ""){
			$scope.itemDescription = "";
		}
		
		if (!$scope.dataItemnameRequired ){
			
			var isExist = false;
			angular.forEach($scope.dataSchema.dataitems, function(value){
			     if (value["name"].toLowerCase() == $scope.itemname.toLowerCase()){			    	
			    	 isExist = true;
			     }
			});
			
			if(!isExist) {
				$scope.dataSchema.dataitems.push({
					"name": $scope.itemname+"",
					"type": $scope.itemtype+"",
					"datalength": $scope.datalength+"",
					"isnull": $scope.itemisnull+"",
					"description" : $scope.itemDescription
				});
				$scope.clearObj();
			
			}
			else {
				$scope.dataItemnameExists = true;
			}
			
		}
		
		$scope.itemTableSort();
		
	};
	
	
	$scope.successPopup = function(){
		jQuery('#successModal').modal('toggle');
	};
	
	$scope.alreadyFoundPopup = function(){
		jQuery('#alreadyFound').modal('toggle');
	};
	
	/*$scope.checkModalPrice = function(){
		jQuery('#verifyPrice').modal('toggle');
	};
	*/
	
	$scope.alertPriceMandateNonOpenDS = function(){
		jQuery('#priceMandateModal').modal('toggle');
	};
	
	
//	SAVE data while button click-----------------------------------------------
	$scope.opVal = false;
	$scope.setOpenDataSetValue = function(btn){
		jQuery('#openDataSetModal').modal('hide');
		$scope.opVal = true;
		if (btn == "zero"){
			$scope.dataSchema.price = "0";
		}
		
		if ($scope.opVal){
			$scope.addDataItem();
		}
	}
	
	//	COUNTRY LIST ----------------------------------------

	$scope.countriesList = [];
	$scope.countriesListObj = [];
	

	
	$scope.addDataItem3 = function(){
		
		if (($scope.dataSchema.opendataset == "yes" || $scope.dataSchema.opendataset == true) && $scope.dataSchema.price > 0){
//			jQuery('#createdata').modal('hide');
			jQuery('#openDataSetModal').modal('show');
		}
		else if (($scope.dataSchema.opendataset == "no" || $scope.dataSchema.opendataset == false) && $scope.dataSchema.price == 0){
//			jQuery('#createdata').modal('hide');
			$scope.alertPriceMandateNonOpenDS(); 
		}
		else{
			if ($scope.dataSchema.price >= $scope.userCommisionVal){
				$scope.addDataItem();
			}
			else{
				jQuery('#commissionValMdl').modal('show');	
			}
		}
	}
	
	$scope.addDataItem = function(){
		
		if ($scope.dataSchema.opendataset== undefined ||$scope.dataSchema.opendataset== null  ||$scope.dataSchema.opendataset== ""){
			$scope.dataSchema.opendataset = "no";
		}
		$scope.dataSchema.negotiation="no";
		
		if ($scope.dataSchema.name== undefined || $scope.dataSchema.name == null|| $scope.dataSchema.name== ""){
			$scope.nameRequired = true;
		}
		else{
			$scope.nameRequired = false;
		}
		
		if ($scope.dataSchema.description== undefined || $scope.dataSchema.description == null|| $scope.dataSchema.description== ""){
			$scope.descriptionRequired = true;
			$scope.descriptionMaxChar = false;
		}
		else{
			if ($scope.dataSchema.description.length <= 250){
				$scope.descriptionRequired = false;
				$scope.descriptionMaxChar = false;
			}
			else{
				$scope.descriptionRequired = false;
				$scope.descriptionMaxChar = true;
			}
			
		}
		
		if ($scope.dataSchema.source == undefined || $scope.dataSchema.source == null|| $scope.dataSchema.source == ""){
			$scope.sourceRequired = true;
		}
		else{
			$scope.sourceRequired = false;
		}
		
		
		if ($scope.dataSchema.category== undefined || $scope.dataSchema.category == null|| $scope.dataSchema.category== ""){
			$scope.categoryRequired = true;
		}
		else{
			$scope.categoryRequired = false;
		}
		
		if ($scope.dataSchema.type== undefined || $scope.dataSchema.type == null|| $scope.dataSchema.type== ""){
			$scope.typeRequired = true;
		}
		else{
			$scope.typeRequired = false;
		}
		
		if ($scope.dataSchema.dataitems== undefined || $scope.dataSchema.dataitems == null|| $scope.dataSchema.dataitems== ""){
			$scope.dataItemAtleastOne = true;
			$scope.dataItemnameRequired = false;
		}
		else{
			$scope.dataItemAtleastOne = false;
			$scope.dataItemnameRequired = false;
		}
		if ($scope.dataSchema.dataitems.length > 0){
			$scope.dataItemAtleastOne = false;
			$scope.dataItemnameRequired = false;
		}
		
		$scope.pattern = /^((http|https|ftp):\/\/)/;
		$scope.isEndPointValidated = false;
		
		if($scope.pattern.test($scope.dataSchema.endpointurl) || $scope.dataSchema.endpointurl == "") {
			$scope.isEndPointValidated = true;
		}
		else{
			$scope.isEndPointValidated = false;
			jQuery('#endPointModal').modal('show');
		}
		console.log($scope.isEndPointValidated);
		
		
		if (!$scope.dataItemAtleastOne && !$scope.nameRequired && !$scope.descriptionRequired && !$scope.categoryRequired && !$scope.typeRequired
				&& !$scope.descriptionMaxChar && !$scope.sourceRequired && $scope.negotiationIs && $scope.isEndPointValidated){

			if ($scope.dataSchema.fromyear== undefined || $scope.dataSchema.fromyear == null|| $scope.dataSchema.fromyear== ""){
				
				$scope.dataSchema.fromyear = 0;
			}
			else{
				$scope.dataSchema.fromyear = parseInt($scope.dataSchema.fromyear);
			}
			if ($scope.dataSchema.frommonth== undefined || $scope.dataSchema.frommonth == null|| $scope.dataSchema.frommonth== ""){
				$scope.dataSchema.frommonth = 0;
			}
			else{
				$scope.dataSchema.frommonth = parseInt($scope.dataSchema.frommonth);
			}
			if ($scope.dataSchema.fromdate== undefined || $scope.dataSchema.fromdate == null|| $scope.dataSchema.fromdate== ""){
				$scope.dataSchema.fromdate = 0;
			}
			else{
				$scope.dataSchema.fromdate = parseInt($scope.dataSchema.fromdate);
			}
			if ($scope.dataSchema.toyear== undefined || $scope.dataSchema.toyear == null|| $scope.dataSchema.toyear== ""){
				$scope.dataSchema.toyear = 0;
			}
			else{
				$scope.dataSchema.toyear = parseInt($scope.dataSchema.toyear);
			}
			if ($scope.dataSchema.tomonth== undefined || $scope.dataSchema.tomonth == null|| $scope.dataSchema.tomonth== ""){
				$scope.dataSchema.tomonth = 0;
			}
			else{
				$scope.dataSchema.tomonth = parseInt($scope.dataSchema.tomonth);
			}
			if ($scope.dataSchema.todate== undefined || $scope.dataSchema.todate == null|| $scope.dataSchema.todate== ""){
				$scope.dataSchema.todate = 0;
			}
			else{
				$scope.dataSchema.todate = parseInt($scope.dataSchema.todate);
			}
			
			
			
			if ($scope.dataSchema.price== undefined || $scope.dataSchema.price == null|| $scope.dataSchema.price== "" || $scope.dataSchema.price == 0){
				$scope.dataSchema.price = 0;
				$scope.dataSchema.price = parseFloat($scope.dataSchema.price);
				$scope.dataSchema.displayprice = parseFloat($scope.dataSchema.price);
			}
			console.log($scope.dataSchema);
			
//			if ($scope.isAllowPrice) {
//			if ($scope.priceVerifiedNonOenDs) {
				$scope.dataSchema.price = parseFloat($scope.dataSchema.price);
				//$scope.dataSchema.price = parseFloat(($scope.dataSchema.price).toFixed(2));
				$scope.dataSchema.displayprice = $scope.dataSchema.price;
				
				if($scope.dataSchema.recordcount == ""){
					$scope.dataSchema.recordcount = 0;
				}
				else {
					$scope.dataSchema.recordcount = parseInt($scope.dataSchema.recordcount);
				}
				console.log($scope.dataSchema);
				
				var tempFile = $("#documrtfile")[0].files[0];
				
				if(tempFile == undefined){
					tempFile = [];
				}
				
				if ($scope.samplefilelocation == undefined){
					$scope.dataSchema.samplefilelocation = "";
				}
				
				
				if( tempFile.size > 0){
					$scope.fileUpload();
				}else{
					$scope.dataSchema.samplefilelocation = $scope.samplefilelocation;
					console.log($scope.dataSchema);
					$scope.callApi();
				}
			
//			}
			
		}
		
	};
	
	$scope.addDataItem2 = function() {
		$scope.priceVerifiedNonOenDs = true;
		$scope.addDataItem3();
	}

	
	$scope.fileUpload = function(){
		
		var tempFile=$("#documrtfile")[0].files[0];
		var filename = $("#documrtfile").val();
		filename=filename.replace("C:\\fakepath\\", "");
		
		var data=new FormData();
		data.append('f', 'json');
		data.append("filename", filename);
		data.append("files", tempFile);
		data.append("orgId", ORG_ID+"");
		
		
    	$.ajax({
    	    method: 'POST',
    	    headers:{'x-api-key':API_USER_KEY},
    	    enctype: 'multipart/form-data',
    	    processData: false,
			contentType: false,
			cache: false,
    	    url: API_FILE_UPLOAD,
    	    data: data,
    	    success: function(res){
    	    	console.log(res);
    	    	
    	    	$scope.$apply(function(){
    	    		$scope.dataSchema.samplefilelocation = res.url;
    				$scope.callApi();
                });
    	    },
    	    error:function(err){
    	    	console.log(err);
    	    }
    		
    	});
	}
	
	
	
	$scope.filterData = function(){
		
		$scope.findButtonStatus = false;
		
		$scope.filterItems = {"selector":{"status": "active"}};
		
		$scope.filterItems.selector["orgid"] = ORG_ID.toString();

		if (!$scope.category == undefined || !$scope.category ==null || !$scope.category == ""){
			console.log($scope.category);
			$scope.filterItems.selector["category"] = $scope.category;
		}
		if (!$scope.statusIn == undefined || !$scope.statusIn ==null || !$scope.statusIn == ""){
			console.log($scope.statusIn);
			$scope.filterItems.selector["status"] = $scope.statusIn.toLowerCase();
		}
		$scope.lastSelectedCategory = angular.copy($scope.category);
		$scope.lastSelectedStatus = angular.copy($scope.statusIn);
		
		
		$scope.filterApi($scope.filterItems, true);
		
	};
	
	
	$scope.defaultFilterData = function(clearRecord){
		//$scope.filterItems = {"selector": {"orgid":ORG_ID.toString(), "status": "active"}, "sort": [{"datecreated": "desc"}]};
		$scope.filterItems = {"selector": {"orgid":ORG_ID.toString(), "status": "active"}, "skip": $scope.skipCount, "sort": [{"datecreated": "desc"}]};
//		$scope.filterItems ={"selector": {"$nor": [{"orgid": ORG_ID.toString()}],"status": "active"},"skip": $scope.skipCount,"sort": [{"datecreated": "desc"}]};
		console.log($scope.filterItems)
		$scope.filterApi($scope.filterItems, clearRecord);
	
	};
	
	
	$scope.deleteRow = function(index){
		console.log(index);
		$scope.dataSchema.dataitems.splice(index, 1);
		
	}
	
	$scope.selectDeleteId = "";
	
	$scope.deletebox = function(id){
		$scope.selectDeleteId = id;
		console.log($scope.selectDeleteId);
		jQuery('#myModal').modal('toggle');
	};

	
	
	$scope.viewSchema = {};
	
	$scope.viewMore = function(scehma){
		$scope.viewSchema = scehma;
		jQuery('#moreDetailModal').modal('toggle');
	};
	
	
	$scope.getStatusClass = function(status){
		var returnText = "deleted";
		if (status=="active"){
			returnText = "active2";
			$scope.showTrash = true;
		}
		else if(status=="deleted"){
			$scope.showTrash = false;
		}
		else{
			$scope.showTrash = true;
		}
		return returnText;
		
	};

	$scope.chooseFileType = function(file){
	
		if ($scope.dataSchema.samplefiletype == "url"){
			$scope.uploadFile = true;
		}
		else{
			$scope.uploadFile = false;
		}
	};

	
	/*$scope.callApi = function(){
		
//		COUNTRY VALIDATION ***************************************************

		$scope.appendCountries = [];
		if ($scope.dataSchema.type == undefined || $scope.dataSchema.type == null || $scope.dataSchema.type == ""){
			$scope.dataSchema.type = "";
		}
		
		console.log($scope.dataSchema.countries);
		
		if ($scope.dataSchema.countries == undefined || $scope.dataSchema.countries == null || $scope.dataSchema.countries == ""){
			$scope.dataSchema.countries = [];
		}
		else if($scope.dataSchema.countries.length){
			for (var j=0; j<$scope.dataSchema.countries.length; j++){
				$scope.appendCountries.push($scope.countriesListObj[$scope.dataSchema.countries[j]]);
			}
			if ($scope.dataSchema.countries){
				$scope.dataSchema.countries = $scope.appendCountries;
			}
		}

//		COUNTRY VALIDATION ***************************************************	
		console.log($scope.dataSchema);
		$scope.cancel();
	};
	*/
		
	$scope.addDataSchemaResponse = {};

	// ADD DATASCHEMA --------------
	
	$scope.callApi = function(){
		
		$scope.saveButtonStatus = false;
		
		/*if ($scope.dataSchema.currency== undefined || $scope.dataSchema.currency == null|| $scope.dataSchema.currency== ""){
			$scope.dataSchema.currency = "USD";
		}*/

		if ($scope.dataSchema.samplefilelocation == undefined || $scope.dataSchema.samplefilelocation == null){
			$scope.dataSchema.samplefilelocation = "";
		}
		
		if ($scope.dataSchema.recordcount == ""){
			$scope.dataSchema.recordcount = 0;
		}
		$scope.dataSchema.recordcount = parseInt($scope.dataSchema.recordcount);
		console.log(JSON.stringify($scope.dataSchema));

		
		$scope.appendCountries = [];
		if ($scope.dataSchema.type == undefined || $scope.dataSchema.type == null || $scope.dataSchema.type == ""){
			$scope.dataSchema.type = "";
		}
		if ($scope.dataSchema.countries == undefined || $scope.dataSchema.countries == null){
			$scope.dataSchema.countries = [];
		}
		else if($scope.dataSchema.countries.length){
			for (var j=0; j<$scope.dataSchema.countries.length; j++){
				$scope.appendCountries.push($scope.countriesListObj[$scope.dataSchema.countries[j]]);
			}
			if ($scope.dataSchema.countries){
				$scope.dataSchema.countries = $scope.appendCountries;
			}
		}
		
		console.log($scope.dataSchema);
		
		$scope.dataSchema["orgid"] = ORG_ID+"";
		$scope.dataSchema["dataprovidername"] = ORG_NAME+"";
		$scope.dataSchema["clientid"] = CLIENT_ID+"";
		$scope.dataSchema["ownerid"] = OWNER_ID+"";
		jQuery('#createdata').modal('hide');
		$http({
			url : API_ADD_SCHEMA,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : $scope.dataSchema,
			}).then(function(response) {
				console.log(response);
				$scope.addDataSchemaResponse = response;
//				$scope.dontLoader = false;
				if ($scope.addDataSchemaResponse.data.message == "This Dataschema is already available in this channel with this organization"){
					$scope.saveButtonStatus = true;
					$scope.alreadyFoundPopup();
//					$scope.dontLoader = true;
				}
				else if ($scope.addDataSchemaResponse.data.message == "DA_CST_COMM_AMNT_LOW"){
					$scope.showLowAmount = true;
					$scope.saveButtonStatus = true;
					$scope.alreadyFoundPopup();
				}
				else{
					$timeout(function(){
						$scope.successPopup();	
					},3000);	
					jQuery('#successModal').modal('toggle');
					$scope.cancel();
				}			
//				if (!$scope.dontLoader){
				
				$timeout(function(){
					$scope.loadeer = true;
					$scope.skipCount = 0;
					$scope.defaultFilterData(true);	
				},3000);
//				}
		})	
	};
	
	
	$scope.filterApi = function(filterData, clearRecord){
		console.log('filter api called.!');
		console.log(filterData);
		$http({
			url : API_LIST_SCHEMA,
			method : 'POST',
			headers : {
		        'x-api-key': API_USER_KEY
		    },
			contentType : 'application/json',
			data : filterData
			}).then(function(response) {
				console.log(response);
				
				$scope.isScrollingActive = false;
				$scope.findButtonStatus = true;
				$scope.loadeer = false;
				if (response.data){
//					$scope.dataSchemaItems = response.data;
					
					if (clearRecord){
						$scope.newArrayObj = [];
					}
					
					/*for (var j=0; j<response.data.Data.length; j++){
						$scope.newArrayObj.push(response.data.Data[j])
					}*/
					
					$.map(response.data.Data, function(obj){
						$scope.newArrayObj.push(obj);
						return (obj);
					});
					
//					$scope.dataSchemaItems = response.data.Data; //----------OLD ARRAY
					
					$scope.dataSchemaItems = $scope.newArrayObj;
					$scope.paginationPageCount = response.data.ResponseMetadata.RecordsCount;
					if ($scope.paginationPageCount < 80){
						$scope.showLoadmoretext = false;
						$scope.showEndPagetext = true;
					}
				
					
					if(!$scope.noBtn){
						jQuery('#myModal').modal('toggle');
					}
					$scope.noBtn = true;
					$scope.deleteBtn = true;
					
				}
				else{
					console.log('not found');
				}
				
		})
	};
	
	
	$scope.deleteApi = function(){
		
		$scope.noBtn = false;
		$scope.deleteBtn = false;
		
		console.log($scope.selectDeleteId);
		console.log('$scope.selectDeleteId');
		
		if ($scope.selectDeleteId != ""){
			$http({
				url : API_DELETE_SCHEMA,
				method : 'POST',
				headers : {
			        'x-api-key': API_USER_KEY
			    },
				contentType : 'application/json',
//				data : [$scope.selectDeleteId.toString()] // blockchain 1.0
			    data : '"'+$scope.selectDeleteId.toString()+'"'  // blockchain 2.0
				
				}).then(function(response) {
					if (response){
						console.log('delete');
						console.log(response);
						$scope.selectDeleteId = "";
						
						$timeout(function(){
							/*$scope.skipCount = 0;*/
							$scope.defaultFilterData(true);
						},1000);
					}
					
				})
			}
	};
	
	$scope.setCaegoryOptions = function(){
		
		$scope.categoryOptions = [];
		
		$http ({
    		url : 'getFlexyList?code=DATA_CATEGORY',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.categoryOptions = response.data.result;
    	})
		
	};
	
	$scope.setCurrencyOptions = function(){
		
		$scope.currencyOptions = [];
		
		$http ({
    		url : 'getFlexyList?code=CURRENCY',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.currencyOptions = response.data.result;
    	})
		
	};
	
	$scope.setStatusOptions = function(){
		
		$scope.statusOptions = [];
		
		$http ({
    		url : 'getFlexyList?code=STATUS',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.statusOptions = response.data.result;
    	})
		
	};
	
	
	$scope.setTypeOptions = function(){
		
		$scope.dataTypeOptions = [];
		
		$http ({
    		url : 'getFlexyList?code=DATA_TYPE',
    		method : 'GET'
    	}).then(function(response) {
    		$scope.dataTypeOptions = response.data.result;
    	})
		
	};
	
	
	$scope.getTypesOfSchema = function(){
		$scope.schemaTypes = [];
		$http ({
			url : 'getFlexyList?code=SCHEMA_TYPES',
			method : 'GET'
		}).then(function(response) {
			$scope.schemaTypes = response.data.result;
			console.log('$scope.schemaTypes');
			console.log($scope.schemaTypes);
			console.log('$scope.schemaTypes');
		})
	};
	
	
	$scope.setCurrencyOptions();
	$scope.setCaegoryOptions();
	$scope.setStatusOptions();
	$scope.setTypeOptions();
	$scope.getTypesOfSchema();
	$scope.defaultFilterData(true);
	
	
	$timeout(function(){
		
		if($scope.loadeer) {
			$scope.loadeer = false;
		}
		
	},5000)
	
	
	$scope.customDateFormat = function(dateString){
		if (dateString){
			var dateTimeStr = dateString.split(' ');
			var dateStr = dateTimeStr[0];
			var timeStr = dateTimeStr[1].split(':');
			var timeStrFormat = timeStr[0]+":"+timeStr[1];
			return dateStr+" "+timeStrFormat;
		}
		
	};
	

	$('#documrtfile').bind('change', function () {
		var filename = $("#documrtfile").val();
		if (/^\s*$/.test(filename)) {
			$(".file-upload").removeClass('active');
			$("#noFile").text("Formats: txt, doc/docx, rtf, pdf");
		} else {
				$(".file-upload").addClass('active');
				$("#noFile").text(filename.replace("C:\\fakepath\\", ""));		
	
		}
	});
	
	
	$scope.scrollingIsActiveRightNow = function(){
		$scope.showLoadmoretext = false;
		if (!$scope.isScrollingActive){
			$scope.isScrollingActive = true;
			if ($scope.paginationPageCount == 80){
				$scope.skipCount += 80;
				$scope.showLoadmoretext = true;
				$scope.defaultFilterData(false);
			}
			else{
				$scope.showEndPagetext = true;
				$scope.skipCount = parseInt($scope.skipCount);
				$scope.paginationPageCount = parseInt($scope.paginationPageCount);
				$scope.skipCount += $scope.paginationPageCount;
			}
		}
	}
	
	

	$scope.countriesList = [{"name":"Afghanistan","dial_code":"+93","code":"AF"},{"name":"Albania","dial_code":"+355","code":"AL"},{"name":"Algeria","dial_code":"+213","code":"DZ"},{"name":"AmericanSamoa","dial_code":"+1 684","code":"AS"},{"name":"Andorra","dial_code":"+376","code":"AD"},{"name":"Angola","dial_code":"+244","code":"AO"},{"name":"Anguilla","dial_code":"+1 264","code":"AI"},{"name":"Antigua and Barbuda","dial_code":"+1268","code":"AG"},{"name":"Argentina","dial_code":"+54","code":"AR"},{"name":"Armenia","dial_code":"+374","code":"AM"},{"name":"Aruba","dial_code":"+297","code":"AW"},{"name":"Australia","dial_code":"+61","code":"AU"},{"name":"Austria","dial_code":"+43","code":"AT"},{"name":"Azerbaijan","dial_code":"+994","code":"AZ"},{"name":"Bahamas","dial_code":"+1 242","code":"BS"},{"name":"Bahrain","dial_code":"+973","code":"BH"},{"name":"Bangladesh","dial_code":"+880","code":"BD"},{"name":"Barbados","dial_code":"+1 246","code":"BB"},{"name":"Belarus","dial_code":"+375","code":"BY"},{"name":"Belgium","dial_code":"+32","code":"BE"},{"name":"Belize","dial_code":"+501","code":"BZ"},{"name":"Benin","dial_code":"+229","code":"BJ"},{"name":"Bermuda","dial_code":"+1 441","code":"BM"},{"name":"Bhutan","dial_code":"+975","code":"BT"},{"name":"Bosnia and Herzegovina","dial_code":"+387","code":"BA"},{"name":"Botswana","dial_code":"+267","code":"BW"},{"name":"Brazil","dial_code":"+55","code":"BR"},{"name":"British Indian Ocean Territory","dial_code":"+246","code":"IO"},{"name":"Bulgaria","dial_code":"+359","code":"BG"},{"name":"Burkina Faso","dial_code":"+226","code":"BF"},{"name":"Burundi","dial_code":"+257","code":"BI"},{"name":"Cambodia","dial_code":"+855","code":"KH"},{"name":"Cameroon","dial_code":"+237","code":"CM"},{"name":"Canada","dial_code":"+1","code":"CA"},{"name":"Cape Verde","dial_code":"+238","code":"CV"},{"name":"Cayman Islands","dial_code":"+ 345","code":"KY"},{"name":"Central African Republic","dial_code":"+236","code":"CF"},{"name":"Chad","dial_code":"+235","code":"TD"},{"name":"Chile","dial_code":"+56","code":"CL"},{"name":"China","dial_code":"+86","code":"CN"},{"name":"Christmas Island","dial_code":"+61","code":"CX"},{"name":"Colombia","dial_code":"+57","code":"CO"},{"name":"Comoros","dial_code":"+269","code":"KM"},{"name":"Congo","dial_code":"+242","code":"CG"},{"name":"Cook Islands","dial_code":"+682","code":"CK"},{"name":"Costa Rica","dial_code":"+506","code":"CR"},{"name":"Croatia","dial_code":"+385","code":"HR"},{"name":"Cuba","dial_code":"+53","code":"CU"},{"name":"Cyprus","dial_code":"+537","code":"CY"},{"name":"Czech Republic","dial_code":"+420","code":"CZ"},{"name":"Denmark","dial_code":"+45","code":"DK"},{"name":"Djibouti","dial_code":"+253","code":"DJ"},{"name":"Dominica","dial_code":"+1 767","code":"DM"},{"name":"Dominican Republic","dial_code":"+1 849","code":"DO"},{"name":"Ecuador","dial_code":"+593","code":"EC"},{"name":"Egypt","dial_code":"+20","code":"EG"},{"name":"El Salvador","dial_code":"+503","code":"SV"},{"name":"Equatorial Guinea","dial_code":"+240","code":"GQ"},{"name":"Eritrea","dial_code":"+291","code":"ER"},{"name":"Estonia","dial_code":"+372","code":"EE"},{"name":"Ethiopia","dial_code":"+251","code":"ET"},{"name":"Faroe Islands","dial_code":"+298","code":"FO"},{"name":"Fiji","dial_code":"+679","code":"FJ"},{"name":"Finland","dial_code":"+358","code":"FI"},{"name":"France","dial_code":"+33","code":"FR"},{"name":"French Guiana","dial_code":"+594","code":"GF"},{"name":"French Polynesia","dial_code":"+689","code":"PF"},{"name":"Gabon","dial_code":"+241","code":"GA"},{"name":"Gambia","dial_code":"+220","code":"GM"},{"name":"Georgia","dial_code":"+995","code":"GE"},{"name":"Germany","dial_code":"+49","code":"DE"},{"name":"Ghana","dial_code":"+233","code":"GH"},{"name":"Gibraltar","dial_code":"+350","code":"GI"},{"name":"Greece","dial_code":"+30","code":"GR"},{"name":"Greenland","dial_code":"+299","code":"GL"},{"name":"Grenada","dial_code":"+1 473","code":"GD"},{"name":"Guadeloupe","dial_code":"+590","code":"GP"},{"name":"Guam","dial_code":"+1 671","code":"GU"},{"name":"Global", "code":"Global"},{"name":"Guatemala","dial_code":"+502","code":"GT"},{"name":"Guinea","dial_code":"+224","code":"GN"},{"name":"Guinea-Bissau","dial_code":"+245","code":"GW"},{"name":"Guyana","dial_code":"+595","code":"GY"},{"name":"Haiti","dial_code":"+509","code":"HT"},{"name":"Honduras","dial_code":"+504","code":"HN"},{"name":"Hungary","dial_code":"+36","code":"HU"},{"name":"Iceland","dial_code":"+354","code":"IS"},{"name":"India","dial_code":"+91","code":"IN"},{"name":"Indonesia","dial_code":"+62","code":"ID"},{"name":"Iraq","dial_code":"+964","code":"IQ"},{"name":"Ireland","dial_code":"+353","code":"IE"},{"name":"Israel","dial_code":"+972","code":"IL"},{"name":"Israel","dial_code":"+972","code":"IL"},{"name":"Italy","dial_code":"+39","code":"IT"},{"name":"Jamaica","dial_code":"+1 876","code":"JM"},{"name":"Japan","dial_code":"+81","code":"JP"},{"name":"Jordan","dial_code":"+962","code":"JO"},{"name":"Kazakhstan","dial_code":"+7 7","code":"KZ"},{"name":"Kenya","dial_code":"+254","code":"KE"},{"name":"Kiribati","dial_code":"+686","code":"KI"},{"name":"Kuwait","dial_code":"+965","code":"KW"},{"name":"Kyrgyzstan","dial_code":"+996","code":"KG"},{"name":"Latvia","dial_code":"+371","code":"LV"},{"name":"Lebanon","dial_code":"+961","code":"LB"},{"name":"Lesotho","dial_code":"+266","code":"LS"},{"name":"Liberia","dial_code":"+231","code":"LR"},{"name":"Liechtenstein","dial_code":"+423","code":"LI"},{"name":"Lithuania","dial_code":"+370","code":"LT"},{"name":"Luxembourg","dial_code":"+352","code":"LU"},{"name":"Madagascar","dial_code":"+261","code":"MG"},{"name":"Malawi","dial_code":"+265","code":"MW"},{"name":"Malaysia","dial_code":"+60","code":"MY"},{"name":"Maldives","dial_code":"+960","code":"MV"},{"name":"Mali","dial_code":"+223","code":"ML"},{"name":"Malta","dial_code":"+356","code":"MT"},{"name":"Marshall Islands","dial_code":"+692","code":"MH"},{"name":"Martinique","dial_code":"+596","code":"MQ"},{"name":"Mauritania","dial_code":"+222","code":"MR"},{"name":"Mauritius","dial_code":"+230","code":"MU"},{"name":"Mayotte","dial_code":"+262","code":"YT"},{"name":"Mexico","dial_code":"+52","code":"MX"},{"name":"Monaco","dial_code":"+377","code":"MC"},{"name":"Mongolia","dial_code":"+976","code":"MN"},{"name":"Montenegro","dial_code":"+382","code":"ME"},{"name":"Montserrat","dial_code":"+1664","code":"MS"},{"name":"Morocco","dial_code":"+212","code":"MA"},{"name":"Myanmar","dial_code":"+95","code":"MM"},{"name":"Namibia","dial_code":"+264","code":"NA"},{"name":"Nauru","dial_code":"+674","code":"NR"},{"name":"Nepal","dial_code":"+977","code":"NP"},{"name":"Netherlands","dial_code":"+31","code":"NL"},{"name":"Netherlands Antilles","dial_code":"+599","code":"AN"},{"name":"New Caledonia","dial_code":"+687","code":"NC"},{"name":"New Zealand","dial_code":"+64","code":"NZ"},{"name":"Nicaragua","dial_code":"+505","code":"NI"},{"name":"Niger","dial_code":"+227","code":"NE"},{"name":"Nigeria","dial_code":"+234","code":"NG"},{"name":"Niue","dial_code":"+683","code":"NU"},{"name":"Norfolk Island","dial_code":"+672","code":"NF"},{"name":"Northern Mariana Islands","dial_code":"+1 670","code":"MP"},{"name":"Norway","dial_code":"+47","code":"NO"},{"name":"Oman","dial_code":"+968","code":"OM"},{"name":"Pakistan","dial_code":"+92","code":"PK"},{"name":"Palau","dial_code":"+680","code":"PW"},{"name":"Panama","dial_code":"+507","code":"PA"},{"name":"Papua New Guinea","dial_code":"+675","code":"PG"},{"name":"Paraguay","dial_code":"+595","code":"PY"},{"name":"Peru","dial_code":"+51","code":"PE"},{"name":"Philippines","dial_code":"+63","code":"PH"},{"name":"Poland","dial_code":"+48","code":"PL"},{"name":"Portugal","dial_code":"+351","code":"PT"},{"name":"Puerto Rico","dial_code":"+1 939","code":"PR"},{"name":"Qatar","dial_code":"+974","code":"QA"},{"name":"Romania","dial_code":"+40","code":"RO"},{"name":"Rwanda","dial_code":"+250","code":"RW"},{"name":"Samoa","dial_code":"+685","code":"WS"},{"name":"San Marino","dial_code":"+378","code":"SM"},{"name":"Saudi Arabia","dial_code":"+966","code":"SA"},{"name":"Senegal","dial_code":"+221","code":"SN"},{"name":"Serbia","dial_code":"+381","code":"RS"},{"name":"Seychelles","dial_code":"+248","code":"SC"},{"name":"Sierra Leone","dial_code":"+232","code":"SL"},{"name":"Singapore","dial_code":"+65","code":"SG"},{"name":"Slovakia","dial_code":"+421","code":"SK"},{"name":"Slovenia","dial_code":"+386","code":"SI"},{"name":"Solomon Islands","dial_code":"+677","code":"SB"},{"name":"South Africa","dial_code":"+27","code":"ZA"},{"name":"South Georgia and the South Sandwich Islands","dial_code":"+500","code":"GS"},{"name":"Spain","dial_code":"+34","code":"ES"},{"name":"Sri Lanka","dial_code":"+94","code":"LK"},{"name":"Sudan","dial_code":"+249","code":"SD"},{"name":"Suriname","dial_code":"+597","code":"SR"},{"name":"Swaziland","dial_code":"+268","code":"SZ"},{"name":"Sweden","dial_code":"+46","code":"SE"},{"name":"Switzerland","dial_code":"+41","code":"CH"},{"name":"Tajikistan","dial_code":"+992","code":"TJ"},{"name":"Thailand","dial_code":"+66","code":"TH"},{"name":"Togo","dial_code":"+228","code":"TG"},{"name":"Tokelau","dial_code":"+690","code":"TK"},{"name":"Tonga","dial_code":"+676","code":"TO"},{"name":"Trinidad and Tobago","dial_code":"+1 868","code":"TT"},{"name":"Tunisia","dial_code":"+216","code":"TN"},{"name":"Turkey","dial_code":"+90","code":"TR"},{"name":"Turkmenistan","dial_code":"+993","code":"TM"},{"name":"Turks and Caicos Islands","dial_code":"+1 649","code":"TC"},{"name":"Tuvalu","dial_code":"+688","code":"TV"},{"name":"Uganda","dial_code":"+256","code":"UG"},{"name":"Ukraine","dial_code":"+380","code":"UA"},{"name":"United Arab Emirates","dial_code":"+971","code":"AE"},{"name":"United Kingdom","dial_code":"+44","code":"GB"},{"name":"United States","dial_code":"+1","code":"US"},{"name":"Uruguay","dial_code":"+598","code":"UY"},{"name":"Uzbekistan","dial_code":"+998","code":"UZ"},{"name":"Vanuatu","dial_code":"+678","code":"VU"},{"name":"Wallis and Futuna","dial_code":"+681","code":"WF"},{"name":"Yemen","dial_code":"+967","code":"YE"},{"name":"Zambia","dial_code":"+260","code":"ZM"},{"name":"Zimbabwe","dial_code":"+263","code":"ZW"},{"name":"land Islands","dial_code":"","code":"AX"},{"name":"Antarctica","dial_code":null,"code":"AQ"},{"name":"Bolivia, Plurinational State of","dial_code":"+591","code":"BO"},{"name":"Brunei Darussalam","dial_code":"+673","code":"BN"},{"name":"Cocos (Keeling) Islands","dial_code":"+61","code":"CC"},{"name":"Congo, The Democratic Republic of the","dial_code":"+243","code":"CD"},{"name":"Cote d'Ivoire","dial_code":"+225","code":"CI"},{"name":"Falkland Islands (Malvinas)","dial_code":"+500","code":"FK"},{"name":"Guernsey","dial_code":"+44","code":"GG"},{"name":"Holy See (Vatican City State)","dial_code":"+379","code":"VA"},{"name":"Hong Kong","dial_code":"+852","code":"HK"},{"name":"Iran, Islamic Republic of","dial_code":"+98","code":"IR"},{"name":"Isle of Man","dial_code":"+44","code":"IM"},{"name":"Jersey","dial_code":"+44","code":"JE"},{"name":"Korea, Democratic People's Republic of","dial_code":"+850","code":"KP"},{"name":"Korea, Republic of","dial_code":"+82","code":"KR"},{"name":"Lao People's Democratic Republic","dial_code":"+856","code":"LA"},{"name":"Libyan Arab Jamahiriya","dial_code":"+218","code":"LY"},{"name":"Macao","dial_code":"+853","code":"MO"},{"name":"Macedonia, The Former Yugoslav Republic of","dial_code":"+389","code":"MK"},{"name":"Micronesia, Federated States of","dial_code":"+691","code":"FM"},{"name":"Moldova, Republic of","dial_code":"+373","code":"MD"},{"name":"Mozambique","dial_code":"+258","code":"MZ"},{"name":"Palestinian Territory, Occupied","dial_code":"+970","code":"PS"},{"name":"Pitcairn","dial_code":"+872","code":"PN"},{"name":"Russia","dial_code":"+7","code":"RU"},{"name":"Saint Barthelemy","dial_code":"+590","code":"BL"},{"name":"Saint Helena, Ascension and Tristan Da Cunha","dial_code":"+290","code":"SH"},{"name":"Saint Kitts and Nevis","dial_code":"+1 869","code":"KN"},{"name":"Saint Lucia","dial_code":"+1 758","code":"LC"},{"name":"Saint Martin","dial_code":"+590","code":"MF"},{"name":"Saint Pierre and Miquelon","dial_code":"+508","code":"PM"},{"name":"Saint Vincent and the Grenadines","dial_code":"+1 784","code":"VC"},{"name":"Sao Tome and Principe","dial_code":"+239","code":"ST"},{"name":"Somalia","dial_code":"+252","code":"SO"},{"name":"Svalbard and Jan Mayen","dial_code":"+47","code":"SJ"},{"name":"Syrian Arab Republic","dial_code":"+963","code":"SY"},{"name":"Taiwan, Province of China","dial_code":"+886","code":"TW"},{"name":"Tanzania, United Republic of","dial_code":"+255","code":"TZ"},{"name":"Timor-Leste","dial_code":"+670","code":"TL"},{"name":"Venezuela, Bolivarian Republic of","dial_code":"+58","code":"VE"},{"name":"Viet Nam","dial_code":"+84","code":"VN"},{"name":"Virgin Islands, British","dial_code":"+1 284","code":"VG"},{"name":"Virgin Islands, U.S.","dial_code":"+1 340","code":"VI"}];
	
	$scope.countriesList.sort(function(a, b){
	    return a.name-b.name
	})
	
	for (var i=0; i<$scope.countriesList.length; i++){
		$scope.countriesListObj[$scope.countriesList[i].code] = {"name":$scope.countriesList[i].name, "code":$scope.countriesList[i].code}   
	}
	
	
	console.log('$scope.countriesListObj');
	console.log($scope.countriesListObj);
	console.log('$scope.countriesListObj');
	
	jQuery('#topMenu').css("display", "block");
	
});





