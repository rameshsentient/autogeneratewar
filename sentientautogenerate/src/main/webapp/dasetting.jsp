<%@ page session="true" %>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_DE"));
Map<String, Map<String, String>> lblFun = ((Map<String, Map<String, String>>) session.getAttribute("ORG_FUN"));
Map<String, Map<String, String>> errOrg = ((Map<String, Map<String, String>>) session.getAttribute("ORG_ERR"));
Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("DA_SETTING"));

String API_ADD_DA_SETTING = APIUtil.API_ADD_DA_SETTING;

String API_GET_DA_SETTING = APIUtil.API_GET_DA_SETTING;

int loginOrgId2 = 0;
int currentLoginId = 0;
String currentOwnerId = "";
if(session.getAttribute("loginOrgId") != null)
{
	loginOrgId2 = (int) session.getAttribute("loginOrgId");
}

if(session.getAttribute("id") != null)
{
	currentLoginId = (int) session.getAttribute("id");
}

 if(session.getAttribute("ownerId") != null)
{
	 currentOwnerId = session.getAttribute("ownerId").toString();
} 


String orgTypeTemp = "";

if(session.getAttribute("orgType") != null)
{
	orgTypeTemp = session.getAttribute("orgType").toString();
}

%>


	
		<style>
			table.listTable thead span{
				margin-left: 4%;
			}
			table.listTable tbody td{
				text-indent:1%;
			} \
			
			
		</style>
		
<style>
		table.tableP{
			/* border : 1px solid #ccc;
			border-top :0px; */
			box-shadow: 0 1px 3px 0 rgba(0,0,0,.2), 0 1px 1px 0 rgba(0,0,0,.14), 0 2px 1px -1px rgba(0,0,0,.12);
		}	
		
.btn_cancel {
	border-color: #ccc;
    width: 10rem;
    margin-left: 10px;
    color: #333;
    border: 1px solid #c4c4c7;
}

.btn {
	display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
	touch-action: manipulation;
    cursor: pointer;
	user-select: none;
    background-image: none;
	border-radius: 4px;
	height: 32px;
}

.btn_save {
    color: white;
    width: 10rem;
    margin-right: 10px;
}
.btn-successcustom {
    background-color: #96CA4E;
    border-color: #96CA4E;
}
.form-control{
	background-color: #fff!important;
}	
.requiredfileds{color: red;}	
	
select{
  color: red;
}
select option { color: #333; }
	</style>
	<script>
	var currentLoginId = <%=currentLoginId%>;
	var OWNER_ORG_ID = <%=currentOwnerId%>;
	var API_GET_DA_SETTING = "<%=API_GET_DA_SETTING%>";
	var API_ADD_DA_SETTING = "<%=API_ADD_DA_SETTING%>";
	
	</script>
<link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/search.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	
	<div class="wrapper" ng-controller="daSettingController" ng-cloak>
	<%@include file="header.jsp"%>
	<div class="container-fluid container-fluid-BG pageTBMargin49">
			<div class="paddingLR30 paddingTopBtm30">
					<div class="row leftPadding40">
		<div class="padding0">
				<h3 class="orgTitle"><%=lblOrg.get("ORG_DE").get("TITLE")%></h3>
				<div class="pad-15">
					<ul class="list-unstyled ul_orgDets form-margin">
							<li>
									<label class="col-sm-2 "><%=lblOrg.get("ORG_DE").get("NAME")%></label>	
									<div class="col-sm-4">	
										<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.name}}<span ng-show="!orgDetails.name.length">N/A</span></p>
										<div class="formInput" ng-show="editOrg2">
											<input type="text" ng-model="orgDetails.name" readonly="true">
										</div>
									</div>
								</li>
								<li>
										<label class="col-sm-2"><%=lblOrg.get("ORG_DE").get("STATUS")%></label>	
										<div class="col-sm-4" >		
											<p class="wordWrpa" ng-hide="editOrg2">{{orgDetails.desc}}<span ng-show="!orgDetails.desc.length">N/A</span></p>
											<div class="formInput" ng-show="editOrg2">
												<textarea ng-model="orgDetails.desc"></textarea>
											</div>
										</div>
									</li>
						<li ng-show="succesUpdat">
							<label class="marginTop10 success_css"><%=lbl.get("DA_SETTING").get("UPDATED_SUCCESS")%></label>
						</li>
						<!-- <i ng-if="orgDetails.orgType == 'child' && uAccess.ORG_DELETEORG" class="fa fa-trash sColor delOrgz" data-toggle="modal" data-target="#deleOrgnzt"></i>
						<i ng-if="uAccess.ORG_UPDATEORGINFO" class="fa fa-pencil colorAAA editOrgz" ng-click="setOrgEditMode()" ng-hide="editOrg2"></i>
						<i class="fa fa-check pColor editOrgz"  ng-click="updateOrgz();" ng-show="editOrg2"></i> -->
					</ul>	
				</div>				
					<div class="clearfix"></div>	
				</div>

				<div class="container-fluid">
						<div class="box bgWhite">
						<div class="orgnztnMenu marginTop10">
					<ul class="list-unstyled margin0">
						<li ng-hide="userDetails" ng-if="uAccess.ORG_GETUSERLIST"><a href="orgdetails"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<li ng-show="userDetails"><a ng-click="userDetails = false"><%=lblOrg.get("ORG_DE").get("USERS")%></a></li>
						<%
						if(orgTypeTemp.equals("main"))
						{
							%>
							<li ng-if="uAccess.ORG_GETORGASSIGNFUNCTIONS"><a href="orgFunctionList"><%=lblOrg.get("ORG_DE").get("FUNCTIONS")%></a></li>
							<%
						}
						%>						
						<!-- <li ng-if="uAccess.ORG_GETORGROLELIST"><a href="orgrole"><%=lblOrg.get("ORG_DE").get("ROLES")%></a></li> -->
						<li ng-if="uAccess.ORG_GETORGGROUPLIST"><a href="orggroup"><%=lblOrg.get("ORG_DE").get("GROUP")%></a></li>
						<!-- <li ng-if="uAccess.ORG_GETORGTAGSLIST"><a href="orgtags"><%=lblOrg.get("ORG_DE").get("TAGS")%></a></li> -->
						<%
						if (loginOrgId2 == 1){
							%>
							<li class="active" ><a href="dasetting"><%=lbl.get("DA_SETTING").get("DASETTINGS")%></a></li>
							<%
						}
						%>
					</ul>	
				</div>
		

			<div class="container-fluid LR30" style="margin-bottom:24px">			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<div class="row">
	           <div class="form-group col-sm-6 col-md-6" >
	         	
	              <label class="font-weight-bold">Account Type <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="plantypeRequired && daSetting.planType.length < 1" >Account type is required</span>
	              <!--  <select class="form-control select-form-control" ng-model="previewStatus" ng-change="getPreviewStatus(previewStatus)" style="cursor:pointer">-->
	    
	              <select id="sel1" class="form-control select-form-control border-class optionDisale" ng-model="daSetting.planType"  style="cursor:pointer;" ng-change="getPlanStatus(daSetting.planType)">
	                <option value="" disabled selected>Select Plan Type</option>
	              	<option  ng-repeat="pType in planTypes"  value="{{pType.code}}">{{pType.value}}</option>
	              </select>
	            
	            </div>
	            
	            <div class="form-group col-sm-6 col-md-6" style="display:none">
	              <label class="font-weight-bold"><%=lbl.get("DA_SETTING").get("MEMBER_TYPE")%></label>
	              <span class="requiredfileds" ng-show="membertypeRequired && daSetting.memberType.length < 1" >Member type is required</span>
	              <select class="form-control select-form-control" ng-model="daSetting.memberType" style="cursor:pointer" >
	              	<option value="" disabled selected><%=lbl.get("DA_SETTING").get("SELECT_MEMBER_TYPE")%></option>
	              	<option ng-repeat="membType in memberTypes" value="{{membType.value}}">{{membType.value}}</option>
	              </select>
	            </div>
	        </div>
			
			<div class="row">
	            <div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold" for="Name"><%=lbl.get("DA_SETTING").get("START_DATE")%> <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="startdateRequired && daSetting.startDate.length < 1" >Start date is required</span>
	              <div class="input-group border-button" id="startFocus">
					 <input class="form-control" type="text" id="startdate" ng-model="daSetting.startDate" ng-init="daSetting.startDate=''" readonly="readonly" placeholder="Select Start Date" />
					 <span class="input-group-addon">
					 	<span class="fa fa-calendar"></span>
					 </span>
	              </div>
	              
	            </div>
	            <div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold"><%=lbl.get("DA_SETTING").get("DURATION")%></label>
	              <span class="requiredfileds" ng-show="durationRequired" >End date is required</span>
	              <div class="input-group border-button" id="endFocus">
					  <input class="form-control" type="text" id="enddate" ng-model="daSetting.durationMonth" ng-init="daSetting.durationMonth=''" readonly="readonly" placeholder="Select End Date"/>
					  <span class="input-group-addon">
                        <span class="fa fa-calendar"></span>
                    </span>
	              </div>
	              
	            </div>
	        </div>
			
			<div class="row">
			 	<div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold" for="Name">Min. Commission Value <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="commissionRequired && daSetting.commissionValue.length < 1" >Min. Commission value is required</span>
	              <div class="input-group-btn border-button">
	                <input type="text" ng-model="daSetting.commissionValue" id="commisionVal" class="form-control" onkeyup="return checkCommisionVal()" placeholder="Enter Min. Commission Value" style="cursor:pointer;"/>
	              </div>
	            </div>
	            
	            <div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold" for="Name"><%=lbl.get("DA_SETTING").get("COMMISION")%> <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="commissionRequired && daSetting.commissionPercentage.length < 1" >Commission percentage is required</span>
	              <div class="input-group-btn border-button">
	                <input type="text" ng-model="daSetting.commissionPercentage" id="commisionPercent" class="form-control" onkeyup="return checkCommisionPercent()" placeholder="15.00" style="cursor:pointer;"/>
	              </div>
	            </div>
	        </div>
	        
	        <div class="row">
			 	<div class="form-group col-sm-6 col-md-6" style="display:none">
	              <label class="font-weight-bold" for="Name"><%=lbl.get("DA_SETTING").get("MEMBER_EMAIL")%> <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="EmailRequired && daSetting.inviteMemberEmail.length < 1">Email is required</span> 
	              <span style="float: right;" > <input type="checkbox" value="Default"  name="default" ng-model="checkBoxVal" ng-change="isChecked(checkBoxVal)" ng-checked="previewStatus" ng-disabled="previewStatus"> <label>Default</label></span>
	              <div>
	                <input type="url" ng-model="daSetting.inviteMemberEmail" class="form-control" ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" style="cursor:pointer;"/>
	              </div>
	            </div>
	            
	            
	             <div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold" for="Name"><%=lbl.get("DA_SETTING").get("FEE_PAID")%> <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="feeRequired && daSetting.feePaid.length < 1" >Fee paid is required</span>
	              <div class="input-group-btn border-button">
	                <!-- <input type="text" ng-model="daSetting.feePaid" id="feesPaid" class="form-control"  placeholder="Select Fee Paid" /> -->
	              <select class="form-control select-form-control" ng-model="daSetting.feePaid" ng-change="disablePayDate(daSetting.feePaid)" style="cursor:pointer;">
	                <option value="" style="color: #9fa599" disabled selected>Select Fee Paid</option>
	              	<option ng-repeat="val in isPaid" value="{{ val }}">{{ val }}</option>
	              	
	              </select>
	              </div>
	            </div>
	            
	            
     	        <div class="form-group col-sm-6 col-md-6" ng-hide="previewStatus">
	              <label class="font-weight-bold" for="Name"><%=lbl.get("DA_SETTING").get("PAYMENT_DATE")%> </label>
	              <span class="requiredfileds" ng-show="paymentdateRequired && daSetting.paymentDate.length < 1">Payment date is required</span>
	              <div class="input-group border-button" id="paymentFocus">
	                <input type="text" id="paymentdate" ng-model="daSetting.paymentDate" ng-disabled="emptyDate" class="form-control" readonly="readonly" placeholder="Select Payment Date"/>
              	    <span class="input-group-addon" >
                        <span class="fa fa-calendar"></span>
					</span>
				</div>
	            </div>
	        </div>
            
             <div class="row">
	            <div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold" for="Name"><%=lbl.get("DA_SETTING").get("SDK_HOSTING")%> <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="isSdkHosting" > SDK hosting is required</span>
	              <div class="input-group-btn border-button">	                
	                <select class="form-control select-form-control" ng-model="daSetting.sdkHosting" ng-change="disableHttp()" />
	              	<option value="" style="color: #9fa599" disabled selected><%=lbl.get("DA_SETTING").get("SELECT_SDK_HOSTING")%></option>
	              	<option value="Sentient" ng-selected="isCheckedBox"><%=lbl.get("DA_SETTING").get("SENTIENT")%></option>
	              	<option value="Custom"><%=lbl.get("DA_SETTING").get("CUSTOM")%></option>
	              </select>
	                
	              </div>
	            </div>
	            <div class="form-group col-sm-6 col-md-6">
	              <label class="font-weight-bold"><%=lbl.get("DA_SETTING").get("SDK_ENDPOINT")%> <span style="color:red" >*</span></label>
	              <span class="requiredfileds" ng-show="isSdkEndpoint" > SDK endpoint is required</span>
	              <input type="text" ng-model="daSetting.sdkEndpoint" ng-disabled="onlyForBasic" class="form-control" placeholder="Enter SDK Endpoint: http://... or https://..."/>
	            </div>
            </div>
 
                
            <div style="padding-bottom: 10px;" align="right" >
               <%-- <button class="btn btn-default" ng-click="clearAll()"><%=lbl.get("DA_SETTING").get("CANCEL")%></button> --%>
               <button ng-show="isHaveData==false" class="btn btn-save btn-successcustom btn_cancel" ng-click="updateDaSetting()">Save</button>
               <button ng-hide="isHaveData==false" class="btn btn-save btn-successcustom btn_cancel" ng-click="updateDaSetting()">Update</button>
			   <%-- <button ng-show="isSubmited" class="btn btn-save btn-successcustom btn_cancel"><%=lbl.get("DA_SETTING").get("SUBMIT")%> <i class="fa fa-spinner fa-spin"></i></button> --%>               
               
             </div>
			</div>	
		</div>	
		</div>	
	</div>
</div>	
</div>
	</div>

<%@include file="footer.jsp"%>
<script src="resources/org/controller/daSettingController.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="resources/js/daterangepicker.min.js"></script>

<script>
	$(function(){
		$('#orgz').addClass('active');
	});	
	
	function checkCommisionVal(){
        var input = document.getElementById('commisionVal');
        var ponto = input.value.split('.').length;
        if (ponto > 2)
                input.value=input.value.substr(0,(input.value.length)-1);
        
        input.value=input.value.replace(/[^0-9.-]/,'');

        if (ponto ==2)
			input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
		if(input.value == '.')
			input.value = "";
	}
	
	function checkCommisionPercent(){
        var input = document.getElementById('commisionPercent');
        var ponto = input.value.split('.').length;
        if (ponto > 2)
                input.value=input.value.substr(0,(input.value.length)-1);
        
        input.value=input.value.replace(/[^0-9.-]/,'');

        if (ponto ==2)
			input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
		if(input.value == '.')
			input.value = "";
	}
	
	function checkDuration(){
        var input = document.getElementById('duration');
        var ponto = input.value.split('.').length;
        if (ponto > 2)
                input.value=input.value.substr(0,(input.value.length)-1);
        
        input.value=input.value.replace(/[^0-9]/,'');

        if (ponto ==2)
			input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
		if(input.value == '.')
			input.value = "";
	}

	
	$(function() {
		  $('#startdate').daterangepicker({
		    singleDatePicker: true,
		    showDropdowns: true,
		    autoUpdateInput: true,
		    minYear: 1901,
		    locale: {
		           format: 'YYYY-MM-DD'
		          }
		  }, function (chosen_date) { 
			  $(this.element[0]).val(chosen_date.format('YYYY-MM-DD'));
		  });
		  
	});
	
	$(function() {
		  $('#enddate').daterangepicker({
		    singleDatePicker: true,
		    showDropdowns: true,
		    autoUpdateInput: false,
		    minYear: 1901,
		    locale: {
		           format: 'YYYY-MM-DD'
		          }
		  }, function (chosen_date) {        
			    $(this.element[0]).val(chosen_date.format('YYYY-MM-DD'));
		  });
	});
	
	$(function() {
		  $('#paymentdate').daterangepicker({
		    singleDatePicker: true,
		    showDropdowns: true,
		    autoUpdateInput: true,
		    minYear: 1901,
		    locale: {
		           format: 'YYYY-MM-DD'
		          }
		  
		  }, function (chosen_date) {        
			    $(this.element[0]).val(chosen_date.format('YYYY-MM-DD'));
		  
		  });
	});

	$(document).on('click','#startFocus',function() {
		$("#startdate").focus();
	});

	$(document).on('click','#endFocus',function() {
		$("#enddate").focus();
	});
	
	$(document).on('click','#paymentFocus',function() {
		$("#paymentdate").focus();
	});
	
    $('#sel1').on('change', function() {
    	  if ($(this).val()) {
    	return $(this).css('color', '#333');
    	  } else {
    	return $(this).css('color', 'red');
    	  }
    	});
</script>