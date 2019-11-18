<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("MARKETPLACE"));

String publicKey = session.getAttribute("publicKey").toString();


String API_MARKET_PLACE = APIUtil.API_MARKET_PLACE;
String API_ADD_CONTRACT = APIUtil.API_ADD_CONTRACT;
String API_CONTRACT_LIST = APIUtil.API_CONTRACT_LIST;
String API_NON_OPENDATASET = APIUtil.API_NON_OPENDATASET;
String API_GET_DA_SETTING = APIUtil.API_GET_DA_SETTING;
String API_DA_GETEMAILID = APIUtil.API_DA_GETEMAILID;
String API_DA_AVAILABLECONTRACTS = APIUtil.API_DA_AVAILABLECONTRACTS;



int loginUsrId = (int) session.getAttribute("id");
%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var API_MARKET_PLACE = "<%=API_MARKET_PLACE%>";
var API_ADD_CONTRACT = "<%=API_ADD_CONTRACT%>";
var API_CONTRACT_LIST = "<%=API_CONTRACT_LIST%>";
var API_NON_OPENDATASET = "<%=API_NON_OPENDATASET%>";
var API_GET_DA_SETTING = "<%=API_GET_DA_SETTING%>";
var API_DA_GETEMAILID = "<%=API_DA_GETEMAILID%>";
var API_DA_AVAILABLECONTRACTS = "<%=API_DA_AVAILABLECONTRACTS%>";

var publicKey = "<%=publicKey%>";
var loginUsrId = <%=loginUsrId%>;


</script>
<style>
	.mt-5{
		margin-top:5px;
	}
	.card-wrap{
		max-width: 100%;
    /* white-space: nowrap; */
    overflow: hidden;
    text-overflow: ellipsis;
    /* display: inline-block; */
    height: 54px;
    font-size: 18px;
	font-weight: bold;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
	}
	.cardPanelHeight{
		min-height: 450px;
	}
	.rowLR{
		margin-left: 0px!important;
		margin-right:0px!important;
	}
	/* .list-view-panel{
		display: none;
	}
	.gridButton{
		display: none;
	} */
	.on {
  color: white;
  background-color: #ccc;
}
.gridButton .listButton{
	font-size: 35px;
}
.gridButton,.listButton{
	padding: 7px 7px;
	background-color:#54565f;
	color: #FFFFFF;
    border-radius: 3px;
    /* margin-right: 13px; */
    line-height: 2.6;
     font-size: 15px;
    margin-right: 10px;
	cursor: pointer;
	float: right;
	}
	
	.alignText{
		text-align: right;
	}
	.purchasBtn{
	background-color: #96ca4e;
    padding: 5px;
    color: white;
	border-radius: 5px;
	cursor: pointer;
	}
	
	.purchasBtn2{
	background-color: #e65f75;
    padding: 5px;
    color: white;
	border-radius: 5px;
	cursor: pointer;
	}
	
	.form-group{
		margin-bottom: 0px!important;
	}
	.fa-calendar, .input-group-addon{
		background-color: white !important;
    /* color: #96ca4e; */
	}
	.date-picker-range{
		border-top-left-radius: 0px;
		border-bottom-left-radius: 0px;
		background: #fff;
		cursor: pointer;
		padding: 5px 10px;
	}
	.dateElm{
		display: inline-block;
	}
	.toggle-container{
		padding-top: 10px;
    /* padding-right: 35px; */
    margin-right: 6px;
    padding-left: 35px;
	}
	.toggle-grid,.toggle-list{
		display: inline-block;
	}
	.toggle-list{
		display: none;
	}
	.clearfix{
		clear: both;
	}
	.optionDisale{
  color:#aaa !important;
}

.optionActive{
  color:#555 !important;
}

option:not(first-child) {
  color: #000;
}
.click-more{
color:#03A9F4;
}
.fa-tag{
color: #8e2e10;
font-size: 18px!important;
}
.fa-download{
color:#8e2e10;
 font-size: large!important;
}	
.Symbol{
    /* color: white; */
	padding: 10px 5px 10px 10px;
    font-weight: bold;
		border-radius: 5px;
		white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.count-record{
background: #f6f6f6;
    /* color: white; */
	padding: 10px 5px 10px 10px;
    font-weight: bold;
		border-radius: 5px;
		white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    }
.count-record-modal{
	color:#4f5671;
	background: #f6f6f6;
	/* padding: 10px 5px 10px 10px; */
	/* padding: 8px 5px 8px 10px; */
	padding: 5px 5px 5px 10px;
  	/* font-size: 18px; */
	border-radius: 5px;
	/* white-space: nowrap; */
    overflow: hidden;
    text-overflow: ellipsis;
} 
    .marginBottom10{
    margin-bottom: 10px;
}
.price{
  display: inline-block;
    padding: 5px 10px;
    border-radius: 5px;
    background:#8BC34A;
    margin-top: 7px;
    color: white;
    width: 100%;
    text-align: center;
}
.price>h4{
  margin-top:0px;
}
.fa-money{
color: white;   

}
.price-part{
 text-align:left;
  padding-top: 10px;
}
.fa-box-open{
font-size: large!important;
color: #e49725;
}
.panel-heading h4{
	font-size: 24px!important;
}
.panel-heading h4:hover{
text-decoration-line: underline;
}
.btn100{
	min-width: 205px!important;
}

.support-btn a{
	/* color: #333!important; */
	color: #4f5671;
}

.support-btn a:hover{
	/* color: #333!important; */
	color: #4f5671;
}
.btn-center1{
	background: #96ca4e;
    color: rgb(255, 255, 255);
    width: auto;
    margin-top: 2px;
}
.btn-center1:hover{
background: #69a72d;
color:white;
}
.btn:focus{
	color:white!important;
}
.btn:hover{
	color:white!important;
}
.card-popup{
	width: 70%;
	padding:30px;
}
.btn-box{
	-webkit-box-shadow: 0px 0px 6px -2px rgba(0,0,0,0.4);
-moz-box-shadow: 0px 0px 6px -2px rgba(0,0,0,0.4);
box-shadow: 0px 0px 6px -2px rgba(0,0,0,0.4);
}
.btn1{
	display: inline-block;
    padding: 12px 13px;
    margin-bottom: 0;
   /*  font-size: 18px; */
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
	border-radius: 4px;
	background-color: #54565f;
}
.marginTop15{
margin-top:15px;
}
.margintop30{
	margin-top: 30px;
}

/* horizondal progress */

.container-progress {
    position: relative;
    margin-top: 20px;
	margin-bottom: 20px;
	width:400px;
	margin: 20px auto;
}

    .container-progress h1 {
        color: #fff;
        margin: 15px;
        padding: 15px;
    }

    .container-progress .main .progress {
        margin: 22px 0;
    height: 10px;
        background-color: #eeeeee;
    }

        .container-progress .main .progress .progress-bar {
            height: 15px;
            color: #eeeeee;
        }

    .container-progress .main .progreso1 {
        transition-delay: 4s;
        transition: all 0.45s ease-in-out;
        width: 33%;
        animation: 0.5s;
        background-color: #e7eecb;
    }

@media (max-width: 768px) {
    .container-progress .main .progreso1 {
        width: 33%;
    }
}

.container-progress .main .progreso2 {
    width: 66%;
    animation: 0.5s;
    background-color: #e7eecb;
    transition: all 0.45s ease;
}

@media (max-width: 768px) {
    .container-progress .main .progreso2 {
        width: 66%;
    }
}

.container-progress .main .progreso3 {
    width: 97%;
    animation: 0.5s;
    background-color: #e7eecb;
    transition: all 0.45s ease;
}
.container-progress .main .progreso4 {
    width: 100%;
    animation: 0.5s;
    background-color: #e7eecb;
    transition: all 0.45s ease;
}
.container-progress .main .progreso5 {
    width: 100%;
    animation: 0.5s;
    background-color: #e7eecb;
    transition: all 0.45s ease;
}		
.container-progress .main .block1 {
    position: absolute;
    margin: 0 0%;
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    /* width: 160px; */
	width: 100px;
    text-align: center;	
    margin-left: -80px;
    top:-38px;
    padding: 4px;
    color: #939393;
}

.container-progress .main .block1 .text-center,
.container-progress .main .block2 .text-center,
.container-progress .main .block3 .text-center,
.container-progress .main .block4 .text-center,
.container-progress .main .block5 .text-center,
.container-progress .main .block6 .text-center{
    margin-left: 60px;
}

.container-progress .main .block2 {
    position: absolute;
    /* margin: 0 20%; */
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    /* width: 160px;	 */
	width: 100px;
    margin-left: -80px;
    text-align: center;
    /* top: -20px; */
	top:-38px;
    padding: 4px;
	left: 33%;
	color: #939393;
}

@media (max-width: 768px) {
    /* .container-progress .main .block2 {
        margin: 0 20%;
    } */
}

.container-progress .main .block3 {
    position: absolute;
    /* margin: 0 40%; */
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    /* width: 160px; */
	width: 100px;
    text-align: center;
    margin-left: -60px;           /* margin-left: -80px; */
    /* top: -20px; */
	top:-38px;
    padding: 4px;
	left: 60%;
	color: #939393;
}

@media (max-width: 768px) {
    .container-progress .main .block3 {
        margin: 0 40%;
    }
}

.container-progress .main .block4 {
    position: absolute;
    /* margin: 0 60%; */
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    /* width: 160px; */
	width: 100px;
    text-align: center;
    margin-left: -80px;
    /* top: -20px; */
	top:-38px;
    padding: 4px;
	left: 97%;
	color: #939393;
}


@media (max-width: 570px) {
    /* .container-progress .main .block4 {
        left: 60% !important;
    } */
}

@media (max-width: 768px) {
    /* .container-progress .main .block4 {
        margin: 0 60%;
        margin-top: 85px;
    } */
}


.container-progress .main .circulo {
    border-radius: 50%;
    height: 30px;
    width: 30px;
    background-color: white;
    top: 0px;
    margin: 6px;
    border: solid 4px #eee;
}

.container-progress .main .fa-check {
    font-size: 14px;
    color: #adc548;
    padding: 2.5px;
}

.container-progress .main .activeblock2 {
    position: absolute;
    /* margin: 0 33.33333%; */
    border-radius: 50%;
	height: 87px;
    width: 160px;
	top: -20px;
    text-align: center;
    margin-left: -80px;
    padding: 4px;
	left: 33%;
	margin-left: -80px;
}

.container-progress .main .activeblock3 {
    position: absolute;
    /* margin: 0 65%; */
    border-radius: 50%;
    height: 87px;
    width: 160px;
	top: -20px;
    text-align: center;
    margin-left: -80px;
    padding: 4px;
	left: 66%;
	margin-left: -80px;
}

.container-progress .main .activeblock4 {
    position: absolute;
    /* margin: 0 95.5%; */
    border-radius: 50%;
    height: 87px;
    width: 160px;
	top: -20px;
    text-align: center;
    margin-left: -80px;
    padding: 4px;	
	left: 97%;
	margin-left: -80px;
} 
.container-progress .main .activeblock5 {
    position: absolute;
    /* margin: 0 95.5%; */
    border-radius: 50%;
    height: 87px;
    width: 160px;
	top: -20px;
    text-align: center;
    margin-left: -80px;
    padding: 4px;	
	left: 78%;
	margin-left: -80px;
} 
.container-progress .main .activeblock6 {
    position: absolute;
    /* margin: 0 95.5%; */
    border-radius: 50%;
    height: 87px;
    width: 160px;
	top: -20px;
    text-align: center;
    margin-left: -80px;
    padding: 4px;	
	left: 98%;
	margin-left: -80px;
} 

.container-progress .main .activecirculo {
    border-radius: 50%;
    height: 30px;
    width: 30px;
    /* background-color: #cfb189; */
    border: 4px solid #adc548;
    margin: 6px;
	margin-left: 60px;
}
.dollar-sign{
	font-size: 12px !important;
    background: #cbab80;
    color: #fbe96a;
	border: 2px solid #fbe96a;
    border-radius:50%;
    /* width: 20px; */
    /* padding: 3px; */
    /* height: 20px; */
    text-align: center;
    /* line-height: 22px !important; */
    /* text-align: center; */
    padding: 2px 5px 2px 6px;
  
}

@media (min-width: 992px){
/* .container-progress {
    width: 600px;
} */
}
@media (min-width: 1200px){
/* .container-progress  {
    width: 600px;
} */
}
@media only screen and (min-width: 924px) and (max-width: 991px) {
	.container-progress .main .block1,
	.container-progress .main .block2,
	.container-progress .main .block3,
	.container-progress .main .block4,
	.container-progress .main .block5,
	.container-progress .main .block6,
	.container-progress .main .activeblock2,
	.container-progress .main .activeblock3,
	.container-progress .main .activeblock4,
	.container-progress .main .activeblock5,
	.container-progress .main .activeblock6{
		width: 130px;
		top:-60px;
		margin-left: -50px;
	}
	.container-progress .main .block1 .text-center, 
	.container-progress .main .block2 .text-center, 
	/* .container-progress .main .block3 .text-center,  */
	.container-progress .main .block4 .text-center, 
	.container-progress .main .block5 .text-center, 
	.container-progress .main .block6 .text-center {
    margin-left: 40px;
}

}
@media only screen and (max-width: 990px){
	.buy-btn-res{
		/* top: 64%; */
		margin-top:10px!important;
	}
	.table-res{
		padding-top:30px!important;
		margin-top: 55px!important;
	}
}
@media only screen and (min-width: 720px) and (max-width: 862px) {
	/* .container-progress {
        width: 600px;
} */
}

@media only screen and (min-width: 420px) and (max-width: 719px) {
	/* .container-progress {
        width: 500px;
} */
}

@media only screen and (min-width: 430px) and  (max-width: 520px) {
	.container-progress {
        width: 320px;
}
}
@media only screen  and  (max-width: 429px) {
	.container-progress {
        width: 250px;
}
.container-progress .main .block3 .text-center{
	margin-left: 45px
}
}

@media only screen and (min-width: 420px) and (max-width: 923px) {
	.container-progress .main .block1,
	.container-progress .main .block2,
	.container-progress .main .block3,
	.container-progress .main .block4,
	.container-progress .main .block5,
	.container-progress .main .block6,
	.container-progress .main .activeblock2,
	.container-progress .main .activeblock3,
	.container-progress .main .activeblock4,
	.container-progress .main .activeblock5,
	.container-progress .main .activeblock6{
		width: 100px;
		top:-60px;
		margin-left: -50px;
	}
	.container-progress .main .block1 .text-center, 
	.container-progress .main .block2 .text-center, 
	/* .container-progress .main .block3 .text-center,  */
	.container-progress .main .block4 .text-center, 
	.container-progress .main .block5 .text-center, 
	.container-progress .main .block6 .text-center {
    margin-left: 30px;
}
.container-progress .main .block3 .progress-text {
	left:27px !important;
}
}
	


/**
This is just to test, but you don't need it.
*/
.next {
    margin-top: 50px;
}
.next .next2 {
        display: none;
    }
    .next .next3 {
        display: none;    }
	.next .next4 {
        display: none;
    }
	.next .next5 {
        display: none;
    }
	
	.fa-check-circle{
    text-align: center;
    font-size: 4rem;
	background: #adc548;
    border-radius: 50%;
    /* padding: 10px; */
    color: white;
    border: 3px solid #adc548;
	}

	.checkSuccess{
	width: 64px;
    border-radius: 50px;
    height: 64px;
    vertical-align: middle;
    display: inline-block;
    padding: 9px;
	background: #e7eecb;
		}

		.large-modal-lg{
			width: 750px!important;
		}
		.color-in-para{
			color:#cbab80;
		}
		.para-text{
			font-size: 16px!important;
		}
	.fa-refresh{
	font-size:4.5rem!important;
    /* background: #2f8f5a; */
    border-radius: 50%;
    background-color: #e7eecb;
    padding: 7px 10px 8px 10px;
    line-height: 1;
    color: green;
    vertical-align: middle;
		}
		.upgrade-text{
			font-size: 3rem;
    vertical-align: middle;
    font-weight: bold;
		}
		.cancel-btn:hover{
			color: #5e0000!important;
			background: white!important;
		}
	.cancel-btn:hover{
		color: #5e0000!important;
			background: white!important;
	}
	.cancel-btn:active{
		color: #5e0000!important;
			background: white!important;
			box-shadow:none!important;
	}
	/* ------------------------ */
	.progress-text{
	position: absolute;
    width: 108px;
    left: 27px; 
	}
.circle-in{
font-size: 18px!important; 
line-height: 1.3!important; 
color:#a8b67c!important;
}
@media only screen and  (max-width: 918px) {
	.progress-text{
	position: relative;
    left: 0px;
		width: auto;
	}
}
/*modal For large*/
@media only screen and (min-width: 768px) and (max-width: 991px) {
	.modal-dialog {
    width: 750px !important;
    margin: 58px auto !important;
}
}
.credits{
    border-radius: 5px;
	display: inline-block;
}
.fa-exclamation-circle{
	font-size: 49px!important;
    color: #d02f30!important;
    vertical-align: middle!important;
}
.alert-icon{
	padding: 21px 10px 24px 10px!important;
	/* padding: 9px 8px 12px 9px!important; */
    /* border: 1px solid gray; */
    border-radius: 50%;
    vertical-align: middle;
	background: #f9e4e4;
}
.label-item{
	color:#a6a6a6;
	 /* font-size: 16px; */
	 max-width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	display: inline-block;
	height: 25px;
}
.field{
	/* font-size: 16px; */
	color: #7a7a7a;
	max-width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	display: inline-block;
	height: 25px;
}
.paddingLR50{

	padding-left: 80px!important;
	padding-left: 80px!important;
}
.mony{
	font-size: 25px;
	 color: #9caa66; 
	 vertical-align: middle;
	 line-height: 1.8;
}

	.label-item-model{
	padding: 5px 5px;
	}
	
	.label-item-model>span{
		font-size:12px;
	}
	.country-block{
		color:#4f5671!important;
		height: auto;
	}

	@media (min-width: 564px){
.daterangepicker .drp-calendar.left .calendar-table {
	padding-right: 12px;
}
}

/*FOR FILTER MEDIA*/
@media screen and (max-width: 991px){
.filter-title,.filter-opt,.date-opt{
	margin-bottom: 10px !important;
}
}
@media screen and (max-width: 767px){
.filter-opt select{
	width: 50% !important;
}
}
/*----------------------*/
</style>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Sentient</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/New-style.css">
  
	<link rel="stylesheet" href="resources/css/search.css">
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
    rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />

    <link rel="stylesheet" href="resources/css/datafed_style.css">
  	<link rel="stylesheet" href="resources/css/market.css">

  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
		
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
	<body ng-app="datafedApp" id="scrollCtrl" ng-controller="marketplaceController" ng-cloak style="background: #f6f6f6">
		<jsp:include page="new_header.jsp"></jsp:include>

		<div class=" container-fluid paddingLR30 padding0" style="margin-top: 130px;"> 
		      <div class="row btn_bg"style="margin-top:20px;padding-left: 20px; margin-right: 0px; background-color:#dfdfdf!important; margin-left: 0px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
		        <div class="col-xs-12 col-sm-12 col-md-1 paddingLeft filter-title">
				  <h4 style="color: #7a7a7b; text-align: left;">Filters</h4>
				</div>
				<div>
		        <div class="col-xs-12 col-sm-12 col-md-7 paddingRight padding0 filter-opt" style="z-index: 0;">
		        	<div style="background: #FFFFFF;border-top-left-radius: 5px !important;
							border-bottom-left-radius: 5px !important;">
		          <div class="input-group my-group" style="width: 100%">

		            <!-- <span class="mark-filter input-group-btn">
		              <i class="fa fa-filter"></i>
		            </span> -->
		            
		            <select class="form-control select-form-control border-class optionDisale" ng-model="countryname" ng-change="filterAllData()" >
	                  <option value="">Country</option>
		              <option ng-repeat="cntry in countriesListObj" value="{{cntry.code}}">{{cntry.name}}</option>
		              <option value="SG">Singapore</option>
		              <option value="JP">Japan</option>
		            </select>
		            
		            <select class="form-control select-form-control border-class optionDisale" ng-model="type" ng-change="filterAllData()" >
						<option value="">Type</option>
						<option ng-repeat="schTyp in schemaTypes" value="{{schTyp.value}}">{{schTyp.value}}</option>

		            </select>
		            
		            <select class="form-control select-form-control border-class optionDisale" ng-model="category" ng-change="filterAllData()" >
		              <option value=""><%=lbl.get("MARKETPLACE").get("SELECT_CATEGORY")%></option>
		              <option ng-repeat="catagery in categoryOptions" value="{{catagery.value}}">{{catagery.value}}</option>
		            </select>

		            <select class="form-control select-form-control border-class optionDisale" ng-model="dataProvider" ng-change="filterAllData()" style="border-top-right-radius: 0;border-bottom-right-radius: 0">
		              <option value=""><%=lbl.get("MARKETPLACE").get("SELECT_PROVIDER")%></option>
		              <option ng-repeat="provider in dataProviderOptions" value="{{provider}}">{{provider}}</option>
	                </select>
					</div>
				  </div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-3 padding0 date-opt" style="text-align: left;">
				<div id="reportrange" class="form-control select-form-control border-class" style="text-align: left;	border-top-left-radius: 0px; border-bottom-left-radius: 0px; cursor: pointer; border-left: 1px solid #ede7e7;">
						<i class="fa fa-calendar"></i>&nbsp;
						<div class="dateElm"></div> 
						<!-- <i class="fa fa-caret-down"></i> -->
				</div>
			</div>
				<div>
				<!-- <div class="col-sm-1 col-md-1 padding0">
				<span class="listButton"><i class=" fa fa-list"></i></sapn>
				</div>
							<div class="col-sm-1 col-md-1 padding0">
						<span class="gridButton"><i class="fa fa-th"></i></sapn>
						</div>	 -->

				</div>
			</div>
		      </div>
			  <!-- <div class="loadr" ng-show="loadeer"></div> -->
			  <div class="loading-container" ng-show="loadeer">
					<div class="loading">
					  <span>Loading...</span>
					</div>
				  </div>
			  <div ng-show="marketPlaceData.length == 0" style="padding: 10px; font-weight: bold; text-align: center;"><%=lbl.get("MARKETPLACE").get("NO_DATA")%></div>

				<!-- <div ng-hide="marketPlaceData.length == 0"  class="rowLR row cardPanelHeight box" when-scrolled="existingContarct()"> -->
				<div ng-hide="marketPlaceData.length == 0"  class="row cardPanelHeight ">
						<!-- <div class="toggle-container">
								<span class="listButton" ng-show="tableView" ng-click="setTableViewStatus()"><i class=" fa fa-list"></i></span>
								<span class="gridButton" ng-hide="tableView" ng-click="setTableViewStatus()"><i class="fa fa-th"></i></span>
								</div> -->
								<div class="clearfix"></div>
						<div style="padding-top:20px;">
		        <!-- <div class="col-md-4 col-sm-4 col-xs-12" ng-repeat="marketPlace in marketPlaceData  | orderBy: reverse:true"> -->
		        <div id="marketData" class="col-md-6 col-sm-6 col-xs-12  col-lg-4 grid-view-panel" ng-click="viewMore(marketPlace)" ng-hide="tableView" ng-repeat="marketPlace in marketPlaceData" style="cursor: pointer;">
		          <div class="market-card panel card-reaction">
					  <div class="">
		          	<div class="col-md-7 col-sm-7 col-xs-7" ng-click="viewMore(marketPlace)" style="cursor: pointer; padding-right:0;">
		            <div class="panel-heading" style="padding:0" ng-hide="marketPlace.Record.alreadypurchased">
					  <p class="card-header card-wrap" data-toggle="tooltip" title=" {{marketPlace.Record.name}}"> {{marketPlace.Record.name}}					   
					  </p>
		            </div> 
					</div>
					<div class="col-md-5 col-sm-5 col-xs-5 padding0" style="text-align: center;">
							   <!-- <span class="dollar-sign" aria-hidden="true">S</span> -->
							   <img style="width: 21px;" src="resources/images/dollar-img.png">
							   <span class="mony"> {{marketPlace.Record.price|  number:0}}</span>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<p class="card-text panel-heading marginTop10" style="padding:0;">
									{{marketPlace.Record.description.substr(0, 150)}}<span ng-show="marketPlace.Record.description.length > 150">...</span>
						</p>			
					</div>
				  </div>
				  <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
						<hr class="marginTop10">
				</div>
		            <div class="panel-body tab-pane">
		            <div>
		            
		            <div>

							<%-- <div class="col-md-4 col-sm-4 col-xs-4">
									<span class="click-more" data-toggle="modal" ng-click="viewMore(marketPlace)" data-schemaName="Bank 1" >
									   <%=lbl.get("MARKETPLACE").get("MORE")%> More info
									   </span>
								   </div> --%>

								  <div class="row" style="margin-left:0px; margin-right:0px; margin-top: 10px">										
							<div class="col-md-12 col-sm-12 col-xs-12 margintop10" style="padding-left:0;" >
									<!-- <div class="font-weight-bold marginbottom10"><%=lbl.get("MARKETPLACE").get("NUMBER_RECORDS")%>&nbsp;&nbsp;</div> -->
									<div class="col-md-4 col-sm-4 col-xs-4 padding0 label-item"><span>Records</span></div>
									<div class="col-md-8 col-sm-8 col-xs-8 padding0 field">	<span style="color: #7a7a7a;" ng-show="marketPlace.Record.recordcount > 0">{{marketPlace.Record.recordcount | number}}</span>
					<%-- <span ng-show="marketPlace.Record.recordcount < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span> --%>
					<span ng-show="marketPlace.Record.recordcount < 1">N/A</span>
									</div>
				  </div>

						<div class="col-md-12 col-sm-12 col-xs-12" style="display: inline-block; padding-left:0;">
							<div class="col-md-4 col-sm-4 col-xs-4 padding0 label-item"><span>Period</span></div>
					            <!-- <i class="fa fa-clock-o" aria-hidden="true"></i> -->
								<div class="col-md-8 col-sm-8 col-xs-8 padding0 field">
									<!-- <span>01 Mar 2019 - 31 Mar 2019 </span> -->
									<span ng-show="marketPlace.Record.fromdate < 10 && marketPlace.Record.fromdate > 0">0</span><span ng-show="marketPlace.Record.fromdate > 0">{{marketPlace.Record.fromdate}}</span><span ng-show="marketPlace.Record.fromdate > 0"></span><span ng-show="marketPlace.Record.frommonth > 0">{{getMonthName(marketPlace.Record.frommonth)}}</span><span ng-show="marketPlace.Record.frommonth > 0"></span><span ng-show="marketPlace.Record.fromyear > 0">{{marketPlace.Record.fromyear}}</span><span ng-show="marketPlace.Record.fromyear > 0 && marketPlace.Record.toyear > 0"> - </span><span ng-show="marketPlace.Record.todate < 10 && marketPlace.Record.todate > 0">0</span><span ng-show="marketPlace.Record.todate > 0">{{marketPlace.Record.todate}}</span><span ng-show="marketPlace.Record.todate > 0"></span><span ng-show="marketPlace.Record.tomonth > 0">{{getMonthName(marketPlace.Record.tomonth)}}</span><span ng-show="marketPlace.Record.tomonth > 0"></span><span ng-show="marketPlace.Record.toyear > 0">{{marketPlace.Record.toyear}}</span>
									<span ng-show="marketPlace.Record.fromyear < 1 && marketPlace.Record.toyear < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
							</div>
					  </div>
	                              
						
						 
		              <div class="col-md-12 col-sm-12 col-xs-12 " style="padding-left:0; margin-top: 0px;" title="{{marketPlace.Record.countryCode}}" >
							<!-- <div class="font-weight-bold marginbottom10"><%=lbl.get("MARKETPLACE").get("NUMBER_RECORDS")%>&nbsp;&nbsp;</div> -->
							<div class="col-md-4 col-sm-4 col-xs-4 padding0 label-item"> <span>Country</span></div>
							<div class="col-md-8 col-sm-8 col-xs-8 padding0 field"> 
							<span ng-repeat="cont in marketPlace.Record.countries | limitTo:4" ng-show="cont.code.length">{{cont.code}}<font ng-show="!$last">, </font></span>
							<span ng-if ="marketPlace.Record.countries.length > 4">...+{{marketPlace.Record.countries.length - 4}}</span>
							<span ng-show="!marketPlace.Record.countries.length">N/A </span>
							</div>
		  			</div>
				  
				      <div class="col-md-12 col-sm-12 col-xs-12 " style="padding-left:0;">
							<div class="col-md-4 col-sm-4 col-xs-4 padding0 label-item"><span><%=lbl.get("MARKETPLACE").get("SOURCE")%></span></div>
				      	<!-- <span ng-show="marketPlace.Record.samplefilelocation && marketPlace.Record.samplefilelocation !=''">
				      		<a ng-href="{{marketPlace.Record.samplefilelocation}}">
				      		<i class="fa fa-download" aria-hidden="true"></i></a>
			      		</span> -->
						  <div class="col-md-8 col-sm-8 col-xs-8 padding0 field"><span ng-show="marketPlace.Record.source !='' ">{{marketPlace.Record.source}}</span>
						<div ng-show="marketPlace.Record.source =='' "><%=lbl.get("MARKETPLACE").get("NA")%></div>
						</div>
					  </div>
					 
					  <div class="col-md-12" style="padding-left:0;" >
						<!-- <div class="font-weight-bold marginbottom10"><%=lbl.get("MARKETPLACE").get("NUMBER_RECORDS")%>&nbsp;&nbsp;</div> -->
						<div class="col-md-4 col-sm-4 col-xs-4 padding0 label-item"><span>Producer</span></div>
								<div class="col-md-8 col-sm-8 col-xs-8 padding0 field" style="color: #adc548;"> <span>{{marketPlace.Record.dataprovidername}}  </span>
		<!-- <span class="font-weight-bold">SG,IN..</span> -->
		<%-- <span ng-show="marketPlace.Record.recordcount < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span> --%>
								</div>
	  </div>
			
		              </div>
		               
	      			  	
	      			  <div class="row">		          
		              <div class="hover-change-items" style="height:15px">

						<div style="color:#9cab68; font-size: 16px;">
							<span ng-show="marketPlace.Record.category" style="text-align: left;">{{marketPlace.Record.category}}</span> 
							<span style="padding-left: 10px;"></span>
							<span ng-show="marketPlace.Record.type">{{marketPlace.Record.type}}</span>
							<!-- <span ng-show="marketPlace.Record.type == 'pos'">POS</span> 
							<span ng-show="marketPlace.Record.type == 'leads'">Leads</span> -->
							<span ng-show="!(marketPlace.Record.type)" style="text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							 
						</div>
				        
		              </div>
		              </div>	
		            </div>
		          </div>
				</div>
			</div>
				<div  ng-show="tableView" class="col-md-12" style="padding-bottom:45px">
					<div class=" table-responsive">				
								<table class="table table-striped table-hover box" >
								  <thead>
									<tr>
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("TH_NAME")%></th>
									  <!-- <th scope="col">Description</th> -->
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("SOURCE")%></th>
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("CREATED_DATE")%></th>
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("DATA_PROVIDER")%></th>
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("CATEGORY")%></th>
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("PRICE")%></th>
									  <th scope="col"><%=lbl.get("MARKETPLACE").get("ACTIONS")%></th>
									</tr>
								  </thead>
								  <tbody>
									<tr ng-repeat="marketPlace in marketPlaceData">
										<td ng-click="viewMore(marketPlace)" >{{marketPlace.Record.name}}</td>
										<td ng-click="viewMore(marketPlace)">{{marketPlace.Record.source}}</td>
										<td ng-click="viewMore(marketPlace)">
											{{marketPlace.Record.dateformatted}}
											<%-- <span class="" ng-show="marketPlace.Record.recordcount > 0">{{marketPlace.Record.recordcount | number}}</span>
											<span class="" ng-show="marketPlace.Record.recordcount < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span> --%>
										</td>
										<td ng-click="viewMore(marketPlace)">{{marketPlace.Record.dataprovidername}}</td>
										<td ng-click="viewMore(marketPlace)">{{marketPlace.Record.category}}</td>
										<td ng-click="viewMore(marketPlace)">{{marketPlace.Record.price | number:0}}</td>
										<td>
											<span>
												<a ng-show="marketPlace.Record.samplefilelocation !=''" class="font-weight-bold" style="color:#4f5671" ng-href="{{marketPlace.Record.samplefilelocation}}">
								      			<i class="fa fa-download" aria-hidden="true" data-toggle="tooltip" title="Download Sample Data"></i>			 
								      			</a>
							      			</span>
							      			<span ng-show="marketPlace.Record.samplefilelocation ==''"  style="min-width: 18px!important; display:inline-block;">&nbsp;&nbsp;</span>
							      			<i class="fas fa-cart-plus purchasBtn" aria-hidden="true" ng-show="!marketPlace.Record.purchased && !(afterPurchasedBtn && marketPlace.Record.name==tmpdsName)" ng-click="buyNow(marketPlace)"></i>
											<i class="fas fa-luggage-cart purchasBtn2" aria-hidden="true" ng-show="marketPlace.Record.purchased" ng-click="gotoDetailView(marketPlace.Record.contractid)"></i>
											<i class="fas fa-luggage-cart purchasBtn2" aria-hidden="true" ng-show="afterPurchasedBtn && marketPlace.Record.name==tmpdsName" ng-click="gotoDetailView(afterPurchasedContId)"></i>
										</td>
									</tr>
								  </tbody>
								</table>
							</div>
						</div>	
		    </div>
		</div>
		
		
		 <!-- <div class="scrollActive" ng-show="scrolleloader">
			<div class="loading">
			  <span>Loading more results...</span>
			</div>
		  </div> -->
		
		<!-- 
		<div class="container">
		  <ul class="pagination">
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		  </ul>
		</div> -->
				
		
		
		<!-- Modal -->
		<div class="modal fade center-modal"  style="overflow-y: auto" id="moreDetailModal" tabindex="-1" role="dialog" aria-labelledby="moreDetailModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" style="min-width:60%;" role="document">
		  <div class="modal-content padding20">
		    <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
		      <h4 class="modal-title text-left font-weight-bold " id="moreDetailModalLabel">{{marketPlaceView.Record.name}}</h4>
					<!-- <div class="text-left"><span style="color: #90969a; font-weight: 100!important;"><span style="color: #52504f;"> <span style="color: #52504f;"> by </span> </span> {{marketPlaceView.Record.dataprovidername}} <span style="color: #52504f;"> in </span> {{marketPlaceView.Record.category}}</span></div>
					<div class="text-left"><span style="color: #90969a; font-weight: 100!important;"><span style="color: #52504f;"> <span style="color: #52504f;"> Created Date :  </span> </span> {{marketPlaceView.Record.datecreated | date:'dd MMM yyyy'}}</div> -->
					<!-- <div class="text-left"><span style="color: #90969a; font-weight: 100!important;"><span style="color: #52504f;"> <span style="color: #52504f;"> by </span> </span> {{marketPlaceView.Record.dataprovidername}} <span style="color: #52504f;">&nbsp;&nbsp;updated on</span> {{marketPlaceView.Record.datecreated | date:'dd MMM yyyy'}}</span></div> -->
					<div class="text-left"><span style="color: #90969a; font-weight: 100!important;"><span style="color: #52504f;"> <span style="color: #4f5671;"> by </span> </span> <span  style="color: #9caa66;">{{marketPlaceView.Record.dataprovidername}}</span> <span style="color: #4f5671;">&nbsp;updated </span> 
					<span ng-if="marketPlaceView.Record.dateUpdatedOn == 0">Today</span>
					<span ng-if="marketPlaceView.Record.dateUpdatedOn == 1 ">{{marketPlaceView.Record.dateUpdatedOn}} day ago</span>
					<span ng-if="marketPlaceView.Record.dateUpdatedOn > 1 && marketPlaceView.Record.dateUpdatedOn <= 7 ">{{marketPlaceView.Record.dateUpdatedOn}} days ago</span>
					<span ng-if="marketPlaceView.Record.dateUpdatedOn >7 && marketPlaceView.Record.dateUpdatedOn <= 30 ">{{marketPlaceView.Record.dateUpdatedOn / 7 | number:0}} week ago</span>
					<span ng-if="marketPlaceView.Record.dateUpdatedOn > 30">{{marketPlaceView.Record.dateUpdatedOn / 30 | number:0}} month ago</span>	
					</span></div>
					
				</div>
				<div class="modal-body area-modal-body">
						<!-- style="height: calc(100% - 212px);overflow-y: auto; padding-top:0px;" -->
			<div class="row">
				<!-- <div class="col-md-12">
					<div style="color:#a7a9a9; display: inline-block;font-size:12px">
						<i class="fa fa-clock-o" aria-hidden="true"></i>
						  <%--   <span class="font-weight-bold"><%=lbl.get("MARKETPLACE").get("PERIOD")%>&nbsp;&nbsp;</span> --%>
							<span class="">{{marketPlace.Record.period}}</span>
						<span ng-show="marketPlaceView.Record.fromyear > 0">{{marketPlaceView.Record.fromyear}}</span><span ng-show="marketPlaceView.Record.frommonth > 0">-</span><span ng-show="marketPlaceView.Record.frommonth < 10 && marketPlaceView.Record.frommonth > 0">0</span><span ng-show="marketPlaceView.Record.frommonth > 0">{{marketPlaceView.Record.frommonth}}</span><span ng-show="marketPlaceView.Record.fromdate > 0">-</span><span ng-show="marketPlaceView.Record.fromdate < 10 && marketPlaceView.Record.fromdate > 0">0</span><span ng-show="marketPlaceView.Record.fromdate > 0">{{marketPlaceView.Record.fromdate}}</span><span ng-show="marketPlaceView.Record.fromyear > 0 && marketPlaceView.Record.toyear > 0"> <%=lbl.get("MARKETPLACE").get("DATE_SEPARATOR")%> </span><span ng-show="marketPlaceView.Record.toyear > 0">{{marketPlaceView.Record.toyear}}</span><span ng-show="marketPlaceView.Record.tomonth > 0">-</span><span ng-show="marketPlaceView.Record.tomonth < 10 && marketPlaceView.Record.tomonth > 0">0</span><span ng-show="marketPlaceView.Record.tomonth > 0">{{marketPlaceView.Record.tomonth}}</span><span ng-show="marketPlaceView.Record.todate > 0">-</span><span ng-show="marketPlaceView.Record.todate < 10 && marketPlaceView.Record.todate > 0">0</span><span ng-show="marketPlaceView.Record.todate > 0">{{marketPlaceView.Record.todate}}</span>
						<span ng-show="marketPlaceView.Record.fromyear < 1 && marketPlaceView.Record.toyear < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
					</div>
				</div> -->
				
				
				<!-- <div class="col-md-12">
					<div style="color:#a7a9a9; display: inline-block;font-size:12px">
						Country :
						<span>Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India, Singapore, Australia, India</span>
						<span ng-repeat="country in countries">{{country.name}},</span>
					</div>
				</div> -->
						<div class="col-md-8 margintop15">	
							<div class="row">
								<div class="col-md-6 label-item-model">
									<span  style="color:#90969a">PERIOD</span>
					                <!-- <div class="count-record-modal">01 Mar 2019  -  31 Mar 2019</div> -->
					                <div class="count-record-modal" ng-hide="marketPlaceView.Record.fromyear < 1 && marketPlaceView.Record.toyear < 1""><span ng-show="marketPlaceView.Record.fromdate < 10 && marketPlaceView.Record.fromdate > 0">0</span><span ng-show="marketPlaceView.Record.fromdate > 0">{{marketPlaceView.Record.fromdate}}</span><span ng-show="marketPlaceView.Record.fromdate > 0">&nbsp;</span><span ng-show="marketPlaceView.Record.frommonth > 0">{{getMonthName(marketPlaceView.Record.frommonth)}}</span><span ng-show="marketPlaceView.Record.frommonth > 0">&nbsp;</span><span ng-show="marketPlaceView.Record.fromyear > 0">{{marketPlaceView.Record.fromyear}}</span><span ng-show="marketPlaceView.Record.fromyear > 0 && marketPlaceView.Record.toyear > 0"> - </span><span ng-show="marketPlaceView.Record.todate < 10 && marketPlaceView.Record.todate > 0">0</span><span ng-show="marketPlaceView.Record.todate > 0">{{marketPlaceView.Record.todate}}</span><span ng-show="marketPlaceView.Record.todate > 0">&nbsp;</span><span ng-show="marketPlaceView.Record.tomonth > 0">{{getMonthName(marketPlaceView.Record.tomonth)}}</span><span ng-show="marketPlaceView.Record.tomonth > 0">&nbsp;</span><span ng-show="marketPlaceView.Record.toyear > 0">{{marketPlaceView.Record.toyear}}</span></div>
									<div class="count-record-modal" ng-show="marketPlaceView.Record.fromyear < 1 && marketPlaceView.Record.toyear < 1"><span ><%=lbl.get("MARKETPLACE").get("NA")%></span></div>
								</div>	
								<div class="col-md-3 label-item-model">
									<span  style="color:#90969a">RECORDS</span>
		                			<div class="count-record-modal" ng-show="marketPlaceView.Record.recordcount>0">{{marketPlaceView.Record.recordcount | number}}</div>
		                			<div class="count-record-modal" ng-show="!(marketPlaceView.Record.recordcount>0)"><%=lbl.get("MARKETPLACE").get("NA")%></div>
								</div>
							</div>	
							<div class="row">	
								<div class="col-md-6 label-item-model  margintop15">
										<span  style="color:#90969a">SOURCE</span>
		                <div class="count-record-modal">{{marketPlaceView.Record.source}}</div>
								</div>
					
						
								<div class="col-md-3 label-item-model  margintop15">
									<span  style="color:#90969a">SECTOR</span>
		                			<div class="count-record-modal">{{marketPlaceView.Record.category}}</div>
								</div>
								<div class="col-md-3 label-item-model  margintop15"  ng-hide="!(marketPlaceView.Record.type)">
									<span  style="color:#90969a">TYPE</span>
					                
					                <div class="count-record-modal">{{marketPlaceView.Record.type}}</div>
					                
					                <!-- <div class="count-record-modal" ng-show="marketPlaceView.Record.type == 'pos'">POS</div>
					                <div class="count-record-modal" ng-show="marketPlaceView.Record.type == 'leads'">Leads</div> -->
								</div>
						
						<!-- <div class="col-md-8 label-item-model"> -->
						<div class="col-md-12 label-item-model  margintop15"ng-hide="!(marketPlaceView.Record.countries.length)">
						
							<span style="color:#90969a">COUNTRY</span>
			                <div class="count-record-modal  country-block">
				                <!-- <span ng-show="marketPlaceView.Record.countryNames.length">{{marketPlaceView.Record.countryNames}}</span>
				                <span ng-show="!(marketPlaceView.Record.countryNames.length)">NA</span> -->
								
								<span ng-repeat="contry in marketPlaceView.Record.countries | limitTo:limitlength" style="word-break: break-all" ng-if="contry.name != ''">{{contry.name}}<font ng-show="!$last">, </font></span>
								
								<span ng-hide="marketPlaceView.Record.countries.length<=4 || !(marketPlaceView.Record.countries.length)">
									<span ng-hide="expanded">...</span><a ng-hide="expanded" ng-click='expanded = !expanded; limitlength=100' style="text-decoration: underline;">View all</a>
									<a ng-show="expanded" ng-click='expanded = !expanded; limitlength=4' style="text-decoration: underline;">View less</a>
								</span>
								<%-- <span ng-if="marketPlaceView.Record.countries.length>1 && $index<2">, </span> </span> --%>
								<!-- <span ng-if ="marketPlaceView.Record.countries.length > 3">...+{{marketPlaceView.Record.countries.length - 3}}</span> -->
								<span ng-show="!(marketPlaceView.Record.countries.length)">N/A</span>
								
								<!-- <span ng-if ="marketPlaceView.Record.countries.length > 3">...+{{marketPlaceView.Record.countries.length - 3}}</span> -->
								
			    	        </div>
						</div>
						
								<div class="col-md-12 label-item-model  margintop15">
										<span  style="color:#90969a">DESCRIPTION</span>
										<div class="count-record-modal country-block">{{marketPlaceView.Record.description}}</div>
									</div> 	
								</div>			
					
				<div class="margintop15" ng-hide="typeForDownload == 'DA_PT_BASIC' || marketPlaceView.Record.samplefilelocation == ''" style="color:#4f5671!important;">
						<div class="btn-default btn1 btn100 support-btn margintop15" style="color:#4f5671"> 
						<span>
							<a ng-href="{{marketPlaceView.Record.samplefilelocation}}">
								 <%=lbl.get("MARKETPLACE").get("DOWNLOAD_SAMPLE")%></a>
						</span>
						</div>
						<!-- <span ng-show="marketPlace.Record.samplefilelocation !=''">
								<a class="font-weight-bold" style="color:#333;" ng-href="{{marketPlace.Record.samplefilelocation}}">
								<i class="fa fa-download" aria-hidden="true"></i> <%=lbl.get("MARKETPLACE").get("DOWNLOAD_SAMPLE")%></a> 
						</span> -->
					</div>	
					
				</div>
				<div class="col-md-4 margintop15" style="position: relative">	
				<div class="padding0 buy-btn-res" style="padding: 5px 15px; text-align: right; position: fixed;	right: 040px; margin-top: 20px;">
								<span ng-show="!marketPlaceView.Record.purchased && !(afterPurchasedBtn && marketPlaceView.Record.name==tmpdsName)" 
										class="buy-btn btn1 btn-center1 btn100 btn-box" style="height: 52px;
								text-align: center;line-height: 36px; padding:9px;vertical-align: middle;" 
										data-toggle="modal" ng-click="buyNow(marketPlaceView)"  ng-hide="marketPlaceView.Record.alreadypurchased">
									  <!-- <%=lbl.get("MARKETPLACE").get("BUY_NOW")%>  -->  Buy With
									  <span>
										<span class="dollar-sign" aria-hidden="true">S</span>
										{{marketPlaceView.Record.price | number:0}}
									  </span>
							    </span>
							
								
								<span class="purchased-btn btn1 btn-center1 btn100 btn-box" data-toggle="modal" ng-click="gotoDetailView(marketPlaceView.Record.contractid)" data-target="" ng-show="marketPlaceView.Record.purchased" style="height: 52px;text-align: center;line-height: 36px; padding:9px; vertical-align: middle;">
									<i class="fas fa-luggage-cart " aria-hidden="true"></i> Purchased
							  	</span>
								
								<span ng-show="afterPurchasedBtn && marketPlaceView.Record.name==tmpdsName" class="purchased-btn btn1 btn-center1 btn100 btn-box" ng-model="afterPurchasedContId" data-toggle="modal" ng-click="gotoDetailView(afterPurchasedContId)" data-target="" style="height: 52px;text-align: center;line-height: 36px;padding:9px; vertical-align: middle;">
							        <i class="fas fa-luggage-cart " aria-hidden="true"></i>Purchased
						        </span>
						        
						
								<%-- <span ng-show="!marketPlace.Record.purchased && !(afterPurchasedBtn && marketPlace.Record.name==tmpdsName)">
					                <span class="buy-btn btn btn-center btn100 btn-box" style="height: 75px;
													text-align: center;
													line-height: 50px;" data-toggle="modal" ng-click="buyNow(marketPlace)"  ng-hide="marketPlace.Record.alreadypurchased">
									  <!-- <%=lbl.get("MARKETPLACE").get("BUY_NOW")%> --> Buy With
									  <span>
										<span class="dollar-sign" aria-hidden="true">S</span>
										{{marketPlaceView.Record.price | number:0}}
									  </span></span>
				               
						        
				                <span ng-show="marketPlace.Record.purchased" class="purchased-btn btn btn-center" data-toggle="modal" ng-click="gotoDetailView(marketPlace.Record.contractid)" data-target="" >
		    					        <i class="fas fa-luggage-cart " aria-hidden="true"></i>Purchased
		    				        </span>
						        
						        <span ng-show="afterPurchasedBtn && marketPlace.Record.name==tmpdsName" class="purchased-btn btn btn-center" ng-model="afterPurchasedContId" data-toggle="modal" ng-click="gotoDetailView(afterPurchasedContId)" data-target="" >
							        <i class="fas fa-luggage-cart " aria-hidden="true"></i>Purchased
						        </span> --%>
				</div>
			</div>
			
		
			</div>
			
			
			
		      <!-- <p class="card-desc">{{marketPlaceView.Record.description}}</p> -->
		      <!-- <div>
		      	<span class="font-weight-bold">Source&nbsp;&nbsp;</span>
		      	<span class="" ng-show="marketPlaceView.Record.source !='' ">{{marketPlaceView.Record.source}}</span>
		        <span ng-show="marketPlaceView.Record.source =='' "><%=lbl.get("MARKETPLACE").get("NA")%></span>
		      </div> -->
		      <!-- <div>
		        <span class="font-weight-bold"><%=lbl.get("MARKETPLACE").get("NUMBER_RECORDS")%>&nbsp;&nbsp;</span>
		        <span ng-show="marketPlaceView.Record.recordcount > 0" class="">{{marketPlaceView.Record.recordcount | number}}</span>
		        <span class="" ng-show="marketPlaceView.Record.recordcount < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
		      </div> -->
		      <!-- <div>
		        <span class="font-weight-bold"><%=lbl.get("MARKETPLACE").get("PERIOD")%>&nbsp;&nbsp;</span>
		        <span ng-show="marketPlaceView.Record.fromyear > 0">{{marketPlaceView.Record.fromyear}}</span><span ng-show="marketPlaceView.Record.frommonth > 0">-</span><span ng-show="marketPlaceView.Record.frommonth < 10 && marketPlaceView.Record.frommonth > 0">0</span><span ng-show="marketPlaceView.Record.frommonth > 0">{{marketPlaceView.Record.frommonth}}</span><span ng-show="marketPlaceView.Record.fromdate > 0">-</span><span ng-show="marketPlaceView.Record.fromdate < 10 && marketPlaceView.Record.fromdate > 0">0</span><span ng-show="marketPlaceView.Record.fromdate > 0">{{marketPlaceView.Record.fromdate}}</span><span ng-show="marketPlaceView.Record.fromyear > 0 && marketPlaceView.Record.toyear > 0"> <%=lbl.get("MARKETPLACE").get("DATE_SEPARATOR")%> </span><span ng-show="marketPlaceView.Record.toyear > 0">{{marketPlaceView.Record.toyear}}</span><span ng-show="marketPlaceView.Record.tomonth > 0">-</span><span ng-show="marketPlaceView.Record.tomonth < 10 && marketPlaceView.Record.tomonth > 0">0</span><span ng-show="marketPlaceView.Record.tomonth > 0">{{marketPlaceView.Record.tomonth}}</span><span ng-show="marketPlaceView.Record.todate > 0">-</span><span ng-show="marketPlaceView.Record.todate < 10 && marketPlaceView.Record.todate > 0">0</span><span ng-show="marketPlaceView.Record.todate > 0">{{marketPlaceView.Record.todate}}</span>
		        <span ng-show="marketPlaceView.Record.fromyear < 1 && marketPlaceView.Record.toyear < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
		      </div> -->
		      <!-- <div>
				<span class="font-weight-bold"><%=lbl.get("MARKETPLACE").get("DATA_PROVIDER")%></span>
				<span>{{marketPlaceView.Record.dataprovidername}}</span>
			  </div> -->
			  <br>
			  <div class="table-res" style="margin-top:0px;font-size:12px; overflow-y: scroll; height:auto;">
				<span style="color: #90969a">DATA SCHEMA</span>
		          <div class="table-responsive" style="margin-top:15px;">
		          <table class="table table-striped" style="font-family: avenir roman; font-size: 14px; color: #4f5671" >
		            <thead>
		              <tr>
		                <th scope="col"><%=lbl.get("MARKETPLACE").get("NAME")%></th>
		                <th scope="col"><%=lbl.get("MARKETPLACE").get("TYPE")%></th>
		                <th scope="col"><%=lbl.get("MARKETPLACE").get("IS_NULL")%></th>
		                <%-- <th scope="col"><%=lbl.get("MARKETPLACE").get("LENGTH")%></th> --%>
		                <th scope="col"><%=lbl.get("MARKETPLACE").get("LENGTH")%></th>
		                <th scope="col"><%=lbl.get("MARKETPLACE").get("DESCRIPTION")%></th>
		              </tr>
		            </thead>
		            <tbody>
		              <tr ng-repeat="dataItem in marketPlaceView.Record.dataitems">
		                <td>{{dataItem.name}}</td>
		                <td>
		                	<span ng-show="dataItem.type.length < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
		                	<span ng-show="dataItem.type.length > 0">{{dataItem.type}}</span>
	                	</td>
		                <td ng-show="dataItem.isnull == 'no'"><%=lbl.get("MARKETPLACE").get("ISNULL_NO")%></td>
		                <td ng-show="dataItem.isnull == 'yes'"><%=lbl.get("MARKETPLACE").get("ISNULL_YES")%></td>
		                <td>
		                	<span ng-show="dataItem.datalength.length < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
		                	<span ng-show="dataItem.datalength.length > 0">{{dataItem.datalength}}</span>
		                </td>
		                <td style="width: 20%; overflow: auto; word-break: break-word; text-overflow: ellipsis;">
		                	<span ng-show="dataItem.description.length < 1"><%=lbl.get("MARKETPLACE").get("NA")%></span>
		                	<span ng-show="dataItem.description.length > 0" data-toggle="tooltip" title="{{dataItem.description}}">{{dataItem.description.substr(0, 30)}}...</span>
		                </td>
		              </tr>
		            </tbody>
		          </table>
		          </div>

		          <!-- <div class="DP" style="margin: 15px 0">
					<div class="mt-5">
						<i class="fas fa fa-tag"></i>
						<span class="font-weight-bold">{{marketPlaceView.Record.category}}</span>
				 	</div>
				 	<div class="mt-5 font-weight-bold" >
						<span ng-show="marketPlaceView.Record.samplefilelocation !=''">
							<a class="font-weight-bold" style="color:#4f5671" ng-href="{{marketPlaceView.Record.samplefilelocation}}">
							<i class="fa fa-download" aria-hidden="true"></i> done <%=lbl.get("MARKETPLACE").get("DOWNLOAD_SAMPLE")%></a>
						</span>
							</div>
				</div> -->
		        <div class="row" style="margin:0px;">
					<!-- <div class="col-md-6 col-sm-6 col-xs-6 padding0">
						<div class="mt-5 font-weight-bold" >
							<span ng-show="marketPlace.Record.samplefilelocation !=''">
								<a class="font-weight-bold" style="color:#333;" ng-href="{{marketPlace.Record.samplefilelocation}}">
								<i class="fa fa-download" aria-hidden="true"></i> <%=lbl.get("MARKETPLACE").get("DOWNLOAD_SAMPLE")%></a> 
							</span>
							<div style="height: 21px;" ng-hide="marketPlace.Record.samplefilelocation !=''">&nbsp;&nbsp;&nbsp;</div>	
						</div>							
						</div> -->
						<!-- <div class="col-md-6 col-sm-6 col-xs-6 padding0" style="text-align:right;">					
						<span style="font-weight: bold;">Open Dataset <i class="fas fa-box-open" style="color:maroon;"></i></span>
					</div> -->
						</div>
		   
		    <!-- <div class="modal-footer">
		      <button type="button" class="btn btn-successcustom" data-dismiss="modal">
		        <%=lbl.get("MARKETPLACE").get("CLOSE")%>
		      </button> -->
		      <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
	
		</div>
		  </div>
		</div>
		</div>
	</div>


	
	<div ng-show="showLoadmoretext" style="padding: 20px; padding-left: 45%; color: #80808096">Loading more results...</div>
	<div ng-show="showEndPagetext" style="padding: 20px; padding-left: 45%; color: #80808096">No more results.</div>
	
	

<!-- Thanks Modal -->
<div class="modal fade center-modal" id="thanksModalSuccess" tabindex="-1" role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
		  <div class="modal-content" style="padding: 30px!important;">
		    <div class="thanksModal" ng-show="!isAlreadyPurchased" style="border: none;">		      
			</div>
			<div class="modal-body">
				<div>
					<span class="checkSuccess"> <i class="fas fa-check-circle"> </i></span>
					<span style="font-size:3rem;vertical-align: middle;font-weight: 300;">&nbsp; Success </span>
					<p></p>
					<p></p>
				</div>
					<span>Contract Number:<span class="color-in-par;" style="text-decoration: underline;color: #9cab69;"> <span ng-click="gotoDetailPage()" data-dismiss="modal" style="cursor:pointer;">{{afterPurchasedContId}}</span></span></span>
					<p class="para-text">
								You have successfully purchased {{marketPlaceView.Record.name}} 
								<span ng-hide="hideUnwantedTxt">for <span class="dollar-sign">S</span> <span class="font-weight-bold"> {{currentBalance | number:0}}&nbsp;</span>and the credits have bee locked.
								You will be notified to download the dataset once the seller has set up the API </span>
						 </p>
					<div class="container-progress" ng-hide="hideUnwantedTxt">
					   <div class="row" style="margin-bottom:2">			
							 <div class="main col-md-12" >
							
									 <div class="progress">
										 <div id="p" class="progress-bar bg-info progreso1" role="progressbar" aria-valuenow="0" aria-valuemin="0" ariavaluemax="100"></div>
									 </div>
								 
									 <div ng-show="!showConfirm" class="block1" >
										 <div style="visibility: hidden;" >2019-06-25 22:29:00</div>
										 <div id="b1" class="text-center circulo activecirculo">
											 <i class="icon1 fa fa-check"></i>									
										 </div>
											 <span class=progress-text>Initiate purchase</span>
									 </div>
									 
									 <div ng-show="showConfirm" class="block1">
										 <div>{{showConfirmDate}}</div>
										 <div id="b1" class="text-center circulo">
											 <i class="icon1"></i>		
											 <!-- <i class="fa fa-check"></i>	 -->							
										 </div>
												 <span class=progress-text>Initiate purchase</span>
									 </div>
									 
									 <div ng-show="!showPayProc" id="block2A" class="block2">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b2" class="text-center circulo">
											 <i class="icon2"></i>
										 </div>
									 <span class=progress-text>	Seller sends out API
											details</span>
									 </div>
									 <div ng-show="showPayProc" id="block2A" class="block2">
											 <div>{{showPayProcDate}}</div>
										 <div id="b2" class="text-center circulo activecirculo">
											 <i class="icon2"></i>		
											 <!-- <i class="fa fa-check"></i> -->	
										 </div>
										 <span class=progress-text>Seller sends out API
												details</span>
									 </div>
									 
									 <div ng-show="!showAccept" id="block3A" class="block3">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b3" class="text-center circulo">
											 <i class="icon3"></i>    
										 </div>
										 <span class=progress-text>Check that you can
												download the data</span>
									 </div>
									 
									 <div ng-show="showAccept" id="block3A" class="block3">
											 <div>{{showAcceptDate}}</div>
										 <div id="b3" class="text-center circulo activecirculo">
											 <i class="icon3"></i>
											 <!-- <i class="fa fa-check"></i> -->	    
										 </div>
										 <span class=progress-text>Check that you can
												download the data</span>
									 </div>
									 
									 <div ng-show="!showDdlsucc" id="block4A" class="block4">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b4"class="text-center circulo">
											 <i class="icon4"></i>
										 </div>
										 <span class=progress-text>Sentient processes
												Payment</span>
									 </div>
									 
									 <div ng-show="showDdlsucc" id="block4A" class="block4">
											 <div>{{showDdlsuccDate}}</div>
										 <div id="b4"class="text-center circulo activecirculo">
											 <i class="icon4"></i>
											 <!-- <i class="fa fa-check"></i> -->
										 </div>
									 <span class=progress-text>Sentient processes
											Payment</span>
									 </div>
							  </div>
					 </div>
				 </div>

			</div>

					<div class="modal-footer margintop30" style="border-top:none;">
		      <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" ng-click="gotoDetailPage()" data-dismiss="modal">
				<!-- <%=lbl.get("MARKETPLACE").get("CLOSE")%> -->
				View contract progress
		      </button>
		      <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
		  <!-- </div> -->
		</div> 
		</div>


												 
		<!-- Public Mandatory Modal -->
		<div class="modal fade center-modal" id="pubKeyMandatoryModal" tabindex="-1" role="dialog" aria-labelledby="pubKeyMandatoryLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    
		    <div class="modal-header thanksModal">
		      <br>
		      <i class="far fa-times-circle" style="font-size: 45px; color:red"></i>
		      <h2 class="modal-title font-weight-bold"><%=lbl.get("MARKETPLACE").get("SORRY")%> <i class="fa fa-frown-o" aria-hidden="true"></i></h2></br> 
		      <p><%=lbl.get("MARKETPLACE").get("PUBKEY_NEED")%></br></p>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn btn_save btn-successcustom" data-dismiss="modal">
		        <%=lbl.get("MARKETPLACE").get("CLOSE")%>
		      </button>
		      <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
		    </div>
		  </div>
		</div> 
		</div>	
		
		<!-- access for buy Mandatory Modal -->
		<div class="modal fade center-modal" id="accessBuyModal" tabindex="-1" role="dialog" aria-labelledby="accessBuyLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    
		    <div class="modal-header thanksModal">
		      <br>
		      <i class="far fa-times-circle" style="font-size: 45px; color:red"></i>
		      <h2 class="modal-title font-weight-bold"><%=lbl.get("MARKETPLACE").get("SORRY")%> <i class="fa fa-frown-o" aria-hidden="true"></i></h2></br> 
		      <p><%=lbl.get("MARKETPLACE").get("ACCESS_NEED_BUY")%></br></p>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn btn_save btn-successcustom" data-dismiss="modal">
		        <%=lbl.get("MARKETPLACE").get("CLOSE")%>
		      </button>
		    </div>
		  </div>
		</div> 
		</div>
		
		<!-- Plantype Modal -->
		<%-- <div class="modal fade center-modal" id="plantypeModal" tabindex="-1" role="dialog" aria-labelledby="plantypeModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
		    
		    <div class="modal-header plantypeModal">
		      <br>
		       <h2 class="modal-title font-weight-bold"><%=lbl.get("MARKETPLACE").get("SORRY")%> <i class="fa fa-frown-o" aria-hidden="true"></i></h2></br> 
		      <p><%=lbl.get("MARKETPLACE").get("PLANTYPE")%></br></p>
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn btn_save btn-successcustom" data-dismiss="modal">
		        <%=lbl.get("MARKETPLACE").get("CLOSE")%>
		      </button>
		    </div>
		  </div>
		</div> 
		</div> --%>
		

		<div class="modal fade center-modal" id="plantypeModal" tabindex="-1" role="dialog" aria-labelledby="plantypeModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
				  <div class="modal-content" style="padding:20px!important;">
					<div class="thanksModal" ng-show="!isAlreadyPurchased" style="border: none;">
					</div>
					<div class="modal-body" style="text-align: left;"> 
						<div class="">
							<!-- <span> <i class="fa fa-refresh" aria-hidden="true"> </i></span> -->
							<div class="padding0" style=" font-size:2rem;">Upgrade membership tier to purchase</div>
							<div class="padding0" style=" font-size:2rem;color:#9cab69;">{{marketPlaceView.Record.name}}</div>
							<p class="para-text margintop20">To access private datasets like {{marketPlaceView.Record.name}}, please upgrade your membership. To learn about the different tiers or upgrade your membership, follow the Upgrade membership link below.</p>
							<p></br></p>
							<p></p>					
						 </div>
						 </div>		
				
							<div class="modal-footer padding0">
								<div class="margintop20">
									<botton class="btn cancel-btn" type="button" style=" padding: 10px; width: 20rem!important;background-color: white; color: #cecfd0; border: none;" data-dismiss="modal">
											Cancel purchase
									</botton>
					  <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 27rem; background-color: #424143; border-color:#424143; color: white;" data-dismiss="modal" ng-click="upgradingPlanType('')">
							Upgrade membership
					  </button>
					</div>
				
					</div>
				</div>
				</div>
				  <!-- </div> -->
				</div> 
				
				
			<div class="modal fade center-modal" id="upgradePlantypeModal" tabindex="-1" role="dialog" aria-labelledby="plantypeModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
				  <div class="modal-content" style="padding:20px!important;">
					<div class="thanksModal" ng-show="!isAlreadyPurchased" style="border: none;">
					</div>
					<div class="modal-body" style="text-align: left;"> 
						<div class="">
							 <p class="para-text margintop20">Your request is been sent to the client service team, we will contact you shortly.</p>
							<p></br></p>
						 </div>
						 </div>
						 
					<div class="modal-footer padding0">
						<div class="margintop20">
						<button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 27rem; background-color: #424143; border-color:#424143; color: white;" data-dismiss="modal">
							Cancel
					  </button>
					  
					</div>	 		
				  </div>
				</div>
			  </div>
			</div> 	
				
				


				<div class="modal fade center-modal" id="insufficient" tabindex="-1" role="dialog" aria-labelledby="plantypeModal" aria-hidden="true">
						<div class="modal-dialog" role="document">
						  <div class="modal-content" style="padding:20px!important;">
							
							<div class="modal-body" style="text-align: left;">
							  <br>
							  <div class="padding0" style=" font-size:2rem;">Insufficient credits to purchase</div>
							  <div class="padding0" style=" font-size:2rem; color:#9cab69;">{{marketPlaceView.Record.name}}</div>
							  <div  class="credits margintop20">
							
								<div style="display: inline-block">
								<label style="color:#9a9a9a; font-size: 10px;">CURRENT CREDITS</label>
								<div class="count-record">
										<span class="dollar-sign" aria-hidden="true">S</span> <span style="font-size: 17px;">  {{curBal | number:0}}</span>
									 </div>
									</div>

									<div style="display: inline-block; padding-left: 10px;">
									 <label style="color:#9a9a9a;font-size: 10px;">DATASET PRICE</label>
								<div class="count-record">		
										<span class="dollar-sign" aria-hidden="true">S</span><span style="font-size: 17px;"> {{dsPrice | number:0}}</span>
									 </div>
									</div> 

							</div>
							<div class="margintop30">
							<p class="para-text" style="color:#c40b0b;" >You need {{remainingAmnt | number:0}} more credits to purchase this dataset.</p>
						</div>
						<div class="margintop30"></div>
						
							<div class="modal-footer padding0">
									<div class="margintop30">
										<botton class="btn cancel-btn" type="button" style=" padding: 10px; width: 25rem!important;background-color: white; color: #cecfd0; border: none;" data-dismiss="modal">
												Cancel purchase
										</botton>
						  <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" ng-click="gotoTopup()"  data-dismiss="modal">
								Top up
						  </button>
						</div>
					
						</div>
							</div>
						  </div>
						</div> 
						</div>
				
					
		
		
		
			<!--INITIATE PURCHASE-->
		
		<div class="modal fade center-modal" id="initiatepurchase" tabindex="-1" role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content" style="padding: 30px!important;">
				<div class="thanksModal" ng-show="!isAlreadyPurchased" style="border: none;">		      
				</div>
				<div class="modal-body">
					<div>
						<div class="padding0" style=" font-size:2rem;">Initiate purchase of</div>
						<div class="padding0" style=" font-size:2rem; color:#9cab69;">{{marketPlaceView.Record.name}}</div>
						<p></p>
					
					</div>
					
						<div class="container-progress">
					 <div class="row" style="margin-bottom:2">			
							 <div class="main col-md-12" >
							
									 <div class="progress">
										 <div id="p" class="progress-bar bg-info progreso1" role="progressbar" aria-valuenow="0" aria-valuemin="0" ariavaluemax="100"></div>
									 </div>
								 
									 <div ng-show="!showConfirm" class="block1" >
										 <div style="visibility: hidden;" >2019-06-25 22:29:00</div>
										 <div id="b1" class="text-center circulo">
											 <!-- <i class="icon1 fa fa-check"></i>	 -->
											<i class="fa fa-circle circle-in"aria-hidden="true"></i>							
										 </div>
											 <span class=progress-text>Purchase initiated</span>
									 </div>
									 
									 <div ng-show="showConfirm" class="block1">
										 <div>{{showConfirmDate}}</div>
										 <div id="b1" class="text-center circulo">
											 <i class="icon1"></i>		
											 <!-- <i class="fa fa-check"></i>	 -->							
										 </div>
												 <span class=progress-text>Purchase initiated</span>
									 </div>
									 
									 <div ng-show="!showPayProc" id="block2A" class="block2">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b2" class="text-center circulo">
											 <i class="icon2"></i>
										 </div>
									 <span class=progress-text>	Offer consideration</span>
									 </div>
									 <div ng-show="showPayProc" id="block2A" class="block2">
											 <div>{{showPayProcDate}}</div>
										 <div id="b2" class="text-center circulo activecirculo">
											 <i class="icon2"></i>		
											 <!-- <i class="fa fa-check"></i> -->	
										 </div>
										 <span class=progress-text>Offer consideration</span>
									 </div>
									 
									 <div ng-show="!showAccept" id="block3A" class="block3">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b3" class="text-center circulo">
											 <i class="icon3"></i>    
										 </div>
										 <span class=progress-text>API details exchange </span>
									 </div>
									 
									 <div ng-show="showAccept" id="block3A" class="block3">
											 <div>{{showAcceptDate}}</div>
										 <div id="b3" class="text-center circulo activecirculo">
											 <i class="icon3"></i>
											 <!-- <i class="fa fa-check"></i> -->	    
										 </div>
										 <span class=progress-text>API details exchange </span>
									 </div>
									 
									 <div ng-show="!showDdlsucc" id="block4A" class="block4">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b4"class="text-center circulo">
											 <i class="icon4"></i>
										 </div>
										 <span class=progress-text>Dataset download verification</span>
									 </div>
									 
									 <div ng-show="showDdlsucc" id="block4A" class="block4">
											 <div>{{showDdlsuccDate}}</div>
										 <div id="b4"class="text-center circulo activecirculo">
											 <i class="icon4"></i>
											 <!-- <i class="fa fa-check"></i> -->
										 </div>
									 <span class=progress-text>Dataset download</span>
									 </div>
							  </div>
							 
					 </div>
					
					 </div>
	
				</div>
				<div class="margintop30" style="border-top: 1px solid #dee2e6;margin-bottom: 30px;">

					<div  class="credits margintop20">
						<div style="display: inline-block">
						<label style="color:#9a9a9a; font-size: 10px;">CURRENT CREDITS</label>
						<div class="count-record">
								<span class="dollar-sign" aria-hidden="true">S</span> <span style="font-size: 17px;">  {{curBal | number:0}}</span>
							 </div>
							</div>

							<div style="display: inline-block">
								<label style="color:#9a9a9a; font-size: 10px;"></label>
								<div class="Symbol">
										 <span style="font-size: 17px; line-height: 2;">-</span>
									 </div>
									</div>

							<div style="display: inline-block; padding-left: 10px;">
							 <label style="color:#9a9a9a;font-size: 10px;">LOCK UP</label>
						<div class="count-record">		
								<span class="dollar-sign" aria-hidden="true">S</span><span style="font-size: 17px;"> {{dsPrice | number:0}}</span>
							 </div>
							</div> 
							
							<div style="display: inline-block">
								<label style="color:#9a9a9a; font-size: 10px;"></label>
								<div class="Symbol">
										 <span style="font-size: 17px; line-height: 2;">=</span>
									 </div>
									</div>

									<div style="display: inline-block; padding-left: 10px;">
										<label style="color:#9a9a9a;font-size: 10px;">BALANCE AFTER LOCK UP</label>
								   <div class="count-record" style=" background-color: #e7eecb!important;">		
										   <span class="dollar-sign" aria-hidden="true">S</span><span style="font-size: 17px;"> {{remainingAmnt | number:0}}</span>
										</div>
									   </div> 
					</div>

				</div>
						
				<div class="modal-footer padding0">
						<div class="margintop30">
							<botton class="btn cancel-btn" type="button" style=" padding: 10px; width: 25rem!important;background-color: white; color: #cecfd0; border: none;" data-dismiss="modal">
									Cancel purchase
							</botton>
			  <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" ng-click="signContract('')" data-dismiss="modal">
					Initiate
			  </button>
			</div>
		
			</div>
			</div>
			  <!-- </div> -->
			</div> 
			</div>
		<!--END-->

		<!--INITIATE PURCHASE: Sorry, initiation of purchase has failed. Please try again-->
		<div class="modal fade center-modal" id="error-pop-up" tabindex="-1" role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content" style="padding: 30px!important;">
				<div class="thanksModal" ng-show="!isAlreadyPurchased" style="border: none;">		      
				</div>
				<div class="modal-body">
					<div>
						<div class="padding0 " style=" font-size:2rem;font-weight: bold;">Initiate purchase of {{marketPlaceView.Record.name}}</div>
						<!-- <div class="padding0 upgrade-text" style=" font-size:2rem;font-weight: bold; color:#9cab69;">{{marketPlaceView.Record.name}}</div> -->
						<p></p>
					
					</div>
					
						<div class="container-progress">
					 <div class="row" style="margin-bottom:2">			
							 <div class="main col-md-12" >
							
									 <div class="progress">
										 <div id="p" class="progress-bar bg-info progreso1" role="progressbar" aria-valuenow="0" aria-valuemin="0" ariavaluemax="100"></div>
									 </div>
								 
									 <div ng-show="!showConfirm" class="block1" >
										 <div style="visibility: hidden;" >2019-06-25 22:29:00</div>
										 <div id="b1" class="text-center circulo">
											 <!-- <i class="icon1 fa fa-check"></i>	 -->
											<i class="fa fa-circle circle-in"aria-hidden="true"></i>							
										 </div>
											 <span class=progress-text>Purchase initiated</span>
									 </div>
									 
									 <div ng-show="showConfirm" class="block1">
										 <div>{{showConfirmDate}}</div>
										 <div id="b1" class="text-center circulo">
											 <i class="icon1"></i>		
											 <!-- <i class="fa fa-check"></i>	 -->							
										 </div>
												 <span class=progress-text>Purchase initiated</span>
									 </div>
									 
									 <div ng-show="!showPayProc" id="block2A" class="block2">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b2" class="text-center circulo">
											 <i class="icon2"></i>
										 </div>
									 <span class=progress-text>	Offer consideration 
											details</span>
									 </div>
									 <div ng-show="showPayProc" id="block2A" class="block2">
											 <div>{{showPayProcDate}}</div>
										 <div id="b2" class="text-center circulo activecirculo">
											 <i class="icon2"></i>		
											 <!-- <i class="fa fa-check"></i> -->	
										 </div>
										 <span class=progress-text>Offer consideration 
												details</span>
									 </div>
									 
									 <div ng-show="!showAccept" id="block3A" class="block3">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b3" class="text-center circulo">
											 <i class="icon3"></i>    
										 </div>
										 <span class=progress-text>API details exchange </span>
									 </div>
									 
									 <div ng-show="showAccept" id="block3A" class="block3">
											 <div>{{showAcceptDate}}</div>
										 <div id="b3" class="text-center circulo activecirculo">
											 <i class="icon3"></i>
											 <!-- <i class="fa fa-check"></i> -->	    
										 </div>
										 <span class=progress-text>API details exchange </span>
									 </div>
									 
									 <div ng-show="!showDdlsucc" id="block4A" class="block4">
										 <div style="visibility: hidden;">2019-06-25 22:29:00</div>
										 <div id="b4"class="text-center circulo">
											 <i class="icon4"></i>
										 </div>
										 <span class=progress-text>Dataset download verification</span>
									 </div>
									 
									 <div ng-show="showDdlsucc" id="block4A" class="block4">
											 <div>{{showDdlsuccDate}}</div>
										 <div id="b4"class="text-center circulo activecirculo">
											 <i class="icon4"></i>
											 <!-- <i class="fa fa-check"></i> -->
										 </div>
									 <span class=progress-text>Dataset download verification</span>
									 </div>
							  </div>
							 
					 </div>
					
					 </div>
	
				</div>
				<div class="margintop30" style="border-top: 1px solid #dee2e6;margin-bottom: 30px;">

					<div  class="credits margintop20">
						<div style="display: inline-block">
						<label style="color:#9a9a9a; font-size: 10px;">CURRENT CREDITS</label>
						<div class="count-record">
								<span class="dollar-sign" aria-hidden="true">S</span> <span style="font-size: 17px;">  10,000</span>
							 </div>
							</div>

							<div style="display: inline-block">
								<label style="color:#9a9a9a; font-size: 10px;"></label>
								<div class="Symbol">
										 <span style="font-size: 17px; line-height: 2;">-</span>
									 </div>
									</div>

							<div style="display: inline-block; padding-left: 10px;">
							 <label style="color:#9a9a9a;font-size: 10px;">LOCK UP</label>
						<div class="count-record">		
								<span class="dollar-sign" aria-hidden="true">S</span><span style="font-size: 17px;"> 2,000</span>
							 </div>
							</div> 
							
							<div style="display: inline-block">
								<label style="color:#9a9a9a; font-size: 10px;"></label>
								<div class="Symbol">
										 <span style="font-size: 17px; line-height: 2;">=</span>
									 </div>
									</div>

									<div style="display: inline-block; padding-left: 10px;">
										<label style="color:#9a9a9a;font-size: 10px;">BALANCE AFTER LOCK UP</label>
								   <div class="count-record" style=" background-color: #e7eecb!important;">		
										   <span class="dollar-sign" aria-hidden="true">S</span><span style="font-size: 17px;"> 2,000</span>
										</div>
									   </div> 
					</div>

				</div>
				<div class="margintop30" style="margin-bottom:30px;">
					<p></p><span class="alert-icon"><i class="fa fa-exclamation-circle"></i></span> <span class="para-text" style="color:#de3c3d" >Sorry, initiation of purchase has failed. Please try again</span></p>
				</div>
				<div class="modal-footer padding0">
						<div class="margintop30">
							<botton class="btn cancel-btn" type="button" style=" padding: 10px; width: 25rem!important;background-color: white; color: #cecfd0; border: none;" data-dismiss="modal">
									Cancel purchase
							</botton>
			  <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" data-dismiss="modal">
				Initiate Purchase
			  </button>
			</div>
		
			</div>
			</div>
			  <!-- </div> -->
			</div> 
			</div>
		<!--END-->
		
		<!--Errot pop up-->
		<div class="modal fade center-modal" id="errorpurchase" tabindex="-1" role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content" style="padding: 30px!important;">
				<div class="thanksModal" ng-show="!isAlreadyPurchased" style="border: none;">		      
				</div>
				<div class="modal-header" style="border: none!important">
					<div>
						<p><span class="alert-icon"><i class="fa fa-exclamation-circle"></i></span> <span style="font-size: 42px; vertical-align: middle;  color: #333;">Error</span></p>
					</div>
				</div>
				<div class="modal-body">				
						<p ng-if="FailReturnMsg == 'LOW_BALANCE'">Please check your balance is insufficient</p>
						<p ng-if="!(FailReturnMsg == 'LOW_BALANCE')">{{FailReturnMsg}}</p>
						<p>If you need help, please contact<a style="text-decoration: underline;"> Sentient Support.</a> </p>
				</div>
			
				<div class="modal-footer padding0" style="border: none!important">
						<div class="margintop30">							
			  <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" data-dismiss="modal">
				Close
			  </button>
			</div>
		
			</div>
			</div>
			  <!-- </div> -->
			</div> 
		</div>
		
		
		<!-- SPINNER -->
		<div class="modal fade center-modal" id="spinnerpurchase" tabindex="-1" role="dialog" aria-labelledby="thanksModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content" style="padding: 30px!important;">
				<div class="spinnerModal"  style="border: none;">		      
				</div>
				<div class="modal-body" style="text-align: center;">
					<div>&nbsp;</div>
						<div>&nbsp;</div>				
		     				<i class="fas fa-spinner fa-spin" style="font-size: 60px;"></i>
		     			<div>&nbsp;</div>
		     		<div>&nbsp;</div>
				</div>
			</div>
		</div> 
	</div>
		
			
			
		<!--END-->
		
		<div class="modal fade center-modal" id="success" tabindex="-1" role="dialog" aria-labelledby="plantypeModal" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    
			    <div class="modal-header success">
			      <br>
			       <p>Successfully purchased!</br></p>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn_save btn-successcustom" data-dismiss="modal">
			        <%=lbl.get("MARKETPLACE").get("CLOSE")%>
			      </button>
			    </div>
			  </div>
			</div> 
		</div>
		
		
		<div class="modal fade center-modal" id="error" tabindex="-1" role="dialog" aria-labelledby="plantypeModal" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content">
			    
			    <div class="modal-header error">
			      <br>
			       <p>Error! Something went wrong.</br></p>
			    </div>
			    <div class="modal-footer">
			      <button type="button" class="btn btn_save btn-successcustom" data-dismiss="modal">
			        <%=lbl.get("MARKETPLACE").get("CLOSE")%>
			      </button>
			    </div>
			  </div>
			</div> 
		</div>
		
		
		<!--  TEST MODAL END============================================================ -->
		
		
		<script src="resources/js/jquery.js"></script>
		<script src="resources/js/bootstrap.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script> -->
		<script src="resources/js/daterangepicker.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/marketplaceController.js"></script>

<script>
	$(function () {
		$('#datafedmenu').addClass('menu-active');
		$("body").tooltip({ selector: '[data-toggle=tooltip]' });

		$('#moreDetailModal').on('hidden.bs.modal', function () {
			$('body').css('overflow', 'auto');
		});
		// jQuery('#thanksModalSuccess').modal();
		/* $('.listButton').click(function() {
			$('.toggle-list').css('display','inline-block');
			$('.list-view-panel, .gridButton').show();
			$('.grid-view-panel, .toggle-grid, .listButton').hide();
		});
		$('.gridButton').click(function() {
			$('.toggle-grid').css('display','inline-block');
			$('.list-view-panel, .toggle-list, .gridButton').hide();
			$('.grid-view-panel, .listButton').show();
			
		$("select").change(function(){
		    if ($(this).val()=="") {
		    	$(this).removeClass("optionActive");
		    	$(this).addClass("optionDisale");
		    	}
		    else {
		    	$(this).removeClass("optionDisale");
		    	$(this).addClass("optionActive");
		    	}
		  });
	}); */


	})
	
	// SCROLL UPTO BOTTOM AND CALL METHOD
	$(window).scroll(function (e){
	    var body = document.body;    
	    var scrollTop = this.pageYOffset || body.scrollTop;
	    if (body.scrollHeight - scrollTop === parseFloat(body.clientHeight)) {
	        angular.element(document.querySelector('[ng-controller="marketplaceController"]')).scope().scrollingIsActiveRightNow()
			
			/* setTimeout(function(){ 
				$(this).scrollTop(0); 
			}, 5000); */
	        
	    }
	});

	$("#mplace").addClass("active");
	
</script>
</body>
</html>

</body>
</html>
