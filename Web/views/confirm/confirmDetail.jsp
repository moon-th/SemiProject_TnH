<%@page import="java.util.*"%>
<%@page import="com.confirmBoard.model.vo.cBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	cBoard b = (cBoard)request.getAttribute("board");

/* 	ArrayList<Member> writerId = (ArrayList<Member>)request.getAttribute("writerId"); */
	ArrayList<Member> checkList = (ArrayList<Member>)request.getAttribute("checkList");
	ArrayList<Member> referList = (ArrayList<Member>)request.getAttribute("referList");
	ArrayList<Member> approver = (ArrayList<Member>)request.getAttribute("approver");
	Member writer = (Member)request.getAttribute("writerId");
	
	ArrayList<String> optionCheckArr = (ArrayList<String>)request.getAttribute("optionCheckArr");
	String optionApproval = (String)request.getAttribute("optionApproval");
	int type = (int)request.getAttribute("type");
	
	Member m = (Member)session.getAttribute("member");
	
	int empCount = 1;
	
	for(int i=0; checkList.size()>i; i++){
		
		if(checkList.get(i).getEmpNo()==m.getEmpNo()){
			empCount = i+1;
		}
		
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>

<!-- 제이쿼리 시작 -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<!-- 제이쿼리 끝 -->

<!-- 폰텔로 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/src/tree_fontello/css/fontello.css">
<!-- 폰텔로 -->

<!-- 테이블 CSS 시작 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 테이블 CSS 끝 -->

<!-- 버튼 CSS 시작 -->
<!-- Material Design Lite -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<!-- 버튼 CSS 끝 -->

<style>
      nav, section {
          float: left;
      }
      nav{
          height: 80%;
          width: 18%;
        padding-left: 3%;
        padding-top: 3%;
      }
      section{
          height: 80%;
          width: 70%;
      }
      .nSpan{
          color:black;
          text-align: center;
          line-height: 50px;
          height: 50px;
          display: block;
          background:  #f1f1f1;
        border: 0.5px solid #f5f5f5;
        font-family: fontello;
      }
      .menuspan{
          background: #e9ecef;
        border: 0.5px solid #dee2e6;
      }
      .writespan{
          color:#ff5757;
          background: #ffeded;
        border: 0.5px solid #f5f5f5;
      }
      .spanhovercss{
          color:white;
          background: #696969;
        border: 0.5px solid #616161;
      }
      .spanhcss{
          color:white;
          background: #ff7676;
        border: 0.5px solid #ff0000;
      }
</style>

<meta charset="UTF-8">
<title>전자 결재 문서</title>
</head>
<body style="height: 100%; width: 100%;">

<!-- header 시작 --><!-- header 시작 --><!-- header 시작 --><!-- header 시작 --><!-- header 시작 -->
	<header>
		<%@ include file="/views/common/header.jsp" %>
	</header>
<!-- nav 시작 --><!-- nav 시작 --><!-- nav 시작 --><!-- nav 시작 --><!-- nav 시작 --><!-- nav 시작 -->
	
<nav>

		<span class='nSpan menuspan'>전자 결재함</span>
		<span class='nSpan hoverspan' id='temp0'>&#xe805 내가 올린 문서</span>
		<span class='nSpan hoverspan' id='temp1'>&#xe808 결재할 문서</span>
		<span class='nSpan hoverspan' id='temp2'>&#xe807 결재 완료 문서</span>
		<span class='nSpan hoverspan' id='temp3'>&#xe80d 반려된 문서</span>
		<span class='nSpan hoverspan' id='temp4'>&#xe80e 참조 문서</span>
		
		<br>
		
		<span class='nSpan writespan' id='gowrite'>&#xe80f 결재 문서 작성</span>
	
</nav>
<script>
/* hover로 메뉴에 css 적용하기 *//* hover로 메뉴에 css 적용하기 *//* hover로 메뉴에 css 적용하기 */
	$(function(){
		
		$('.hoverspan').hover(function(){
			// mouseenter
			$(this).addClass('spanhovercss');
		},function(){
			// mouseleave
			$(this).removeClass('spanhovercss');
		});
		
		$('.writespan').hover(function(){
			// mouseenter
			$(this).addClass('spanhcss');
		},function(){
			// mouseleave
			$(this).removeClass('spanhcss');
		});
		
/* span onclick event 적용하기 *//* span onclick event 적용하기 *//* span onclick event 적용하기 */
		$('#gowrite').click(function(){
			location.href='<%=request.getContextPath()%>/views/confirm/confirm.jsp';
		})
		$('#temp0').click(function(){
			location.href='<%=request.getContextPath()%>/confirmList.bo?type=0&empNo=<%= m.getEmpNo() %>';
		})
		$('#temp1').click(function(){
			location.href='<%=request.getContextPath()%>/confirmList.bo?type=1&empNo=<%= m.getEmpNo() %>';
		})
		$('#temp2').click(function(){
			location.href='<%=request.getContextPath()%>/confirmList.bo?type=2&empNo=<%= m.getEmpNo() %>';
		})
		$('#temp3').click(function(){
			location.href='<%=request.getContextPath()%>/confirmList.bo?type=3&empNo=<%= m.getEmpNo() %>';
		})
		$('#temp4').click(function(){
			location.href='<%=request.getContextPath()%>/confirmList.bo?type=4&empNo=<%= m.getEmpNo() %>';
		})
		
	});

</script>

<section id='board' style="margin-left: 5%; margin-right: 5%; margin-top: 3%;">

	<form style="margin-right: 30%;">
		
	<table class="table">
		<tbody>
			<tr>
				<td>
				
					<%-- <% boolean check = true; %>
					<% for(Member m3 : checkList) { %>
					
					<% if (m.getEmpNo()==m3.getEmpNo()) { %>
						<input type='button' value='결재 반려' id='menu' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
					<% check = false; %>
					<% }else if(approver.get(0).getEmpNo()==m.getEmpNo()){ %>
						<input type='button' value='결재 반려' id='menu' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">
					<% check = false; %>
					<% } %>
					
					<% } %>
					
					<% if (check) { %>
					<input type='button' value='결재 반려' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" disabled>
					<% check = false; %>
					<% } %>
					
					&nbsp;&nbsp;&nbsp; --%>
					
					
					
					<% boolean check2 = true; %>
					
					<%
						int breakpoint = 0;
						
						for(int i=0; optionCheckArr.size()>i; i++){
							if(optionCheckArr.get(i).equals("N")){
								breakpoint = i;
								break;
							}
						}
					%>
					
					<%-- <% for(int i=0; checkList.size()>i; i++) { %> --%>
					<% if (m.getEmpNo()==checkList.get(breakpoint).getEmpNo() && optionCheckArr.get(breakpoint).equals("N")) { %>
					<input type='button' value='결재 반려' id='menu' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
					onclick="location.href='<%=request.getContextPath()%>/cXXX.ap?bno=<%= b.getcBno() %>&type=<%= type %>&empNo=<%= m.getEmpNo() %>'">
					&nbsp;&nbsp;&nbsp;
					<input type='button' value='검토 완료' id='checkComplete' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
					onclick="location.href='<%=request.getContextPath()%>/cCheking.ap?bno=<%= b.getcBno() %>&type=<%= type %>&empCount=<%= empCount %>'">
					<% check2 = false; %>
					<% } %>
					<%-- <% } %> --%>
					
					<% if (check2 && approver.get(0).getEmpNo()!=m.getEmpNo()) { %>
					<input type='button' value='결재 반려' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" disabled>
					&nbsp;&nbsp;&nbsp;
					<input type='button' value='검토 완료' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" disabled>
					<% check2 = false; %>
					<% }else if( approver.get(0).getEmpNo()==m.getEmpNo() && optionApproval.equals("N") ){ %>
						<input type='button' value='결재 반려' id='menu' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
						onclick="location.href='<%=request.getContextPath()%>/cXXX.ap?bno=<%= b.getcBno() %>&type=<%= type %>&empNo=<%= m.getEmpNo() %>'">
						
					<% } %>

					<%
						boolean apcheck = true;
						
						for(int i=0; optionCheckArr.size()>i; i++){
							if(optionCheckArr.get(i).equals("N")){
								apcheck = false;
								break;
							}
						}
					%>
					
					
					&nbsp;&nbsp;&nbsp;
					<% if(approver.get(0).getEmpNo()==m.getEmpNo() && optionApproval.equals("N") && apcheck){ %>
					<input type='button' value='승인 완료' id='appComplte' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
					onclick="location.href='<%=request.getContextPath()%>/cAppcomp.ap?bno=<%= b.getcBno() %>&type=<%= type %>'">
					<% }else{ %>
					<input type='button' value='승인 완료' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" disabled>
					<% } %>
					
					&nbsp;&nbsp;&nbsp;
					<input type='button' value='목록 보기' id='menuback' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
					onclick="location.href='/Semi/confirmList.bo?type=<%= type %>&empNo=<%= m.getEmpNo() %>'">
				
				</td>
			</tr>
			<tr>
				<td>문서번호 : <%=b.getcBno() %></td>
			</tr>
			<tr>
				<td>제목 : <%=b.getcBtitle() %></td>
			</tr>
			<tr>
				<td>작성일 :  <%=b.getcBdate() %></td>
			</tr>
			<tr>
				<td>조회수 :  <%=b.getcBcount() %></td>
			</tr>
				<!-- 첨부파일 -->
				<% if( b.getcBoardfile() != null ) { %>
				<tr>
					<td style='font-family: fontello; width:3%;'>
						&#xe809 첨부파일 : <a href="/Semi/fdServlet.cb?path=<%= b.getcBoardfile() %>"><%= b.getcBoardfile() %></a>
					</td>
				</tr>
				<%} else { %>
				<tr>
					<td style='font-family: fontello; width:3%;'>&#xe809 첨부파일 : </td>
				</tr>
				<% } %>
			<tr>
				<% if( b.getKeepingDoc() == 1 ) { %>
					<td>보존기한 : 6개월 </td>
				<%} else if( b.getKeepingDoc() == 2 ) { %>
					<td>보존기한 : 1년 </td>
				<%} else { %>
					<td>보존기한 : 2년 </td>
				<% } %>
			</tr>
			<tr>
				<% if( b.getCbsecType() == 1 ) { %>
					<td>기밀등급 : 공개 </td>
				<%} else if( b.getCbsecType() == 2 ) { %>
					<td>기밀등급 : 일반 </td>
				<%} else { %>
					<td>기밀등급 : 기밀 </td>
				<% } %>
			</tr>
			
			
			<% if(b.getDenyEmpNo()!=null){
				
				if(Integer.parseInt(b.getDenyEmpNo())==approver.get(0).getEmpNo()){ %>
					<tr>
					<td style='font-family: fontello;'>
						&#xe80d 반려한 사원 : 
					<p style='font-size: 12pt; color:#ff5b6a;'>
						이 문서를 반려한 직원은 '<%= approver.get(0).getDeptName() %> 의 <%= approver.get(0).getJobName() %> <%= approver.get(0).getEmpName() %>' 입니다.
					</p>
					</td>
					</tr>
				<% }
				
				
				
				for(Member me : checkList){
					
					if(me.getEmpNo()==Integer.parseInt(b.getDenyEmpNo())){ %>
					<tr>
					<td style='font-family: fontello;'>
						&#xe80d 반려한 사원 : 
					<p style='font-size: 12pt; color:#ff5b6a;'>
						이 문서를 반려한 직원은 '<%= me.getDeptName() %>의 <%= me.getJobName() %> <%= me.getEmpName() %>' 입니다.
					</p>
					</td>
					</tr>
					<%}
					
				}

			} %>
			
			
		</tbody>
	</table>
		
      <table class="table">
        <thead class="thead-light">
<%-- 			<% for(Member m1 : writerId) { %> --%>
			<tr>
				<th>기안</th>
				<th><%= writer.getDeptName() %></th>
				<th><%= writer.getJobName() + " " + writer.getEmpName() %></th>
				<th align='center'>검토 여부</th>
			</tr>
<%-- 			<% } %> --%>
		</thead>
		
		<tbody>
			<% for(int i=0; checkList.size()>i; i++) { %>
			<% if(i==0){ %>
			<tr id='list1'>
				<td>검토</td>
				<td><%= checkList.get(i).getDeptName() %></td>
				<td><%= checkList.get(i).getJobName() + " " + checkList.get(i).getEmpName() %></td>
				
				<% if(optionCheckArr.get(i).equals("N")){ %>
					<td></td>
				<% }else{ %>
					<td style='font-family: fontello;'>&nbsp;&nbsp;&nbsp;&nbsp;&#xe80a</td>
				<% } %>
			</tr>
			<% }else { %>
			<tr id='list1'>
				<td></td>
				<td><%= checkList.get(i).getDeptName() %></td>
				<td><%= checkList.get(i).getJobName() + " " + checkList.get(i).getEmpName() %></td>
				
				<% if(optionCheckArr.get(i).equals("N")){ %>
					<td></td>
				<% }else{ %>
					<td style='font-family: fontello;'>&nbsp;&nbsp;&nbsp;&nbsp;&#xe80a</td>
				<% } %>
			</tr>
			<% } %>
			<% } %>
			   
			   
			<% for(int i=0; referList.size()>i; i++) { %>
			<% if(i==0){ %>
			<tr id='list2'>
				<td>참조</td>
				<td><%= referList.get(i).getDeptName() %></td>
				<td><%= referList.get(i).getJobName() + " " + referList.get(i).getEmpName() %></td>
				<td></td>
			</tr>
			<% }else { %>
			<tr id='list2'>
				<td></td>
				<td><%= referList.get(i).getDeptName() %></td>
				<td><%= referList.get(i).getJobName() + " " + referList.get(i).getEmpName() %></td>
				<td></td>
			</tr>
			<% } %>
			<% } %>
			          
		<thead class="thead-dark" id='list3'>
			<% for(Member m2 : approver) { %>
			<tr>
				<th>승인</th>
				<th><%= m2.getDeptName() %></th>
				<th><%= m2.getJobName() + " " + m2.getEmpName() %></th>
				
				<% if(optionApproval.equals("N")){ %>
				<th></th>
				<% }else{ %>
				<th style='font-family: fontello;'>&nbsp;&nbsp;&nbsp;&nbsp;&#xe80a</th>
				<% } %>
			</tr>
			<% } %>
		</thead>
		</tbody>
		</table>
		
		<label>본문 : </label>
		<p id='content'>
			<%= b.getcBcontent() %>
		</p>
		
	</form>
</section>

<script>
	

</script>

</body>
</html>