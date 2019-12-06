<%@ page session="true" %>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.util.APIUtil"%>
<%@page import="com.util.APIUtil"%>

<%
Map<String, Map<String, String>> menus = ((Map<String, Map<String, String>>) session.getAttribute("MENU"));

Map<String, Map<String, String>> lbl = ((Map<String, Map<String, String>>) session.getAttribute("CONTRACTDETAILS"));

String API_CONTRACT_HISTORY = APIUtil.API_CONTRACT_HISTORY;
String API_UPDATE_CONTRACT = APIUtil.API_UPDATE_CONTRACT;
String API_CONTRACT_LIST = APIUtil.API_CONTRACT_LIST;
String API_DA_ACCOUNTLIST = APIUtil.API_DA_ACCOUNTLIST;
String SUB_LIST_VALPAIR_URL = APIUtil.SUB_LIST_VALPAIR_URL;
String RSA_DECODE = APIUtil.RSA_DECODE;


String URL_ENC_TEXT = lbl.get("CONTRACTDETAILS").get("URL_ENC_TEXT");


%>
<script>
var orgid=<%= session.getAttribute("loginOrgId")%>;
var API_CONTRACT_HISTORY = "<%=API_CONTRACT_HISTORY%>";
var API_UPDATE_CONTRACT = "<%=API_UPDATE_CONTRACT%>";
var API_CONTRACT_LIST = "<%=API_CONTRACT_LIST%>";
var URL_ENC_TEXT = "<%=URL_ENC_TEXT%>";
var API_DA_ACCOUNTLIST = "<%=API_DA_ACCOUNTLIST%>";
var SUB_LIST_VALPAIR_URL = "<%=SUB_LIST_VALPAIR_URL%>";
var RSA_DECODE = "<%=RSA_DECODE%>";

</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contract Details | Sentient.io</title>
  <meta charset="utf-8">
  <link rel="icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="https://sentient.io/img/favicon.ico" type="image/x-icon">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.css">
  <link rel="stylesheet" href="resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/search.css">
  <link rel="stylesheet" href="resources/css/New-style.css">
  <style type="text/css">
  .contra-head{
	  margin-bottom: 0px!important;
  }
  .radiobtn {
  position: relative;
  display: inline-flex;
}
.radiobtn label {
  display: inline-block;
  background: #f9ffe7;
  color: #444;
  border-radius: 5px;
  padding: 10px 0px;
  border: 1px solid #96ca4e;
  margin: 5px;
  cursor: pointer;
  text-align: center;
    width: 100px;
    height: 85px;
}
/* .radiobtn label:after, .radiobtn label:before {
  content: "";
  position: absolute;
  right: 11px;
  top: 11px;
  width: 20px;
  height: 20px;
  border-radius: 3px;
  background: #afca4ef0;
} */
/* .radiobtn div:before {
  background: transparent;
  transition: 0.1s width cubic-bezier(0.075, 0.82, 0.165, 1) 0s, 0.3s height cubic-bezier(0.075, 0.82, 0.165, 2) 0.1s;
  z-index: 2;
  overflow: hidden;
  background-repeat: no-repeat;
  background-size: 13px;
  background-position: center;
  width: 0;
  height: 0;
  background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxNS4zIDEzLjIiPiAgPHBhdGggZmlsbD0iI2ZmZiIgZD0iTTE0LjcuOGwtLjQtLjRhMS43IDEuNyAwIDAgMC0yLjMuMUw1LjIgOC4yIDMgNi40YTEuNyAxLjcgMCAwIDAtMi4zLjFMLjQgN2ExLjcgMS43IDAgMCAwIC4xIDIuM2wzLjggMy41YTEuNyAxLjcgMCAwIDAgMi40LS4xTDE1IDMuMWExLjcgMS43IDAgMCAwLS4yLTIuM3oiIGRhdGEtbmFtZT0iUGZhZCA0Ii8+PC9zdmc+);
} */
.radiobtn input[type="radio"] {
  display: none;
  position: absolute;
  width: 100%;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
}

.radiobtn input[type="radio"]:checked + label {
	background: #dbfd782e;
  -webkit-animation-name: blink;
          animation-name: blink;
  -webkit-animation-duration: 1s;
          animation-duration: 1s;
		  border-color: #afca4ef0;
		  background:#96ca4e !important;
		  color:white;
		  transition: transform 300ms ease;
		  transform: scale(1.1, 1.1);
}
.radiobtn input[type="radio"]:disabled + label{
	background: #ccc;
	cursor: not-allowed !important;
}
/* .radiobtn input[type="radio"]:checked + label:after {
  background: #2d9744f0;
} */
.radiobtn input[type="radio"]:checked + label:before {
  width: 20px;
  height: 20px;
}
.dceditable{
display:none;
}
.dpeditable{
display:none;
}
.checked{
display:none;
}
.message-blink{
	animation: blinks 1s linear 3;
}
.CD-icon-setting{
text-align: right;
    top: 20px;
    right: 20px;
}
.CD-margin{
    border-radius: 5px;
    /* background: #96ca4e; */  
    font-size: 25px!important;
    /* border: 1px solid gray; */
    /* color: #ffffff; */
}
.settings-icon{
color: #d68a3c;
}
.comment-icon{
color:white;
}
.withdrawal-icon{
  color:#e35b66;}
.processing_ico{
    font-weight: 900;
    vertical-align: middle;
    font-size: 21px!important;
    color: #92CE0C;
    }
.icons-detail{
	cursor: pointer;
	}
.icons-detail>i{
	width:100%;
	border-radius: 0;
}
/* .icons-detail>i:hover{
	background:#54565f;
	color:white;
	border-top-left-radius: 5px;
    border-top-right-radius: 5px;
} */
.icons-detail>div{
	padding: 3px;
}
/* .icons-detail:hover{
	border: 1px solid #f5f5f5;
	box-shadow: 0px 3px 2px #e3e5e6;
	border-radius: 5px;
	transition: box-shadow 0.3s ease-in-out;
	
} */

.container-progress {
    position: relative;
    margin-top: 20px;
	margin-bottom: 20px;
}

    .container-progress h1 {
        color: #fff;
        margin: 15px;
        padding: 15px;
    }

    .container-progress .main .progress {
        margin: 20px 0;
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
        width: 20%;
        animation: 0.5s;
        background-color: #B8EBCC;
    }

@media (max-width: 768px) {
    .container-progress .main .progreso1 {
        width: 34%;
    }
}

.container-progress .main .progreso2 {
    width: 40%;
    animation: 0.5s;
    background-color: #B8EBCC;
    transition: all 0.45s ease;
}

@media (max-width: 768px) {
    .container-progress .main .progreso2 {
        width: 73%;
    }
}

.container-progress .main .progreso3 {
    width: 60%;
    animation: 0.5s;
    background-color: #B8EBCC;
    transition: all 0.45s ease;
}
.container-progress .main .progreso4 {
    width: 80%;
    animation: 0.5s;
    background-color: #B8EBCC;
    transition: all 0.45s ease;
}
.container-progress .main .progreso5 {
    width: 100%;
    animation: 0.5s;
    background-color: #B8EBCC;
    transition: all 0.45s ease;
}
.container-progress .main .block1 {
    position: absolute;
    margin: 0 0%;
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    width: 160px;
    text-align: center;	
    margin-left: -80px;
    top: -20px;
    padding: 4px;
    color: #b6b7b7;
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
    width: 160px;	
    margin-left: -80px;
    text-align: center;
    top: -20px;
    padding: 4px;
	left: 20%;
	color: #b6b7b7;
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
    width: 160px;
    text-align: center;
    margin-left: -60px;           /* margin-left: -80px; */
    top: -20px;
    padding: 4px;
	left: 38%;
	color: #b6b7b7;
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
    width: 160px;
    text-align: center;
    margin-left: -80px;
    top: -20px;
    padding: 4px;
	left: 60%;
	color: #b6b7b7;
}


@media (max-width: 570px) {
    .container-progress .main .block4 {
        left: 60% !important;
    }
}

@media (max-width: 768px) {
    /* .container-progress .main .block4 {
        margin: 0 60%;
        margin-top: 85px;
    } */
}

.container-progress .main .block5 {
    position: absolute;
    /* margin: 0 80%; */
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    width: 160px;
    text-align: center;
    margin-left: -80px;
    top: -20px;
    padding: 4px;
	left:78%;
	color: #b6b7b7;
}

.container-progress .main .block6 {
    position: absolute;
    /* margin: 0 100%; */
    border-radius: 50%;
    /* height: 50px;
    width: 50px; */
	height: 87px;
    width: 160px;
    text-align: center;
    margin-left: -80px;
    top: -20px;
    padding: 4px;
	left: 98%;
	color: #b6b7b7;
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
    color: #438F5B;
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
	left: 20%;
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
	left: 38%;
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
	left: 58%;
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
.margintop30{
	margin-top:30px;
}

 /* @media (max-width: 768px) {
    .container-progress .main .activeblock4 {
        margin: 0 90.7%;
    }
}

@media (min-width: 510px) and (max-width: 600px) {
    .container-progress .main .activeblock4 {
        margin: 0 89.5%;
    }
}

@media (min-width: 368px) and (max-width: 509px) {
    .container-progress .main .activeblock4 {
        margin: 0 86%;
    }
}

@media (min-width: 200px) and (max-width: 367px) {
    .container-progress .main .activeblock4 {
        margin: 0 86%;
    }
} */

.container-progress .main .activecirculo {
    border-radius: 50%;
    height: 30px;
    width: 30px;
    background-color: #ffffff;
    border: solid 4px #438F5B;
    margin: 6px;
	margin-left: 60px;
}
/* .dollar-sign{
	font-size: 14px !important;
    background: #cbab80;
    color: #e8e822;
    border-radius: 25px;
    text-align: center;
    padding: 0px 4px 0px 5px;
    border: 2px solid #e8e822;
    vertical-align: middle;
} */

@media (min-width: 992px){
.container-progress {
    width: 810px;
}
}
@media (min-width: 1200px){
.container-progress  {
    width: 1000px;
}
}
@media only screen and (min-width: 924px) and (max-width: 990px) {
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
	.container-progress .main .block3 .text-center, 
	.container-progress .main .block4 .text-center, 
	.container-progress .main .block5 .text-center, 
	.container-progress .main .block6 .text-center {
    margin-left: 40px;
}

}

@media only screen and (min-width: 720px) and (max-width: 862px) {
	.container-progress {
        width: 600px;
}
}

@media only screen and (min-width: 420px) and (max-width: 719px) {
	.container-progress {
        width: 500px;
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
	.container-progress .main .block3 .text-center, 
	.container-progress .main .block4 .text-center, 
	.container-progress .main .block5 .text-center, 
	.container-progress .main .block6 .text-center {
    margin-left: 40px;
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
    }.modal-footer{
border-top:none!important;
}
.icon-container{
    text-align: right;
    top: 20px;
 }
.price-tag{
    font-size: 20px;
	background: #e8f0cd;
    /* color: white; */
    padding: 4px 12px 5px 12px;
    font-weight: bold;
    border-radius: 5px;
    white-space: nowrap;
    /* overflow: hidden; */
	text-overflow: ellipsis;
	display: inline-block;
   }
.seller{
font-size:26px;
/* font-weight: bold; */
color: #363c4f;
}

@keyframes blinks{
0%{opacity: 0;}
50%{opacity: .5;}
100%{opacity: 1;}
}
.date-style{
font-size:10px;
color:gray;
padding-right:5px;
}
.chat-box{
 width: 90%;
 min-height:60px!important;
 border-top-right-radius: 5px;
 border-top-left-radius:5px;
 border-bottom-right-radius: 5px;
 border-bottom-left-radius: 5px; 

 }
 .progress-text{
color: #54565f;
 }
 .table-responsive{
	overflow-x:auto;
	word-break: break-word;
 }

 /* ------ */
 .dateColor{
	color: #b6b7b7;
	height: 18px!important;
	 }
	 .progress-text{
color: #54565f;
 }
.StepProgress {
  position: relative;
  padding-left: 45px;
  list-style: none;
}
.StepProgress::before {
  display: inline-block;
  content: "";
  position: absolute;
  top: 0;
  left: 13px;
  width: 10px;
  height: 100%;
  height: calc(100% - 40px)!important;
  border-left: 6px solid #f6f6f6;
}
.StepProgress-item:last-child::before {
    background: white;
}
.StepProgress-item.current:last-child::before {
    border-left: 2px solid white;
}
.StepProgress-item.is-done:last-child::before {
    border-left: 2px solid white;
}
.StepProgress-item {
  position: relative;
  counter-increment: list;
  padding-bottom: 20px;
}
/* .StepProgress-item:not(:last-child) {
  padding-bottom: 46px;
} */
.StepProgress-item::before {
  display: inline-block;
  content: "";
  position: absolute;
  left: -32px;
  height: 100%;
  width: 10px;
}
.StepProgress-item::after {
  content: "";
  display: inline-block;
  position: absolute;
  top: 0;
  left: -40px;
  width: 22px;
  height: 22px;
  border: 2px solid #efefef;
  border-radius: 50%;
  background-color: #fff;
  font-size: 14px;
  text-align: center;
 padding-top: 1px;
 
}
.StepProgress-item.is-done>.status{
	position: relative;
    top: -4px;
}

.StepProgress-item.is-done::before {
  border-left: 6px solid #e8f0cd;
}
.StepProgress-item.is-done::after {
	content: "\2713";
    padding-top: 1px;
    width: 22px;
    height: 22px;
    top: -4px;
    left: -40px;
    font-size: 14px;
	font-weight: 700;
    text-align: center;
    color: #9caa66;
    border: 2px solid #9caa66;
    /* background-color: green; */
}

.StepProgress-item.nextitem::after{
	box-shadow: 0px 0px 2px 4px #e1ecbc;
    background-color: #9caa66;
}

.StepProgress-item.current::before {
  border-left: 2px solid green;
}
.StepProgress-item.current::after {
  content:"\2713";
  padding-top: 1px;
  width: 22px;
  height: 22px;
  top: -4px;
  left: -40px;
  font-size: 14px;
  text-align: center;
  color: green;
  border: 2px solid green;
  background-color: white;
}
.StepProgress strong {
  display: block;
}
.fa-comment-dots{
	line-height:1.5!important;
}
.attached{
	text-align: right;
    float: right;
    background-color: #424143;
    height: 40px;
    width: 82px;
    border-radius: 5px;
    position: absolute;
    right: 0;
    bottom: 1px;
}

.text-attached{
	width: calc(100% - 82px)!important;
    display: inline-block!important;
	border: 1px solid #fff;
}
.form-control1{
    border-top-right-radius: 0!important;
	border-bottom-right-radius: 0!important;    
	border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}
.chatSend.fa.fa-paper-plane-o{
	font-size: 23px!important;
    font-weight: bold!important;
	/* padding-left: 8px!important;
    FONT-SIZE: 23px!important;
    PADDING-TOP: 3px!important;
    FONT-WEIGHT: 900!important; */
}
.chatSend {
	height:50px!important;
	cursor: pointer;
}
.sendBtn{
	font-weight: 700!important;
    color: white!important;
	line-height: 2.8!important;
    margin-right: 22px!important;
}

.bottomBG{
	background-color: #f6f6f6;
	/* height: 180px; */
	position: relative;
	padding: 0;
	min-height: 140px;
}
.padding10{
	padding:10px;
}

.history-chat{
/* border-left: 1px solid #f3f3f3;
padding:10px !important;
height: 100% !important; */
}

.icon-withdraw{
	/* padding: 10px; */
	font-size: 16px;
	border-radius: 5px;
	/* background-color: #bc0001; */
	text-decoration: underline;
	font-weight: normal;
}
.icon-withdraw:hover{
	color:red;
}
.fa-minus-circle{
	vertical-align: middle;
}
textarea.form-control{
	-webkit-box-shadow:none!important;
}
textarea {
        resize: none;
    }
.count-record{
	text-align:left;
}
.bg{
	background: #F0F0F0;
	background-repeat: no-repeat;
	}
	.trans-key{
	padding-bottom: 13px;
    display: inline-block;
    color: #54565f;
    padding-left: 10px;
    letter-spacing: 3px;
    font-weight: bold;
	}
	table{margin-top:10px!important;}
	.paddingtop{
		padding-top:27px
	}
	.FB{font-size: 15px;
    font-weight: bold;}
	.labelgray{
		color:#C0C0C0;
	}
	::placeholder {
      color: #D0D0D0 !important;
	}
	.back-to-page a:hover{
		color: #333!important;
	}

	.Msg-bg{
	position: absolute;
    bottom: 7px;
    left: 0;
    right: 0;
    height: 41px;
    background: white;
	border-radius: 5px;
	}
	.msg-text-area{
		position: absolute;
    height: 38px!important;
    /* padding-top: 17px; */
    border: none;
    /* line-height: 7px; */
    bottom: 1px;
    vertical-align: middle;
    line-height: 2.5;
	overflow: auto;
	}
	.modal-header{
		border-bottom: none;
	}
	:disabled{
		background: #ffffff!important;
	}
	.lock{
		font-size: 20px; 
		padding: 7px 10px; 
		background-color:gray; 
		border-radius:100%;
	}

	.lock:hover{
    font-size: 20px;
    padding: 7px 10px;
    background-color: #ffffff;
    border-radius: 100%;
    /* color: #fff; */
}

.modal-footer {
    text-align: center;
}
.cancel-btn:hover {
color: #5e0000 !important;
background:white !important;
}
.decryptPressbtn{
	word-wrap:break-word;
	color: #fff; 
	background-color:#414143; 
	border: 1px solid #414143; 
	border-radius: 5px; 
	display:inline-block;
	cursor: pointer;
	padding: 10px 10px 10px 5px
}

  </style>
  	
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700"
    rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
    
    <link rel="stylesheet" href="resources/css/datafed_style.css">
  	<link rel="stylesheet" href="resources/css/market.css">
  	<link rel="stylesheet" href="resources/css/contract.css">
  	
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  	
</head>
	<body class="bg" ng-app="datafedApp" ng-controller="contractdetailController" ng-cloak>
		<jsp:include page="new_header.jsp"></jsp:include>
		<!-- <div class="loadr" ng-show="loadeer"></div> -->
		<div class="loading-container" ng-show="loadeer">
			<div class="loading">
			</div>
		</div>
		
		<div class="loading-container2" ng-show="loadeerBtn">
			<div class="loading">
			</div>
		</div>
		
		
		<div class="container" style="padding-bottom: 48px; padding-top: 90px; margin-top: 60">
		<span class="back-to-page" ng-if="isProducer"><a href="contract" style="color: #A9A9A9;"><i class="fa fa-angle-left" style="font-weight: bold;"></i>&nbsp;&nbsp; Back to Sell Contracts</a></span>
		<span class="back-to-page" ng-if="!isProducer"><a href="mycontract" style="color: #A9A9A9;"><i class="fa fa-angle-left" style="font-weight: bold;"></i>&nbsp;&nbsp; Back to Buy Contracts</a></span>
		<div class="box"  style="background-color: white; border-radius: 5px;margin-top: 10px !important;">
		        <!--  <h4 class="contra-head btn_bg font-weight-bold"><%=lbl.get("CONTRACTDETAILS").get("TITLE")%> </h4> -->

					   <div class="row" style="margin: 0!important;">						
						<div class="col-md-6 col-sm-6 col-xs-12" style="padding-top:10px;" >
							<div class="col-md-12" style="margin-bottom: 20px;">

							<div style="margin-bottom: 20px;">
									<div class="col-xs-10 col-sm-10 col-md-10 padding0" style="display: inline-block;margin-top: 20px;">     
							<span class="seller"> {{selectedContractData.Record.dsname}}</span>	
									</div>

							<div class="col-xs-2 col-sm-2 col-md-2 padding0" style="display: inline-block;margin-top: 20px;text-align: right;">
									
									<span class="icons-detail icon-setting" style="padding-left: 10px;" data-toggle="modal" data-target="#con-setting" ng-click="stopInterval()" ng-disabled="hideBtnsWhileSend">
										<i class="fa fa-cog settings-icon CD-margin" style="color:#7a7a7b" aria-hidden="true"></i>
										<!-- <div>Settings</div> -->
									</span>													
							</div>	
						</div>
							
		                    <div>
		                	<div class="paddingtop">
								
							<div  class="paddingtop">
									<div class="col-md-4  padding0 labelgray">Contract number</div>
									<div class="col-md-8  padding0 FB"><span id="divcopy">{{selectedContractData.Record.id}}</span> &nbsp;<i id="copyContract" class="far fa-copy" style="color:#7a7a7b;cursor: pointer;" title="Copy" ng-click="copyContractNum('divcopy')"></i></div>
									</div>

							<div class="paddingtop" ng-show="!isProducer">
		                        <div class="col-md-4  padding0 labelgray"> Data Producer</div>
								<div class="col-md-8  padding0 FB" style="color: #a2b070!important" ng-show="!isProducer" class="seller"> {{selectedContractData.Record.dpname}}</div>
							</div>
							
							<div class="paddingtop" ng-show="!isProducer">
		                        <div class="col-md-4  padding0 labelgray"> Data Producer email</div>
								<div class="col-md-8  padding0 FB" style="color: #a2b070!important" ng-show="!isProducer" class="seller"> {{selectedContractData.Record.dpemail}}</div>
							</div>

	
							<div  class="paddingtop" ng-show="isProducer">
		                        <div  class="col-md-4  padding0 labelgray" >Data Consumer</div>
								<div  class="col-md-8  padding0 FB"  style="color: #a2b070!important" ng-show="isProducer"  class="seller"> {{selectedContractData.Record.dcname}}</div>	
							</div>
							<div  class="paddingtop" ng-show="isProducer">
		                        <div  class="col-md-4  padding0 labelgray" >Data Consumer email</div>
								<div  class="col-md-8  padding0 FB"  style="color: #a2b070!important" ng-show="isProducer"  class="seller"> {{selectedContractData.Record.dcemail}}</div>	
							</div>

								<div class="paddingtop">
									<div class="col-md-4  padding0 labelgray"> Price</div>													
									<!-- <div class="col-md-8  padding0 FB"><span class="dollar-sign">S</span> {{selectedContractData.Record.price | number:0}}</div>	 -->
									<div class="col-md-8  padding0 FB"><span><img style="width: 21px;" src="resources/images/dollar-img.png"></span> {{selectedContractData.Record.price | number:0}}</div>		                 
								</div>
								
								<div class="col-md-12  paddingtop padding0" ng-hide="hideAllBtns">
									<div ng-show="showWithdrawnBtn && selectedContractData.Record.opendataset=='no'" class="FB margintop20" data-toggle="modal" data-target="#withdraw" ng-click="stopInterval()">
										<div class="icon-withdraw"> Cancel Order</div>
									</div>
								</div>	
							</div>
								</div>							
							</div>
								<div  ng-if="selectedContractData.Record.price>0" class="col-md-12 padding0" style=" border-top:1px solid #fff5f5;">	
								<div class="col-md-12 col-xs-12 padding0" >										
									<div style="padding:20px 20px 0px 0px; background-color: white;">
											<!-- <div class="wrapper" style="padding:20px 20px 0px 0px; background-color: white;"> -->
									
											<ul class="StepProgress">
												
											  <li ng-if="showConfirm" class="StepProgress-item is-done">
													<div class="status">
													<p class="progress-text">Purchase initiated</p>
													<span> {{showConfirmDate|date:'yyyy MMM dd HH:mm'}}</span>
												</div>	  
											  </li>
											  
											  <li ng-if="!showAccept" class="StepProgress-item">
													<div class="status">
													<p class="progress-text labelgray">Offer consideration</p>	
													<span style="visibility: hidden"></span>
												</div>													  						 
											  </li>
											  
											  <li ng-if="showAccept" class="StepProgress-item is-done">
													<div class="status">
													<p class="progress-text">Offer consideration</p>			
													<span> {{showAcceptDate|date:'yyyy MMM dd HH:mm'}}</span>
												</div>													  				 
											  </li>	
											  											  
											  <li ng-if="!showAPIExch" class="StepProgress-item">
													<div class="status">
													<p class="progress-text labelgray">API details exchange</p>	
													<span style="visibility: hidden"></span>
												</div>													  						 
											  </li>
											  
											  <li ng-if="showAPIExch" class="StepProgress-item is-done">
													<div class="status">
													<p class="progress-text">API details exchange</p>			
													<span> {{showAPIExchDate|date:'yyyy MMM dd HH:mm'}}</span>
												</div>													  				 
											  </li>												  
											  <li ng-if="!showDdlsucc" class="StepProgress-item">
													<div class="status">
													<p class="progress-text labelgray">Dataset download verification</p>				
													<span style="visibility: hidden"></span>
												</div>													  		
											  </li>
											  <li ng-if="showDdlsucc" class="StepProgress-item is-done">
													<div class="status">
													<p class="progress-text">Dataset download verification</p>						
													<span>{{showDdlsuccDate|date:'yyyy MMM dd HH:mm'}}</span>
												</div>													 
											  </li>
											  
											  <li ng-if="!showContClosd" class="StepProgress-item">
													<div class="status">
													<p class="progress-text labelgray">End of transaction</p>			
													<span style="visibility: hidden"></span>
												</div>																		
											  </li>
											  <li ng-if="showContClosd" class="StepProgress-item is-done">
													<div class="status">
													<p class="progress-text">End of transaction</p>		
													<span> {{showContClosdDate |date:'yyyy MMM dd HH:mm'}}</span>
												</div>																			
											  </li>
											</ul>
											</div>
						</div>	
					 <!-- </div> -->
					</div>
					   </div>	

					<div class="col-md-6 col-sm-6 col-xs-12 history-chat" style=" border-left: 1px solid #f6f6f6;background-color: #f6f6f6;">
						<div class="col-md-12 history-part" style="padding:30px 30px 30px 30px;">
							<!-- -----------------------PRODUCER PAGE CHAT START-------------------------------  -->
							
							<div ng-show="isProducer" class="" id="ChatContant" >
								<div ng-repeat = "chData in contractHistoryData">
									<div class="outgoing_msg" ng-if="chData.Value.lastmessageby == chData.Value.dporgid && isOpenDatasetCheck(selectedContractData.Record,chData.Value)">
										<div class="sent_msg table-responsive">
											
												<table class="chat-box" style="width: 100%; background-color: #fff;">
													<tr>
														<td align="left" style="padding-top: 10px; padding-bottom:10px;margin-top:20px;"><div class="received_withd_msg"></div></td>
														<td align="right" style="padding-top: 5px;padding-right: 5px"><span class="received_withd_msg date-style"> {{chData.Value.dateformatted|date:'yyyy MMM dd HH:mm'}}</span> </td>
													</tr>
													<tr>
														<td align="left" colspan="2">
															<p class="price_status time_date"  style="word-wrap:break-word;color: #747474;" ng-bind-html="getStatusChat(chData.Value.messagedp,chData.Value.message) | trust"></p>
														</td></tr>
												</table>
										</div>
										<span ng-show="isProducer" class="profile-style-outgoing font-weight-bold">
											me
										</span>
										<span ng-show="!isProducer" class="profile-style-outgoing font-weight-bold">
											DP
										</span>
										
									</div>
						
								<div class="incoming_msg" style="margin-bottom: 10px" ng-if="chData.Value.lastmessageby == '1' && isOpenDatasetCheck(selectedContractData.Record,chData.Value)">
									<span class="profile-style_admin font-weight-bold">
								   <img style="width:30px; height: 29px;" src="resources/org/images/logo2.png" alt="">
									</span>
									<div class="received_msg table-responsive">
										<div class="received_withd_msg">
											
											<table class="chat-box" style="width: 100%; background-color: #f7f7d0;">
												<tr>
													<td align="left" style="padding-top: 10px;padding-bottom:5px;"><div class="received_withd_msg"></div></td>
													<td align="right" style="padding-top: 5px;padding-right: 5px;padding-bottom:5px;"><span class="received_withd_msg date-style"> {{chData.Value.dateformatted|date:'yyyy MMM dd HH:mm'}}</span> </td>
												</tr>
												<tr>
													<td align="left" colspan="2" >
													<p class="price_status time_date chatbox" style="word-wrap:break-word;color: #747474;background-color: #f7f7d0;"> <b ng-bind-html="getStatusChat(chData.Value.messagedp,chData.Value.message) | trust"></b></p>
													</td></tr>
											</table>
											
										</div>
				
									</div>
								</div>
								
								<div class="incoming_msg" style="margin-bottom: 10px" ng-if="chData.Value.lastmessageby == chData.Value.dcorgid && isOpenDatasetCheck(selectedContractData.Record,chData.Value)">
									<span class="profile-style font-weight-bold">
									DC
									</span>
									<div class="received_msg table-responsive">
										<div class="received_withd_msg">
											
											<table class="chat-box" style="background-color:#eaf4df; width: 100%;">
												<tr>
													<td align="left" style="padding-top: 10px;"><div class="received_withd_msg"></div></td>
													<td align="right" style="padding-top: 5px;padding-right: 5px"><span style=" min-height:60px!important;" class="received_withd_msg date-style"> {{chData.Value.dateformatted|date:'yyyy MMM dd HH:mm'}}</span> </td>
												</tr>
												<tr>
													<td align="left" colspan="2" style="padding-top: 10px;">
														<p class="price_status time_date" style="word-wrap:break-word;color: #747474;" ng-bind-html="getStatusChat(chData.Value.messagedc,chData.Value.message) | trust"></p>                            		
													</td></tr>
											</table>
											
										</div>
									</div>
								</div>
								</div>
								<div style="text-align:center;height:20px;padding:10px;" >
									<span ng-if="isOpenDataMessage"><%=lbl.get("CONTRACTDETAILS").get("PLESAE_WAIT")%></span><br>
									<i ng-if="loadChatData" class="fas fa-spinner fa-spin" style="font-size:20px;"></i>
								</div>
							</div>
							
							<!-- -----------------------PRODUCER PAGE CHAT END-------------------------------  --> 
							
							<!-- -----------------------CONSUMER PAGE CHAT START-------------------------------  -->
							
							<div ng-show="!isProducer" class="" id="ChatContant" >
								<div ng-repeat = "chData in contractHistoryData">
									<div class="outgoing_msg" ng-if="chData.Value.lastmessageby == chData.Value.dcorgid && isOpenDatasetCheck(selectedContractData.Record,chData.Value)">
										<div class="sent_msg table-responsive">
											
												<table class="chat-box"style="width: 100%; background-color: #fff;">
													<tr>
														<td align="left" style="padding-top: 10px;padding-bottom: 2px"><div class="received_withd_msg"></div></td>
														<td align="right" style="padding-top: 5px;padding-bottom: 2px;padding-right: 5px"><span class="received_withd_msg date-style"> {{chData.Value.dateformatted|date:'yyyy MMM dd HH:mm'}}</span> </td>
													</tr>
													<tr>
														<td align="left" colspan="2" style="padding-bottom: 2px">
															<p class="price_status time_date" style="word-wrap:break-word;color: #747474;" ng-bind-html="getStatusChat(chData.Value.messagedc,chData.Value.message) | trust"></p>
														</td>
													</tr>
												</table>
											
										</div>
										<span ng-show="!isProducer" class="profile-style-outgoing font-weight-bold">
											me
										</span>
									</div>
								
					
							   
								   <div class="incoming_msg" style="margin-bottom: 10px;" ng-if="chData.Value.lastmessageby == '1' && isOpenDatasetCheck(selectedContractData.Record,chData.Value)">
										<span class="profile-style_admin font-weight-bold ">
											<img style="width:30px; height:29px;" src="resources/org/images/logo2.png" alt="">
										</span>
										<div class="received_msg table-responsive">
											<div class="received_withd_msg">
												<!-- <-------------ADMIN--------------->
												<table class="chat-box" style="width:100%; background-color:#f7f7d0;">
													<tr>
														<td align="left" style="padding-top: 10px;padding-bottom: 2px; margin-top:20px;" ><div class="received_withd_msg"></div></td>
														<td align="right" style="padding-top: 5px;padding-bottom: 2px;padding-right: 5px;"><span class="received_withd_msg date-style"> {{chData.Value.dateformatted|date:'yyyy MMM dd HH:mm'}}</span> </td>
													</tr>
													<tr>
														<td colspan="2" class="btnD" style="padding-bottom: 5px; text-align: center;" >
															<p class="price_status time_date" style="word-wrap:break-word;color: #747474;max-width:500px;" ><b ng-bind-html="getStatusChat(chData.Value.messagedc,chData.Value.message) | trust"></b>
															<div class="decryptPressbtn" ng-click="decryptMdl()" ng-show="showDecryptBtn">
															<i class="fa fa-lock lock"></i><%=lbl.get("CONTRACTDETAILS").get("DECRYPT_BTN_MSG")%></div>
															</p>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>

								
								<div class="incoming_msg" style="margin-bottom: 10px" ng-if="chData.Value.lastmessageby == chData.Value.dporgid && isOpenDatasetCheck(selectedContractData.Record,chData.Value)">
								   
									<span class="profile-style font-weight-bold">
										DP
									</span>
									
									<div class="received_msg table-responsive">
										<div class="received_withd_msg">
											
											<table class="chat-box" style="background-color:#eaf4df; width: 100%;">
												<tr >
													<td align="left" style="padding-top: 10px;padding-bottom: 2px; margin-top:20px; "><div class="received_withd_msg"></div></td>
													<td align="right" style="padding-top: 5px;padding-bottom: 2px;padding-right: 5px"><span style=" min-height:60px!important;" class="received_withd_msg date-style"> {{chData.Value.dateformatted|date:'yyyy MMM dd HH:mm'}}</span> </td>
												</tr>
												<tr>
													<td colspan="2" class="btnDecrypt" style="padding-bottom: 5px; text-align: center;">
													<p class="price_status time_date"  style="word-wrap:break-word;color: #747474;min-height: 15px;" ng-bind-html="getStatusChat(chData.Value.messagedc,chData.Value.message) | trust"></p>
													<div class="decryptPressbtn" ng-click="decryptMdl()" ng-show="showDecryptBtn">
													<i class="fa fa-lock lock"></i><%=lbl.get("CONTRACTDETAILS").get("DECRYPT_BTN_MSG")%></div>
													</p>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
								<div style="text-align:center;height:20px;padding:10px;" >
									<span ng-if="isOpenDataMessage"><%=lbl.get("CONTRACTDETAILS").get("PLESAE_WAIT")%></span><br>
									<i ng-if="loadChatData" class="fas fa-spinner fa-spin" style="font-size:20px;"></i>
								</div>
								
							</div> 
							
							<!-- -----------------------CONSUMER PAGE CHAT END-------------------------------  -->
							</div>
							
							<!-- SEND BUTTON ------------------------------------------------ -->
						
							<div class="col-md-12 bottomBG">
								<!-- ACCEPT BUTTON FOR PRODUCER ------------------------------------------------ -->
								<div class="outgoing_msg" ng-if="selectedContractData.Record.statuscode=='DA_CST_TRAN_SUCC' && isProducer">
									<div class="sent_msg table-responsive" style="position:relative;margin-bottom: 70px;">
											<table class="chat-box" style="width:92%; background-color: #fff; height: 110px;">
												<!-- <tr>
													<td align="left"><div class="received_withd_msg"></div></td>
													<td align="right" style="padding-right: 5px;padding-top: 2px"><span class="received_withd_msg date-style">{{currentdate|date:'yyyy MMM dd HH:mm'}}</span></td>
												</tr> -->
												<tr>
													<td colspan="2" style="font-size: 15px; padding:0!important;">
														<span style="padding-bottom:0!important;padding-bottom:0!important;color: #333; font-weight:normal; padding-left:5px!important;padding-right:5px!important"><%=lbl.get("CONTRACTDETAILS").get("DA_DC_CONF")%></span>
													</td>
												</tr>
												<tr>
													<td align="left" colspan="2" style="text-align: right; padding:10px;padding-top: 0;	padding-bottom: 0;">
														<div ng-click="updateContractBtnAction(newdesc,'downloadcancel')" style="word-wrap:break-word;color: #333;padding: 10px;display:inline-block;cursor: pointer;margin-right: 25px"> <%=lbl.get("CONTRACTDETAILS").get("DA_DC_CONF_NO")%></div>
														<div ng-click="updateContractBtnAction(newdesc,'accept')"  style="word-wrap:break-word;color: #333; border: 1px solid; padding: 10px;	border-radius: 5px; display:inline-block;cursor: pointer;"><%=lbl.get("CONTRACTDETAILS").get("DA_DC_CONF_YES")%></div>
													</td></tr>
											</table>
									</div>
									<span class="profile-style-outgoing font-weight-bold">me</span>
								</div>
								<!-- ACCEPT BUTTON FOR PRODUCER END------------------------------------------------ -->
								<!-- DOWNLOAD BUTTON FOR CONSUMER START------------------------------------------------ -->
								<div class="outgoing_msg" ng-if="(selectedContractData.Record.statuscode=='DA_CST_API_EXCH' || selectedContractData.Record.statuscode=='DA_CST_DATA_DOWN_FAIL') && !isProducer">
									<div class="sent_msg table-responsive" style="position:relative;margin-bottom: 70px;">
											<table class="chat-box" style="width:92%; background-color: #fff; height: 110px;">
												<!-- <tr>
													<td align="left"><div class="received_withd_msg"></div></td>
													<td align="right" style="padding-right: 5px;padding-top: 2px"><span class="received_withd_msg date-style">{{currentdate|date:'yyyy MMM dd HH:mm'}}</span></td>
												</tr> -->
												<tr>
													<td colspan="2" style="font-size: 15px; padding:0!important;">
														<span style="padding-bottom:0!important;padding-bottom:0!important;color: #333; font-weight:normal; padding-left:5px!important;padding-right:5px!important"><%=lbl.get("CONTRACTDETAILS").get("DA_D_DWN_CONF")%></span>
													</td>
												</tr>
												<tr>
													<td align="left" colspan="2" style="text-align: right; padding:10px;padding-top: 0;	padding-bottom: 0;">
														<div ng-click="updateContractBtnAction(newdesc,'downloadcancel')" style="word-wrap:break-word;color: #333;padding: 10px;display:inline-block;cursor: pointer;margin-right: 25px"> <%=lbl.get("CONTRACTDETAILS").get("DA_D_DWN_CONF_NO")%></div>
														<div ng-click="updateContractBtnAction(newdesc,'download')"  style="word-wrap:break-word;color: #333; border: 1px solid; padding: 10px;	border-radius: 5px; display:inline-block;cursor: pointer;"><%=lbl.get("CONTRACTDETAILS").get("DA_D_DWN_CONF_YES")%></div>
													</td></tr>
											</table>
									</div>
									<span class="profile-style-outgoing font-weight-bold">me</span>
								</div>
							<!-- DOWNLOAD BUTTON FOR CONSUMER END------------------------------------------------ -->
							
								<div class="Msg-bg">		
								   <div  class=" padding10">
									   <textarea class="msg-text-area" ng-disabled="hideForm" class="form-control1 form-control text-attached" rows="2" ng-model="newdesc" placeholder="Type your message..."></textarea>
									   <div class="attached" style="text-align: right;float: right;">		
									      <span class="chatSend">
											   <span class="sendBtn" ng-show="!issendbtnsubmitted" ng-click="updateContractBtnAction(newdesc,'message')">Send</span>
											   <span class="sendBtn" ng-show="issendbtnsubmitted" ng-disabled>Send  <i class="fas fa-spinner fa-spin"></i></span>
											     
										   </span>
									   </div>		
								   </div>
   								 </div>
								 <div class="col-md-6"></div>
							</div>
							
							<!-- SEND BUTTON ------------------------------*******************------------------ -->
				</div>
	
			</div>
	</div>
</div>    
		<div class="modal fade center-modal" id="publicKeyModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content" style="padding: 20px;">
		    <div class="modal-header thanksModal headDiv">
               <div class="form-group">
               	  <label style="color: #333333; float: left;"><%=lbl.get("CONTRACTDETAILS").get("PUB_KEY")%><span style="color:red"> *</span></label>
				  <i style="float:right;" id="testkey" class="fa fa-copy" data-toggle="tooltip" title="copy" ng-click="copytoclipboard()"></i>
                  <textarea class="form-control" rows="5" id="copykey" ng-model="selectedContractData.Record.publickey" ng-readonly="isProducer || hideForm" ></textarea>
               </div>
               		    
			    <div style="text-align: right;" >
			    	<button type="button" class="btn btn-default uButton"style="margin-right: 0px;" ng-hide="isKeyUpdate" ng-click="resetPublicKey()"><%=lbl.get("CONTRACTDETAILS").get("CLOSE")%></button>
			      	<button type="button" class="btn btn-successcustom marginLeft5" ng-click="updateContractPublicKey('public key updated')" ng-hide="isProducer || isKeyUpdate || hideForm" ><%=lbl.get("CONTRACTDETAILS").get("UPDATE")%></button>
			      	<button type="button" class="btn btn-successcustom" ng-show="isKeyUpdate" ><%=lbl.get("CONTRACTDETAILS").get("OK")%> <i class="fas fa-spinner fa-spin"></i></button>
			      	
			    </div>
			    
		    </div>
		    
		  </div>
		</div> 
		</div>	
		
			    		
		    <!-- Settings model-->		
<div class="modal fade" id="con-setting" role="dialog">
    <div class="modal-dialog">    
  
      <div class="modal-content"  style="padding: 20px;">
        <div class="modal-header" style="text-align: left; margin-bottom: 0;">
          <button type="button" class="close" data-dismiss="modal" ng-click="startInterval()">&times;</button>
          <h3 class="modal-title" style="margin-bottom: 0;">Settings</h3>
        </div>
        
        <div class="modal-body">
        <div class="form-group" ng-hide="disableProviderEmail">
			<label class="margintop20 font-weight-bold" for="email"><%=lbl.get("CONTRACTDETAILS").get("PRODUCER_EMAIL")%>:&nbsp;</label>								
			<i class="pull-right fas fa-check-square dpCheckClick" ng-click="updateSettings('DP');hideEmail=!hideEmail" ng-show="hideEmail" style="color: #96ca4e;font-size: 20px;position: absolute; top: 20; right: 20;"></i> 
			<span class="dpData" ng-hide="hideEmail">{{selectedContractData.Record.dpemail}}<i style="margin-left: 10px; position: absolute; right: 20px; top: 20px; cursor: pointer;font-size: 20px;color: #54555f;" class="fas fa-pen-square dpEditClick" ng-hide="hideForm" ng-click="hideEmail=!hideEmail"></i></span>	                         
			<input class="form-control" type="text" ng-model="selectedContractData.Record.dpemail" ng-show="hideEmail" ng-readonly="hideForm"/>
		</div>
		
        <div class="form-group" ng-hide="disableConsumerEmail">
			<label class="font-weight-bold" for="e-mail"><%=lbl.get("CONTRACTDETAILS").get("CONSUMER_EMAIL")%>:&nbsp;</label>
			<i class=" pull-right fas fa-check-square dcCheckClick" ng-click="updateSettings('DC');hideEmail=!hideEmail" ng-show="hideEmail" style="color: #96ca4e;font-size: 20px;cursor: pointer;"></i>		                       
			<span class="dcData" ng-hide="hideEmail">{{selectedContractData.Record.dcemail}}<i style="margin-left: 10px;cursor: pointer;font-size: 20px;color: #54555f;" class="fas fa-pen-square dcEditClick" ng-hide="hideForm" ng-click="hideEmail=!hideEmail"></i></span>
			<input type="text" class="form-control" ng-model="selectedContractData.Record.dcemail" ng-show="hideEmail" ng-readonly="hideForm"/>																
		</div>	
		
		 <div class="">		      
               <div class="form-group">
               	  <label style="float: left;"><%=lbl.get("CONTRACTDETAILS").get("PUB_KEY")%><span style="color:red"> *</span></label>
				  <i style="float:right;" id="testkey1" class="fa fa-copy" data-toggle="tooltip" title="copy" ng-click="copytoclipboard1()"></i>
                  <textarea class="form-control" rows="5" id="copykey1" ng-model="selectedContractData.Record.publickey" ng-readonly="isProducer || hideForm" ></textarea>
               </div>
         </div>
            <div class="modal-footer padding0">   
              <div class="col-md-12 padding0" style="text-align:right;">   
          <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="startInterval()">Close</button>
        </div>   
        </div>  
        </div>        
       
      </div>
      
    </div>
  </div>
  
  
  
  <!-- Contact modal -->
  <div class="modal fade center-modal" id="contact" tabindex="-1" role="dialog" aria-labelledby="refreshModalLabel" aria-hidden="true" >
			<div class="modal-dialog" role="document">
			  <div class="modal-content"  style="padding: 20px;">
			  <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" ng-click="startInterval()">&times;</button>
          <h4 class="modal-title">Contact Us</h4>
        </div>
			  <div class="modal-body">
			   <div class="form-group">
										<label class="font-weight-bold message-title" for="message-box">Would you like to send a message</label>
										<span ng-show="confirmcontractrequired && newdesc.length < 1" style="color:red"> <%=lbl.get("CONTRACTDETAILS").get("MESSAGE_REQUIRED")%></span>
										<textarea class="form-control" rows="3" ng-model="newdesc" placeholder="Type your message..." ></textarea>
									</div>
									
			    <div class="modal-footer padding0" ng-hide="buyPopupStatusLoad">
			    <div class="form-group msg-next col-md-12 padding0" style="text-align:right;" ng-hide="confirmcontractrequired && newdesc.length < 1">
										
					<button ng-show="!sendButtonStatus" class="btn btn-successcustom" ng-click="updateContract1(newdesc)">
						<i class="fa fa-paper-plane-o"></i> <%=lbl.get("CONTRACTDETAILS").get("SEND")%>
					</button>
					
					 <button ng-show="sendButtonStatus" class="btn btn-successcustom">
						<i class="fa fa-paper-plane-o"></i> <%=lbl.get("CONTRACTDETAILS").get("SEND")%>
						<i class="fas fa-spinner fa-spin"></i>
					</button>
					
				</div>   
			    </div>
			  </div>
			   </div>
			</div> 
		</div>
		<!-- Withdraw modal -->
  <div class="modal fade center-modal" id="withdraw" tabindex="-1" role="dialog" aria-labelledby="refreshModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content"  style="padding: 20px;">
			  <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" ng-click="startInterval()">&times;</button>
          <h4 class="modal-title">Withdraw</h4>
        </div>
			  <div class="modal-body">
			   <div class="form-group">
					<label class="font-weight-bold message-title" for="message-box">Give a  reason for withdrawal</label>
					<span ng-show="confirmcontractrequired && newdesc.length < 1" style="color:red"> <%=lbl.get("CONTRACTDETAILS").get("MESSAGE_REQUIRED")%></span>
					<textarea class="form-control" rows="3" ng-model="newdesc" placeholder="Type your message..." ></textarea>
				</div>
									
			    <div class="modal-footer padding0" ng-hide="buyPopupStatusLoad">
			   <div class="form-group msg-next col-md-12 padding0" style="text-align:right;">
					<button class="btn btn-successcustom" ng-show="!sendButtonStatus"  ng-click="withdrawnContract(newdesc)">
						<i class="fa fa-paper-plane-o"></i> <%=lbl.get("CONTRACTDETAILS").get("SEND")%>
					</button>
					
					<button class="btn btn-successcustom" ng-show="sendButtonStatus">
						<i class="fa fa-paper-plane-o"></i> <%=lbl.get("CONTRACTDETAILS").get("SEND")%>
						<i class="fas fa-spinner fa-spin"></i>
					</button>
				</div>   
			    </div>
			  </div>
			   </div>
			</div> 
		</div>
		
		<!-- Refresh modal -->
		<div class="modal fade center-modal" id="refreshModal" tabindex="-1" role="dialog" aria-labelledby="refreshModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content"  style="padding: 20px;">
			    <div class="modal-header refreshModal">
			      <p style="text-align: left;"><%=lbl.get("CONTRACTDETAILS").get("REFRESH_CHAT")%></p>
			  	</div>
			    <div class="modal-footer" ng-hide="buyPopupStatusLoad">
			      <button type="button" class="btn btn-successcustom" data-dismiss="modal">
			        <%=lbl.get("CONTRACTDETAILS").get("CLOSE")%>
			      </button>
			    </div>
			  </div>
			</div> 
		</div>
		

		<!-- Decript Modal -->
		<div class="modal fade center-modal" id="decryptModal" tabindex="-1" role="dialog" aria-labelledby="decryptModal" aria-hidden="true">
				<div class="modal-dialog" role="document">
				  <div class="modal-content" style="padding:30px!important;">
					
					<div class="modal-body" style="text-align: left;">
					  <br>
					  <div class="padding0" style=" font-size:2rem;">Decrypt Message</div>
					
					<div class="margintop20">
							<p class="para-text" style="text-align: left;"><%=lbl.get("CONTRACTDETAILS").get("DECRYPT_PUBLIC_KEY_MSG")%></p>
							<input type="text" class="form-control" value={{endpointMsg}} readonly/><br>
							<p class="para-text" style="text-align: left;"><%=lbl.get("CONTRACTDETAILS").get("DECRYPT_PRIVATE_KEY_MSG")%></p>
							<input type="text" class="form-control" ng-model="privateKey"/><br>							
					<p class="para-text" style="color:#c40b0b;">{{decrypterrMessage}}
				</div>		
			</div>
					<div class="modal-footer padding0" style=" border-top:1px 1px solid #dee2e6;">
								<botton class="btn cancel-btn" type="button" style=" padding: 10px; width: 25rem!important;background-color: white; color: #cecfd0; border: none;" data-dismiss="modal">
										Cancel
								</botton>
								<button type="button" class="btn btn-successcustom" style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" ng-show="isbuttonsubmitted" ng-disabled>Decrypt Message <i class="fas fa-spinner fa-spin"></i> </button>			
				  <button type="button" class="btn btn-successcustom"style=" padding: 10px; width: 25rem; background-color: #424143; border-color:#424143; color: white;" ng-show="!isbuttonsubmitted" ng-click="decryptKey()">
						Decrypt Message
				  </button>
				</div>
			
				</div>
					</div>
				  </div>
				</div> 
				</div>
		
		
		<div class="modal fade center-modal" id="decryptsuccessModal" tabindex="-1" role="dialog" aria-labelledby="refreshModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content"  style="padding: 30px;">
			    <div class="modal-body refreshModal">
						<div>
								<span class="checkSuccess"> <i class="fas fa-check-circle"> </i></span>
								<span style="font-size:3rem;vertical-align: middle;font-weight: 300;">&nbsp; Success </span>
								<p></p>
								<p></p>
							</div>
			      <p class="para-text"><b><%=lbl.get("CONTRACTDETAILS").get("ENDPOINT_URL")%></b></p>
			      <p style="overflow-wrap: break-word; color: royalblue; text-decoration: underline;" ng-if="decryptendpointurl"><a href="{{decryptendpointurl}}"  target="_blank">{{decryptendpointurl}}</a></p>
			       <p class="para-text" ng-if="apidocument"><b><%=lbl.get("CONTRACTDETAILS").get("API_DOC")%> </b></p>
			      <p style="overflow-wrap: break-word; color: royalblue; text-decoration: underline;"><a href="{{apidocument}}" target="_blank">{{apidocument}}</a></p>
			      <p class="para-text" style="overflow-wrap: break-word; color: peru;" ng-if="endpointexpiry">Kindly note that the API endpoint will expire after {{endpointexpiry}} days.</p>
			  	</div>
			  	
			    <div class="modal-footer">
					<div class="col-md-12">
			      <button type="button" class="btn btn-successcustom" data-dismiss="modal" ng-click="decryptmdlClear()" style="width:100%; padding: 10px; width: 25rem;  background-color:#424143; border-color: #424143; color:white;">
			       Close
				  </button>
				</div>
			    </div>
			  </div>
			</div> 
		</div>
		
		
		<!-- auto page reload modal -->
		<div class="modal fade center-modal" id="autoPageReloadModal" tabindex="-1" role="dialog" aria-labelledby="autorefreshModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
			  <div class="modal-content"  style="padding: 20px;">
			    <div class="modal-header autoPageReloadModal">
			    	<p><%=lbl.get("CONTRACTDETAILS").get("RELOAD_PAGE")%></p>
			  	</div>
			    <div class="modal-footer" ng-hide="buyPopupStatusLoad">
			      <button type="button" class="btn btn-successcustom" data-dismiss="modal" ng-click="autoPageReloader()">
			        <%=lbl.get("CONTRACTDETAILS").get("OK")%>
			      </button>
			    </div>
			  </div>
			</div> 
		</div>
		
		<div id="confirmModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content"  style="padding: 20px;">
            <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Thank You For Connecting With Us </h4>
            </div>
            <div class="modal-body">
                <p> What is your negotiated price?</p>
				<input id="negPrice" type="text" class="form-control" placeholder="0" ng-model="selectedContractData.Record.finalprice" onkeyup="return replacePonto()" ng-disabled="priceDisabled"/>
			</div>
			<div class="" >
			<button type="button" class="btn btn-successcustom" data-dismiss="modal">
				Negotiate
				<!-- <%=lbl.get("CONTRACTDETAILS").get("OK")%> -->
			  </button>
			</div>
        </div>
    </div>
</div>

		<script src="resources/js/jquery.js"></script>
	  	<script src="resources/js/bootstrap.js"></script>	  

	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
		<script src="resources/js/ngstorage.min.js"></script>
		<script src="resources/js/datafedApp.js"></script>
		<script src="resources/controller/contractdetailController.js"></script>
	</body>
		<script>	

var radioText=''
function selectRadio(dis){
	if(dis && dis.innerText==="Negotiation"){
		radioText=dis.innerText;
		$("#confirmModal").modal('show');
	}else{
		radioText='';
		$(".message-title").hide();
		$(".message-blink").show();
	}
}

	$(".option-next").click(function(){
		$(".dec_area").hide();
		if(radioText==="Negotiation"){
			$(".nego-area").fadeIn();			
		}else{
			$(".message-area").fadeIn();
		}
	});
	
	$(".neg-back").click(function(){
		$(".dec_area").fadeIn();
		$(".nego-area").hide();		
	});

	$(".neg-next").click(function(){
		$(".message-area").fadeIn();
		$(".nego-area").hide();		
	});

	$(".msg-back").click(function(){
		$(".message-area").hide();
		if(radioText==="Negotiation"){
			$(".nego-area").fadeIn();			
		}else{
			$(".dec_area").fadeIn();
				}	
	});
	/* ---------------entret in contract detail page -------------------- */
	  /* $(document).ready(function(){
	    $("#enterContract").modal('show');	 	   
	    }); */
	  /* ----------------------------------- */
		$(".dcEditClick").click(function(){
			  $(".dceditable").show();
			  $(".dcData").hide();			  
			  $(".dceditable").addClass("form-control");
			  $(".dcEditClick").hide();		
			  $(".dcCheckClick").show();	
			  	  
			});
			$(".dcCheckClick").click(function(){
			  $(".dceditable").hide();	
			  $(".dcData").show();		  
			  $(".dceditable").addClass("form-control");
			  $(".dcEditClick").show();		
			  $(".dcCheckClick").hide();	
			  	  
			});
		
			$(".dpEditClick").click(function(){
			  $(".dpeditable").show();
			  $(".dpData").hide();			  
			  $(".dpeditable").addClass("form-control");
			  $(".dpEditClick").hide();		
			  $(".dpCheckClick").show();	
			  	  
			});
			$(".dpCheckClick").click(function(){
			  $(".dpeditable").hide();	
			  $(".dpData").show();		  
			  $(".dpeditable").addClass("form-control");
			  $(".dpEditClick").show();		
			  $(".dpCheckClick").hide();	
			  	  
			});

		    // $(document).ready(function(){
		    //     $("#confirmModal").modal('show');
		    // });
			
	$(function () {
		$('#datafedmenu').addClass('menu-active');
		$('[data-toggle="tooltip"]').tooltip();

	function replacePonto(){
        var input = document.getElementById('negPrice');
        var ponto = input.value.split('.').length;
        
        input.value=input.value.replace(/[^0-9.]/,'');

        if (ponto ==2)
	input.value=input.value.substr(0,(input.value.indexOf('.')+3));
	
	if(input.value == '.')
		input.value = "";
	
	}

	$("#buycont").addClass("active");

</script>
</html>
