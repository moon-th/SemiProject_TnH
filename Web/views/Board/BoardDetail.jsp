<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.board.model.vo.*"%>
<%@ page import=" com.member.model.vo.* ,com.boardComment.model.vo.*" %>
<% 
   Member m = (Member)session.getAttribute("member");
   Board b = (Board)request.getAttribute("Board");
   ArrayList<BoardComment> clist = (ArrayList<BoardComment>)request.getAttribute("clist");
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
    
    .replyArea {
		width:800px;				
		margin-left:auto;
		margin-right:auto;
		padding-bottom : 5px;
	}
	.replyArea textArea {
		border-radius: 10px;
		resize: none;
	}
	
	.replyList1 td{	background : lavenderblush; }
	.replyList2 td{	background : honeydew; }
	.replyList3 td{ background : aliceblue; }
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
                  <table style="max-width: 98.1%;" class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            
                                <thead>
            
                                    <tr>
            
                                        <p align="center">공지사항 내용</p>
            
                                    </tr>
            
                                </thead>
            
                                <tbody>
            
                                    <tr>    
                                        <td><input type="text" class="form-control" value="<%= b.getBtitle() %>" name="title" maxlength="50" readonly/></td>
            							</td>
            							
            
                                    </tr>
                                    <tr>
                                        <td><input type="text" value="<%= b.getBwriter() %>" class="form-control" placeholder="작성자" name="writer" maxlength="50" readonly/></td>
            
                                    </tr>
                                    <tr>
                                        <td><input type="text" class="form-control" value="<%= b.getBdate() %>" name="date" maxlength="10" readonly/></td>        
                                    </tr>
            						
            						
                                    <tr>
            							<td style="height: 355px;"><span id="content"><%= b.getBcontent() %></span>            					
            							</td>                                                                               
            
                                    </tr>

            						<% if(b.getBoardfile() != null && b.getBoardfile().length() > 0) { %>
                                    <tr>
                                    	<td>                                    
                                    	<a href="/Semi/bfdown.bo?path=<%=b.getBoardfile() %>"><%=b.getBoardfile() %></a>
                                    	</td>
                                    </tr>
            						<% } %>
                                   
            
                                </tbody>
            
                            </table>	
            				
                            
                            
            				<div class="replyArea">
			<div class="replyWriteArea">
				<form action="/Semi/insertComment.bo" method="post">
					<input type="hidden" name="writer" value="<%=m.getEmpId()%>"/>
					<input type="hidden" name="bno" value="<%=b.getBno() %>" />
					<input type="hidden" name="refcno" value="0" />
					<input type="hidden" name="clevel" value="1" />
					
					<table align="left" style="position: relative;right: 135px;">
						<tr>
							<td><textArea style=" margin-bottom: 10px;width: 1000px; border-radius: none" rows="2" cols="80" id="replyContent" name="replyContent"></textArea></td>
							<td><button type="submit" id="addReply" style="width: 80px;height: 30px;border-radius: 10px;position: relative;top: -10px;">댓글 등록</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="replySelectArea">
			<!-- 게시글의 댓글들을 보여주는 부분  -->
			<% if (clist != null) { %>
				<% for(BoardComment bco : clist) { %>
				
				<table id="replySelectTable"
	      	 style="margin-left : <%= (bco.getClevel()-1) * 15 %>px;
	      	 		width : <%= 800 - ((bco.getClevel()-1) * 15)%>px;"
	      	 class="replyList<%=bco.getClevel()%>">
		  		<tr>
		  			<td rowspan="2"> </td>
					<td><b><%= bco.getCwriter() %></b></td>
					<td><%= bco.getCdate() %></td>
					<td align="center">
 					<%if(m.getEmpId().equals(bco.getCwriterId()) || m.getEmpId().equals("admin")) { %>
						<input type="hidden" name="cno" value="<%=bco.getCno()%>"/>
							  
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);" style="border-radius: 10px;">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none; border-radius: 10px;">수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);"style="border-radius: 10px;">삭제하기</button>
							
					<% } else if( bco.getClevel() < 3) { %>
						<input type="hidden" name="writer" value="<%=m.getEmpId()%>"/>
						<input type="hidden" name="refcno" value="<%= bco.getCno() %>" />
						<input type="hidden" name="clevel" value="<%=bco.getClevel() %>" />
						<button type="button" class="insertBtn" 
							 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
							 
						<button type="button" class="insertConfirm"
							onclick="reConfirm(this);"
							style="display:none;" >댓글 추가 완료</button> 
							
					<% } else {%>
						<span> 마지막 레벨입니다.</span>
					<% } %>
					</td>
				</tr>
				<tr class="comment replyList<%=bco.getClevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="105" rows="2"
					 readonly="readonly"><%= bco.getCcontent() %></textarea>
					</td>
				</tr>
			</table>
			
			<% } } else { %>			
			<% } %>
			</div>
		</div>
           
            </div>
            <div class="centerlow">

              <a onclick="writeOpen();" class="btn btn-default btn-primary pull-right" style=" margin-left: 10px;" >글쓰기</a>
              <% if(m.getEmpId().equals("admin") && m.getEmpId().equals(b.getBwriterId())){ %>
                          <input type="submit" class="btn btn-primary pull-right" value="수정하기" onclick="goUpdate();" />
                            <% } %>
               <script>
                function writeOpen(){ //메세지창 열기
                  window.open(location.href="views/Board/BoardInsert.jsp",'글쓰기','width=1280px,height=960px');
                }
                
                function back(){
                	location.href="selectList.bo";
                }
                //재영이 화이팅이야 !  
                function goUpdate(){
                	location.href="bUpView.bo?bno=<%=b.getBno()%>";
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
                
                function updateReply(obj) {
            		// 현재 위치와 가장 근접한 textarea 접근하기
            		$(obj).parent().parent().next().find('textarea')
            		.removeAttr('readonly');
            		
            		// 수정 완료 버튼을 화면 보이게 하기
            		$(obj).siblings('.updateConfirm').css('display','inline');
            		
            		// 수정하기 버튼 숨기기
            		$(obj).css('display', 'none');
            	}
            	
            	function updateConfirm(obj) {
            		// 댓글의 내용 가져오기
            		var content
            		  = $(obj).parent().parent().next().find('textarea').val();
            		
            		// 댓글의 번호 가져오기
            		var cno = $(obj).siblings('input').val();
            		
            		// 게시글 번호 가져오기
            		var bno = '<%=b.getBno()%>';
            		
            		location.href="/Semi/updateComment.bo?"
            				 +"cno="+cno+"&bno="+bno+"&content="+content;
            	}
            	
            	function deleteReply(obj) {
            		// 댓글의 번호 가져오기
            		var cno = $(obj).siblings('input').val();
            		
            		// 게시글 번호 가져오기
            		var bno = '<%=b.getBno()%>';
            		
            		location.href="/Semi/deleteComment.bo"
            		+"?cno="+cno+"&bno="+bno;
            	}
            	
            	function reComment(obj){
            		// 추가 완료 버튼을 화면 보이게 하기
            		$(obj).siblings('.insertConfirm').css('display','inline');
            		
            		// 클릭한 버튼 숨기기
            		$(obj).css('display', 'none');
            		
            		// 내용 입력 공간 만들기
            		var htmlForm = 
            			'<tr class="comment"><td></td>'
            				+'<td colspan="3" style="background : transparent;">'
            					+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
            				+ '</td>'
            			+ '</tr>';
            		
            		$(obj).parents('table').append(htmlForm);
            		
            	}
            	
            	function reConfirm(obj) {
            		// 댓글의 내용 가져오기
            		
            		// 참조할 댓글의 번호 가져오기
            		var refcno = $(obj).siblings('input[name="refcno"]').val();
            		var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
            		
            		// console.log(refcno + " : " + level);
            		
            		// 게시글 번호 가져오기
            		var bno = '<%=b.getBno()%>';
            		
            		var parent = $(obj).parent();
            		var grandparent = parent.parent();
            		var siblingsTR = grandparent.siblings().last();
            		
            		var content = siblingsTR.find('textarea').val();
            		
            		// console.log(parent.html());
            		// console.log(grandparent.html());
            		// console.log(siblingsTR.html());
            		
            		// console.log(content);

            		// writer, replyContent
            		// bno, refcno, clevel
            		
            		location.href='/Semi/insertComment.bo'
            		           + '?writer=<%= m.getEmpId() %>' 
            		           + '&replyContent=' + content
            		           + '&bno=' + bno
            		           + '&refcno=' + refcno
            		           + '&clevel=' + level;
            	}
                </script>
              
                
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

              // checkbox 모두 체크만들기 
            $(document).ready(function(){
                $('.checkAll').click(function(){
    
                    if($(".checkAll").prop("checked")){
                        $(".chkbox").prop("checked",true);
                    }else{
                        $(".chkbox").prop("checked",false);
                    }
                });
            });
      
            
            $(function(){
    			
    			$("#listArea td").mouseenter(function(){
    				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
    			}).mouseout(function(){
    				$(this).parent().css({"background":"black"});
    			}).click(function(){
    				//console.log($(this).parent().children().eq(0).text());
    				var bno = $(this).parent().children().eq(0).text();
    				location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno;
    			});
    		});
    		
    		function search(){
    			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
    		}
            </script>
            
</body>
</html>