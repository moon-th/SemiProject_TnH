<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	  Member t = (Member)session.getAttribute("member"); 
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	ul{
	list-style: none;
	}

</style>
<body>
 <footer class="mdl-mega-footer" >
                <div class="mdl-mega-footer--middle-section">
                  <div class="mdl-mega-footer--drop-down-section" style="    position: relative;
                  left: 655px; text-align : center;">
                
                    <!--하단바 컨텐츠 -->
                   
               
                    <ul id=info>
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
                  <ul class="mdl-mega-footer--link-list" id="foot">
                    <li><a href="">Web Starter Kit</a></li>
                    <li><a href="#">Privacy and Terms</a></li>
                   <%if(t.getEmpNo()==0){ %>
                    <li><a onclick="admin()">관리자메뉴</a></li>
                    <%} %>
                  </ul>
    
                </div>
    			 <script >
        			function admin() {
        			location.href="/Semi/mList.em";
        				
					}	
		       	 </script>
    
              </footer>

</body>
</html>