<%@ page session="true" %>
    <%@page import="java.util.*"%>
        <%@page import="java.util.Map"%>
            <%@page import="com.util.APIUtil"%>

                <%@include file="session.jsp"%>


                    <%
Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("DOC_LST"));
Map<String, Map<String, String>> labelAddErr = ((Map<String, Map<String, String>>) session.getAttribute("E_ADD_DOC"));
Map<String, Map<String, String>> labelEMap = ((Map<String, Map<String, String>>) session.getAttribute("E_DOC_LST"));
Map<String, Map<String, String>> labelAdd = ((Map<String, Map<String, String>>) session.getAttribute("ADD_DOC"));
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));


int loginOrgId = 0;

if(session.getAttribute("loginOrgId") != null)
{
	loginOrgId = (int) session.getAttribute("loginOrgId");
}


String DOC_LIST_URL = APIUtil.DOCLISTURL;
String DOC_ADD_UPDATE_URL = APIUtil.DOC_ADD_UPDATE_URL;
String DOC_INFO_URL = APIUtil.DOC_INFO_URL;
String DOC_DEL_URL = APIUtil.DOC_DEL_URL;
String DOC_KC_SEARCH_URL=APIUtil.DOC_KC_SEARCH_URL;


%>

                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <title>Sentient IO</title>
                            <meta charset="utf-8">
                            <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
                            <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
                            <meta name="viewport" content="width=device-width, initial-scale=1">
                            <link rel="stylesheet" href="resources/css/bootstrap.css">
                            <link rel="stylesheet" href="resources/css/font-awesome.min.css">
                            <link rel="stylesheet" href="resources/css/ng-tags.css" />

                            <link rel="stylesheet" href="resources/css/angular-datatables.css">
                            <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css">
                            <link rel="stylesheet" href="https://cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.min.css">
                            <link rel="stylesheet" href="resources/css/style.css">
                            <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />
							<link rel="stylesheet" href="resources/css/mob-res.css">

                            <style>
                                .checkbox label {
                                    margin-left: -10px;
                                    padding-top: 6px;
                                }
                                .checkbox label::after {
                                line-height: 2.8!important;
                                }
                                table.kBaseTable tr td {
                                    overflow: visible;
                                }
                                
                                .showLeft {
                                    margin-left: 15px;
                                }
                              
                                    h4 {
                                        margin-top: 0px;
                                        margin-bottom: 0px;
                                }
                                .tagDisable{
                                color:#5683aa;
                            	}
                                table.dataTable thead th, table.dataTable thead td {
                                        border-bottom:none!important;
                                    }
                                table.kBaseTable tbody tr td.hideColor {
                                    /* background-color: #f3f3f3 !important; */
                                }
                                .dragDrpBx p a{
                                    color:#5683aa;
                                }
                                .paddingL10{
                                    padding-left: 0px!important;
                                }
                                .formBtn1{
                                    padding: 3px;
                                }
                                #documentTable{
                                    	-webkit-box-shadow: 0px 2px 5px 0px rgba(194,188,194,1);
	-moz-box-shadow: 0px 2px 5px 0px rgba(194,188,194,1);
	box-shadow: 0px 2px 5px 0px rgba(194,188,194,1);
	/*padding: 20px;*/
	border-bottom-left-radius:5px!important;
    border-bottom-right-radius:5px!important;
                                }                               
                                /* .dataTables_wrapper{
                                    padding: 5px;
                                } */
                                .add-docAlign{
                            padding-bottom:15px;
                            border-bottom: 1px solid #e4e4e4;
                                }
                                .formLabel{
                                    padding-left:6px;        
                                                       }
                                @media print {
                                    .tooltips {
                                        display: none;
                                    }
                                }
                                table.dataTable thead th{
                                    padding: 0px 18px;

                                }
                                .dataTables_filter input[type="search"]{
                                    border-radius: 5px;
                                }
                                .dataTables_filter input{
                                    height: 40px;
                                }
                                .dataTables_filter input[type="search"]:focus{
                                    border: 1px solid #96ca4e;
                                }
#menuiconAI{
    display:none!important;
}

                            </style>



                            <script>
                                var loginOrgId = <%=loginOrgId%>;
                                var DOC_LIST_URL = "<%=DOC_LIST_URL%>";
                                var DOC_ADD_UPDATE_URL = "<%=DOC_ADD_UPDATE_URL%>";
                                var DOC_INFO_URL = "<%=DOC_INFO_URL%>";
                                var DOC_DEL_URL = "<%=DOC_DEL_URL%>";
                                var DOC_KC_SEARCH_URL = "<%=DOC_KC_SEARCH_URL%>";
                            </script>

                        </head>

                        <body ng-app="sentiApp" ng-controller="knowledgeCtrl" ng-cloak>
                            <jsp:include page="header.jsp" />
                            <div class="dashPage" ng-cloak>
                                <!-- <div class="loadr" ng-if="loaderS"> -->
                                        <div class="loading-container" ng-if="loadeer">
                                             <div class="loading">
                                               <span>Loading...</span>
                                             </div>
                                           </div>
                                </div>
                                <div class="container-fluid paddingLR30 pageTBMargin padding0 box ">
                                    <div class="titleInfo">
                                        <h4 class="dastitl  btn_bg" style="margin-top:0;">
                                            <%=labelMap.get("DOC_LST").get("D_LST_SUBTITLE")%>
                                        </h4>
                                    </div>
                                    <div class="clearfix"></div>
 
                                    <section class="tablData col-md-12 padding10"  style="display: inline-block;">
                                        <button class="btn btn-successcustom  marginTop20" ng-click="gotoSearch()">Document search</button>
                                        <span style="padding-left: 5px;"></span>
                                        <button ng-if="uAccess.KC_UPDATEDOC" class="btn btn-successcustom  marginTop20" id="creatKbase" ng-click="clearFiles()"> <%=labelMap.get("DOC_LST").get("D_LST_ADDDOC")%></button>
                                   
                                        <div class="clearfix"></div>

                                        <form class="kBaseBox marginTop10 padding0" name="formCreate" novalidate id="kBaseBox">
                                            <h4 class="marginTop10 col-sm-12" style="padding: 5px;">
                                                <%=labelAdd.get("ADD_DOC").get("D_ADD_TITLE")%>
                                            </h4>
                                            <div class="clearfix"></div>

                                            <div class="formGrp">
                                                <div class="formLabel col-sm-2">
                                                    <h3>
                                                        <%=labelAdd.get("ADD_DOC").get("D_ADD_FORMAT")%>
                                                    </h3>
                                                </div>

                                                <div class="formField col-sm-5">
                                                    <%-- <select style="width : 28%;text-indent:5px;" ng-change="createEmpRw(docFormat)" class="dropBoxed" ng-model="docFormat" ng-class="{true : 'colorAAA',false : ''}[sentFormat == undefined || sentFormat == '']">
										<option value=""><%=labelAdd.get("ADD_DOC").get("D_ADD_FORMAT_P")%></option>
                                                        <option value="{{docType.value}}" ng-repeat="docType in docTypes">{{docType.value | uppercase}}</option>
                                                        </select> --%>
                                                        <ul class="list-unstyled fileTypRadi" style="margin-bottom:0px;">
                                                            <input type="hidden" name="formdata" ng-model="formdata" id="formdata" />
                                                            <li><input type="radio" name="formatType" value="document" ng-model="uploadType" ng-change="createEmpRw(uploadType)"><span><%=labelAdd.get("ADD_DOC").get("ADD_DOCUMET")%></span></li>
                                                            <li><input type="radio" name="formatType" value="website" ng-model="uploadType" ng-change="createEmpRw(uploadType)"><span><%=labelAdd.get("ADD_DOC").get("ADD_URL")%></span></li>
                                                        </ul>
                                                </div>
                                                <!--<div class="clearfix"></div>-->
                                            </div>

                                            <!--<div class="clearfix"></div>-->

                                            <div class="formGrp" ng-hide="uploadType == 'website'">
                                                <div class="col-sm-2 formLabel">
                                                    <h3>
                                                        <%=labelAdd.get("ADD_DOC").get("D_ADD_UPLOAD")%>
                                                    </h3>
                                                </div>

                                                <div class="formField col-sm-5">
                                                    <div class="formField" ng-show="uploadType == 'website'">
                                                        <input type="text" placeholder="Source url" ng-model="val.filePath">
                                                    </div>

                                                    <div class="relative formUpload" style="padding-left:12px">
                                                        <div ng-disabled="!uploadType" class="dragDrpBx" ngf-select="uploadFiles($files)" ngf-drop="uploadFiles($files)" ng-model="files" multiple="true">
                                                            <p><a ng-disabled="!uploadType">Choose files or Drag here to upload</a></p>
                                                        </div>
                                                    </div>




                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <!--  -->
                                            <div class="clearfix"></div>
                                            <div class="table-responsive padding0">
                                            <table class="creteFilez box kBaseTable listTable table-condensed table-borderedtoggle table table-striped table-hover" ng-show="selectedFils.length > 0 || uploadType == 'website'">
                                                <thead>
                                                    <tr>
                                                        <th style="text-indent:5%;">
                                                            <span class="noBorder"><%=labelAdd.get("ADD_DOC").get("D_ADD_NAME")%></span>
                                                        </th>
                                                        <th>
                                                            <span class="noBorder"><%=labelAdd.get("ADD_DOC").get("D_ADD_DESC")%></span>
                                                        </th>
                                                        <th style="max-width: 30%;width: 30%;">
                                                            <span class="noBorder"><%=labelAdd.get("ADD_DOC").get("D_ADD_DOC")%></span>
                                                        </th>
                                                        <th>
                                                            <span class="noBorder"><%=labelAdd.get("ADD_DOC").get("D_ADD_ACCESS")%></span>
                                                        </th>
                                                        <th>
                                                            <span class="noBorder"><%=labelAdd.get("ADD_DOC").get("D_ADD_TAGS")%></span>
                                                        </th>
                                                        <th ng-hide="uploadType == 'website'">
                                                            <span class="noBorder"><%=labelAdd.get("ADD_DOC").get("D_ADD_REMOVE")%></span>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody ng-show="uploadType == 'website'">
                                                    <tr ng-repeat="val in tableObj">

                                                        <input type="hidden" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_NAME_P")%>" ng-init="val.docId = 0" ng-model="val.docId" required>
                                                        <td style="padding-left : 12px;">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_NAME_P")%>" ng-model="val.docName" required>
                                                        </td>
                                                        <td style="padding-left:0px;padding-right:0px;">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_DES_P")%>" ng-model="val.docDesc" required>
                                                        </td>
                                                        <td class="textLeft" style="padding-left:0px;padding-right:0px;">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_DOC_P")%> URL" ng-model="val.filePath" required>
                                                        </td>
                                                        <td style="padding-left:0px;padding-right:0px;">
                                                            <select style="text-indent:5px;" class="dropBoxed" ng-init="val.docAccess = docAccessList[0].value" ng-model="val.docAccess" ng-class="{true : 'colorAAA',false : ''}[sentAccess == undefined || sentAccess == '']">
										<%-- <option value=""><%=labelAdd.get("ADD_DOC").get("D_ADD_ACCESS_P")%></option> --%>
											<option value="{{docAc.value}}" ng-repeat="docAc in docAccessList">{{docAc.value}}</option>
										</select>
                                                        </td>
                                                        <td style="padding-left:0px;padding-right:0px;">
                                                            <button style="padding:5px 12px; width: 150px;" class="btn btn-default uButton pull-left" data-id="val.docId" ng-click="openTagzModal(val,$index)"><i class="fa fa-plus" style="margin-right:5px"></i><%=labelAdd.get("ADD_DOC").get("ADD_TAG_ADD")%></button>
                                                            <div class="view-ic relative marginLeft10 pull-left" ng-if="val.tags.length > 0">
                                                                <button style="padding:5px 12px; width: 150px;" class="btn btn-default uButton"><i class="fa fa-eye"></i></button>
                                                                <div class="hoverTags">
                                                                    <ul class="list-unstyled" style="max-height: 300px; overflow: auto;">
                                                                        <li ng-repeat="tag in val.tags |filter: 2 track by $index">{{tag.tag}} : {{tag.value}}</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <!-- <tr>
                                                         <td colspan="4" class="hideColor"></td>
                                                        <td colspan="2" class="hideColor" style="padding-left:0px;padding-right:0px;">
                                                         <button style="padding:5px 12px;  width: 150px;" class="btn btn-default uButton" ng-click="tagforAll(allTagsLisArr)"><i class="fa fa-plus" style="margin-right:5px"></i><%=labelAdd.get("ADD_DOC").get("ADD_TAG_ALL")%></button>
                                                        </td>
                                                    </tr> -->

                                                </tbody>

                                                <tbody ng-hide="uploadType == 'website'">
                                                    <tr ng-repeat="val in tableObj">
                                                        <input type="hidden" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_NAME_P")%>" ng-init="val.docId = 0" ng-model="val.docId" required>
                                                        <td>
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_NAME_P")%>" ng-model="val.docName" required>
                                                        </td>
                                                        <td>
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("D_ADD_DES_P")%>" ng-model="val.docDesc" required>
                                                        </td>
                                                        <td class="textLeft">
                                                            {{val.fileName}}
                                                        </td>
                                                        <td>
                                                            <select  style="text-indent:5px;" class="dropBoxed" ng-init="val.docAccess = docAccessList[0].value" ng-model="val.docAccess" ng-class="{true : 'colorAAA',false : ''}[sentAccess == undefined || sentAccess == '']">
											<%-- <option value=""><%=labelAdd.get("ADD_DOC").get("D_ADD_ACCESS_P")%></option> --%>
											<option value="{{docAc.value}}" ng-repeat="docAc in docAccessList">{{docAc.value}}</option>
										</select>
                                                        </td>
                                                        <td>
                                                            <button style="padding:5px 12px; width: 150px;" class="btn btn-default uButton pull-left" data-id="val.docId" ng-click="openTagzModal(val,$index)"><i class="fa fa-plus" style="margin-right:5px"></i><%=labelAdd.get("ADD_DOC").get("ADD_TAG_ADD")%></button>
                                                            <div class="view-ic relative marginLeft10 pull-left" ng-if="val.tags.length > 0">
                                                                <button style="padding:5px 12px" class="btn btn-default uButton"><i class="fa fa-eye"></i></button>
                                                                <div class="hoverTags">
                                                                    <ul class="list-unstyled">
                                                                        <li ng-repeat="tag in val.tags">{{tag.tag}} : {{tag.value}}</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="textCenter">
                                                            <a class="colorAAA fa fa-close" ng-click="removeRows($index)"></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4" class="hideColor"></td>
                                                        <td colspan="2" class="hideColor">
                                                            <button style="padding:5px 12px; width:150px;" class="btn btn-default uButton" ng-click="tagforAll(allTagsLisArr)"><i class="fa fa-plus" style="margin-right:5px"></i><%=labelAdd.get("ADD_DOC").get("ADD_TAG_ALL")%></button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                            <div class="col-md-12">
                                                <%-- <label class="error" ng-show="addErr"><%=labelAddErr.get("E_ADD_DOC").get("ADD_ALT_DOC")%></label> --%>
                                                    <label class="error" ng-show="addErr">Please fill all the required fields.</label>
                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="formGrp marginTop20">
                                                <div class="add-docAlign formBtn1 col-md-12" style="text-align: right;">
                                                    <button class="btn btn-default" id="hideForm" ng-click="cancelFor()"><%=labelAdd.get("ADD_DOC").get("D_ADD_CANCEL")%></button>
                                                    <button type="button" class="btn btn-successcustom marginLeft5" ng-click="createDocs()"><%=labelAdd.get("ADD_DOC").get("D_ADD_ADD")%></button>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </form>
                                        <div class="clearfix"></div>

                                        <div class="tableList dtesAre marginTop10" ng-controller="AngularWayCtrl as showCase" ng-if="showController" ng-cloak>
                                            <!-- 	<div class="col-sm-5 search_bx">
							<input type="text" placeholder ="Search here.." ng-model="filterTable"/>
							<i class="fa fa-search"></i>
                        </div> -->
                        <div class="table-responsive padding0">
                                           <!-- <table class="table table-striped table-hover box" id="documentTable" datatable="ng" dt-options="showCase.dtOptions" dt-column-defs="showCase.dtColumnDefs" class="kBaseTable listTable table-condensed table-borderedtoggle">
                                               -->
<table class="table-striped table-hover box" id="documentTable" style="margin-top: 22px;" datatable="ng" dt-options="showCase.dtOptions" dt-column-defs="showCase.dtColumnDefs">
 <thead>
                                                    <tr>
                                                        <!-- <th>
                                                            <div class="checkbox">
                                                            <input id="checkball_{{$index}}" type="checkbox" ng-model="isAllSelected" ng-click="toggleAll(isAllSelected)" />
                                                            <label style="margin-left:-5px" for="checkball_{{$index}}"></label>
                                                        </div>
                                                        </th> -->
                                                        <th>
                                                            <span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_NAME")%></span>
                                                            <a class="advOptn" ng-if="advSpan">
                                                                <b id="itemSelectd">{{selectedList}}</b>
                                                                <%=labelMap.get("DOC_LST").get("D_LST_ITEMSE")%>
                                                            </a>
                                                        </th>
                                                        <th>
                                                            <span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_FORMAT")%></span>
                                                            <a class="advOptn" ng-if="advSpan" data-toggle="modal" data-target="#confimationPop" ng-class="{true : '',false : ''}[advEditSpan]">
                                                                    <%=labelMap.get("DOC_LST").get("D_LST_DLTPRO")%>
                                                                </a>
                                                        </th>
                                                        <!--<th style="padding-bottom: 20px;">
                                                            <span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_DOC")%></span>
                                                        </th>-->
                                                        <th><span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_ACCESS")%></span></th>
                                                        <th><span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_TAGS")%></span></th>
                                                        <th><span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_CREATE")%></span></th>
                                                        <th><span ng-if="!advSpan" class="noBorder"><%=labelMap.get("DOC_LST").get("D_LST_STATUS")%></span></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="val in tableDatz" ng-style="val.check_bx === true ? { 'background-color':'#e8e8e8'} : { 'background-color':''}">
                                                        <!-- <td>
                                                                <div class="checkbox">
                                                            <input id="checkbx_{{$index}}" type="checkbox" ng-model="val.check_bx" ng-change="optionToggled();" />
                                                            <label for="checkbx_{{$index}}"></label>
                                                            </div>
                                                        </td> -->
                                                        <td ng-click="editDoclist(val.docId)" style="width:35%">{{val.docName}}</td>
                                                       <!-- <td class="paddingL10" ng-click="editDoclist(val.docId)">{{val.docDesc}}</td>
-->                                                        
<td ng-click="editDoclist(val.docId)">
                                                            {{val.docFormat | uppercase}}
                                                        </td>
   <!--                                                     <td class="paddingL10" class="textLeft" ng-click="editDoclist(val.docId)">
                                                            <span class="srcLink">
										<span>{{val.fileName}}</span>
                                                            </span>
                                                        </td>
-->       
                                                 <td ng-click="editDoclist(val.docId)">{{val.docAccess}}</td>
                                                        <td>
                                                            <div id="displayTag">
                                                                <ul class="list-unstyled margin0" ng-init="tagslimit = 2" ng-click="editDoclist(val.docId)">
                                                                    <li ng-repeat="tag in val.tags  |limitTo : tagslimit">{{tag.tag}}:{{tag.value}}</li>
                                                                </ul>
                                                                <div class="pColor" ng-show='tagExpand && val.tags.length > 2' ng-click="tagExpand = !tagExpand;tagslimit = 2">
                                                                    <%=labelMap.get("DOC_LST").get("D_LST_COLLAP")%>
                                                                </div>
                                                                <div class="pColor" ng-show="!tagExpand && val.tags.length > 2" ng-click="tagExpand = !tagExpand;tagslimit = 15">
                                                                    <%=labelMap.get("DOC_LST").get("D_LST_EXPAND")%>
                                                                </div>
                                                            </div>
                                                            <span id="dontdisplay" style="display: none;" ng-repeat="tag in val.tags">{{tag.tag}}:{{tag.value}}</span>
                                                        </td>

                                                        <td ng-click="editDoclist(val.docId)">{{val.dateUpdated}}</td>
                                                        <td ng-click="editDoclist(val.docId)">{{val.status}}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                        <div align="right" ng-if="tableDatz.length>0">
                                            <ul class="pagination" style="margin:0px;padding-bottom:45px;">
                                                <li ng-show="curentPage>1" ng-click="prevPage()"><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                                <li ng-show="curentPage <= 1"><a href="#" style="cursor: not-allowed;"><i class="fa fa-angle-left"></i></a></li>
                                                <li><a><i style="color: #333;">{{curentPage}} of {{totalPages}}</i></a></li>
                                                <li ng-show="curentPage < totalPages" ng-click="nextPage()"><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                                <li ng-show="curentPage >= totalPages" style="cursor: not-allowed;"><a href="#"><i style="cursor: not-allowed;" class="fa fa-angle-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </section>
                                </div>



                                <!-- TAG MODAL WINDOW -->
                                <div id="tagsModal" class="customPop modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" ng-click="updateTagsinClose()">&times;</button>
                                                <h4 class="modal-title">
                                                    <%=labelAdd.get("ADD_DOC").get("ADD_TAG_TITLE")%>
                                                </h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="formGrp">
                                                    <form class="formField" novalidate>
                                                        <div class="col-sm-5 padding0">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("ADD_TAG_KEY")%>" ng-model="uniqueKey">
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("ADD_TAG_VALUE")%>" ng-model="uniqueValue">
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <button type="submit" class="uButton popBtn" ng-disabled="!uniqueKey || !uniqueValue" ng-click="addTagsRow()"><i class="fa fa-plus"></i></button>
                                                        </div>
                                                    </form>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <!-- DYNAMIC TAGS LIST -->
                                                <div class="formGrp" ng-repeat="list in tagsLisArr">
                                                    <div class="formField" novalidate>
                                                        <div class="col-sm-5 padding0">
                                                            <input type="text" placeholder="key" ng-model="list.tag" disabled="true">
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <input type="text" placeholder="value" ng-model="list.value" disabled="true">
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <button type="submit" class="uButton popBtn" ng-click="removeTagz($index)"><i class="fa fa-close colorAAA"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>



                                                <label class="error_css" ng-show="errorKey"><%=labelAddErr.get("E_ADD_DOC").get("D_ADD_ALT_KEY")%></label>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-successcustom" ng-click="showOrgTagPop()"><%=labelAdd.get("ADD_DOC").get("ADD_FROM_LIST")%></button>
                                                <button type="button" class="btn btn-successcustom" data-dismiss="modal" ng-click="updateTagsinClose()"><%=labelAdd.get("ADD_DOC").get("ADD_TAG_CLOSE")%></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- TAG MODAL WINDOW-->



                                <!-- SELECT TAG FOR ALL -->
                                <div id="selectAll" class="customPop modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" ng-click="updateAllTagsinClose()">&times;</button>
                                                <h4 class="modal-title">
                                                    <%=labelAdd.get("ADD_DOC").get("ADD_TAG_ALLTITLE")%>
                                                </h4>
                                            </div>
                                            <div class="modal-body" style="max-height: 500px; overflow: auto;">
                                                <div class="formGrp">
                                                    <form class="formField" novalidate>
                                                        <div class="col-sm-5 padding0">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("ADD_TAG_KEY")%>" ng-model="allTagKey">
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <input type="text" placeholder="<%=labelAdd.get("ADD_DOC").get("ADD_TAG_VALUE")%>" ng-model="allTagValue">
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <button type="submit" class="uButton popBtn" ng-disabled="!allTagKey || !allTagValue" ng-click="allTagsSelect()">
										<i class="fa fa-plus"></i>
									</button>
                                                        </div>
                                                    </form>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="formGrp" ng-repeat="list in allTagsLisArr">
                                                    <div class="formField" novalidate>
                                                        <div class="col-sm-5 padding0">
                                                            <input type="text" placeholder="key" ng-model="list.tag" disabled="true">
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <input type="text" placeholder="value" ng-model="list.value" disabled="true">
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <button type="submit" class="uButton popBtn" ng-click="removeAllTagz($index,list)">
										<i class="fa fa-close colorAAA"></i>
									</button>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <label class="error_css" ng-show="allerrorKey"><%=labelAddErr.get("E_ADD_DOC").get("D_ADD_ALT_KEY")%></label>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-successcustom" ng-click="showOrgTagAllPop()"><%=labelAdd.get("ADD_DOC").get("ADD_FROM_LIST")%></button>
                                                <button type="button" class="btn btn-successcustom" data-dismiss="modal" ng-click="updateAllTagsinClose()"><%=labelAdd.get("ADD_DOC").get("ADD_TAG_CLOSE")%></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- All TAG MODAL WINDOW-->

                                <!--  ORG TAG LIST START -->

                                <div id="orgTagPop" class="customPop modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">
                                                    <%=labelAdd.get("ADD_DOC").get("ORG_TAG_TITLE")%>
                                                </h4>
                                            </div>
                                            <div class="modal-body" style="max-height: 500px; overflow: auto;">

                                                <ul class="nav nav-tabs " id="tabContent">
                                                    <li class="active"><a href="#tags" class="tagDisable" data-toggle="tab">Tags</a></li>
                                                    <li><a href="#tagGroup" class="tagDisable" data-toggle="tab">Tags Group</a></li>
                                                </ul>
                                                <section class="wrapper tagsWrapp">
                                                    <div class="tab-content">
                                                        <div class="tab-pane" id="tagGroup">
                                                            <div class="parnt_dii box" ng-repeat="tag in tagList">
                                                                <div class="child_row" style="background-color: #efefef;">
                                                                    <div class="col-sm-5 formFiltt" style="padding-left: 0px !important; ">
                                                                        <span ng-hide="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp"><i class="fa fa-angle-down"></i></span>
                                                                        <span ng-show="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp"><i class="fa fa-angle-up"></i></span>
                                                                        <span style="float: left;"><input type="text" ng-model="tag.tagKey" readonly class="formTextBox"></span>
                                                                    </div>
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="tag.tagValue" readonly class="formTextBox">
                                                                    </div>
                                                                    <div class="col-sm-2" style="text-align: right; ">
                                                                        <!-- <span ng-show="tag.checkedStatus=='checked'" ng-click="setOnOffTag(tag, 'P')">
							<i class="fa fa-toggle-on" style="color: #a4c158; font-size: xx-large; padding-top: 2px"></i>
							</span>
							<span ng-hide="tag.checkedStatus=='checked'" ng-click="setOnOffTag(tag, 'P')">
							<i class="fa fa-toggle-off" style="color: #bc0000; font-size: xx-large; padding-top: 2px"></i>
							</span> -->
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>

                                                                <div ng-show="tag.excp" class="child_row subChild" ng-repeat="child in tag.childTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
                                                                    <!-- <div class="col-sm-1">
                                                                    </div> -->
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="child.tagKey" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <!-- <div class="col-sm-1">
                                                                    </div> -->
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="child.tagValue" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <div class="col-sm-2" style="text-align: right;">
                                                                        <span ng-show="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
							<i class="fa fa-toggle-on"></i>
							</span>
                                                                        <span ng-hide="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
							<i class="fa fa-toggle-off"></i>
							</span>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>

                                                        <div class="tab-pane active" id="tags">
                                                            <div class="parnt_dii box">
                                                                <div class="child_row subChild" ng-repeat="child in singleTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
                                                                    <!-- <div class="col-sm-1">
                                                                    </div> -->
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="child.tagKey" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <!-- <div class="col-sm-1">
                                                                    </div> -->
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="child.tagValue" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <div class="col-sm-2" style="text-align: right;">
                                                                        <span ng-show="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
							<i class="fa fa-toggle-on"></i>
							</span>
                                                                        <span ng-hide="child.checkedStatus=='checked'" ng-click="setOnOffTag(child, 'C')">
							<i class="fa fa-toggle-off" ></i>
							</span>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>


                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-successcustom" data-dismiss="modal"><%=labelAdd.get("ADD_DOC").get("ADD_TAG_CLOSE")%></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- FOR ALL DOC TAGS -->

                                <div id="orgTagPop2" class="customPop modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">
                                                    <%=labelAdd.get("ADD_DOC").get("ORG_TAG_TITLE")%>
                                                </h4>
                                            </div>
                                            <div class="modal-body" style="max-height: 500px; overflow: auto;">

                                                <ul class="nav nav-tabs" id="tabContent">
                                                    <li class="active"><a href="#tagsAll" data-toggle="tab">Tags</a></li>
                                                    <li><a href="#tagGroupAll" data-toggle="tab">Tags Group</a></li>
                                                </ul>

                                                <section class="wrapper tagsWrapp">
                                                    <div class="tab-content">
                                                        <div class="tab-pane" id="tagGroupAll">
                                                            <div class="parnt_dii box" ng-repeat="tag in tagList">
                                                                <div class="child_row" style="background-color: #efefef;">
                                                                    <div class="col-sm-5 formFiltt" style="padding-left: 0px !important; ">
                                                                        <span ng-hide="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp"><i class="fa fa-angle-down"></i></span>
                                                                        <span ng-show="tag.excp" style="float: left; padding-right: 5px; padding-top: 8px; cursor: pointer;" ng-click="tag.excp = !tag.excp"><i class="fa fa-angle-up"></i></span>
                                                                        <span style="float: left;"><input type="text" ng-model="tag.tagKey" readonly class="formTextBox"></span>
                                                                    </div>
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="tag.tagValue" readonly class="formTextBox">
                                                                    </div>
                                                                    <div class="col-sm-2" style="text-align: right; ">
                                                                        <!-- <span ng-show="tag.checkedStatus=='checked'" ng-click="setOnOffTagForAll(tag, 'P')">
							<i class="fa fa-toggle-on" style="color: #a4c158; font-size: xx-large; padding-top: 2px; cursor: pointer;"></i>
							</span>
							<span ng-hide="tag.checkedStatus=='checked'" ng-click="setOnOffTagForAll(tag, 'P')">
							<i class="fa fa-toggle-off" style="color: #bc0000; font-size: xx-large; padding-top: 2px; cursor: pointer;"></i>
							</span> -->
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>

                                                                <div ng-show="tag.excp" class="child_row subChild" ng-repeat="child in tag.childTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
                                                                    <!-- <div class="col-sm-1">
                                                                    </div> -->
                                                                    <div class="col-sm-5 formFiltt">
                                                                        <input type="text" ng-model="child.tagKey" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <div class="col-sm-1">
                                                                    </div>
                                                                    <div class="col-sm-4 formFiltt">
                                                                        <input type="text" ng-model="child.tagValue" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <div class="col-sm-2" style="text-align: right;">
                                                                        <span ng-show="child.checkedStatus=='checked'" ng-click="setOnOffTagForAll(child, 'C')">
							<i class="fa fa-toggle-on" ></i>
							</span>
                                                                        <span ng-hide="child.checkedStatus=='checked'" ng-click="setOnOffTagForAll(child, 'C')">
							<i class="fa fa-toggle-off" ></i>
							</span>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>

                                                        <div class="tab-pane active" id="tagsAll">
                                                            <div class="parnt_dii box">
                                                                <div class="child_row subChild" ng-repeat="child in singleTags" style="border-bottom-color: #CCC; border-bottom-width: 1px; border-bottom-style: solid;">
                                                                    <div class="col-sm-1">
                                                                    </div>
                                                                    <div class="col-sm-4 formFiltt">
                                                                        <input type="text" ng-model="child.tagKey" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <div class="col-sm-1">
                                                                    </div>
                                                                    <div class="col-sm-4 formFiltt">
                                                                        <input type="text" ng-model="child.tagValue" readonly class="formTextBoxChild">
                                                                    </div>
                                                                    <div class="col-sm-2" style="text-align: right;">
                                                                        <span ng-show="child.checkedStatus=='checked'" ng-click="setOnOffTagForAll(child, 'C')">
							<i class="fa fa-toggle-on" ></i>
							</span>
                                                                        <span ng-hide="child.checkedStatus=='checked'" ng-click="setOnOffTagForAll(child, 'C')">
							<i class="fa fa-toggle-off" ></i>
							</span>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </section>


                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-successcustom" data-dismiss="modal"><%=labelAdd.get("ADD_DOC").get("ADD_TAG_CLOSE")%></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                                <!--  ORG TAG LIST END -->


                                <!-- BOOTSTRAP ERROR MODAL -->
                                <div id="errorModal" class="customPop modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Error !!</h4>
                                            </div>
                                            <div class="modal-body">
                                                <p>{{popUpMsg}}</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-successcustom" data-dismiss="modal">Ok</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- BOOTSTRAP ERROR MODAL -->

                                <!-- BOOTSTRAP DELETE CHECK MODAL -->
                                <div id="confimationPop" class="customPop modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">
                                                    <%=labelEMap.get("E_DOC_LST").get("D_LST_ALT_TITLE")%>
                                                </h4>
                                            </div>
                                            <div class="modal-body">
                                                <p>
                                                    <%=labelEMap.get("E_DOC_LST").get("D_LST_ALT_MSG")%>
                                                </p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default uButton" data-dismiss="modal"><%=labelEMap.get("E_DOC_LST").get("D_LST_ALT_NO")%></button>
                                                <button type="button" class="btn btn-successcustom" ng-click="deleteTableList()"><%=labelEMap.get("E_DOC_LST").get("D_LST_ALT_YES")%></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- BOOTSTRAP DELETE CHECK MODAL -->


                            </div>

                            <script src="resources/js/jquery.js"></script>
                            <script src="resources/js/bootstrap.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>


                            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
                            <script src="resources/js/app.js"></script>
                            <script src="resources/controller/controller.js"></script>
                            <script src="resources/js/directive.js"></script>
                            <script src="resources/js/factory.js"></script>
                            <script src="resources/js/catalog.js"></script>

                            <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
                            <script src="resources/js/angular-datatables.min.js"></script>
                            <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
                            <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js"></script>
                            <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
                            <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
                            <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
                            <script src="resources/js/angular-datatables.buttons.js"></script>

                            <script src="https://cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
                            <script src="resources/js/angular-datatables.tabletools.min.js"></script>

                            <script src="resources/js/ng-file-upload-shim.js"></script>
                            <script src="resources/js/ng-file-upload.js"></script>
                            <script src="resources/js/custom.js"></script>


                            <script src="resources/js/ng-tags.js"></script>
                            <script src="resources/org/js/ngStroge.min.js"></script>

                            <script>
                                $('[data-toggle="tooltip"]').tooltip();
                                $(function() {
                                    $('#knowledge').addClass('menu-active');

                                    $('.ham-icon').click(function() {
                                        $('.overlay').toggleClass('show-overlay');
                                    })


                                    $(".dummyPTag").change(function() {
                                        if ($(this).prop("checked") == true) {
                                            //run code
                                        } else {
                                            //run code
                                        }
                                    });

                                });
                            </script>
                        </body>

                        </html>
                       
