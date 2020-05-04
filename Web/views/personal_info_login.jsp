<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	 Member m = (Member)session.getAttribute("member"); 
	
    
    
	%>
<!doctype html>

<html lang="en">
  <head>
    

   
    <meta charset="utf-8">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>개인 정보 수정</title>

    <!-- 게시판 부트스트랩 cnd-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- 게시판 부트스트랩 cnd-->
    <!--제이쿼리 cnd-->
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!--제이쿼리 cnd-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
    <link rel="stylesheet" href="./css/styles.css">
    <style>
      
    body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
    
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 0px;
      z-index: 900;
    }
    #login{
        position: absolute;
        
        right: 30px;
    }

    .main{ position: relative; height: 894px; padding: 20px; 
           align-content: center;    }
    .article{
      display: inline-block;
      margin: 10px;
      padding: 20px;
      
    
    }  
    .side-bar{
      position: relative;
    top: -52px;
    left: -20px;
    width: 291px;
    height: 902px;
     
      background: rgb(228, 233, 235);
    } 
     .left{ position: absolute;left: 300px;top: 50px; }  
    .center{  position: absolute; left: 813px; top: -37px;} 
    .right{ position: absolute; left: 1343px; top: -37px}
    .detail-profile{
        position: relative;
        width: 550px;
        height: 900px;
     
            background: #FFFFFF;
         
    }
    .photo{
      width: 150px;
    height: 150px;
    left: 145px;
    position: relative;
    margin: 35px;   }
    .work-info{
        position: relative;
        width: 530px;
        height: 450px;
            background: #FFFFFF;
            border-right-style: inset;
            margin-bottom: -20px;
            font-size: 25px;
    }
   
  
    #logo{
      position: absolute;
      width: 120px;
      height: 120px;
      right: 70px;
    }
    #top{
      background: rgb(60, 0, 109);
      border-radius: 30px;
    }
    .bottom{
      position: relative;
    width: 1070px;
    height: 380px;
   
    
   
    top: 1000px;
    left: 670px
          }
    #profile li{
      list-style-type: none;
      font-weight: 900;
      letter-spacing: 0.04em;
      color: #000000;
      font-size: 15px;
      padding: 30px;
    }
    #profile span{
     padding-left: 145px;
    }
    ul{
      padding-left: 20px;
      list-style-type: none;;
    }      
    p{
      position: relative;
      background: rgb(rgb(207, 202, 202), rgb(213, 219, 213), rgb(199, 199, 202));
      top: 0px;
      font-weight: 900;
      font-size: 20px;
      line-height: 7px;
      letter-spacing: 0.04em;
      color: #000000;
      padding: 30px;
      font-style: normal;
    }
    table{
      font-style: normal;
    }
    .work-info li{
    font-weight: 900;
    font-size: 15px;
    padding: 9px;
    letter-spacing: 4px;
    color: #000000;
    }
    .work-info span{
      color: red;
      padding-left: 77px;
    }
    .salary li{
    font-weight: 900;
    color: #000000;
    font-size: 15px;
    padding: 9px;
    letter-spacing: 4px;
    line-height: 40px;
    }
    .salary span{
      padding-left: 60px;
    }
   .list-group li{
    background:   rgb(228, 233, 235); ;
    border: 0px;
    line-height: 30px;
    font-size: 15px;
    font-weight: 600;
    padding-left: 75px;
   }
   .list-group a{
      color: black;
   }

    </style>

  
</head>

<body>
  <!--버튼 CND-->
  <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  <!--버튼 CND-->  
  <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base" >
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
       <%@ include file="/views/common/header2.jsp" %> 
          <main class="mdl-layout__content">
          <div class="mdl-layout__tab-panel is-active" id="overview" style="background: white;"> 
        <!--메인 프레임-->
        <div class="main">
          <!--왼쪽공간-->
      <div class="side-bar">
            <div class="panel panel-info">
              <div class="panel-heading">
              <p class="panel-title" style="margin: 23px;
              font-size: 25px;">인사 정보</p>
            </div>
              <!-- 사이드바 메뉴목록1 -->
              <ul class="list-group">
              <li class="list-group-item"><a href="border(department).html">나의 인사정보</a></li>
                <li class="list-group-item"><a href="/Semi/address.ad">사내 인사정보</a></li>
              <li class="list-group-item"><a href="border(community).html">개인정보 수정</a></li>
              </ul>
          </div>                    
          </div>
          
         	 <form action="/Semi/infologin.me" method="get" name="frm" id="frm">
             <div class="article left" style="text-align:left; font-size: 20px; font-weight: bold;">
              <span>아이디 :  </span> &nbsp;&nbsp;&nbsp;<input type="text" id="id" name="id" value="<%=m.getEmpId() %>" style="margin-left: 19px;"> <br><br>
              <span>비밀번호 : </span> &nbsp;&nbsp; <input type="password" id="pwd" name="pwd" placeholder="비밀번호" value=""><br><br>
				<div style="text-align :right;">	
				<input type=submit onclick="return submitAttion()" value="로그인">            
				</div>
				</div>
				</form>
				<script>
				
				<%--  window.onload=function(){
						if('<%=request.getAttribute("fail") %>' != 'null') {
					  		alert("<%=request.getAttribute("fail") %>");
						 }
					    } --%>
				 
			function submitAttion(){
				   var id = document.getElementById('id');
				   var pwd = document.getElementById('pwd');
				
				if(id.value==""){
			        alert("ID를 입력해주세요.")
			        return false;
			    }else if(pwd.value==""){
			        alert("Password를 입력해주세요.")
			        return false;
			   	}else if("<%=m.getEmpPwd()%>"!=pwd.value){
					alert('아이디 비밀번호를 확인해 주세요');
					 return false;
			   }else{
			   		return true;  		
			   }
			}
		
		</script>
            </div>
      </div>
      <!--메인 끝-->
       <%@ include file="./common/footer.jsp" %>
            </main>
            <script>
              window.onfocus=function(){
              }
              window.onload=function(){
               window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
              window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
              window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
              window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
              }
            </script>
</body>
</html>