<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.board.model.vo.*, com.member.model.vo.*"%>
<% Member m = (Member)session.getAttribute("member"); %>
<% Board b = (Board)request.getAttribute("Board"); %>
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

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    

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

    .main{ position: relative; height: 1600px; padding: 20px;}

    .left{width: 300px; height: 1000px;}

    .center{width: 1150px; height: 800px; position: absolute; left: 350px; top: 21px;}

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
                        <div class="panel-heading">
                        <h3 class="panel-title">게시판</h3>
                        </div>
                        <!-- 사이드바 메뉴목록1 -->
                        <ul class="list-group">
                        <li class="list-group-item"><a onclick="goNotice();">전체공지 게시판</a></li>
                        <li class="list-group-item"><a onclick="goBoard1();">사내 커뮤니티 게시판</a></li>
                        <li class="list-group-item"><a onclick="goBoard2();">사내 경조사 게시판</a></li>
                        </ul>
                    </div>                    
            </div><br>      
            <% if (m != null) { %>      
            <div class="center">     
                <div class="container">

                    <div class="row">
                                
            			  <form method="post" id="updateForm" style="width: 1200px" enctype="multipart/form-data">
                            <table class="table table-striped"
            
                                style="text-align: center; border: 1px solid #dddddd">
            
                                <thead>
            
                                    <tr>
            
                                        <th colspan="2"
            
                                            style="background-color: #eeeeee; text-align: center;">게시판 수정</th>
            
                                    </tr>
            
                                </thead>
            
                                <tbody>
            
                                    <tr>
            
                                        <td><input type="text" class="form-control" value="<%= b.getBtitle() %>" name="title" maxlength="50" >
                                        	<input type="hidden" name="bno" value="<%= b.getBno() %>">
                                        </td>
                                    <tr>
            
                                        <td><input type="text" value="<%= b.getBwriter() %>" class="form-control" placeholder="작성자" name="writer" maxlength="50" readonly/></td>

            
                                    </tr>
                                                                        
                                    <tr>
            							<td><textarea id="summernote" class="form-control" name="content"><%= b.getBcontent() %></textarea> 
            							</td>            
                                    </tr>                                  
            
                                </tbody>
            
                            </table>
                            <div id="fileDiv"> 
                          	<p>	
            				<% if(b.getBoardfile() != null){ %>   
                              	<a href="/Semi/nfdown.no?path=<%=b.getBoardfile() %>"><%=b.getBoardfile() %></a>                              	                              	
                              	<a href="#this" class="btn btn-primary" id="delete" name="delete">삭제</a>
                              	<% } %>
            				</p>	
                           </div>                                                        
                    </div>
            		<input style="position: relative;top: 510px;left: -28px;" type="file" name="file" id="file">
                </div>                   
            </div>
            
            <div class="centerlow">
                <input type="submit" onclick="goUpdate();" class="btn btn-primary pull-right" value="수정" style=" margin-left: 10px;" />
                <input type="submit" onclick="deleteBoard();" class="btn btn-primary pull-right" value="삭제" />
                </div>
                </form>
                
				<% } else { 
				request.setAttribute("msg", "회원만 열람 가능합니다.");
			 	} %>                
                
               <script>
               function goUpdate(){
               	$("#updateForm").attr("action","<%=request.getContextPath() %>/bUpdate.bo");
               }
               
               function deleteBoard(){
               	$("#updateForm").attr("action","<%= request.getContextPath() %>/bDelete.bo");
               	
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
                </script>
                
                <script type="text/javascript">		
	
				$(document).ready(function(){			
					$("a[name='delete']").on("click", function(e){ //삭제 버튼
						e.preventDefault();
						fn_deleteFile($(this));
					});
				});		
				
				function fn_deleteFile(obj){
					obj.parent().remove();
				}
	</script>
                
                     
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

            $(document).ready(function() {
            $('#summernote').summernote();
            });

            $('#summernote').summernote({
            height: 380,
            width:1120,   //set editable area's height
            codemirror: { // codemirror options
                theme: 'monokai'
            }
            });

            </script>
            
</body>
</html>