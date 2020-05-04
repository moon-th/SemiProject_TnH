<%@page import="com.member.service.MemberService"%>
<%@page import="com.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   		 ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
   
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>메인 페이지</title>
    


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
    <link rel="stylesheet" href="views/css/styles.css">
    <link id="theme" href="css/theme-default.css" rel="stylesheet" type="text/css">

<!--태환 css-->
<style>

	.panel{
		margin-left: 40px;
	}
	
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
    .article{
      display: inline-block;
      margin: 5px;
      padding: 5px;
      position: relative;
    }
    .main{ position: relative; height: 1480px; padding: 10px; }
    .left{  position: absolute; left: 0px}
    .center{  position: absolute; left: 440px;} 
    .right{ position: absolute; left: 1300px;}

     .name{
            position: absolute;
      width: 110px;
      height: 40px;
      left: 130.58px;
      top: 236.75px;

      font-family: Comfortaa;
      font-style: normal;
      font-weight: normal;
      font-size: 30px;
      line-height: 40px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: -0.015em;

      color: #000000;

      transform: rotate(0.31deg);
     } 
     .myphoto{
      position: absolute;
      width: 128px;
      height: 128px;
      left: 126.45px;
      top: 76.68px;

      background: url(photo-1542103749-8ef59b94f47e.jpg);
      transform: rotate(0.31deg);
     }
     .title{
      position: absolute;
      width: 80px;
      height: 15px;
      left: 148.27px;
      top: 300.84px;

      font-family: Roboto;
      font-style: normal;
      font-weight: 900;
      font-size: 13px;
      line-height: 15px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;

      color: #000000;

      transform: rotate(0.31deg);
     }
     .todaycheck{
      position: absolute;
      width: 200px;
      height: 20px;
      left: 50px;
      top: 354.02px;

     
      font-style: normal;
      font-weight: 900;
      font-size: 15px;
      line-height: 15px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;

      color: #000000;
    
     }
     .todaycheck1{
      position: absolute;
      width: 200px;
      height: 150px;
      top: 354.02px;
      left: 50px;

     
      font-style: normal;
      font-weight: 900;
      font-size: 15px;
      line-height: 15px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;

      color: #000000;
    
     }
    .checkpaper{
      position: relative;
      left: 24.27px;
      top: 9px;
      font-style: normal;
      font-weight: 900;
      font-size: 20px;
      line-height: 46px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      color: #000000;
    }
      .non{
        width: 800px;height: 670px; 
      padding: 10px;  background:white;

      }
    .board{    width: 800px;
    height: 670px;
    border: 1px solid rgb(192, 189, 189);
    padding: 10px;
    background: white;
    position: relative;
    top: 54px;}
      .write{
        position: relative left 1px;
      }
    .calendar{width: 380px; height: 550px;}
    
    #chat{ position:relative; width: 500px;height: 950px;
       background: white;      
            border: 1px solid rgb(192, 189, 189); padding: 15px;}
    #chattext{
        position: relative;
    top: -15px;
    left: -7px;
    width: 405px;
    height: 65px;
    padding: 10px;
    } 
    #chatbutton{
        position: relative;
    top: -15px;
    width: 90px;
    height: 64px;
    left: -7px;
    }
    .emergency{position: relative width 500px; height: 300px;}
    .check{position: relative;
            width: 375px;
            height: 350px;

            background: white;
          
            
            border: 1px solid rgb(192, 189, 189); }

      
      .checklist>li{
        font-style: normal;
    font-weight: 500;
    font-size: 15px;
    line-height: 25px;
    display: flex;
    align-items: center;
    text-align: center;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    color: #000000;
    }        
    .foodlist{
      
    position: relative;
    width: 380px;
    height: 482px;
    background:white;
    padding: 10px;
  
    border: 1px solid rgb(192, 189, 189);
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
   
  #foodtable tr,#foodtable td 
    {
    padding: 11px;
    border-top: 3px solid #ddd;
     }
  #boardtable tr,#boardtable td 
    {
    padding: 11px;
    border-top: 3px solid #ddd;
     }
     .emergency{
        position: relative;
        height: 400px;
        padding: 10px;
     } 
    
    .col-md-3{
   border-radius: 10px;
    margin-bottom: 30px;
    margin-left: 35px;
    padding-top: 10px;
    background: floralwhite;
    font-weight: bold;
     font-size: 17px;
    }
    .empphoto{
    	border-radius: 10px
    }
 	.dept-title{
 		color: black;
 		font-weight: 700!important;
 		    margin: 0!important;
 		        font-size: 24px;
    line-height: 32px;
    font-family: "Roboto","Helvetica","Arial",sans-serif;
        box-sizing: border-box;
        display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
 	}
    
</style>
<!--태환 css-->    
</head>

<body>
    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
         <%@ include file="/views/common/header2.jsp" %> 
          
          <div class="mdl-layout__tab-panel is-active" id="overview">
            	 <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h4 class="dept-title"  style="color: blakc">임원진</h4>
                    </div>
                    <div class="card-body">
                     
                  </div>
                <div class="row">
                      <%for(Member m : list) { %>
                      <%if(m.getDeptName().equals("임원진")){ %>
                    <div class="col-md-3">
                        <!-- CONTACT ITEM -->
                      
                        <div class="panel panel-default">
                            <div class="panel-body profile">
                                <div class="profile-image" style="width: 177px;height: 200px;">
                                <%if(m.getChangename()!=null && !m.getChangename().equals("null")){%>
                                    <img class="empphoto" alt="사원사진" src="./resource/images/<%=m.getChangename() %>" width="177px" height="200">
                                <%}else{ %>
                                	<img class="empphoto" alt="사원사진" src="./resource/images/캡처.PNG" width="177px" height="200">
                                <%} %>
                                </div>
                                <div class="profile-data">
                           		       <div class="profile-data-name"> <%=m.getEmpName() %></div>
                                    <div class="profile-data-title"><%=m.getDeptName() %> / <%=m.getJobName() %></div>
                                </div>
                             
                            </div>                                
                            <div class="panel-body">                                    
                                <div class="contact-info">
                                    <p><small>Mobile</small><br><%=m.getPhone() %></p>
                                    <p><small>Email</small><br><%=m.getEmail() %></p>
                                    <p><small>Address</small><br><%=m.getAddress() %></p>                                   
                                </div>
                            </div>                                
                        </div>
                        </div>
                        <%} %>
                        <% } %>
                        <!-- END CONTACT ITEM -->
                 
                        </div>
                    </div>
            	
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h4 class="dept-title">총무팀</h4>
                    </div>
                    <div class="card-body">
                     
                  </div>
                <div class="row">
                      <%for(Member m : list) { %>
                      <%if(m.getDeptName().equals("총무팀")){ %>
                    <div class="col-md-3">
                        <!-- CONTACT ITEM -->
                      
                        <div class="panel panel-default">
                            <div class="panel-body profile">
                                <div class="profile-image" style="width: 177px;height: 200px;">
                                    <img class="empphoto" alt="사원사진" src="./resource/images/<%=m.getChangename() %>" width="177px" height="200">
                                </div><br>
                                <div class="profile-data">
                                    <div class="profile-data-name"><%=m.getEmpName() %></div>
                                    <div class="profile-data-title"><%=m.getDeptName() %> / <%=m.getJobName() %></div>
                                </div>
                             
                            </div>                                
                            <div class="panel-body">                                    
                                <div class="contact-info">
                                    <p><small>Mobile</small><br><%=m.getPhone() %></p>
                                    <p><small>Email</small><br><%=m.getEmail() %></p>
                                    <p><small>Address</small><br><%=m.getAddress() %></p>                                   
                                </div>
                            </div>                                
                        </div>
                        </div>
                        <%} %>
                        <% } %>
                        <!-- END CONTACT ITEM -->
                 
                        </div>
                    </div>
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h4 class="dept-title">인사팀</h4>
                    </div>
                    <div class="card-body">
                     
                  </div>
                <div class="row">
                      <%for(Member m : list) { %>
                      <%if(m.getDeptName().equals("인사팀")){ %>
                    <div class="col-md-3">
                        <!-- CONTACT ITEM -->
                      
                        <div class="panel panel-default">
                            <div class="panel-body profile">
                                <div class="profile-image" style="width: 177px;height: 200px;">
                                    <img class="empphoto" alt="사원사진" src="./resource/images/<%=m.getChangename() %>" width="177px" height="200">
                                </div>
                                <div class="profile-data">
                                    <div class="profile-data-name"><%=m.getEmpName() %></div>
                                    <div class="profile-data-title"><%=m.getDeptName() %> / <%=m.getJobName() %></div>
                                </div>
                             
                            </div>                                
                            <div class="panel-body">                                    
                                <div class="contact-info">
                                    <p><small>Mobile</small><br><%=m.getPhone() %></p>
                                    <p><small>Email</small><br><%=m.getEmail() %></p>
                                    <p><small>Address</small><br><%=m.getAddress() %></p>                                   
                                </div>
                            </div>                                
                        </div>
                        </div>
                        <%} %>
                        <% } %>
                        <!-- END CONTACT ITEM -->
                 
                        </div>
                    </div>
                    
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h4 class="dept-title">영업팀</h4>
                    </div>
                    <div class="card-body">
                     
                  </div>
                <div class="row">
                      <%for(Member m : list) { %>
                      <%if(m.getDeptName().equals("영업팀")){ %>
                    <!--   while(m.getDeptName() != m.getDeptName()[m+1]) -->
                    <div class="col-md-3">
                        <!-- CONTACT ITEM -->
                        <div class="panel panel-default">
                            <div class="panel-body profile">
                                <div class="profile-image" style="width: 177px;height: 200px;">
                                    <img class="empphoto" alt="사원사진" src="./resource/images/<%=m.getChangename() %>" width="177px" height="200">
                                </div>
                                <div class="profile-data">
                                    <div class="profile-data-name"><%=m.getEmpName() %></div>
                                    <div class="profile-data-title"><%=m.getDeptName() %> / <%=m.getJobName() %></div>
                                </div>
                             
                            </div>                                
                            <div class="panel-body">                                    
                                <div class="contact-info">
                                    <p><small>Mobile</small><br><%=m.getPhone() %></p>
                                    <p><small>Email</small><br><%=m.getEmail() %></p>
                                    <p><small>Address</small><br><%=m.getAddress() %></p>                                   
                                </div>
                            </div>                                
                        </div>
                        </div>
                        <%} %>
                        <% } %>
                        <!-- END CONTACT ITEM -->
                 
                        </div>
                    </div>
                    
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h4 class="dept-title">개발팀</h4>
                    </div>
                    <div class="card-body">
                     
                  </div>
                <div class="row">
                      <%for(Member m : list) { %>
                   			<%if(m.getDeptName().equals("개발팀")){ %>
                    <div class="col-md-3">
                        <!-- CONTACT ITEM -->
                      
                        <div class="panel panel-default">
                            <div class="panel-body profile">
                                <div class="profile-image" style="width: 177px;height: 200px;">
                                    <img class="empphoto" alt="사원사진" src="./resource/images/<%=m.getChangename() %>" width="177px" height="200">
                                </div>
                                <div class="profile-data">
                                    <div class="profile-data-name"><%=m.getEmpName() %></div>
                                    <div class="profile-data-title"><%=m.getDeptName() %> / <%=m.getJobName() %></div>
                                </div>
                             
                            </div>                                
                            <div class="panel-body">                                    
                                <div class="contact-info">
                                    <p><small>Mobile</small><br><%=m.getPhone() %></p>
                                    <p><small>Email</small><br><%=m.getEmail() %></p>
                                    <p><small>Address</small><br><%=m.getAddress() %></p>                                   
                                </div>
                            </div>                                
                        </div>
                        </div>
                        	<%} %>
                        <% } %>
                        <!-- END CONTACT ITEM -->
                 
                        </div>
                    </div>
                    
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                      <h4 class="dept-title">기획팀</h4>
                    </div>
                    <div class="card-body">
                     
                  </div>
                <div class="row">
                      <%for(Member m : list) { %>
                      <%if(m.getDeptName().equals("기획팀")){ %>
                    <div class="col-md-3">
                        <!-- CONTACT ITEM -->
                      
                        <div class="panel panel-default">
                            <div class="panel-body profile">
                                <div class="profile-image" style="width: 177px;height: 200px;">
                                    <img class="empphoto"  alt="사원사진" src="./resource/images/<%=m.getChangename() %>" width="177px" height="200">
                                </div>
                                <div class="profile-data">
                                    <div class="profile-data-name"><%=m.getEmpName() %></div>
                                    <div class="profile-data-title"><%=m.getDeptName() %> / <%=m.getJobName() %></div>
                                </div>
                             
                            </div>                                
                            <div class="panel-body">                                    
                                <div class="contact-info">
                                    <p><small>Mobile</small><br><%=m.getPhone() %></p>
                                    <p><small>Email</small><br><%=m.getEmail() %></p>
                                    <p><small>Address</small><br><%=m.getAddress() %></p>                                   
                                </div>
                            </div>                                
                        </div>
                        </div>
                        <%  } %>
                        <%    } %>
                        <!-- END CONTACT ITEM -->
                        </div>
                    </div>
                    
                    
                    
                </div>
                </div>
        
    <br><br><br><br><br><br>
            <footer class="mdl-mega-footer" >
                <div class="mdl-mega-footer--middle-section">
                  <div class="mdl-mega-footer--drop-down-section" style="    position: relative;
                  left: 655px;">
                
                    <!--하단바 컨텐츠 -->
                   
               
                    <ul id=info style="list-style: none;">
                        <h4 style="font-weight: 700">Company Information</h4>
                      <li>상호 : 주식회사 T&H Company</li>
                      <li>주소 : 경기도 성남시 수정구 태평동 5380 501호</li>
                      <li>대표자 : 문태환 Moon Tae Hwan</li>
                      <li>사업자 등록번호 : 111 - 39 - 33140</li>
                      <li>Tel : 033-552-7517 / 010-8634-7517</li>
                      <li>E-Mail : itmoon@kakao.com</li>
                  
                    </ul>
         
                  </div>
                
                </div>
                <div class="mdl-mega-footer--bottom-section">
                  <div class="mdl-logo">
                    More Information
                  </div>
                  <ul class="mdl-mega-footer--link-list">
                    <li><a href="https://developers.google.com/web/starter-kit/">Web Starter Kit</a></li>
                    <li><a href="#">Help</a></li>
                    <li><a href="#">Privacy and Terms</a></li>
                  </ul>
                </div>
              </footer>

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