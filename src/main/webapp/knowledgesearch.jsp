<%@ page session="true" %> 
<%@page import="java.util.*"%> 
<%@page import="java.util.Map"%> <%@page import="com.util.APIUtil"%> 
<%@include file="session.jsp"%> 
<% 
   Map<String, Map<String, String>> labelMap = ((Map<String, Map<String, String>>) session.getAttribute("DOC_SEARCH")); 
    Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU")); 
    String DOC_KC_SEARCH_URL =  APIUtil.DOC_KC_SEARCH_URL; 
%>
        <script>
          var orgid=<%= session.getAttribute("loginOrgId")%>;
          var DOC_KC_SEARCH_URL = "<%=DOC_KC_SEARCH_URL%>";
        </script>

        <!DOCTYPE html>
        <html lang="en">
          <head>
            <title>Sentient Catalog</title>
            <meta charset="utf-8" />
            <link
              rel="icon"
              href="https://sentient.io/img/favicon.ico"
              type="image/x-icon"
            />
            <link
              rel="shortcut icon"
              href="https://sentient.io/img/favicon.ico"
              type="image/x-icon"
            />
            <meta
              name="viewport"
              content="width=device-width, initial-scale=1"
            />
            <link rel="stylesheet" href="resources/css/bootstrap.css" />
            <link rel="stylesheet" href="resources/css/font-awesome.min.css" />
            <link rel="stylesheet" href="resources/css/style.css" />
            <link rel="stylesheet" href="resources/css/search.css" />
            <link rel="stylesheet" href="resources/css/mob-res.css">
            
            <style type="text/css">
              .ndfHFb-c4YZDc-i5oIFb
                .ndfHFb-c4YZDc-to915-LgbsSe.ndfHFb-c4YZDc-LgbsSe {
                -webkit-border-radius: 2px;
                border-radius: 2px;
                height: 24px;
                line-height: 24px;
                margin: 0;
                padding: 8px;
                min-width: 0;
                background-color: red;
              }
              .sear_res ul.pagination li.pagi_cnt{
                border: 1px solid #dddddd;
    padding: 3px;
              }
              
table.topsTable tr td {
    padding: 5px;
}
            </style>
          </head>
          <body ng-app="sentiCatalog" ng-controller="searchCtrl" ng-cloak>
            <jsp:include page="new_header.jsp"></jsp:include>

            <div>
              <!-- <div class="loadr" ng-if="loader"></div> -->
              <div class="loading-container" ng-if="loader">
                  <div class="loading">
                    <span>Loading...</span>
                  </div>
                  </div>

              <section class="wrapper searchPage" ng-show="searchMain">
                <div class="container-fluid paddingLR30 pageTBMargin padding0">
                  <div class="col-sm-6 searcBx col-sm-offset-3">
                    <!-- <img src="resources/images/logo.png" alt=""/> -->
                    <%--
                    <h1><%=labelMap.get("DOC_SEARCH").get("DS_FIND")%></h1>
                    --%>
                    <br />
                    <div class="search_panel">
                      <form class="search_inpt" novalidate>
                        <input type="text" ng-model="searchKey"
                        placeholder="<%=labelMap.get("DOC_SEARCH").get("DS_FIND")%>"
                        required>
                        <button type="submit" ng-click="getContentOfDoc()">
                          <i class="fa fa-search"></i>
                        </button>
                      </form>
                    </div>
                  </div>
                  <div class="col-sm-2 searcBxQuery">
                    <span
                      ><a
                        href="https://peristera.atlassian.net/wiki/spaces/SEN/pages/268369921/Search+Query+Language"
                        target="_blank"
                        ><i class="fa fa-info-circle"></i
                        ><span class="queryHelp">Query Help</span></a
                      ></span
                    >
                  </div>
                </div>
              </section>

              <section class="wrapper searhcLis" ng-show="searchResult">
                <div class="paddingLR30 pageTBMargin padding0">
                  <div class="sear_res">
                    <%--
                    <h4 class="resul_Cnt">
                      <%=labelMap.get("DOC_SEARCH").get("DS_FIND")%>
                    </h4>
                    --%>
                    <form novalidate class="search_inpt pageSearchBx pull-left">
                      <input type="text"
                      placeholder="<%=labelMap.get("DOC_SEARCH").get("DS_FIND")%>"
                      ng-model="searchKey" style="text-align: left;" required>
                      <button type="submit" ng-click="getContentOfDoc()">
                        <i class="fa fa-search"></i>
                      </button>
                    </form>
                    <div
                      class="col-sm-2"
                      style="margin-top: 12px;"
                    >
                      <span
                        ><a
                          href="https://peristera.atlassian.net/wiki/spaces/SEN/pages/268369921/Search+Query+Language"
                          target="_blank"
                          ><i class="fa fa-info-circle"></i
                          ><span class="queryHelp">Query Help</span></a
                        ></span
                      >
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <p class="resul_Cnt" ng-if="resultData.length>0">
                      <!-- About <span>{{ resultData.length }} results</span> for -->
                      About <span>top results</span> for
                      your searched content
                    </p>
                    <p class="resul_Cnt" ng-if="resultData.length<1">
                      <%=labelMap.get("DOC_SEARCH").get("NO_RESULT")%>
                    </p>
                    <!-- <div class="resul_bx container-fluid padding0" ng-repeat="row in resultData | startFrom:currentPage*pageSize | limitTo:pageSize"> -->
                    <div class="resul_bx container-fluid padding0" ng-repeat="row in resultData">
                      <h3 class="btn_bg" style="text-align: left !important">{{ row.articleTitle }}</h3>
                      <div class="pad-15">
                        <p class="link">
                          <a target="_blank" href="{{ row.articleUrl }}">{{
                            row.articleUrl
                          }}</a>
                        </p>
                        <div ng-if="row.articleUrl==''">
<!--                           <p
                            class="pColor"
                            style="cursor: pointer;"
                            ng-show="viewPreview"
                            ng-click="viewPreview=!viewPreview"
                          >
                            Hide Preview
                          </p> -->
                          <p class="pColor" style="cursor: pointer;">
                            <a href="{{ trustSrc(row.file_url) }}" target="_blank" style="color: #333"><b>Open Document</b></a>
                          </p>
                          <!-- <div ng-show="viewPreview">
                            <iframe
                              ng-src="{{ trustSrc(row.file_url) }}"
                              style="width:800px; height:500px;margin-bottom: 10px;"
                              frameborder="0"
                            ></iframe>
                          </div> -->
                        </div>

                        <p class="desc">
                          {{ row.articleContentText.substr(0, 1000) }} ...
                        </p>
                        
                        
                        
                        
                        <table border="1" width="100%" style="margin-top: 10px;" class="topsTable" ng-if="row.articleContentProfile.categories.length>0 || row.articleContentProfile.entities.length>0">
                        	<tr style="background: #424143;color: #fff !important;padding: 10px">
                        		<td>Categories</td>
                        		<td>Person</td>
                        		<td>Organization</td>
                        		<td>Location</td>
                        	</tr>
                        	<tr>
                        		<!-- <td ng-init="ngramslimit = 5">
                        			<span ng-repeat="ngrm in row.nGrams | orderObjectBy : 'score'|limitTo : ngramslimit ">
                        			{{ ngrm.name }} &nbsp;&nbsp;-
                              		{{ ngrm.score.substr(0, 4) }}
                              		<br></span>
                        		</td> -->
                        		<td width="25%" valign="top">
                        			<span ng-repeat="cat in row.articleContentProfile.categories|orderObjectBy : 'node_weight'|limitTo:7">{{cat.name}}<br></span>
                        			<span ng-if="row.articleContentProfile.categories.length<1">N/A</span>
                        		</td>
                        		<td width="25%" valign="top">
                        			<span ng-repeat="enti in row.articleContentProfile.entities" ng-if="enti.type=='person'">
                        				<span ng-repeat="val in enti.value|orderObjectBy : 'count'|limitTo:7">{{val.name}}<br></span>
                        				<span ng-if="enti.value.length<1">N/A</span>
                        			</span>
                        			<span ng-if="row.articleContentProfile.entities.length<1">N/A</span>
                        		</td>
                        		<td width="25%" valign="top">
                        			<span ng-repeat="enti in row.articleContentProfile.entities" ng-if="enti.type=='organization'">
                        				<span ng-repeat="val in enti.value|orderObjectBy : 'score'|limitTo:7">{{val.name}}<br></span>
                        				<span ng-if="enti.value.length<1">N/A</span>
                        			</span>
                        			<span ng-if="row.articleContentProfile.entities.length<1">N/A</span>
                        		</td>
                        		<td width="25%" valign="top">
                        			<span ng-repeat="enti in row.articleContentProfile.entities" ng-if="enti.type=='location'">
                        				<span ng-repeat="val in enti.value|orderObjectBy : 'score'|limitTo:7">{{val.name}}<br></span>
                        				<span ng-if="enti.value.length<1">N/A</span>
                        			</span>
                        			<span ng-if="row.articleContentProfile.entities.length<1">N/A</span>
                        		</td>
                        	</tr>
                        </table>
                       <!--  <span style="text-align: center;margin-top: 10px">
						  <p class="desc linkColor" style="cursor: pointer;" ng-show="ngramExpand && row.nGrams.length > 2" >
						    <span ng-click="ngramExpand = !ngramExpand;ngramslimit = 5">Collapse</span>
						  </p> 
						  <p class="desc linkColor" style="cursor: pointer;" ng-show="!ngramExpand && row.nGrams.length > 2" >
						    <span ng-click="ngramExpand = !ngramExpand;ngramslimit = 1500">Expand</span>
						  </p>
						</span> -->
						
                      </div>
                    </div>
                    
                    
                 

                    <div style="padding-bottom:70px;" align="right" ng-if="resultData.length > pageSize">
                        <%-- <ul class="pagination" style="margin:0px;">
                            <li ng-show="currentPage+1 > 1" ng-click="pagePrev()"><a href="#"><i class="fa fa-angle-left" style="line-height: unset;"></i></a></li>
                            <li ng-show="currentPage+1 <= 1"><a href="#" style="cursor: not-allowed;"><i class="fa fa-angle-left" style="line-height: unset;"></i></a></li>
                            <li><a><i style="color: #333;">{{currentPage + 1}} of {{numberOfPages()}}</i></a></li>
                            <li ng-show="currentPage+1 < numberOfPages()" ng-click="pageNext()"><a href="#"><i class="fa fa-angle-right" style="line-height: unset;"></i></a></li>
                            <li ng-show="currentPage+1 >= numberOfPages()" style="cursor: not-allowed;"><a href="#"><i style="cursor: not-allowed;line-height: unset;" class="fa fa-angle-right"></i></a></li>
                        </ul> --%>
                    </div>
                  </div>
                </div>
              </section>
            </div>

            <script src="resources/js/jquery.js"></script>
            <script src="resources/js/bootstrap.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
            <script src="resources/js/ngstorage.min.js"></script>
            <script src="resources/js/catalog.js"></script>
            <script src="resources/controller/searchtrl.js"></script>
            <script src="resources/js/ngClickCopy.js"></script>

            <script>
              $(function() {
                $("#menuiconAI").hide();
                $("#menuiconDA").hide();
        		$(".tpMenu").addClass("menuShadow");
              });
            </script>
          </body>
        </html>
