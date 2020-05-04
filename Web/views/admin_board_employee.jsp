<%@page import="com.member.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<Member> list = (ArrayList<Member>)session.getAttribute("list"); 
   
   Member m = (Member)session.getAttribute("member");
   PageInfo pi = (PageInfo)session.getAttribute("pi");
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   

%>
<!doctype html>

<html lang="en">
  <head>
        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
 
    
    <title>사원관리 게시판</title>


    <meta name="mobile-web-app-capable" content="yes">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">

    <meta name="msapplication-TileColor" content="#3372DF">


  

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
    <link rel="stylesheet" href="views/css/styles.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    

    <style>
            
     a{
 cursor:pointer;
 }
 a:hover{
    text-decoration: none;
   color: white;    
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

    .main{ position: relative; height: 1160px; padding: 20px;}

    .side-bar{width: 300px; height: 1000px;}

    .page-content{width: 1150px; height: 800px;  position: absolute; left: 350px;;}

    .centerlow{width: 1150px; height: 170px; position: absolute; left: 350px; top: 850px;}
    
    

  

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

    
    th{
      font-size: 13px;
      padding-left: 100px;
      text-align: right;
    }

    td{      
      text-align: right;
      padding-left: 50px;
    }
    .list-group-item{
      margin-bottom: 20px;
      border: 0px;
      padding-left: 50px;
    }
    .list-group-item a{
      color : black;
    }
    </style>
</head>

<body>
    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
          <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
            <div class="mdl-layout--large-screen-only mdl-layout__header-row">
            </div>
            <div class="mdl-layout--large-screen-only mdl-layout__header-row" id="top">
             <img src="./resource/images/로고1.png" id="logo">
            </div>
            <div class="mdl-layout--large-screen-only mdl-layout__header-row">
            </div>
            <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
              <a href="views/mainpage.jsp" class="mdl-layout__tab">홈</a>
            <a href="javascript:void(0)" class="mdl-layout__tab" onclick="goNotice()">공지사항</a>
              <a href="javascript:void(0)" class="mdl-layout__tab" onclick="goBoard1()">게시판</a>
              <a href="#features" class="mdl-layout__tab">근태관리</a>
              <a href="#features" class="mdl-layout__tab">전자결제</a>
              <a href="mypage.jsp" class="mdl-layout__tab">인사정보</a>
              <form action="/Semi/logout.me">
              <input type="submit" class="mdl-layout__tab" id="login" value="로그아웃" style="background: #512DA8;">  
              </form>
              <a href="#features" class="mdl-layout__tab" onclick="MessageOpen();">메신저</a>
               <!--사이드바-->
              <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
                
              <!-- Material Design icon font -->
              <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
              <!--사이드바-->                           
                <span 
                class="visuallyhidden">Add</span>
              </button>
            </div>
          </header>
          <main class="mdl-layout__content">
          <div class="mdl-layout__tab-panel is-active" id="overview">
            
         <div class="main">      
                <div class="left">
                    <!-- 사이드 바 메뉴-->
                    <!-- 패널 타이틀1 -->
                    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
                      <div class="side-bar">
                        <!-- 사이드 바 메뉴-->
                        <!-- 패널 타이틀1 -->
                        <div class="panel panel-info">
                          <div class="panel-heading" style=" padding: 20px;" >
                            <h3 class="panel-title" style="font-size: 20px;
                            font-weight: 900;">관리자 메뉴</h3>
                            </div>
                            <!-- 사이드바 메뉴목록1 -->
                            <ul class="list-group">
                              <li class="list-group-item"><a href="views/admin_add_employee.jsp">회원추가</a></li>
                            <li class="list-group-item"><a href="/Semi/mList.em">회원목록</a></li>
                            <li class="list-group-item"><a href="/Semi/flist.fo">식단관리</a></li>
                            </ul>
                        </div>                    
                </div><br>                                  
                      
                          <div class="page-content"><!-- Your content goes here -->
                          <table id="listArea" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
                            <thead>
                              <tr>
                                <th style="font-size: 15px; " class="mdl-data-table__cell--non-numeric">사원번호</th>
                                <th style="font-size: 15px;" >사원명</th>
                                <th style="font-size: 15px;">생년월일</th>
                                <th style="font-size: 15px;">부서</th>
                                <th style="font-size: 15px;">직급</th>  
                                <th style="font-size: 15px;">입사일</th>
                                <th style="font-size: 15px;">퇴사일</th>
                              </tr>
                            </thead>
                            <tbody>
                            <% for(Member mem : list) { %>
                            <% String entDate = String.valueOf(mem.getEntDate());%>
                              <tr id="delselect">
                                <td class="mdl-data-table__cell--non-numeric"><%=mem.getEmpNo()%></td>
                                <td style="padding-left: 100px;"><%=mem.getEmpName() %></td> 
                                <td style="padding-left: 100px;"><%=mem.getEmpSsn() %></td>
                                <td style="padding-left: 100px;"><%=mem.getDeptName() %></td>
                                <td style="padding-left: 100px;"><%=mem.getJobName() %></td> 
                                <td style="padding-left: 100px;"><%=mem.getHireDate() %></td>
                               <%if(entDate.equals("null")){ %>    
                                <td style="padding-left: 100px;">재직중</td>
                               <%} else{%>
                                <td style="padding-left: 100px;"><%=mem.getEntDate() %></td>
                                <%} %>
                            </tr>
                            <% } %>
             
                            </tbody>
                          </table>
                          
                  <%-- 페이지 처리 --%>
                          <div class="pagingArea" align="center"><br>
         <button onclick="location.href='<%= request.getContextPath() %>/mList.em?currentPage=1'"><<</button>
         <%  if(currentPage <= 1){  %>
         <button disabled><</button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/mList.em?currentPage=<%=currentPage - 1 %>'"><</button>
         <%  } %>
         
         <% for(int p = startPage; p <= endPage; p++){
               if(p == currentPage){   
         %>
            <button disabled><%= p %></button>
         <%      }else{ %>
            <button onclick="location.href='<%= request.getContextPath() %>/mList.em?currentPage=<%= p %>'"><%= p %></button>
         <%      } %>
         <% } %>
            
         <%  if(currentPage >= maxPage){  %>
         <button disabled>></button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/mList.em?currentPage=<%=currentPage + 1 %>'">></button>
         <%  } %>
         <button onclick="location.href='<%= request.getContextPath() %>/mList.em?currentPage=<%= maxPage %>'">>></button>
         
      </div><br>
                            <div id="searchForm" class="text-center">
                              
                              <form action="/Semi/mSearch.em">
                                  <select name="category" style="height: 26px;">
                                      <option value="empno">사원번호</option>
                                      <option value="empname">사원명</option>
                                      <option value="deptname">부서</option>
                                      <option value="jobname">직급</option>
                                  </select>
                                  <input type="text" size="20" id="keyword" name="Keyword"/>&nbsp;
                                  <input type="submit" value="검색" class="btn btn-default btn-primary" onclick="return searchmem()">
                              </form>    
                          </div>
                          <a style="position: relative;right: 35px;
                          bottom: 35px;" class="btn btn-default btn-primary pull-right" id="del" onclick='test();'>선택항목삭제</a>
                        </div>
                    </div>                  
            </div><br>            
              
              <script>
                 function searchmem(){
                    
                    if(document.getElementById('keyword').value==""){
                       return false
                    }else{
                       return true;
                    }
                 }
              
              
              </script>
            

               <script>
            
            function test(){
               var dellist = new Array();
               var tt = document.getElementsByClassName('is-selected');
               
               for(var i=0;i<tt.length;i++){
                  var dar=tt[i].childNodes[2].innerHTML;   
                  dellist[i]=dar;
                  
               }
               location.href="/Semi/mDelete.em?dellist="+dellist;
            }
            
                function writeOpen(){ //메세지창 열기
                  window.open('write.html','메세지함','width=1280px,height=960px');
                }
                 $(function(){
                 
                 $("#listArea td").click(function(){
                    var no = $(this).parent().children().eq(1).text();
                    location.href="/Semi/mDetail.em?no="+no;
                 }); 
              });
                //td의 0번에 들어있는 onclick을 비워두면 끗
                      </script>
               
                  
              
        </div>   
        </div>
      <%@ include file="./common/footer.jsp" %>
            </main>

            <script>
            function goNotice(){
                location.href="/Semi/selectList.no";
             }
             
             function goBoard(){
                location.href="/Semi/selectList.bo";
             }
             
             function goBoard1(){                  
                 var typeno = 1;                   
                 location.href="/Semi/selectList.bo?typeno="+typeno;
             }  
            
            
              window.onfocus=function(){
              }
              window.onload=function(){
              window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
              window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
  
              window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
              window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
              };

            </script>
            
</body>
</html>