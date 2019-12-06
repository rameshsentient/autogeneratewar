<%@ page session="true" %>
<%@page import="java.util.Map"%>

<%@include file="session.jsp"%>

<%
Map<String, Map<String, String>> lblSet = ((Map<String, Map<String, String>>) session.getAttribute("PLT_SET"));
Map<String, Map<String, String>> lblFun = ((Map<String, Map<String, String>>) session.getAttribute("FUN_SET"));
Map<String, Map<String, String>> lblMic = ((Map<String, Map<String, String>>) session.getAttribute("MIC_SET"));
Map<String, Map<String, String>> errFun = ((Map<String, Map<String, String>>) session.getAttribute("FUN_ERR"));
Map<String, Map<String, String>> errAll = ((Map<String, Map<String, String>>) session.getAttribute("PLAT_ERR"));
%>
<script>
var fun_success_msg="<%=errFun.get("FUN_ERR").get("SUCCESS_MSG")%>";
</script>
<style type="text/css">
	.customPre{
	background-color: #fff;
	border: none;
	padding: 0px;
	font-size: 16px;
    font-family: 'Lato',sans-serif;
    font-weight: 500;
    line-height: 2;
}
.tierlower { 
	position: absolute;
	color: #bc0000;
	left: 230;
	top: 272;
}
.tiercost {
	position: absolute;
	right:120px;
	top: 272;
	color: #bc0000;
}

</style>



		<div class="wrapper" ng-controller="functions" ng-cloak>
<%@include file="header.jsp"%>		
		<div class="loadr" ng-if="loadShow"></div>	
		
			<div class="container tmenu_Body">
			<div class="loadr" ng-if="loadShow"></div>	
				<div class="clearfix"></div>	

				<div class="dets_Tab_main marginTop20">
					<ul class="list-unstyled tabsoF_details margin0" ng-init="tabsGrpup='platformTab'">
						<li ng-class="(tabsGrpup == 'platformTab')?'active':''"><a ng-click="tabsGrpup = 'platformTab'"><%=lblSet.get("PLT_SET").get("TAB1")%></a></li>
						<li ng-class="(tabsGrpup == 'apiTab')?'active':''"><a ng-click="tabsGrpup = 'apiTab';microDetails = false"><%=lblSet.get("PLT_SET").get("TAB2")%></a></li>
						<li ng-class="(tabsGrpup == 'discounts')?'active':''"><a ng-click="tabsGrpup = 'discounts';microDetails = false"><%=lblSet.get("PLT_SET").get("TAB3")%></a></li>
						<li ng-class="(tabsGrpup == 'predefined')?'active':''"><a ng-click="tabsGrpup = 'predefined';microDetails = false"><%=lblSet.get("PLT_SET").get("TAB4")%></a></a></li>
					</ul>

					<div class="clearfix"></div>

					<div class="tabz_Contnt" ng-show="tabsGrpup == 'platformTab'"  ng-init="tabsStatus = 'flexy'">
						<ul class="littContz">
							<li class="cursor" ng-class="{true : 'active',false  : ''}[tabsStatus == 'flexy']" ng-click="tabsStatus = 'flexy'"><%=lblSet.get("PLT_SET").get("T1_FLEXY")%></li>
							<li class="cursor" ng-class="{true : 'active',false  : ''}[tabsStatus == 'functions']" ng-click="tabsStatus = 'functions';fnDetails = false"><%=lblSet.get("PLT_SET").get("T1_FUN")%></li>
						</ul>
						
						<ul class="margin0 littContzLi list-unstyled"  ng-show="tabsStatus=='flexy'">
							<li class="cursor"><a href="flexylanguage"><i class="fa fa-angle-right marginRight10"></i> <%=lblSet.get("PLT_SET").get("T1_FLX_LANG")%></a></li>
							<li class="cursor"><a href="flexylabel"><i class="fa fa-angle-right marginRight10"></i> <%=lblSet.get("PLT_SET").get("T1_FLX_LBL")%></a></li>
							<li class="cursor"><a href="flexyerror"><i class="fa fa-angle-right marginRight10"></i> <%=lblSet.get("PLT_SET").get("T1_FLX_ERR")%></a></li>
							<li class="cursor"><a href="flexycodelist"><i class="fa fa-angle-right marginRight10"></i><%=lblSet.get("PLT_SET").get("T1_FLX_CODE")%></a></li>
						</ul>
						
						<div class="row"  ng-show="tabsStatus=='functions'">
							<button class="pButton" data-toggle="modal" data-target="#createfuncnn" ng-hide="fnDetails" ng-click="cancelFn(id)"><%=lblFun.get("FUN_SET").get("TITLE")%></button>
							
							<div class="clearfix"></div>
							
								<table class="listTable marginTop20 fnTabz" ng-hide="fnDetails">
									<thead>
										<th class="width80 checkbox">
											<input id="checkall_{{$index}}" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)"/>
											<label for="checkall_{{$index}}"></label>
										</th>
										<th>
											<span  ng-hide="advSpan"><%=lblFun.get("FUN_SET").get("NAME")%></span>
											<a  class="advOptn white cursor" ng-show="advSpan" data-toggle="modal" data-target="#deleUssr">
												<%=lblFun.get("FUN_SET").get("DELETE")%>
											</a>
										</th>
										<th><span ng-hide="advSpan"><%=lblFun.get("FUN_SET").get("CODE")%></span></th>
										<th><span ng-hide="advSpan"><%=lblFun.get("FUN_SET").get("TYPE")%></span></th>
										<th style="width:200px"><span style="margin:0px" ng-hide="advSpan"><%=lblFun.get("FUN_SET").get("DESC")%></span></th>
										<th><span  ng-hide="advSpan"><%=lblFun.get("FUN_SET").get("CREATEBY")%></span></th>
										<th><span  ng-hide="advSpan"><%=lblFun.get("FUN_SET").get("CREATEDATE")%></span></th>
									</thead>
				
									<tbody>
										<tr ng-repeat="fun in functionDatas" class="cursor">
											<td class="width80 padding0 checkbox">
												<input id="checkabx_{{$index}}" type="checkbox" ng-model="fun.check_bx" ng-change="optionToggled();"/>
												<label for="checkabx_{{$index}}"></label>
											</td>
											<td style="width: 180px" ng-click="getFundDets(fun)">{{fun.funName}}</td>
											<td style="width: 100px;word-break:break-all" ng-click="getFundDets(fun)">{{fun.code}}</td>
											<td style="width: 100px" ng-click="getFundDets(fun)">{{fun.type}}</td>
											<td style="width: 300px" ng-click="getFundDets(fun)">
											{{fun.funDesc.substr(0, 100)}}
											<span ng-show="fun.funDesc.length>100">...</span>
											</td>
											<td ng-click="getFundDets(fun)">{{fun.creadedBy}}</td>
											<td ng-click="getFundDets(fun)">{{fun.dateCreated}}</td>
										</tr>
										<tr ng-if="functionDatas.length < 1">
											<td class="emptyrow" colspan="7">no data found</td>
										</tr>
									</tbody>
								</table>	
								
								<div class="container tmenu_Body" ng-show="fnDetails">
									
									<h1 style="width:93%;" class="pageH1"><%=lblFun.get("FUN_SET").get("FUN_DE")%>
										<div class="pull-right">
											<i class="fa fa-pencil cursor" ng-click="setFunctionEdit(fnGroups)" title="edit function" data-toggle="modal" data-target="#createfuncnn"></i>
										<!-- 	<i class="fa fa-list marginLeft10 cursor" ng-click="fnDetails = false" title="function list"></i> -->
										</div>
									</h1>
										<ul class="list-unstyled ul_orgDets">
											<li ng-if="fnGroups.funName">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_NAME")%></label>		
												<span class="col-sm-8">{{fnGroups.funName}}</span>
											</li>	
											
											<li ng-if="fnGroups.type">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_TYPE")%></label>		
												<span class="col-sm-8">
													{{fnGroups.type}}
												</span>
											</li>
											
											<li ng-if="fnGroups.funDesc">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_DESC1")%></label>		
												<span class="col-sm-8">{{fnGroups.funDesc}}</span>
											</li>	
											
											<li ng-if="fnGroups.funDesc2">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_DESC2")%></label>		
												<span class="col-sm-8">{{fnGroups.funDesc2}}</span>
											</li>	
											
											<li ng-if="fnGroups.apiendpoint" ng-if="fnGroups.apiendpoint">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_APIEND")%></label>		
												<pre class="col-sm-8 customPre" >{{fnGroups.apiendpoint}}</pre>
											</li>	
											
											<li ng-if="fnGroups.iconUrl">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_ICON")%></label>		
												<span class="col-sm-8">
													<img class="iconFn" src="{{fnGroups.iconUrl}}" alt="" style="margin-bottom: 10px">
												</span>
											</li>
											
											<li ng-if="fnGroups.source">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_SOURCE")%></label>		
												<span class="col-sm-8">
													<div class="badge" style="margin-right: 10px;margin-bottom: 10px" ng-repeat="arr in fnGroups.sourceArr">{{arr}}</div>
												</span>
											</li>
											
											<li ng-if="fnGroups.docUrl">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_DOCURL")%></label>		
												<span class="col-sm-8">
													{{fnGroups.docUrl}}
												</span>
											</li>
											<li ng-if="fnGroups.termUrl">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_TERMURL")%></label>		
												<span class="col-sm-8">
													{{fnGroups.termUrl}}
												</span>
											</li>
											
											<li ng-if="fnGroups.feature.length > 0">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_FEATRURE")%></label>	
												<ul  class="list-unstyled col-sm-8">
													<li ng-repeat="ft in fnGroups.feature"><i class="fa fa-briefcase marginRight10"></i> {{ft.title}}</li>
												</ul>
											</li>
											
											<li class="marginTop10" style="padding-bottom: 40px;" ng-if="fnGroups.images.length > 0" >
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_IMGS")%></label>	
												<!-- <ul class="list-unstyled margin0 ediImgFn col-sm-8">
													<li ng-repeat="fImgs in fnGroups.images"><img src="{{fImgs.imgUrl}}" alt=""/></li>
												</ul> -->
												
												<div class="col-sm-8 ">
												    <div class="col-md-2" ng-repeat="img in fnGroups.images" style="height: 100px">
												      <div class="thumbnail">
												        <a href="{{img.imgUrl}}" target="_blank">
												          <img src="{{img.imgUrl}}" alt="Lights" style="width:100%">
												        </a>
												      </div>
												    </div>
												 </div>
											</li>
											
											<li class="marginTop20" ng-if="fnGroups.pricing.length > 0">
												<label class="col-sm-2"><%=lblFun.get("FUN_SET").get("FUN_PRICING")%></label>	
												<div class="popTable col-sm-9" style="padding-top:0px;margin-top:-10px;">
													<table class="tableP">
														<thead>
															<th style="width:20%">
																<span><%=lblFun.get("FUN_SET").get("FUN_PR_PLAN")%></span>
															</th>
															<th style="width:20%">
																<span><%=lblFun.get("FUN_SET").get("FUN_PR_FEA")%></span>
															</th>
															<th style="width:30%">
																<span><%=lblFun.get("FUN_SET").get("FUN_PR_DESC")%></span>
															</th>
															<th style="width:10%">
																<span><%=lblFun.get("FUN_SET").get("FUN_PR_PRICE")%></span>
															</th>
															<th style="width:10%">
																<span><%=lblFun.get("FUN_SET").get("FUN_PR_NOCALL")%></span>
															</th>
															<th style="width:10%">
																<span><%=lblFun.get("FUN_SET").get("FUN_PR_COST_CALL")%></span>
															</th>
															<th style="width:10%">
																<span><%=lblFun.get("FUN_SET").get("TIERS")%></span>
															</th>
															
														</thead>
														
														<tbody>
															<tr ng-repeat="dat in fnGroups.pricing">
																<td style="max-width:250px !important;word-wrap: break-word;overflow: hidden;">
																	<span>{{dat.plan}}</span>
																</td>
																<td style="max-width:250px !important;word-wrap: break-word;overflow: hidden;">
																	<span>{{dat.feature}}</span>
																</td>
																<td style="max-width:250px !important;word-wrap: break-word;overflow: hidden;">
																	
																	<span >{{dat.desc}}</span>
																</td>
																<td style="width:10%">
																	{{dat.price}}
																</td>
																<td style="width:10%">
																	{{dat.noofcall}}
																</td>
																<td style="width:10%">
																	{{dat.callperapi}}
																</td>
																<td style="width:10%" >
																	<i class="fa fa-eye" aria-hidden="true" ng-click="viewMore(dat)" ng-show="dat.tier.length > 0" style="cursor: pointer;"></i>
																</td>
																
															</tr>
														</tbody>
													</table>
												</div>
											</li>
											<div class="clearfix"></div>	
										</ul>
									<div class="clearfix"></div>	
					
									<div class="dets_Tab_main marginTop20">
										<ul class="list-unstyled tabsoF_details margin0 funcTabz">
											<li ng-class="(tabsGrpfn == 'user_group')?'active':''"><a ng-click="tabsGrpfn = 'user_group'"><%=lblFun.get("FUN_SET").get("FUN_GROUP")%></a></li>
											<li ng-class="(tabsGrpfn == 'user_role')?'active':''"><a ng-click="tabsGrpfn = 'user_role'"><%=lblFun.get("FUN_SET").get("FUN_ROLE")%></a></li>
											<li ng-class="(tabsGrpfn == 'user_function')?'active':''"><a ng-click="tabsGrpfn = 'user_function'"><%=lblFun.get("FUN_SET").get("FUN_USER")%></a></li>
											<li ng-class="(tabsGrpfn == 'micro_service')?'active':''"><a ng-click="tabsGrpfn = 'micro_service'"><%=lblFun.get("FUN_SET").get("FUN_MICSERVICE")%></a></li>
											<li ng-class="(tabsGrpfn == 'pred_service')?'active':''"><a ng-click="tabsGrpfn = 'pred_service'">Predefined Function</a></li>
										</ul>
					
										<div class="clearfix"></div>
					
										<div class="funcTabz tabz_Contnt" ng-init="tabsGrpfn = 'user_group'">
											<div ng-show="tabsGrpfn == 'user_group'">
												<button class="sButton marginRight10" data-toggle="modal" data-target="#creategroup"><%=lblFun.get("FUN_SET").get("FUN_ASN_GROUP")%></button>
												<strong><%=lblFun.get("FUN_SET").get("FUN_ATT_GROUP")%> : {{fnGroups.groups.length}}</strong>
													<div class="clearfix"></div>
											
												<div class="listOf_tabsLis marginTop20">
													<ul class="list-unstyled">
														<li ng-repeat="fn in fnGroups.groups">
															<img src="resources/org/images/group_list.png"/> 
															<span>{{fn.value}}</span>
															<i class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deleteGrpFn" data-id="{{fn.id}}"></i>
														</li>
													</ul>
												</div>
											</div>
											
											<div ng-show="tabsGrpfn == 'user_role'">
												<button class="sButton marginRight10" data-toggle="modal" data-target="#createrole"><%=lblFun.get("FUN_SET").get("FUN_ASN_ROLE")%></button>
												<strong><%=lblFun.get("FUN_SET").get("FUN_ATT_ROLE")%> : {{fnGroups.roles.length}}</strong>
													<div class="clearfix"></div>
											
												<div class="listOf_tabsLis marginTop20">
													<ul class="list-unstyled">
														<li class="roleTabz" ng-repeat="role in fnGroups.roles">
															<img src="resources/org/images/role_list.png"/> 
															<span>{{role.value}}</span>
															<i class="fa fa-close pull-right cursor delePopId" data-toggle="modal" data-target="#deleteRolFn" data-id="{{role.id}}"></i>
														</li>
													</ul>
												</div>
											</div>
											
											<div ng-show="tabsGrpfn == 'user_function'">
													<button class="sButton marginRight10" data-toggle="modal" data-target="#createuser"><%=lblFun.get("FUN_SET").get("FUN_ASN_USER")%></button>
													<strong><%=lblFun.get("FUN_SET").get("FUN_ATT_USER")%> : {{fnGroups.users | count : 'id'}}</strong>
														<div class="clearfix"></div>
												
													<div class="listOf_tabsLis marginTop20">
														<ul class="list-unstyled">
															<li class="userTabz" ng-repeat="user in fnGroups.users | unique: 'id'">
																<i class="fa fa-user sColor"></i> 
																<span>{{user.value}}</span>
																<!-- <i class="fa fa-close pull-right cursor" ng-click="removeFnUser($index)"></i> -->
															</li>
														</ul>
													</div>
											</div>
											
											<div ng-show="tabsGrpfn == 'micro_service'">
													<button class="sButton marginRight10" data-toggle="modal" data-target="#assignservice"><%=lblFun.get("FUN_SET").get("FUN_ASN_SERV")%></button>
													<strong><%=lblFun.get("FUN_SET").get("FUN_ATT_SERV")%> : {{fnGroups.microServices | count : 'id'}}</strong>
														<div class="clearfix"></div>
												
													<div class="listOf_tabsLis marginTop20">
														<ul class="list-unstyled">
															<li class="userTabz" ng-repeat="service in fnGroups.microServices | unique: 'id'">
																<i class="fa fa-snowflake-o sColor"></i> 
																<span>{{service.value}}</span>
																<i class="fa fa-close pull-right cursor deleFnMicId"  data-toggle="modal" data-target="#deleteFnMicservice" data-id="{{service.id}}"></i>
															</li>
														</ul>
													</div>
											</div>
											
											<div ng-show="tabsGrpfn == 'pred_service'">
													<button class="sButton marginRight10" data-toggle="modal" data-target="#assignservicePred"><%=lblFun.get("FUN_SET").get("FUN_ASN_SERV")%></button>
													<strong><%=lblFun.get("FUN_SET").get("FUN_ATT_SERV")%> : {{fnGroups.microServices | count : 'id'}}</strong>
														<div class="clearfix"></div>
												
													<div class="listOf_tabsLis marginTop20">
														<ul class="list-unstyled">
															<li class="userTabz" ng-repeat="service in fnGroups.microServices | unique: 'id'">
																<i class="fa fa-snowflake-o sColor"></i> 
																<span>{{service.value}}</span>
																<i class="fa fa-close pull-right cursor deleFnMicId"  data-toggle="modal" data-target="#deleteFnMicservice" data-id="{{service.id}}"></i>
															</li>
														</ul>
													</div>
											</div>
					
											<div class="clearfix"></div>
										</div>	
					
									</div>	
								</div>
															
							</div>						
						
						<div class="clearfix"></div>
					</div>
					
					<div class="tabz_Contnt " ng-show="tabsGrpup == 'apiTab'">
							
						<div ng-hide="microDetails">	 
							<button class="pButton marginTop10" data-toggle="modal" data-target="#addmicroServ" ng-click="clearField()"><%=lblMic.get("MIC_SET").get("CREATE")%></button>
							<div class="clearfix"></div>
	
							<table class="listTable marginTop20 fnTabz">
								<thead>
									<th class="width80 checkbox">
										<input id="servall_{{$index}}" type="checkbox" ng-model="allMicro" ng-click="microAll(allMicro)"/>
										<label for="servall_{{$index}}"></label>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblMic.get("MIC_SET").get("NAME")%></span>
										<span class="cursor pull-left" ng-if="advEditSpan" ng-click="editSubRow()">Edit</span>								
										<span class="cursor pull-left" ng-if="advSpan" data-toggle="modal" data-target="#deleteMicroserv"><%=lblMic.get("MIC_SET").get("DELETE")%></span>
									</th>	
									<th>
										<span style="margin-left:-4px;" ng-if="!advSpan"><%=lblMic.get("MIC_SET").get("DESC")%></span>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblMic.get("MIC_SET").get("CREATEDDATE")%></span>
									</th>
								</thead>
			
								<tbody>
									<tr class="cursor" ng-repeat="mic in microData">
										<td class="width80 padding0 checkbox">
											<input id="checkmic_{{$index}}" type="checkbox" ng-model="mic.check_bx" ng-change="microToggle()"/>
											<label for="checkmic_{{$index}}"></label>
										</td>
										<td style="width: 20%;"   ng-click="getMicroInfo(mic.id)">{{mic.name}}</td>
										<td  style="width: 55%;padding-right: 10px" class="indent0" style="width:300px;" ng-click="getMicroInfo(mic.id)">{{mic.desc}}</td>
										<td style="width: 18%;" ng-click="getMicroInfo(mic.id)">{{mic.dateUpdated}}</td>
									</tr>
									<tr ng-if="microData.length < 1">
										<td class="emptyrow" colspan="4"><%=lblFun.get("FUN_SET").get("NOT_FOUND")%></td>
									</tr>
									
								</tbody>
							</table>
						</div>	
						
						<!-- /*Micro Info*/ -->
						
						<div class="container tmenu_Body" ng-show="microDetails">
							<h1 style="width:93%;" class="pageH1"><%=lblMic.get("MIC_SET").get("MIC_DE")%>
								<div class="pull-right">
									<i class="fa fa-pencil cursor" ng-click="setMicroEdit(microEdit)" title="edit function" data-toggle="modal" data-target="#addmicroServ"></i>
								</div>
							</h1>
						<!-- 	<button class="pButton marginTop10" data-toggle="modal" data-target="#addmicroServ">edit</button> -->
								<ul class="list-unstyled ul_orgDets">
									<li>
										<label class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_NAME")%></label>		
										<span class="">{{microEdit.name}}</span>
									</li>	
									
									<li>
										<label class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_CATEGORY")%></label>		
										<span class="">{{microEdit.categoryName}}</span>
									</li>
									
									<li>
										<label ng-show="microEdit.desc" class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_DESC")%></label>		
										<span class="">{{microEdit.desc}}</span>
									</li>	
								</ul>
							<div class="clearfix"></div>	
			
							<div class="dets_Tab_main marginTop20">
								<ul class="list-unstyled funcTabz tabsoF_details margin0">
									<li class="active"><a href=""><%=lblMic.get("MIC_SET").get("MIC_FUN")%></a></li>
								</ul>
			
								<div class="clearfix"></div>
			
								<div class="tabz_Contnt funcTabz">
									<div class="row">
										<button class="sButton marginRight10" data-toggle="modal" data-target="#assignFn"><%=lblMic.get("MIC_SET").get("MIC_ASN_FN")%></button>
										<strong><%=lblMic.get("MIC_SET").get("MIC_ATT_FN")%> : {{microEdit.functions.length}}</strong>
											<div class="clearfix"></div>
									
										<div class="listOf_tabsLis marginTop20">
											<ul class="list-unstyled">
												<li ng-repeat="fn in mEditFuncc">
													<img src="resources/org/images/function_list.png"/> 
													<span>{{fn.fName}}</span>
													<i class="fa fa-close pull-right cursor deleMicFnId" data-toggle="modal" data-target="#deleteMicFn" data-id="{{fn.id}}"></i>
												</li>
											</ul>
										</div>
									</div>
									
									<div class="clearfix"></div>
								</div>	
			
							</div>	
						</div>
					</div>
					
					<!-- ---------------Predefined tab  ----------------------- -->
					
					<div class="tabz_Contnt " ng-show="tabsGrpup == 'predefined'">
							
						<div ng-hide="microDetails">	 
							<button class="pButton marginTop10" data-toggle="modal" data-target="#addmicroServPred" ng-click="clearFieldPred()"><%=lblMic.get("MIC_SET").get("ADD_PREDEFINED")%></button>
							<div class="clearfix"></div>
	
							<table class="listTable marginTop20 fnTabz">
								<thead>
									<th class="width80 checkbox">
										<input id="servall_pred{{$index}}" type="checkbox" ng-model="allMicroPred" ng-click="microAllPred(allMicroPred)"/>
										<label for="servall_pred{{$index}}"></label>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblMic.get("MIC_SET").get("NAME")%></span>
										<span class="cursor pull-left" ng-if="advEditSpan" ng-click="editSubRow()">Edit</span>								
										<span class="cursor pull-left" ng-if="advSpan" data-toggle="modal" data-target="#deleteMicroservPred"><%=lblMic.get("MIC_SET").get("DELETE")%></span>
									</th>	
									<th>
										<span style="margin-left:-4px;" ng-if="!advSpan"><%=lblMic.get("MIC_SET").get("DESC")%></span>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblMic.get("MIC_SET").get("CREATEDDATE")%></span>
									</th>
								</thead>
			
								<tbody>
									<tr class="cursor" ng-repeat="micPred in microDataPred">
										
										<td class="width80 padding0 checkbox">
											<input id="checkmic_pred{{$index}}" type="checkbox" ng-model="micPred.check_bx" ng-change="microTogglePred()"/>
											<label for="checkmic_pred{{$index}}"></label>
										</td>
										<td style="width: 20%;" ng-click="getMicroInfoPred(micPred)">{{micPred.name}}</td>
										<td  style="width: 55%;padding-right: 10px" class="indent0" style="width:300px;" ng-click="getMicroInfoPred(micPred)">{{micPred.desc}}</td>
										<td style="width: 18%;" ng-click="getMicroInfoPred(micPred)">{{customDateFormat(micPred.dateUpdated)}}</td>
									</tr>
									<tr ng-if="microDataPred.length < 1">
										<td class="emptyrow" colspan="4"><%=lblFun.get("FUN_SET").get("NOT_FOUND")%></td>
									</tr>
									
								</tbody>
							</table>
						</div>	
						
						<!-- /*Predefined Info*/ -->
						
						<div class="container tmenu_Body" ng-show="microDetails">
							<h1 style="width:93%;" class="pageH1"><%=lblMic.get("MIC_SET").get("PREDEFINED_DETAILS")%>
								<div class="pull-right">
									<i class="fa fa-pencil cursor" ng-click="setMicroEditPred(microEditPred)" title="edit function" data-toggle="modal" data-target="#addmicroServPred"></i>
								</div>
							</h1>
								<ul class="list-unstyled ul_orgDets">
									<li>
										<label class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_NAME")%></label>		
										<span class="">{{microEditPred.name}}</span>
									</li>	
									
									<li>
										<label ng-show="microEditPred.desc" class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_DESC")%></label>		
										<span class="">{{microEditPred.desc}}</span>
									</li>	
								</ul>
							<div class="clearfix"></div>	
			
							<div class="dets_Tab_main marginTop20">
								<ul class="list-unstyled funcTabz tabsoF_details margin0">
									<li class="active"><a href=""><%=lblMic.get("MIC_SET").get("MIC_FUN")%></a></li>
								</ul>
			
								<div class="clearfix"></div>
			
								<div class="tabz_Contnt funcTabz">
									<div class="row">
										<button class="sButton marginRight10" data-toggle="modal" data-target="#assignFnPred"><%=lblMic.get("MIC_SET").get("MIC_ASN_FN")%></button>
										<strong><%=lblMic.get("MIC_SET").get("MIC_ATT_FN")%> : {{microEditPred.functions.length}}</strong>
											<div class="clearfix"></div>
									
										<div class="listOf_tabsLis marginTop20">
											<ul class="list-unstyled">
												<li ng-repeat="fn in mEditFunccPred">
													<img src="resources/org/images/function_list.png"/> 
													<span>{{fn.fName}}</span>
													<i class="fa fa-close pull-right cursor deleMicFnIdPred" ng-click="deletePredFunction(fn.id)"></i>
												</li>
											</ul>
										</div>
									</div>
									
									<div class="clearfix"></div>
								</div>	
			
							</div>	
						</div>
					</div>
					
					
					
					
					
					<div class="tabz_Contnt " ng-show="tabsGrpup == 'discounts'">
							
						<div ng-hide="microDetails">	 
							<button class="pButton marginTop10" data-toggle="modal" data-target="#addDiscounts" ng-click="clearDiscount()"><%=lblFun.get("FUN_SET").get("DISCOUNT")%></button>
							<div class="clearfix"></div>
	
							<table class="listTable marginTop20 fnTabz">
								<thead>
									<th class="width80 checkbox">
										<input id="all_{{$index}}" type="checkbox" ng-model="allDiscount" ng-click="distoggleAll(allDiscount)"/>
										<label for="all_{{$index}}"></label>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("NAME_DISCOUNT")%></span>
										<span class="cursor pull-left" ng-if="advSpan" data-toggle="modal" data-target="#deleteDiscount"><%=lblFun.get("FUN_SET").get("DELETE_DISCOUNT")%></span>
									</th>	
									<th>
										<span style="margin-left:-4px;" ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("DIS_DISCOUNT")%></span>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("START_DATE")%></span>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("END_DATE")%></span>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("DIS_DETAILS")%></span>
									</th>
								</thead>
			
								<tbody>
									<tr class="cursor" ng-repeat="disc in discountList">
										<td class="width80 padding0 checkbox">
											<input id="checkdis_{{$index}}" type="checkbox" ng-model="disc.check_bx" ng-change="discountToggle(disc.check_bx)"/>
											<label for="checkdis_{{$index}}"></label>
										</td>
										<td style="width: 20%;"   ng-click="getDiscountInfo(disc)">{{disc.name}}</td>
										<td  style="width: 15%;padding-right: 10px"  ng-click="getDiscountInfo(disc)" class="indent0">{{disc.discount}}</td>
										<td style="width: 20%;" ng-click="getDiscountInfo(disc)">{{disc.sdate}}</td>
										<td style="width: 20%;" ng-click="getDiscountInfo(disc)">{{disc.edate}}</td>
										<td style="width: 20%;" ng-click="viewDiscountDetails(disc)" ><span style="text-decoration: underline;">click here</span></td>

									</tr>
									<tr ng-if="discountList.length < 1">
										<td class="emptyrow" colspan="6"><%=lblFun.get("FUN_SET").get("NOT_FOUND")%></td>
									</tr>
									
								</tbody>
							</table>
						</div>	
						
						<!-- /*Discounts Info*/ -->
						
						<div class="container tmenu_Body" ng-show="microDetails">
							<h1 style="width:93%;" class="pageH1"><%=lblMic.get("MIC_SET").get("MIC_DE")%>
								<div class="pull-right">
									<i class="fa fa-pencil cursor" ng-click="setMicroEdit(microEdit)" title="edit function" data-toggle="modal" data-target="#addmicroServ"></i>
								</div>
							</h1>
						<!-- 	<button class="pButton marginTop10" data-toggle="modal" data-target="#addmicroServ">edit</button> -->
								<ul class="list-unstyled ul_orgDets">
									<li>
										<label class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_NAME")%></label>		
										<span class="">{{microEdit.name}}</span>
									</li>	
									
									<li>
										<label class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_CATEGORY")%></label>		
										<span class="">{{microEdit.categoryName}}</span>
									</li>
									
									<li>
										<label ng-show="microEdit.desc" class="col-sm-2 textRight"><%=lblMic.get("MIC_SET").get("MIC_DESC")%></label>		
										<span class="">{{microEdit.desc}}</span>
									</li>	
								</ul>
							<div class="clearfix"></div>	
			
							<div class="dets_Tab_main marginTop20">
								<ul class="list-unstyled funcTabz tabsoF_details margin0">
									<li class="active"><a href=""><%=lblMic.get("MIC_SET").get("MIC_FUN")%></a></li>
								</ul>
			
								<div class="clearfix"></div>
			
								<div class="tabz_Contnt funcTabz">
									<div class="row">
										<button class="sButton marginRight10" data-toggle="modal" data-target="#assignFn"><%=lblMic.get("MIC_SET").get("MIC_ASN_FN")%></button>
										<strong><%=lblMic.get("MIC_SET").get("MIC_ATT_FN")%> : {{microEdit.functions.length}}</strong>
											<div class="clearfix"></div>
									
										<div class="listOf_tabsLis marginTop20">
											<ul class="list-unstyled">
												<li ng-repeat="fn in mEditFuncc">
													<img src="resources/org/images/function_list.png"/> 
													<span>{{fn.fName}}</span>
													<i class="fa fa-close pull-right cursor deleMicFnId" data-toggle="modal" data-target="#deleteMicFn" data-id="{{fn.id}}"></i>
												</li>
											</ul>
										</div>
									</div>
									
									<div class="clearfix"></div>
								</div>	
			
							</div>	
						</div>
					</div>
					
				</div>	
				
		<!-- ADD MICROSERVICE MODAL -->
			<div id="addmicroServ" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <form class="modal-content" name="microFrm" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="clearMicForm(microInfo.id)"></i>
			    	<h1 class="pageH1 pColor">
			    		<span ng-if="microInfo.id != ''"><%=lblMic.get("MIC_SET").get("ADD_UPDATE")%></span>
			    		<span ng-if="microInfo.id == '' || microInfo.id == undefined"><%=lblMic.get("MIC_SET").get("ADD_CREATE")%></span>
			    	 <%=lblMic.get("MIC_SET").get("ADD_TITLE")%></h1>
			    	
			    	<div class="clearfix"></div>
					
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_NAME")%></label>
			    		</div>	
			    		<div class="formInput  col-sm-7">
			    			<input type="text" ng-model="microInfo.name" name="funName" required/>
			    			<input type="hidden" ng-model="microInfo.id"/>
			    			<i class="fa fa-close errClose" ng-show="funFormValidate && !microInfo.name"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_CATEGORY")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="microInfo.category">
			    				<option ng-repeat="val in categTypes" value="{{val.id}}"> {{val.value}}</option>	
			    			</select>
			    			<i class="fa fa-close errClose" ng-show="funFormValidate && !microInfo.category"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_DESC")%></label>
			    		</div>	
			    		<div class="formInput  col-sm-7">
			    			<textarea type="text" ng-model="microInfo.desc"></textarea>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_FUN")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdMicroFunctn">
			    				<option ng-repeat="val in functionDatas | filter:{typeId:'102'}" value="{{val.id}}" ng-disabled="disableMicroFn(microInfo.id, val.id)"> {{val.funName}}</option>	
			    			</select>	
							<!-- <a ng-click="" href="">add more function..</a> -->
							
							
			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li class="micFunImg" ng-repeat="fn in microFuncc" class="relative padding0"> 
			    					<img src="resources/org/images/function_list.png">
			    					<select class="noBorder" ng-model="fn.fId" disabled="true">
			    						<option ng-repeat="val in functionDatas| filter:{typeId:'102'}" value="{{val.id}}"> {{val.funName}}</option>
			    					</select>
			    					<!-- <i class="fa fa-close pull-right cursor delePopId" ng-click="removeMicFunction($index,fn)"></i> -->
			    				</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addMicroFunction(selectdMicroFunctn)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	<div class="formGroups marginTop20">
			    		<div class="formInput  col-sm-offset-2 col-sm-9">
			    			<label class="marginTop10 error_css" ng-if="errorShow">{{errMessage}}</label>
			    			<label class="marginTop10 success_css" ng-if="sucsMsg">
			    				{{successMsg}}
			    			</label>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
			    			<button class="pButton pull-right"  ng-click="addMicroService()"><%=lblMic.get("MIC_SET").get("MIC_SAVE")%></button>
			    			<button class="btn btn-default uButton pull-right marginRight10" data-dismiss="modal" ng-click="clearMicForm(microInfo.id)"><%=lblMic.get("MIC_SET").get("MIC_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>
			  </div>
			</div>
			<!-- END ADD GROUP MODAL -->
			
			
		<!-- ADD PREDEFINED MODAL -->
			<div id="addmicroServPred" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <form class="modal-content" name="microFrmPred" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="clearMicFormPred(microInfoPred.id)"></i>
			    	<h1 class="pageH1 pColor">
			    		<span ng-if="microInfoPred.id != ''"></span>
			    		<span ng-if="microInfoPred.id == '' || microInfoPred.id == undefined"></span>
			    	 <%=lblMic.get("MIC_SET").get("ADD_PREDEFINED_GROUP")%></h1>
			    	
			    	<div class="clearfix"></div>
					
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_NAME")%></label>
			    		</div>	
			    		<div class="formInput  col-sm-7">
			    			<input type="text" ng-model="microInfoPred.name" name="fName" required/>
			    			<input type="hidden" ng-model="microInfoPred.id"/>
			    			<i class="fa fa-close errClose" ng-show="funFormValidate && !microInfoPred.name"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_DESC")%></label>
			    		</div>	
			    		<div class="formInput  col-sm-7">
			    			<textarea type="text" ng-model="microInfoPred.desc"></textarea>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblMic.get("MIC_SET").get("ADD_FUN")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdMicroFunctnPred">
			    				<option ng-repeat="valPred in functionDatasPred | filter:{typeId:'102'}" value="{{valPred.id}}" ng-disabled="disableUserPredefined(valPred.funName)"> {{valPred.funName}}</option>	
			    			</select>	
							<!-- <a ng-click="" href="">add more function..</a> -->
							
							
			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="fn in mEditFunccPred">
									<img src="resources/org/images/function_list.png"/> 
									<span>{{fn.fName}}</span>
									<!-- <i class="fa fa-close pull-right cursor deleMicFnId" data-toggle="modal" data-target="#deleteMicFn" data-id="{{fn.id}}"></i> -->
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addPredefinedFunction(selectdMicroFunctnPred, functionDatasPred)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	<div class="formGroups marginTop20">
			    		<div class="formInput  col-sm-offset-2 col-sm-9">
			    			<label class="marginTop10 success_css" ng-if="sucsMsg">{{successMsg}}</label>
			    			<label class="marginTop10 error_css" ng-if="errorShow">{{errMessage}}</label>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
			    			<button class="pButton pull-right"  ng-click="addMicroServicePred()"><%=lblMic.get("MIC_SET").get("MIC_SAVE")%></button>
			    			<button class="btn btn-default uButton pull-right marginRight10" data-dismiss="modal" ng-click="clearMicFormPred(microInfoPred.id)"><%=lblMic.get("MIC_SET").get("MIC_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>
			  </div>
			</div>
		
		
			

		
		
		<!-- ADD DISCOUNTS MODAL -->
			<div id="addDiscounts" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <form class="modal-content" name="discountFrm" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="clearMicForm(microInfo.id)"></i>
			    	<h1 class="pageH1 pColor">
			    		<span ng-if="dis.id != ''"><%=lblFun.get("FUN_SET").get("ADD_UPDATE")%></span>
			    		<span ng-if="dis.id == '' || dis.id == undefined"><%=lblFun.get("FUN_SET").get("ADD_AD")%></span>
			    	 <%=lblFun.get("FUN_SET").get("DIS")%></h1>
			    	
			    	<div class="clearfix"></div>
					
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("AD_NAME")%></label>
			    		</div>	
			    		<div class="formInput  col-sm-7">
			    			<input type="text" ng-model="dis.name" name="funName" required/>
			    			<input type="hidden" ng-model="dis.id" ng-init="dis.id=0"/>
			    			<i class="fa fa-close errClose" ng-show="disFormValidate && !dis.name"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("DIS_CNT")%></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
			    			<input type="text"  ng-model="dis.discount" numbers-only/>
			    			<i class="fa fa-close errClose" ng-show="disFormValidate && !dis.discount"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("STRT_DAT")%></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
			    			<input type="text" id="startdate" ng-model="dis.sdate" ng-init="dis.sdate=''"/>
			    			<i class="fa fa-calendar" onclick="document.getElementById('startdate').focus()" style="position: absolute;top: 12px; right: 20px;"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("END_DAT")%></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
			    			<input type="text" id="enddate" ng-model="dis.edate" ng-init="dis.edate=''"/>
			    			<i class="fa fa-calendar" onclick="document.getElementById('enddate').focus()" style="position: absolute;top: 12px; right: 20px;"></i>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("AD_ORG")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select  multiple="multiple"  id="orgs" ng-model="dis.orgs">
                                <option value="{{org.id}}" ng-repeat="org in orgs">{{org.name}}</option>
                            </select>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("AD_USR")%></label>
			    		</div>	
			    		<div class="formInput formSelect  col-sm-7">
			    			<select  multiple="multiple"  id="users" ng-model="dis.users">
                                <option value="{{usr.id}}" ng-repeat="usr in users">{{usr.name}}</option>
                            </select>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
					<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("MICRO_SER")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select  multiple="multiple"  id="micros" ng-model="dis.micros">
                                <option value="{{micr.id}}" ng-repeat="micr in micros">{{micr.name}}</option>
                            </select>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formInput  col-sm-offset-2 col-sm-9">
			    			<label class="marginTop10 error_css" ng-if="errorShow">{{errMessage}}</label>
			    			<label class="marginTop10 success_css" ng-if="sucsMsg">
			    				{{successMsg}}
			    			</label>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
			    			<button class="pButton pull-right"  ng-click="updateDiscounts()"><%=lblMic.get("MIC_SET").get("MIC_SAVE")%></button>
			    			<button class="btn btn-default uButton pull-right marginRight10" data-dismiss="modal" ng-click="clearDiscount()"><%=lblMic.get("MIC_SET").get("MIC_CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>
			  </div>
			</div>

		<!-- END ADD GROUP MODAL -->
			
			
			
				<!--CREATE FUNCTION MODAL -->
			<div id="createfuncnn" class="modal fade popUpId funPopp" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <form class="modal-content" name="functionForm" novalidate>
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="cancelFn(id)"></i>
			    	<h1 class="pageH1 pColor">
			    		<span ng-hide = "id == undefined || id == ''"><%=lblFun.get("FUN_SET").get("ADD_FUN_UPADTE")%></span>
			    		<span ng-show = "id == undefined || id == ''"><%=lblFun.get("FUN_SET").get("ADD_FUN_CREATE")%></span>
			    	
			    	<%=lblFun.get("FUN_SET").get("ADD_FUN")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_NAME")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="name" name="name">
			    			<input  type="hidden" ng-model="id" name="id">
			    			<i class="fa fa-close errClose" ng-show="formValidate && !name"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_CODE")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="code" name="code">
			    			<i class="fa fa-close errClose" ng-show="formValidate && !code"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_TYPE")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-8">
			    			<select ng-model="type" name="type">
			    				<option value="{{ftype.id}}" ng-repeat="ftype in functionTypes"> {{ftype.value}}</option>	
			    			</select>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !type"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_DESC1")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<textarea ng-model="descrpition1" name="descrpition1"></textarea>
			    			<i class="fa fa-close errClose" ng-show="formValidate && !descrpition1"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_DESC2")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<textarea ng-model="descrpition2" name="descrpition2"></textarea>
			    			<i class="fa fa-close errClose" ng-show="functionForm.descrpition2.$dirty && functionForm.descrpition2.$invalid"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("API_END")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<textarea ng-model="apiendpoint" name="apiendpoint"></textarea>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_ICON")%></label>
			    		</div>	
			    		<div class="formInput formUpload relative col-sm-8">
			    			<div class="relative formUpload" ng-hide="iconURL || iconFiles">
								<div class="dragDrpBx" ngf-drop="" ng-model="iconFiles" ngf-accept="'image/*'">
									<p><a class="cursor" ngf-select="" ng-model="iconFiles" name="file" ngf-accept="'image/*'"><%=lblFun.get("FUN_SET").get("ADD_UPLOAD_TXT")%></a></p>
								</div>
							</div>
							<ul class="marginTop10 list-unstyled filePrevw" ng-show="iconFiles">
							 	<li class="pull-left">
							 		<img ngf-src="iconFiles" class="thumb"/>
							 		<i class="fa fa-close remFilePre" ng-click="iconFiles = ''"></i>
							 	</li>
							 </ul>
							 <ul class="marginTop10 list-unstyled filePrevw" ng-show="iconURL">
							 	<li class="pull-left">
							 		<img src="{{iconUrl}}" class="thumb"/>
							 		<i class="fa fa-close remFilePre" ng-click="iconURL=''"></i>
							 	</li>
							 </ul>
						</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_SOURCE")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="source" name="sourceUrl" chip-url>
			    			<i class="fa fa-close errClose" ng-show="functionForm.sourceUrl.$dirty && functionForm.sourceUrl.$invalid"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_DOC_URL")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="docUrl" name="docUrl" http-prefix>
			    			<i class="fa fa-close errClose" ng-show="functionForm.docUrl.$dirty && functionForm.docUrl.$invalid"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label><%=lblFun.get("FUN_SET").get("ADD_TERM_URL")%></label>
			    		</div>	
			    		<div class="formInput col-sm-8">
			    			<input ng-model="termUrl" name="termUrl" http-prefix>
			    			<i class="fa fa-close errClose" ng-show="functionForm.termUrl.$dirty && functionForm.termUrl.$invalid"></i>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    		
			    		    	
			    	<div class="formGroups marginTop20">
						<div class="listOf_tabsLis inUsList col-sm-11">
							<p data-toggle="collapse" data-target="#add_featr">
								<%=lblFun.get("FUN_SET").get("ADD_ADD_FEA")%>
							</p>
							
							<div class="list-unstyled panel-collapse collapse in" id="add_featr">
								<div class="popTable padding0">
									<table class="tableP">
										<thead>
											<th style="width:90%">
												<span><%=lblFun.get("FUN_SET").get("ADD_FE_TEXT")%></span>
												<input type="text" ng-model="featurTxt">
											</th>											
											<th>
												<button class="btn btn-default uButton addLanBtn" ng-disabled="!featurTxt" ng-click="addfeaturTxt()">+</button>
											</th>
										</thead>
										
										<tbody>
											<tr ng-repeat="dat in tempFeat">
												<td>
													<span><%=lblFun.get("FUN_SET").get("ADD_FE_TEXT")%></span>
													<input type="text" ng-model="dat.title" readonly>
												</td>
												<td>
													<button style="margin-left:6px;" class="uButton addLanBtn" ng-click="removeFeatur($index,dat)"><i class="fa fa-close"></i></button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>	
						<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
						<div class="listOf_tabsLis inUsList col-sm-11">
							<p data-toggle="collapse" data-target="#add_imags">
								<%=lblFun.get("FUN_SET").get("ADD_ADD_IMG")%>
							</p>
							
							<div class="list-unstyled panel-collapse collapse in" id="add_imags">
								<div class="formGroups marginTop20">
					    			<div class="relative formUpload">
										<!-- <input id="fileIps" type="file" ngf-select="" ng-model="files" multiple="true" name="file" ngf-accept="'image/*'" required="">
										<label class="btn btn-default" for="fileIps">upload</label> -->
										<div class="dragDrpBx" ngf-drop="" ng-model="files" multiple="true"  ngf-accept="'image/*'">
											<p><a class="cursor" ngf-select="" ng-model="files" multiple="true" name="file" ngf-accept="'image/*'"><%=lblFun.get("FUN_SET").get("ADD_UPLOAD_TXT")%></a></p>
										</div>
									</div>
									
									 <ul class="marginTop10 list-unstyled filePrevw" ng-show="files">
									 	<li class="pull-left" ng-repeat="file in files">
									 		<img ngf-src="file" class="thumb"/>
									 		<i class="fa fa-close remFilePre" ng-click="removePrvw()"></i>
									 	</li>
									 </ul>		
									 				
									 <ul class="marginTop10 list-unstyled filePrevw" >
									 	<li class="pull-left" ng-repeat="img in trmpImages">
									 		<img src="{{img.imgUrl}}" class="thumb"/>
									 		<i class="fa fa-close remFilePre" ng-click="removeImage(img)"></i>
									 	</li>
									 </ul>		
									 
									 <label class="marginTop10 error_css" ng-if="files.length + trmpImages.length > 10"><%=errFun.get("FUN_ERR").get("ADD_FILE")%></label>						
								</div>
							</div>
						</div>	
						<div class="clearfix"></div>
			    	</div>
			    	
			    	
			    	<div class="formGroups marginTop20">
						<div class="listOf_tabsLis inUsList col-sm-11">
							<p data-toggle="collapse" data-target="#add_pricin">
								<%=lblFun.get("FUN_SET").get("ADD_ADD_PRICE")%> Plan
							</p>
							
							<div class="list-unstyled panel-collapse collapse in" id="add_pricin">
								<div class="popTable">
									<table class="tableP">
										<thead>
											<tr >	
												<th style="width:30%">
													<span><%=lblFun.get("FUN_SET").get("ADD_PR_PLAN")%></span>
													<textarea type="text" ng-model="pricinPlan" style="width: 100%"></textarea><br><br>
													
													<span><%=lblFun.get("FUN_SET").get("ADD_PR_PRICE")%></span>
													<input type="text" ng-model="pricinValue" >
												</th>
												<th style="width:30%">
													<span><%=lblFun.get("FUN_SET").get("ADD_PR_FE")%></span>
													<textarea type="text" ng-model="pricingFeature" style="width: 100%"></textarea><br><br>
													
													<span><%=lblFun.get("FUN_SET").get("ADD_ADD_NOCALL")%></span>
													<input type="text" ng-model="pricinNoacall" numbers-only>
												</th>
												<th style="width:30%">
													<span><%=lblFun.get("FUN_SET").get("ADD_PR_DESC")%></span>
													<textarea type="text" ng-model="pricingDescription" style="width: 100%"></textarea><br><br>
													
													<span><%=lblFun.get("FUN_SET").get("ADD_PR_COST_PCALL")%></span>
													<input type="text" ng-model="pricingCpcall" numbers-only>
												</th>
		
											</tr>
											<!-- <th>
												<button class="btn btn-default uButton addLanBtn" ng-disabled="!pricinPlan || !pricingFeature || !pricinValue || !pricinNoacall || !pricingCpcall" 
												ng-click="addTempPricing()">+</button>
											</th> -->
											
											<tr>
												<th colspan="3" style="background-color: #fff; border: 1px solid #a4c158;">
												<br/>
													<label><%=lblFun.get("FUN_SET").get("TIERSS")%></label>
													<table class="tableP">
														<thead>
															<tr>
																<th style="width:30%">
																	<span><%=lblFun.get("FUN_SET").get("LOWER_LIM")%></span>
																	<input type="text" ng-model="lower" numbers-only>
																</th>
																<th style="width:30%">
																	<span><%=lblFun.get("FUN_SET").get("UPPER_LIM")%></span>
																	<input type="text" ng-model="upper" numbers-only>
																</th>
																<th style="width:30%">
																	<span><%=lblFun.get("FUN_SET").get("COST_PER_API")%></span>
																	<input type="text" ng-model="cost" numbers-only>
																</th>
																<th>
																	<button class="btn btn-default uButton addLanBtn" ng-disabled="!lower || !cost " ng-click="addTier()">+</button>
																</th>
															</tr>
														</thead>
														<tr ng-repeat="tier in pricringTierList" style="background-color: #a4c158; color:#fff;">
															<td style="width:30%">{{tier.lower}}</td>
															<td style="width:30%">{{tier.upper}}</td>
															<td style="width:30%">{{tier.cost}}</td>
															<td class="aligncenter" style="color:#bc0000">
											                  <i class="fa fa-trash act_icon aligncenter" aria-hidden="true" ng-click="deleteTier($index)"></i>
										                  	</td>
														</tr>
													</table>
													<div style="padding:10px; ">
													<button class="btn btn-default uButton addLanBtn" ng-disabled="!pricinPlan || !pricingFeature || !pricinValue || !pricinNoacall || !pricingCpcall" 
												ng-click="addTempPricing()" style="font-size:12px;font-weight: none !important; color: #FFFFFF !important; background-color: #a4c158"><%=lblFun.get("FUN_SET").get("ADD_PLAN")%></button></div>
												</th>
											</tr>
											
										</thead>
										
										<tbody>
											<tr ng-repeat="dat in tempPriceing" style="border-bottom: 1px solid #eaeaea;">
											
												<td>
													<textarea type="text" ng-model="dat.plan" style="width: 100%"></textarea>
													<input type="text" ng-model="dat.price"  style="margin-top: 2px;">
												</td>
												<td>
													<textarea type="text" ng-model="dat.feature" style="width: 100%"></textarea>
													<input type="text" ng-model="dat.noofcall" numbers-only style="margin-top: 2px;">
												</td>
												<td>
													<textarea type="text" ng-model="dat.desc" style="width: 100%"></textarea>
													<input type="text" ng-model="dat.callperapi" numbers-only style="margin-top: 2px;">
												</td>
												
												<td>
													<button style="margin-left:6px;margin-top:0px;" class="uButton addLanBtn" ng-click="removePricing($index,dat)"><i class="fa fa-close"></i></button>
												</td>
												
											</tr>
										</tbody>
									</table>
									
								</div>
							</div>
						</div>	
						<div class="clearfix"></div>
			    	</div>
			    	
			    	
			    	
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-2">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-7">
				    		<div ng-show="formValidate">
				    			<label class="marginTop10 error_css" ng-hide="files.length + trmpImages.length < 11">
				    				<%=errFun.get("FUN_ERR").get("ADD_IMG")%>
				    			</label>
				    		</div>	
			    			<label class="marginTop10 success_css" ng-if="sucsMsg">
			    				{{successMsg}}
			    			</label>
			    			<label class="marginTop10 error_css" ng-show="errorFunction">
			    			<%=lblFun.get("FUN_SET").get("FUN_TIT_CODE")%>
			    			</label>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>
			    	
			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput  col-sm-offset-5 col-sm-4" style="text-align: center;">
			    			<button class="btn btn-default uButton" data-dismiss="modal" ng-click="cancelFn(id)"><%=lblFun.get("FUN_SET").get("ADD_CANCEL")%></button>
			    			<button style="padding-right: 20px;" class="pButton marginLeft10" ng-click="addFunction()"><%=lblFun.get("FUN_SET").get("ADD_CREATE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </form>

			  </div>
			</div>
		<!--END CREATE USER MODAL -->	
		
				
											<!-- VIEW DISCOUNTS DETAILS -->
			<div id="viewDiscounts" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=lblFun.get("FUN_SET").get("DISCOUNT_DETAILS")%></h1>
			    		<div class="formInput col-sm-12">
			    	
			    		<table class="detailTable marginTop20 fnTabz">
								<thead>
									
									<th>
										<span ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("FUN_ORG")%></span>
										<span class="cursor pull-left" ng-if="advSpan" data-toggle="modal" data-target="#deleteDiscount"><%=lblFun.get("FUN_SET").get("FUN_DLT")%></span>
									</th>	
									<th>
										<span style="margin-left:-4px;" ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("FUN_USERS")%></span>
									</th>
									<th>
										<span ng-if="!advSpan"><%=lblFun.get("FUN_SET").get("MICROSERVICES")%></span>
									</th>
									
								</thead>
			
								<tbody>
									<tr class="cursor">
										<td style="width: 20%;vertical-align:top" >
											<ul class="selectdPoLst list-unstyled margin0">
							    				<li ng-repeat="org in tempOrgs" style="border: none !important"> 
							    					<span>{{getOrg(org,'O')}}</span>
							    					<!-- <i class="fa fa-close pull-right"></i> -->
							    				</li>
							    			</ul>
										</td>
										<td style="width: 20%;vertical-align:top" >
											<ul class="selectdPoLst list-unstyled margin0">
							    				<li ng-repeat="usr in tempUsers" style="border: none !important"> 
							    					<span>{{getOrg(usr,'U')}}</span>
							    				</li>
							    			</ul>
										</td>
										<td style="width: 20%;vertical-align:top" >
											<ul class="selectdPoLst list-unstyled margin0">
							    				<li ng-repeat="mic in tempMicros" style="border: none !important"> 
							    					<span>{{getOrg(mic,'M')}}</span>
							    				</li>
							    			</ul>
										</td>

									</tr>
									<tr ng-if="tempOrgs.length < 1 && tempUsers.length < 1 && tempMicros.length<1">
										<td class="emptyrow" colspan="6" align="center"><%=lblFun.get("FUN_SET").get("NOT_FOUND")%></td>
									</tr>
									
								</tbody>
							</table>
							</div>	
			    		
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
											<!-- DELETE ROLE MODAL -->
			<div id="deleUssr" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteFunctn()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
		
					
			<!-- DELETE Fun MODAL -->
			<div id="deleteMicFn" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteMicFun()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
			
			<!-- DELETE Fun MODAL Predefined-->
			<div id="deleteMicFnPred" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteMicFunPred()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
			
											<!-- DELETE Fun MODAL -->
			<div id="deleteMicroserv" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleMicroService()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>
			
			<!-- DELETE Fun MODAL Predefined-->
			
			<div id="deleteMicroservPred" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleMicroServicePred()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>
			
				
											<!-- DELETE Fun MODAL -->
			<div id="deleteDiscount" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteDiscounts()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
			
											<!-- DELETE MICROSEERVIC FUN MODAL -->
			<div id="deleteFnMicservice" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="deleteFunMicservice()"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	


											<!-- DELETE GROUP IN FUNCTN MODAL -->
			<div id="deleteGrpFn" class="modal fade popUpId" role="dialog">
			  	<div class="modal-dialog">			  	
			    <!-- Modal content-->
			    	<div class="modal-content">
			    		<i class="fa fa-close closPo" data-dismiss="modal"></i>
			    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
			    		<div class="formInput col-sm-12">
			    			<button class=" pull-right pButton marginLeft10" ng-click="removeFnGroup(deleteMe)"><%=errAll.get("PLAT_ERR").get("YES")%></button>
			    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
					</div>
				</div>
			</div>	
		
						<!-- DELETE ROLE MODAL -->
		<div id="deleteRolFn" class="modal fade popUpId" role="dialog">
		  	<div class="modal-dialog">			  	
		    <!-- Modal content-->
		    	<div class="modal-content">
		    		<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninUser = ''"></i>
		    		<h1 class="pageH1"><%=errAll.get("PLAT_ERR").get("CONFIRM")%></h1>
			    		
			    		<p><%=errAll.get("PLAT_ERR").get("MESSAGE")%></p>
		    		<div class="formInput col-sm-12">
		    			<button class=" pull-right pButton marginLeft10" ng-click="removeFnRole(deleteMe)"><%=errAll.get("PLAT_ERR").get("YES")%></button>
		    			<button class="btn btn-default pull-right uButton" data-dismiss="modal"><%=errAll.get("PLAT_ERR").get("CANCEL")%></button>
		    		</div>	
		    		<div class="clearfix"></div>
				</div>
			</div>	
		</div>	
		
					<!-- ADD GROUP MODAL -->
			<div id="creategroup" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectedGroupModel = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblFun.get("FUN_SET").get("FUN_ADD_GRP")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblFun.get("FUN_SET").get("FUN_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectedGroupModel">
			    				<option ng-repeat="val in groupOptions" value="{{val.id}}" ng-disabled="disableGroup(val.grpName)"> {{val.grpName}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="fn in fnGroups.groups"> 
			    					<img src="resources/org/images/group_list.png">
			    					<span>{{fn.value}}</span>
			    					<!-- <i class="fa fa-close pull-right"></i> -->
			    				</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addToGroupList(selectedGroupModel)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pButton pull-right" data-dismiss="modal" ng-click="selectedGroupModel = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD GROUP MODAL -->
		
		<!-- ADD ROLE MODAL -->
			<div id="createrole" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectedroleModel = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblFun.get("FUN_SET").get("FUN_ADD_ROLE")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblFun.get("FUN_SET").get("FUN_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectedroleModel">
			    				<option ng-repeat="role in fnRoles" value="{{role.id}}" ng-disabled="disableRole(role.roleName)">{{role.roleName}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="role in fnGroups.roles">
			    					<img src="resources/org/images/role_list.png"/> 
									<span>{{role.value}}</span>
			    				</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addToRoleList(selectedroleModel)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pull-right pButton" data-dismiss="modal" ng-click="selectedroleModel = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD ROLE MODAL -->

		
			<!-- ADD ROLE MODAL -->
			<div id="createuser" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdUsrinFn = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblFun.get("FUN_SET").get("FUN_ADD_USER")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblFun.get("FUN_SET").get("FUN_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdUsrinFn">
			    				<option ng-repeat="usr in UserDatas" value="{{usr.id}}" ng-disabled="disableUserinFn(usr.userName)"> {{usr.userName}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li class="userTabz" ng-repeat="user in fnGroups.users | unique: 'id'">
									<i class="fa fa-user sColor"></i> 
									<span>{{user.value}}</span>
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="addUsrtoFunc(selectdUsrinFn)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pull-right pButton" data-dismiss="modal" ng-click="selectdUsrinFn = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD USER MODAL -->
		
		<!-- ADD MICROSERVICE FUNCTN MODAL -->
			<div id="assignservice" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdserviceinFn = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblFun.get("FUN_SET").get("FUN_ADD_SERV")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblFun.get("FUN_SET").get("FUN_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdserviceinFn">
			    				<option ng-repeat="data in microData" value="{{data.id}}" ng-disabled="disableUser(data.name)"> {{data.name}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li class="userTabz" ng-repeat="service in fnGroups.microServices | unique: 'id'">
									<i class="fa fa-snowflake-o sColor marginRight10"></i> 
									<span>{{service.value}}</span>
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="assignMicFunction(selectdserviceinFn,fnGroups.id,'ms')"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pull-right pButton" data-dismiss="modal" ng-click="selectdUsrinFn = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>
			
			
			<!-- ADD PREDEFINED FUNCTN MODAL -->
			<div id="assignservicePred" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdserviceinFnPred = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblFun.get("FUN_SET").get("FUN_ADD_SERV")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblFun.get("FUN_SET").get("FUN_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdserviceinFn">
			    				<option ng-repeat="data in microDataPred" value="{{data.id}}" ng-disabled="disableUserPredefined(data.name)"> {{data.name}}</option>
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li class="userTabz" ng-repeat="service in fnGroups.microServices | unique: 'id'">
									<i class="fa fa-snowflake-o sColor marginRight10"></i> 
									<span>{{service.value}}</span>
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="assignMicFunctionPred(selectdserviceinFnPred,fnGroups.id)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pull-right pButton" data-dismiss="modal" ng-click="selectdUsrinFnPred = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD USER MODAL -->
		
	<!-- EDIT FUNCTION IN MICROSERVICES MODAL -->
			<div id="assignFn" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninMic = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblMic.get("MIC_SET").get("MIC_ADD_FN")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblMic.get("MIC_SET").get("MIC_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdFninMic">
			    				<option ng-repeat="val in functionDatas| filter:{typeId:'102'}" value="{{val.id}}" ng-disabled="disableAssigndFn(val.id)"> {{val.funName}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="fn in mEditFuncc">
									<img src="resources/org/images/function_list.png"/> 
									<span>{{fn.fName}}</span>
									<!-- <i class="fa fa-close pull-right cursor deleMicFnId" data-toggle="modal" data-target="#deleteMicFn" data-id="{{fn.id}}"></i> -->
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="assignMicFunction(microEdit.id,selectdFninMic,'fn')"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pull-right pButton" data-dismiss="modal" ng-click="selectdFninMic = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>

		<!-- END ADD USER MODAL -->


		<!-- EDIT FUNCTION IN PREDEFINED MODAL -->
			<div id="assignFnPred" class="modal fade popUpId" role="dialog">
			  <div class="modal-dialog">			  	
			    <!-- Modal content-->
			    <div class="modal-content">
			    	<i class="fa fa-close closPo" data-dismiss="modal" ng-click="selectdFninMicPred = ''"></i>
			    	<h1 class="pageH1 pColor"><%=lblMic.get("MIC_SET").get("MIC_ADD_FN")%></h1>
			    	
			    	<div class="clearfix"></div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-4">
			    			<label><%=lblMic.get("MIC_SET").get("MIC_SELECT")%></label>
			    		</div>	
			    		<div class="formInput formSelect col-sm-7">
			    			<select ng-model="selectdFninMicPred">
			    				<option ng-repeat="valPred in functionDatasPred| filter:{typeId:'102'}" value="{{valPred.id}}" ng-disabled="disableAssigndFnPred(valPred.id)"> {{valPred.funName}}</option>	
			    			</select>	

			    			<ul class="selectdPoLst list-unstyled margin0">
			    				<li ng-repeat="fn in mEditFunccPred">
									<img src="resources/org/images/function_list.png"/> 
									<span>{{fn.fName}}</span>
									<!-- <i class="fa fa-close pull-right cursor deleMicFnId" data-toggle="modal" data-target="#deleteMicFn" data-id="{{fn.id}}"></i> -->
								</li>
			    			</ul>
			    		</div>	
			    		<div class="col-sm-1">
			    			<button class="uButton" ng-click="assignMicFunctionPred(microEditPred,selectdFninMicPred)"><i class="fa fa-plus"></i></button>
			    		</div>
			    		<div class="clearfix"></div>
			    	</div>

			    	<div class="formGroups marginTop20">
			    		<div class="formLabel textRight col-sm-3">
			    			<label></label>
			    		</div>	
			    		<div class="formInput col-sm-9">
			    			<button class="pull-right pButton" data-dismiss="modal" ng-click="selectdFninMicPred = ''"><%=lblFun.get("FUN_SET").get("FUN_SET_CLOSE")%></button>
			    		</div>	
			    		<div class="clearfix"></div>
			    	</div>


			    </div>

			  </div>
			</div>




		<!-- VIEW MORE MODAL -->
		<div class="modal fade" id="showtable">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          	<h4 class="modal-title" >{{viewTiers.plan}}</h4>
		        </div>
		        <div class="modal-body" >
		           	<div class="modal-body area-modal-body">
				    	<table class="table table-striped" >
				            <thead>
			              		<tr>
					                <th scope="col"><%=lblFun.get("FUN_SET").get("TIER_LOWER")%></th>
					                <th scope="col"><%=lblFun.get("FUN_SET").get("TIER_UPPER")%></th>
					                <th scope="col"><%=lblFun.get("FUN_SET").get("TIER_COST")%></th>
				                </tr>
				            </thead>
				            <tbody>
				            	<tr ng-repeat="viewTab in viewTiers.tier">
					                <td>{{viewTab.lower}}</td>
					                <td>{{viewTab.upper}}</td>
					                <td>{{viewTab.cost}}</td>
					            </tr>
				            </tbody>
				          </table>
				        </div>  
		        </div>
		        <div class="modal-footer" style="text-align: center;">
		          	<button type="button" class="btn btn-default" data-dismiss="modal" 
		          	style="background-color: #a4c158; color: #fff"><%=lblFun.get("FUN_SET").get("TIER_CLOSE")%></button>
		        </div>
		      </div>
		    </div>
		 </div>
				
		<!-- END VIEW MORE MODAL -->
		
	</div>	
</div>




<%@include file="footer.jsp"%>
<script src="resources/org/controller/func_controller.js"></script>

 <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />
 <link href="resources/org/css/multiple-select.css" rel="stylesheet">
 <script src="resources/org/js/multiple-select.js"></script>
 <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<script>
			$(function(){
				$('[data-toggle="tooltip"]').tooltip();   
				$('#plfm').addClass('active');
				$('#orgz').removeClass('active');
				
				$('#startdate').datepicker({
					dateFormat: 'dd-mm-yy'
				});
				$('#enddate').datepicker({
					dateFormat: 'dd-mm-yy'
				});
				$('#orgs').multipleSelect({
	                width: '100%'
	            });
				$('#users').multipleSelect({
	                width: '100%'
	            });
				$('#micros').multipleSelect({
	                width: '100%'
	            });
			});	
			
		</script>