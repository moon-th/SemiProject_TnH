<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.board.model.vo.*"%>
<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	String category = (String)request.getAttribute("con");
	String keyword = (String)request.getAttribute("keyword");
	String typeno = (String)request.getParameter("typeno");
%>

<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>게시판</title>

	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>	
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

  
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
   <link rel="stylesheet" href="./views/css/styles.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!— 폰텔로 —>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/src/tree_fontello/css/fontello.css">
	<!— 폰텔로 —>

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

    .main{ position: relative; height: 1000px; padding: 20px;}

    .left{width: 300px; height: 1000px;}

    .center{width: 1150px; width: 1170px; position: absolute; left: 350px; top: 21px;}

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
          	<%@ include file="/views/common/header.jsp" %> 
          <main class="mdl-layout__content">
          <div class="mdl-layout__tab-panel is-active" id="overview">
            
         <div class="main">      
                <div class="left">
                    <!-- 사이드 바 메뉴-->
                    <!-- 패널 타이틀1 -->
                    <div class="panel panel-info">
                      <div class="panel-heading" style=" padding: 20px;" >
                        <h3 class="panel-title" style="font-size: 20px;
                        font-weight: 900;">게시판</h3>
                        </div>
                        <!-- 사이드바 메뉴목록1 -->
                        <ul class="list-group">
                        <li class="list-group-item"><a onclick="goNotice();">전체공지 게시판</a></li>
                        <li class="list-group-item"><a onclick="goBoard1();">사내 커뮤니티 게시판</a></li>
                        <li class="list-group-item"><a onclick="goBoard2();">사내 경조사 게시판</a></li>
                        </ul>
                    </div>                    
            </div><br>            
            <div class="center">     
                <table class="table table-hover" id="listArea">
                    <thead>
                        <tr>
                            <th style='width: 5%;'>번호</th>
                            <th style='width: 5%;'></th>
                            <th style='width: 60%;'>제목</th>
                            <th style='width: 10%;'>작성자</th>
                            <th style='width: 10%;'>조회수</th>
                            <th style='width: 10%;'>날짜</th>
                            
                        </tr>
                    </thead>
                    <% for(Board b : list){ %>
                    <tbody>
                        <tr>
                        	<input type="hidden" value="<%= b.getBno() %>"/>
                            <td><%= b.getRnum() %></td>
                            <% if( b.getBoardfile() != null) { %>
							<td style='font-family: fontello;'>&#xe809</td>
							<%} else { %>
							<td>  </td>
							<% } %> 
                            <td><%= b.getBtitle() %></td> 
                            <td><%= b.getBwriter() %></td>
                            <td><%= b.getBcount() %></td>
                            <td><%= b.getBdate() %></td>
                                       
                        </tr>                        
                    </tbody>
                    <% } %>
                </table>                    
            </div>
            <div class="centerlow">

              <a onclick="writeOpen();" class="btn btn-default btn-primary pull-right">글쓰기</a>
               <script>
                function writeOpen(){ //메세지창 열기
                  window.open(location.href="views/Board/BoardInsert.jsp",'글쓰기','width=1280px,height=960px');
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
                
                function goBoard2(){                	
                	var typeno = 2;               	
            		location.href="/Semi/selectList.bo?typeno="+typeno;
            	}
                $("#listArea td").mouseenter(function(){
    				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
    			}).mouseout(function(){
    				$(this).parent().css({"background":""});
    			}).click(function(){
    				var bno = $(this).parent().find("input").val();
    	 			location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno; 
    			});
                </script>
              
                <%-- 페이지 처리 --%>
				<div class="pagingArea" align="center">
					<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1&typeno=<%=typeno%>'"><<</button>
					<%  if(currentPage <= 1){  %>
					<button disabled><</button>
					<%  }else if(category == null && keyword == null){ %>
		            <button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>&typeno=<%=typeno%>'"><</button>
		            <%  } else{%>
		               <button onclick="location.href='<%= request.getContextPath() %>/searchBoard.bo?currentPage=<%=currentPage - 1 %>&con=<%=category%>&keyword=<%=keyword%>&typeno=<%=typeno%>'"><</button>
		            <%}%>
					
					<% for(int p = startPage; p <= endPage; p++){
							if(p == currentPage){	
					%>
						<button disabled><%= p %></button>
					<%      }else if(category==null && keyword==null){%>
						<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>&typeno=<%=typeno%>'"><%= p %></button>
					 <%}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/searchBoard.bo?currentPage=<%= p %>&keyword=<%=keyword%>&con=<%=category%>&typeno=<%=typeno%>'"><%= p %></button>
					<%      } %>
					<% } %>
						
					<%  if(currentPage >= maxPage){ %>
					<button disabled>></button>
					<%  }else if(category==null && keyword==null){%>
					<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= currentPage + 1 %>&typeno=<%=typeno%>'">></button>
				 		<%}else{ %>				
					<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>&typeno=<%=typeno%>'">></button>
					<%  } %>
					<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>&typeno=<%=typeno%>'">>></button>
			
		</div>
                    <div class="searchArea" align="center">
				<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" id="keyword" placeholder="키워드를 입력하세요!"> 
			<input type="button" class="btn btn-default btn-primary" onclick="return search();" value="검색">			
		</div>
              
            </div>         
        </div>   
        </div>
          <%@ include file="../common/footer.jsp" %>
            </main>

            <script>
            	            
              window.onfocus=function(){
              }
              window.onload=function(){
              window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
              window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
              window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
              window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
              };

          
                 
    		
    		function search(){
    			
    			if(document.getElementById('keyword').value == ""){
    				return false;
    			}else{
					<% for(Board b : list){ %>
                       var typeno =<%= b.getBtype() %>
                    <% } %>
    				location.href="<%=request.getContextPath()%>/searchBoard.bo?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val()+"&typeno="+typeno;
    				return true;				
    			}
    			
    		}
            </script>
            
</body>
</html>