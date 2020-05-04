<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	 Member T = (Member)session.getAttribute("member");
	%>
	<!--헤더 시작 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/views/css/styles.css">
   <link rel="stylesheet" href="<%=request.getContextPath()%>/views/css/mainstyles.css">
<header
	class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
	<div class="mdl-layout--large-screen-only mdl-layout__header-row">
	</div>
	<div class="mdl-layout--large-screen-only mdl-layout__header-row"
		id="top">
		<h3>T & H Company</h3>
		<img src="<%=request.getContextPath()%>/resource/images/로고1.png" id="logo">

	</div>
	<div class="mdl-layout--large-screen-only mdl-layout__header-row">
	</div>
	<div
		class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">

		<a href="<%=request.getContextPath() %>/views/mainpage.jsp"
			class="mdl-layout__tab">홈</a> <a href="javascript:void(0)"
			class="mdl-layout__tab" onclick="goNotice()">공지사항</a> <a
			href="javascript:void(0)" class="mdl-layout__tab"
			onclick="goBoard1()">게시판</a> <a href="" class="mdl-layout__tab"
			onclick="workingHour();">근태관리</a> <a
			href="<%=request.getContextPath()%>/views/confirm/confirm.jsp"
			class="mdl-layout__tab" onclick="">전자결제</a>
			 <a href="<%=request.getContextPath() %>/views/mypage.jsp" class="mdl-layout__tab">인사정보</a>
		<form action="<%=request.getContextPath() %>/logout.me">
			<input type="submit" class="mdl-layout__tab" id="login" value="로그아웃"
			style="background: #512DA8;">
		</form>
		<a href="" class="mdl-layout__tab" onclick="MessageOpen();">메신저</a>

	</div>
</header>
<script>

function workingHour() {
	window.open("<%=request.getContextPath()%>/views/workingHour/workinghour.jsp?empNo=<%= T.getEmpNo() %>","근태 관리 시스템","width=1400, height=700,resizable=yes");
}

          	function MessageOpen(){ //메세지창 열기
                window.open('/Semi/msglist.do?my_emp_no=<%=T.getEmpNo()%>','메세지함','width=1280px,height=960px');
              		}
      
                
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
          </script>
          <!-- 헤더 끝 -->