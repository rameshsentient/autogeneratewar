<%@ page session="true" %>
    <%@page import="java.util.*"%>
        <%@page import="java.util.Map"%>
        <%@page import="com.util.APIUtil"%>
            <%
if(session.getAttribute("MENU")!=null){
	Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));
	String api_key = "";
	String userApiKey = "";
	String orgType = "";
	String clientId = "";
	String ownerId = "";
	String org_Name = "";
	String org_Email = "";
	
	if(session.getAttribute("orgType") != null)
	{
		orgType = session.getAttribute("orgType").toString();
	}
	
	if(session.getAttribute("userApiKey") != null)
	{
		userApiKey = session.getAttribute("userApiKey").toString();
	}
	
	if(session.getAttribute("api_key") != null)
	{
		api_key = session.getAttribute("api_key").toString();
	}
	
	if(session.getAttribute("orgName") != null)
	{
		org_Name = session.getAttribute("orgName").toString();
	}
	if(session.getAttribute("orgEmail") != null)
	{
		org_Email = session.getAttribute("orgEmail").toString();
	}
	
	int loginOrgId = 0;
	int loginUsrId = 0;

	if(session.getAttribute("loginOrgId") != null)
	{
		loginOrgId = (int) session.getAttribute("loginOrgId");
	}
	
	if(session.getAttribute("id") != null)
	{
		loginUsrId = (int) session.getAttribute("id");
	}
	
	if(session.getAttribute("clientId") != null)
	{
		clientId = session.getAttribute("clientId").toString();
	}
	
	if(session.getAttribute("ownerId") != null)
	{
		ownerId = session.getAttribute("ownerId").toString();
	}
	
	String CHECK_ENOUGH_BALANCE = APIUtil.CHECK_ENOUGH_BALANCE;

%>
                <!-- Start of sentientio Zendesk Widget script -->
                <script>
                    /*<![CDATA[*/
                    window.zE || (function(e, t, s) {
                        var n = window.zE = window.zEmbed = function() {
                                n._.push(arguments)
                            },
                            a = n.s = e.createElement(t),
                            r = e.getElementsByTagName(t)[0];
                        n.set = function(e) {
                            n.set._.push(e)
                        }, n._ = [], n.set._ = [], a.async = true, a.setAttribute("charset", "utf-8"), a.src = "https://static.zdassets.com/ekr/asset_composer.js?key=" + s, n.t = +new Date, a.type = "text/javascript", r.parentNode.insertBefore(a, r)
                    })(document, "script", "35efafaf-9bd0-4f75-8c65-0dffd8aa28eb"); /*]]>*/
                </script>
                <!-- End of sentientio Zendesk Widget script -->
                <script>

                    var API_KEY = "<%=api_key%>";
                    var API_USER_KEY = "<%=userApiKey%>";
                    var ORG_ID = <%=loginOrgId%>;
                    var USR_ID = <%=loginUsrId%>;
                    var ORG_TYPE = "<%=orgType%>";
                    var CLIENT_ID = "<%=clientId%>";
                    var OWNER_ID = "<%=ownerId%>";
                    var ORG_NAME = "<%=org_Name%>";
                    var ORG_EMAIL = "<%=org_Email%>";
                    var CHECK_ENOUGH_BALANCE = "<%=CHECK_ENOUGH_BALANCE%>";
                    
                </script>
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
                <script>

                	function checkBalance(){
                		$(document).ready(function(){
						  $("#showBalance").hide();
						  checkBalanceMethod();
              			});
                    }

                	function commaSeparator(num)
                	  {
                	    var num_parts = num.toString().split(".");
                	    num_parts[0] = num_parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                	    return num_parts.join(".");
                	  }
                    

					function checkBalanceMethod(){

						console.log('----------1-------------');
						if (ORG_ID != 1){
							console.log('----------2-------------');
							data1 = JSON.stringify({"orgId": ORG_ID+""});
							var currentbalance = 0;
							$.ajax({
							    type: "POST",
							    url: CHECK_ENOUGH_BALANCE,
							    contentType : 'application/json',
							    dataType : 'json',
							    headers: {"x-api-key": API_USER_KEY},
							    data: data1,
							    success: function(response) {
								    
							    	console.log(response);
							    	console.log('----------3-------------');
							    	if (response.balance){
								    	/* currentbalance = response.balance.toLocaleString(); */
								    	currentbalance = commaSeparator(response.balance.toFixed(0));
								    	document.getElementById("accBalance").innerHTML = currentbalance;
								    }
								    document.getElementById("showPriceTag").style.display = "block";
							    },
							    error: function(response) {
							    	 console.log('-------------Balance is not loading----------------');
							    	 console.log(response);
							    	 console.log('*************Balance is not loading****************');
							    }
							});
						}
					}
					
					checkBalanceMethod();
					checkBalance();
			
	            </script>
                
                <style>
                    [ng\:cloak],
                    [ng-cloak],
                    .ng-cloak {
                        display: none !important
                    }
                    
                    .header-row-margine {
                        margin-right: 0;
                        margin-left: 0;
                        height: 60px;
                        /* padding-top: 14px; */
                    }
                    
                    .header-row-margine>div {
                        display: inline-block;
                    }
                    
                    .overlay {
                        position: fixed;
                        left: 0;
                        right: 0;
                        top: 57px;
                        bottom: 0;
                        z-index: 10;
                        background-color: #35363a;
                        text-align: left;
                        color: white;
                        margin: auto;
                        overflow: auto;
                        display: none;
                    }
                    
                    .overlay.show-overlay {
                        display: block !important;
                    }
                    
                    .menu-sm {
                        padding: 10px;
                        font-size: 14px;
                        border-bottom: 1px solid gray;
                    }
                    
                    .overlay ul li {
                        display: block;
                        padding: 10px;
                        font-size: 14px;
                        border-bottom: 1px solid gray;
                    }
                    
                    .overlay ul li:last-child {
                        border-bottom: 0px;
                    }
                    
                    a,
                    a:hover,
                    a:focus {
                        text-decoration: none;
                        
                    }
                    
                    .overlay ul li:hover {
                        transition: all .5s linear;
                        background-color: gray;
                    }
                    
                    .overlay-content {
                        margin: 20px;
                        /* background-color: #1d1d1f; */
                    }
                    
                    .sm-submenu {
                        display: none;
                    }
                    
                    .menu-sm.open-sub .sm-submenu {
                        display: block;
                    }
                    
                    .list-item-settings a {
                        font-size: 15px!important;
                        /* font-family: Georgia, 'Times New Roman', Times, serif; */
                    }
                  /*NEW HEADER CONTENT*/
                  .profile-content{
                        text-align: right;
                        border: 1px solid #dadce0;
    border-radius: 8px;
    padding: 3px 8px;
    background-color: rgba(245, 244, 247, 0.88);
    cursor: pointer;
    }

    .profile-content1{
                        text-align: right;
                        border: 1px solid #fff;
    border-radius: 8px;
    padding: 3px 8px;
    /* background-color: rgba(245, 244, 247, 0.88); */
    cursor: pointer;
    }
    .profile-icon{
    float: right;
    width: 40px;
    height: 40px;
    border-radius: 50px;
    background: #ccc;
    text-align: center;
       font-size: 25px;
    color: white;
                    }
                    
                  
                    .profile-icon i{
                        line-height: 36px;
                    }
                    .profile-data{
                        display: inline-block;
    margin-right: 10px;
    padding-left: 18px;
    /* text-align: center; */
    font-size: 17px;
                    }
                    .profile-data div:nth-child(1){
                        font-weight: bold;
                    }
/* < new> */
.profile-icon1 i{
    line-height: 49px;
                    }
                    .profile-icon1{
    width: 40px;
    height: 40px;
    border-radius: 50px;
    background: #ccc;
    text-align: center;
    font-size: 35px;
       display: inline-block;
    color: white;
                    }

.profile-data1{
    
    display: inline-block;
    /* margin-right: 10px; */
    padding-left: 10px;
    text-align: left;
                    }
                    .profile-data1 div:nth-child(1){
                        font-weight: bold;
                        color: #646464;
                    }
                    .profile-data1 div:nth-child(2){
                        color:#909090;
                    }
                  
                    /* < END> */

                    .porfile-submenu{
                        top:54px !important;
                        text-align: left;   
                        right: 0 !important;
                        left: 17px !important;
                        /* min-width: 150px; */
                    }
                    .acc-bal{
                        border-radius: 5px;
                        padding: 3px;
                        text-align: right;                        
                        }
                        .ai-list{
            display: inline-block;
    /* padding-left: 15px; */
    position: absolute;
    font-size: 21px;
    color: #a90000;
    left: 37px;
    text-transform: lowercase;
    font-weight: normal;
          }    
          .da-list{
            display: inline-block;
    /* padding-left: 15px; */
    position: absolute;
    font-size: 21px;
    color: #9fae6b;
    left: 37px;
    text-transform: lowercase;
    font-weight: normal;
          } 
    .li-client{
    display: inline-block;
    color: #484243 !important;
    text-transform: lowercase;
    font-weight: normal;
    margin: 0px;
          }
     .moneydollar {
     font-size: 17px !important;
    background: #cbab80;
    color: #fbe96a;
    border-radius: 25px;
    font-size:17px;
    /* width: 20px; */
    /* padding: 3px; */
    /* height: 20px; */
    text-align: center;
    /* line-height: 22px !important; */
    /* text-align: center; */
    padding: 2px 7px 2px 7px;
    border:2px solid #fbe96a;
                        }
                        .dashLogo1{
                            text-align: center;
                            height: 0;
                        }
                        .top_first1{
                            margin: 15px 10px 15px 29px;
                        }
                        .porfile-submenu1{
    top: 36px !important;
    text-align: left;
    right: 0 !important;
     left: -10px !important; 
}
ul.subMenu1{
    min-width: 208px!important;
    max-width: 350px;
 
}
ul.subMenu1 li{
    /* margin-bottom:20px;
    margin-top: 15px; */
    margin: 15px;
}

.menuShadow{
box-shadow: 0px 1px 4px -1px rgba(92,97,130,1);
}

.mobile-menu a{
  margin: 0px !important;
}
.mobile-menu li{
  padding-left: 15px;
}
.ai-bg{
    margin: 0px!important;
    /* margin-bottom: 0px!important; */
    border-left: 13px solid #fbe6e6;
    padding: 7px 15px;
}
#da{
    margin: 0px!important;
    border-left: 13px solid #e8f0cd;
    padding: 7px 15px;
}
#client{
    margin: 0;
    border-left: 13px solid #f4eee5;
    padding: 7px 15px;
}
/*HIDE LEFT MENU for XS*/

@media screen and (max-width: 767px){
    .hide-btn,.leftPans,.top-right-icons{
        display: none !important;
    }
}
@media screen and (max-width: 520px){
.tools-list .dropdown-menu{
    position: fixed !important;
    right: 0 !important;
    top: auto !important;
    left: auto !important;
}
.top-ribbon-green{
    white-space: nowrap;
    overflow-y:scroll;
}
}
.menu-icons{
    width: 27px;
    display: inline-block!important;
}
                </style>
                <div class="overlay">
                    <div class="overlay-content">
                        <div class="menu-sm">
                            <a href="dashboard">
                                <%=menus.get("MENU").get("MENU_DASH")%>
                            </a>
                        </div>
                        <div class="menu-sm" onclick="toggleSubmenu(this)" ng-class="{true : 'menuShow',false : 'menuHide'}[uAccess.KC_UPDATEDOC || uAccess.KC_DOCUMENTSEARCH]" id="knowledg">
                            <a href="">
                                <%=menus.get("MENU").get("MENU_KNOWLADGE")%>
                            </a>
                            <ul class="sm-submenu">
                                <li ng-if="uAccess.KC_UPDATEDOC">
                                    <a href="docList">
                                        <%=menus.get("MENU").get("MENU1")%>
                                    </a>
                                </li>
                                <li ng-if="uAccess.KC_DOCUMENTSEARCH">
                                    <a href="knowledgeSearch">
                                        <%=menus.get("MENU").get("MENU_KS_SEARCH")%>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <%-- <%if((int)session.getAttribute("loginOrgId")==1){%>
                            <div class="menu-sm">
                                <a href="addorg">
                                    <%=menus.get("MENU").get("MENU2")%>
                                </a>
                            </div>
                            <div class="menu-sm">
                                <a href="platform">
                                    <%=menus.get("MENU").get("MENU3")%>
                                </a>
                            </div>
                            <%}else{ %>
                                <div class="menu-sm">
                                    <a href="orgdetails">
                                        <%=menus.get("MENU").get("MENU2")%>
                                    </a>
                                </div>
                                <%} %> --%>
                                    <%-- <div class="menu-sm" onclick="toggleSubmenu(this)" id="pageprofile">
                                        <a href="">
                                            <%=menus.get("MENU").get("MENU_DEMOS")%>
                                        </a>
                                        <ul class="sm-submenu">
                                            <li>
                                                <a href="urlindexing">
                                                    <%=menus.get("MENU").get("MENU_PAGE")%>
                                                </a>
                                            </li>
                                            <li>
                                                <a target="_blank" href="https://sentient.io/demo/vivien/?s=v">
                                                    <%=menus.get("MENU").get("MENU_VIV_VO")%>
                                                </a>
                                            </li>
                                            <li>
                                                <a target="_blank" href="https://sentient.io/demo/vivien/?s=t">
                                                    <%=menus.get("MENU").get("MENU_VIV_TXT")%>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="docconversion">
                                                    <%=menus.get("MENU").get("MENU_DOC_CON")%>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="webscraping">
                                                    <%=menus.get("MENU").get("MENU_WEB_SEC")%>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="asr">
                                                    <%=menus.get("MENU").get("ASR_SG")%>
                                                </a>
                                            </li>
                                            <li><a href="tts">TTS</a></li>
                                            <li>
                                                <a target="_blank" href="tepcodemo">
                                                    <%=menus.get("MENU").get("MENU_TEPCO")%>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="directorysearch">
                                                    <%=menus.get("MENU").get("MENU_DIRECTORY_SEARCH")%>
                                                </a>
                                            </li>
                                        </ul>
                                    </div> --%>
                                    <div class="menu-sm" onclick="toggleSubmenu(this)" ng-if="uAccess.BROTHER" id="brother">
                                        <a href="">
                                            <%=menus.get("MENU").get("MENU_CLIENT")%>
                                        </a>
                                        <ul class="sm-submenu">
                                            <li ng-if="uAccess.BROTHER" style="margin-bottom:0;">
                                                <a href="promolist">
                                                    <%=menus.get("MENU").get("MENU_BROTHER")%>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="menu-sm" onclick="toggleSubmenu(this)" ng-if="uAccess.DATASCHEMA || uAccess.MARKETPLACE || uAccess.PROVLIST || uAccess.MYCONDATA" id="datafedmenu-mob">
                                        <a href="">
                                            <%=menus.get("MENU").get("DATAFEDERATION")%>
                                        </a>
                                        <ul class="sm-submenu">
                                            <li ng-if="uAccess.DATASCHEMA">
                                                <a href="dataset">
                                                    <%=menus.get("MENU").get("DATA_SCHEMA")%>
                                                </a>
                                            </li>
                                            <li ng-if="uAccess.MARKETPLACE">
                                                <a href="marketplace">
                                                    <%=menus.get("MENU").get("MARKETPLACE")%>
                                                </a>
                                            </li>
                                            <li ng-if="uAccess.PROVLIST">
                                                <a href="contract">
                                                    <%=menus.get("MENU").get("CONTRACT")%>
                                                </a>
                                            </li>
                                            <li ng-if="uAccess.MYCONDATA">
                                                <a href="mycontract">
                                                    <%=menus.get("MENU").get("MY_CONTRACT")%>
                                                </a>
                                            </li>
                                            
                                            <li ng-if="true">
                                                <a href="keys">
                                                    <%=menus.get("MENU").get("GENERATE_KEYS")%>
                                                </a>
                                            </li>
                                            
                                             <li ng-if="true">
                                                 <a href="encode">
                                                     <%=menus.get("MENU").get("ENCODE_KEY")%>
                                                 </a>
                                             </li>
                                             <li ng-if="true">
                                                 <a href="decode">
                                                     <%=menus.get("MENU").get("DECODE_KEY")%>
                                                 </a>
                                             </li>
                                                
                                        </ul>
                                    </div>
                                    
                                    
                                    <div class="menu-sm" onclick="toggleSubmenu(this)" ng-if="uAccess.DATASCHEMA || uAccess.MARKETPLACE || uAccess.PROVLIST || uAccess.MYCONDATA" id="datafedmenu-mob">
                                        <a href="">
                                            <%=menus.get("MENU").get("TRANSACTIONS")%>
                                        </a>
                                        <ul class="sm-submenu">
                                            <li><a href="billingdashboard"><%=menus.get("MENU").get("BILLING_DASH")%></a></li>
											<li><a href="transactions"><%=menus.get("MENU").get("TRANSACTIONS")%></a></li>
											<li><a href="invoice"><%=menus.get("MENU").get("BILLING_INV")%></a></li>
                                        </ul>
                                    </div>
                                    
                                    <%-- <div class="menu-sm" id="pageprofile"><a href="urlindexing"><%=menus.get("MENU").get("MENU_PAGE")%>
                                        </a>

                                        <div class="menu-sm" onclick="toggleSubmenu(this)" id="vivien">
                                            <a href="">
                                                <%=menus.get("MENU").get("MENU_VIVIEN")%>
                                            </a>
                                            <ul class="sm-submenu">
                                                <li>
                                                    <a target="_blank" href="http://sentient.io/samples/vivien/?s=v">
                                                        <%=menus.get("MENU").get("MENU_VIV_VO")%>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a target="_blank" href="http://sentient.io/samples/vivien/?s=t">
                                                        <%=menus.get("MENU").get("MENU_VIV_TXT")%>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                    			</div> --%>
                    		</div>	
                </div>
                <header class="mainHeader container-fluied" id="topMenu" style="display: none;">
                    <div class="tpMenu">
                        <div class="catalog-menu">
                            <div class="row header-row-margine">
                                <div class="top_first1">
                                    <div class="dashLogo1" style="display: inline-block;">

                                        <li>
                                            <div style="padding-bottom: 17px; padding-right: 10px;">
                                         <img class="padding0" style="padding-right:20px;" src="resources/images/menu-icon.png">
                                            </div>
                                                <ul style="max-height: 500px;overflow-y: auto; padding:0!important;" class="list-unstyled subMenu1 subMenu porfile-submenu1">
                                                    <li class="mobile-menu" style="margin: 0px"> 
                                                        <ul>
                                                    <li class="mob-profile" style="margin-left: 15px;margin-right: 15px;">
                                                                <div class="profile-icon1"> 
                                                                        <i class="fa fa-user" ></i>
                                                                    </div>
                                                           <div class="profile-data1" style="max-width: 144px;"> 
                                                            <div class="uName" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;"><%=(String)session.getAttribute("userName")%></div>
                                                            <div class="uOrg" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;"><%=(String)session.getAttribute("orgName")%> </div>
                                                          </div>
                                                                 
                                                             </li>
                                                            </ul>
                                                            </li>
                                                       
                                                  
                                                            <li class="ai-bg" id="dash" style="margin-top: 0px!important">
                                                                <a href="catalog" style="margin: 0px">
                                                                    <img style="display: inline-block; width: auto;height: 30px" src="resources/images/Ai.png" >
                                                                  <!-- <span class="ai-list"> ai & data</span> -->
                                                                  <p class="li-client" style="display: block; font-size: 15px">AI services and solutions</p >
                                                                </a>
                                                            </li>  
                                                            <li id="da" ng-if="uAccess.MARKETPLACE">
                                                                <a href="marketplace" style="margin: 0px">
                                                                        <img style="display: inline-block; width: auto;height: 30px" src="resources/images/menu2.png">   
                                                                        <p class="li-client" style="display: block; font-size: 15px">Buy and sell data securely</p >
                                                                </a>
                                                            </li> 
                                                            <li id="client" ng-if="uAccess.BROTHER" style="margin-bottom: 0px!important">
                                                                <a href="promolist" style="margin: 0px">
                                                                    <img style="display: inline-block; width: auto;height: 30px" src="resources/images/co-lab.png">   
                                                                  <p class="li-client" style="display: block; font-size: 15px">Brother</p >
                                                                </a>
                                                            </li>
                                                    <li class="mobile-menu" style="margin: 0px"> 
                                                        <ul>
                                                    
                                                                 <%if(orgType.equalsIgnoreCase("main")){%>
                                                                    <li id="orgz">
                                                                        <a href="addorg"><div class="menu-icons"><i class="fa fa-sitemap"></i></div>
                                                                            <%=menus.get("MENU").get("MENU2")%>
                                                                        </a>
                                                                    </li>
                                                                    <%}else{ %>
                                                                        <li ng-if="uAccess.ORG_GETUSERLIST || uAccess.ORG_GETORGASSIGNFUNCTIONS || uAccess.ORG_GETORGROLELIST || uAccess.ORG_GETORGGROUPLIST || uAccess.ORG_GETORGTAGS" id="orgz">
                                                                            <a href="orgdetails"><div class="menu-icons"><i class="fa fa-sitemap"></i></div>
                                                                                <%=menus.get("MENU").get("MENU2")%>
                                                                            </a>
                                                                        </li>
                                                                        <%} %>
                    
                                                                            <li>
                                                                                <a href="transactions"><div class="menu-icons"><i class="fa fa-exchange"></i></div>                                                                                 
                                                                                    <%=menus.get("MENU").get("TRANSACTIONS")%>
                                                                                </a>
                                                                            </li>
                                                                            <li><a href="invoice"><div class="menu-icons"><i class="fa fa-calculator"></i></div>
                                                                                <%=menus.get("MENU").get("BILLING_INV")%></a></li>
                                                                            <li>
                                                                                <a href="creditmanagement"><span class="menu-icons"><i class="fa fa-credit-card"></i></span>                                                                                 
                                                                                    <%=menus.get("MENU").get("CREDITEXPIRY")%>
                                                                                </a>
                                                                            </li>
                                                                            
                                                                            <li ng-if="uAccess.ORG_LOGINHISTORY" id="orgz">
                                                                                <a href="useractivity"><div  class="menu-icons"><i class="fa fa-tasks"></i></div>                                                                             
                                                                                    <%=menus.get("MENU").get("USER_ACTIVITY")%>
                                                                                </a>
                                                                            </li>
                                                                            <li id="orgz">
                                                                                <a href="apidashboard"><div class="menu-icons"><i class="fa fa-connectdevelop"></i></div>
                                                                                    <%=menus.get("MENU").get("API_DASHBOARD")%>
                                                                                </a>
                                                                            </li>
                                                                            <li><a href="logout" style="cursor:pointer"><div class="menu-icons"><i class="fa fa-power-off"></i></div>
                                                                                <span class="uOrg">Logout</span></a>
                                                                                </li>
                                                                                </ul>
                                                                                </li>                                                       
                                                </ul>
                                            </li>
                                             
                           
                                            
                                            <a href="dashboard"><img class="web-logo" style="width:193px; padding-left:15px;" src="resources/org/images/logo.png" alt="" /></a>
                                            <a href="dashboard"><img class="mob-logo" style="width:67px; padding-left:15px; padding-bottom: 5px" src="resources/org/images/mob-logo.png" alt="" /></a>
                                            <img style="width:126px!important; display:none; padding-left:15px; padding-bottom: 3px;" src="resources/images/Ai.png" id="menuiconAI">
                                            <img style="width: 170px!important; display:none;padding-bottom:3px; padding-left:15px;" src="resources/images/menu2.png" id="menuiconDA">
                                    </div>
                                </div>


                                <div class="hidden-xs hidden-sm">
                                   
                                </div>
                                <div class="pull-right top-right-icons" style="margin-right:29px;margin-top: 4px;margin-bottom: 5px;">
                                    <li class="acc-bal">
                                        <div style="margin-right: 15px; position: relative; top: -10px; display: none;" id="showPriceTag">
                                            <span class="moneydollar" aria-hidden="true">S</span>
                                           	<span class="font-weight-bold" id ="accBalance">0</span>
                                        </div>
                                    </li>
                                    <li>

                                    <li class="profile-content1">                                  
                                            <div class="profile-icon1"> 
                                                    <i class="fa fa-user" ></i>
                                                </div>
                                       <div class="profile-data1" style="width: 160px;"> 
                                            <div class="uName" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;"><%=(String)session.getAttribute("userName")%></div>
                                            <div class="uOrg" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;"><%=(String)session.getAttribute("orgName")%> </div>
                                      </div>
                                        
                                        <ul class="list-unstyled subMenu porfile-submenu">
                                	    		<li>
                                                    <a href="myaccount"><div class="menu-icons"><i class="fa fa-user-o"></i></div>                                                                                 
                                                        <%=menus.get("MENU").get("MY_ACCOUNT")%>
                                                    </a>
                                                </li>

                                                <%if(orgType.equalsIgnoreCase("main")){%>
                                                    <li id="orgz">
                                                        <a href="addorg"><div class="menu-icons"><i class="fa fa-sitemap"></i></div>
                                                            <%=menus.get("MENU").get("MENU2")%>
                                                        </a>
                                                    </li>
                                                    <%}else{ %>
                                                        <li ng-if="uAccess.ORG_GETUSERLIST || uAccess.ORG_GETORGASSIGNFUNCTIONS || uAccess.ORG_GETORGROLELIST || uAccess.ORG_GETORGGROUPLIST || uAccess.ORG_GETORGTAGS" id="orgz">
                                                            <a href="orgdetails"><div class="menu-icons"><i class="fa fa-sitemap"></i></div>
                                                                <%=menus.get("MENU").get("MENU2")%>
                                                            </a>
                                                        </li>
                                                        <%} %>
    
                                                            <li>
                                                                <a href="transactions"><div class="menu-icons"><i class="fa fa-exchange"></i></div>                                                                                 
                                                                    <%=menus.get("MENU").get("TRANSACTIONS")%>
                                                                </a>
                                                            </li>
                                                            <li><a href="invoice"><div class="menu-icons"><i class="fa fa-calculator"></i></div>
                                                                <%=menus.get("MENU").get("BILLING_INV")%></a></li>
                                                            <li>
                                                                <a href="creditmanagement"><span class="menu-icons"><i class="fa fa-credit-card"></i></span>                                                                                 
                                                                    <%=menus.get("MENU").get("CREDITEXPIRY")%>
                                                                </a>
                                                            </li>
                                                            
                                                            <li ng-if="uAccess.ORG_LOGINHISTORY" id="orgz">
                                                                <a href="useractivity"><div  class="menu-icons"><i class="fa fa-tasks"></i></div>                                                                             
                                                                    <%=menus.get("MENU").get("USER_ACTIVITY")%>
                                                                </a>
                                                            </li>
                                                            <li id="orgz">
                                                                <a href="apidashboard"><div class="menu-icons"><i class="fa fa-connectdevelop"></i></div>
                                                                    <%=menus.get("MENU").get("API_DASHBOARD")%>
                                                                </a>
                                                            </li>
                                                            <li><a href="logout" style="cursor:pointer"><div class="menu-icons"><i class="fa fa-power-off"></i></div>
                                                                <span class="uOrg">Logout</span></a>
                                                                </li>
                                        </ul>
                                    </li>
                                    <!-- <div><span>ADMIN</span></div> -->
                                    <!-- <li class="settings_cog"><a href=""><i class=" fa fa-cog"></i></a>
                                        <ul class="list-unstyled subMenu">
                                            <%if(orgType.equalsIgnoreCase("main")){%>
                                                <li id="orgz">
                                                    <a href="addorg">
                                                        <%=menus.get("MENU").get("MENU2")%>
                                                    </a>
                                                </li>
                                                <%}else{ %>
                                                    <li ng-if="uAccess.ORG_GETUSERLIST || uAccess.ORG_GETORGASSIGNFUNCTIONS || uAccess.ORG_GETORGROLELIST || uAccess.ORG_GETORGGROUPLIST || uAccess.ORG_GETORGTAGS" id="orgz">
                                                        <a href="orgdetails">
                                                            <%=menus.get("MENU").get("MENU2")%>
                                                        </a>
                                                    </li>
                                                    <%} %>

                                                        <li id="orgz">
                                                            <a href="apidashboard">
                                                                <%=menus.get("MENU").get("API_DASHBOARD")%>
                                                            </a>
                                                        </li>
                                        </ul>
                                    </li> -->
                                    <li>

                                        <!-- <li class="settings_cog"><a href=""><i class="fa fa-ellipsis-v"></i></a>
                                            <ul class="list-unstyled subMenu">
                                                <li class="userDets">
                                                    <a style="color:#286090!important; cursor:auto;">
                                                        <i class="fa fa-user" style="width:30px;"></i>
                                                        <span class="uName"><%=(String)session.getAttribute("userName")%></span></a>
                                                </li>
                                                <li><a style="color:#286090!important;cursor:auto;"><i class="fa fa-group" style="width:30px;"></i>
                                                    <span class="uOrg"><%=(String)session.getAttribute("orgName")%> </span></a>
                                                </li>
                                               
                                                <li><a href="logout" style="cursor:pointer"><i class="fa fa-sign-out" style="width:30px;"></i>
                                                    <span class="uOrg">Logout</span></a>
                                                    </li>

                                            </ul>
                                        </li> -->


                                        <!-- <li class="settings_cog ham-icon">
                                            <span class="visible-sm visible-xs hidden-md ">
							<i class="fa fa-bars"> </i> -->
						</span>
                                        </li>
                                    </li>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                
                
				<section>
                    <div class="top-ribbon-green">
                        <a href="marketplace"><span ng-if="uAccess.MARKETPLACE" type="button" id="mplace"><%=menus.get("MENU").get("MARKETPLACE")%></span></a>                    
                            <a href="dataset"><span ng-if="uAccess.DATASCHEMA" type="button" id="dataset"><%=menus.get("MENU").get("DATA_SCHEMA")%></span></a>
                            <a href="contract"><span ng-if="uAccess.PROVLIST" type="button" id="sellcont"><%=menus.get("MENU").get("CONTRACT")%></span></a>
                            <a href="mycontract"><span ng-if="uAccess.MYCONDATA" type="button" id="buycont"><%=menus.get("MENU").get("MY_CONTRACT")%></span></a>
                            <!-- <span id="tools"><a href="javascript:;">Tools</a></span> -->
                            <%-- <a href="keys"><span type="button" id="keypair"><%=menus.get("MENU").get("GENERATE_KEYS")%></span></a>
                            <a href="encode"><span type="button" id="enctext"><%=menus.get("MENU").get("ENCODE_KEY")%></span></a>
                            <a href="decode"><span id="detext"><%=menus.get("MENU").get("DECODE_KEY")%></span></a> --%>

                           
                            <div class="tools-list dropdown" id="toolsdrop" style="display: none">
                                <span class="tool dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                  Tools
                                  <span class="caret"></span>
                                </span>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                  <li><a href="keys" target="_blank">Generate PKI Key-pair</a></li>
                                  <li><a href="encode" target="_blank">Encrypt Text</a></li>
                                  <li><a href="decode" target="_blank">Decrypt Text</a></li>
                                  <!-- <li role="separator" class="divider"></li>
                                  <li><a href="#">Separated link</a></li> -->
                                </ul>
                              </div>
                              
                        </div>
                            </section>
<%}%>
                            <!-- <section >
                            <div class="top-ribbon">
                                    <span id="solution" class="active" type="button" ng-click="setMenu('S')"><a href="dashboard">Solutions</a></span>
                                    <span id="micro-service" type="button" ng-click="setMenu('M')"><a href="dashboard">Microservices</a></span>
                                </div>
                                </section> -->