<%@page import="java.util.*"%>
<%@page import="com.confirmBoard.model.vo.*"%>

<%@ 
	page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<% 
	ArrayList<cBoard> list = (ArrayList<cBoard>)request.getAttribute("list"); 
	confirmPageInfo cpi = (confirmPageInfo)request.getAttribute("cpi");
	int listCount = cpi.getListCount();
	int currentPage = cpi.getCurrentPage();
	int maxPage = cpi.getMaxPage();
	int startPage = cpi.getStartPage();
	int endPage = cpi.getEndPage();
	int type = (int)(request.getAttribute("type"));
	
	Member m = (Member)session.getAttribute("member");
%>

<!DOCTYPE html>
<html>
<head>

<!-- 폰텔로 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/src/tree_fontello/css/fontello.css">
<!-- 폰텔로 -->

<!-- 제이쿼리 시작 -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
<!-- 제이쿼리 끝 -->

<!-- 테이블 CSS 시작 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 테이블 CSS 끝 -->


<meta charset="UTF-8">

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

<title>게시판 목록</title>

</head>
<body style="height: 100%; width: 100%;">
	
	<!-- header 시작 --><!-- header 시작 --><!-- header 시작 --><!-- header 시작 --><!-- header 시작 -->
	<%@ include file="/views/common/header.jsp" %> 
	
	
	
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

	<section id='board' style='margin-top: 3%;'>
		<form style="margin-left: 5%; margin-right: 5%;">
			
			
			
			<table class="table" id="listArea">
				
				<thead class="thead-light" align="center">
					<tr>
						<th style="width: 10%;">문서번호</th>
						<th style='font-family: fontello; width:3%;'>&#xe809</th>
						<th style='width:60%;'>제목</th>
						<th>기안자</th>
						<th>등록일</th>
						<th>조회</th>
					</tr>
		        </thead>
				<tbody>
					<% for(cBoard cb : list){ %>
					<tr>
						<input type="hidden" value="<%= cb.getcBno() %>"/>
						<!-- 문서번호 -->
						<td style="width: 10%;" align="center"><%= cb.getcBno() %></td>
						
						<!-- 첨부파일 -->
						<% if( cb.getcBoardfile() != null ) { %>
						<td style='font-family: fontello; width:3%;'>&#xe809</td>
						<%} else { %>
						<td style='font-family: fontello; width:3%;'></td>
						<% } %>
						
						<!-- 문서제목 -->
						<td style='width:60%;'><%= cb.getcBtitle() %></td>
						
						<!-- 기안자 -->
						<td align="center"><%= cb.getcBwriter() %></td>
						
						<!-- 등록일 -->
						<td align="center"><%= cb.getcBdate() %></td>
						
						<!-- 조회 -->
						<td align="center"><%= cb.getcBcount() %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			
			<script>
				$(function(){
					$("#listArea td").mouseenter(function(){
						$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
					}).mouseout(function(){
						$(this).parent().css({"background":"#f5f5f5"});
					}).click(function(){
						var bno = $(this).parent().find("input").val();
						location.href="<%=request.getContextPath()%>/confirmSelectOne?type=<%= type %>&bno=" + bno;
					});
				});
			</script>
			
<%-- 페이지 처리 --%><%-- 페이지 처리 --%><%-- 페이지 처리 --%><%-- 페이지 처리 --%><%-- 페이지 처리 --%><%-- 페이지 처리 --%><%-- 페이지 처리 --%><%-- 페이지 처리 --%>
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%= request.getContextPath() %>/confirmList.bo?currentPage=1'" style='font-family: fontello;'>&#xf137</button>
				<%  if(currentPage <= 1){  %>
				<button disabled style='font-family: fontello;'>&#xe80b</button>
				<%  }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirmList.bo?currentPage=<%=currentPage - 1 %>'" style='font-family: fontello;'>&#xe80b</button>
				<%  } %>
				
				<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){	
				%>
					<button disabled><%= p %></button>
				<%      }else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/confirmList.bo?currentPage=<%= p %>'"><%= p %></button>
				<%      } %>
				<% } %>
					
				<%  if(currentPage >= maxPage){  %>
				<button disabled  style='font-family: fontello;'>&#xe80c</button>
				<%  }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirmList.bo?currentPage=<%=currentPage + 1 %>'" style='font-family: fontello;'>&#xe80c</button>
				<%  } %>
				<button onclick="location.href='<%= request.getContextPath() %>/confirmList.bo?currentPage=<%= maxPage %>'" style='font-family: fontello;'>&#xf138</button>
				
			</div>
			<br>
			<div align="center">
				<select id="searchCondition" name="searchCondition">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="docnumber">문서 번호</option>
				</select>
				<input type="search" id="keyword" placeholder="검색어를 입력하세요."> 
				<button type="button" onclick="searchDoc();">검색하기</button>
			</div>
			
			<input type='hidden' name='type1' value='<%= type %>'>
			<input type='hidden' name='empNo' value='<%= m.getEmpId() %>'>
			
			<script>
				function searchDoc(){
					location.href="<%=request.getContextPath()%>/searchDoc.co?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val()+"&type=<%= type %>&empNo=<%= m.getEmpNo() %>";
				}
			</script>
			
		</form>
	</section>

</body>
</html>