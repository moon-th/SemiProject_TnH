<%@page import="com.member.model.vo.Member"%>
<%@page import="com.foodlist.model.vo.PageInfo"%>
<%@page import="com.foodlist.model.vo.FoodList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<FoodList> list = (ArrayList)request.getAttribute("list"); 
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>식단관리</title>
    <!--캘린더 CND-->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <!--캘린더 CND-->
    <meta name="mobile-web-app-capable" content="yes">
    <!-- <link rel="icon" sizes="192x192" href="images/android-desktop.png"> -->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <!-- <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png"> -->

    <!-- <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png"> -->
    <meta name="msapplication-TileColor" content="#3372DF">

    <!-- <link rel="shortcut icon" href="images/favicon.png"> -->
    <!-- 제이쿼리 CND-->
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- 제이쿼리 CND-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
    <link rel="stylesheet" href="views/css/styles.css">

    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script> -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
    
         
 
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

    .main{ position: relative; height: 1135px; padding: 20px;}

    .left{width: 300px; height: 1000px;}

    .center{width: 1150px; height: 800px;  position: absolute; left: 350px; top: 21px;}

    .centerlow{width: 1150px; height: 170px; position: absolute; left: 350px; top: 850px;}
    
    

        /* WHAT YOU NEED */
    .fading-side-menu.affix-top {
        opacity: 1;
        transition: opacity 1s
    }
    .fading-side-menu.affix {
        top: 11.5px;
    }
    .fading-side-menu.affix {
        opacity: 0.2;
        transition: opacity 5s
    }
    .fading-side-menu.affix:hover {
        opacity: 1;
        transition: opacity 0.3s
    }
    /* RECOMMENDED STYLING BUT NOT REQUIRED */
    .fading-side-menu a {
        color: rgb(102, 102, 102);
    }
    .fading-side-menu a .fa {
        padding-right:15px;
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

        /* 게시판 리스트 목록 */
    .sub_news,.sub_news th,.sub_news td{border:0}
    .sub_news a{color:#383838;text-decoration:none}
    .sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
    .sub_news caption{display:none}
    .sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
    .sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
    .sub_news .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
    .sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
    .sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
    .sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
    .sub_news tr.reply .title a{padding-left:16px;background:url(첨부파일/ic_reply.png) 0 1px no-repeat}
    /* //게시판 리스트 목록 */
 

    .foodlist{
        width: 1000px;
    height: 1000px;
    
    position: absolute;
    padding: 9px;
top: -10px;
    }
    #inputfood{
    margin: 15px;
    width: 1387px;
    height: 120px;
    border-style: outset;
    padding: 10px;
    background: white;
    position: relative;
    } 
    #inputfood label{
           padding-right: 13px;
    margin-left: 97px;
    }
    #dayfood{
        margin: 15px;
    width: 905px;
    height: 50px;
    
    background: white;
    line-height: 40px;
    padding-left: 35px;
    border-radius: 15px;
    }
    #dayfood span{
            padding-left: 15px;
            padding-right: 84px;
  
    }

    .list-group-item{
      margin-bottom: 20px;
      border: 0px;
      padding-left: 50px;
    }
    .list-group-item a{
      color : black;
    }
   .side-bar{
      position: relative;
    
    
    left: 0px;
    width: 270px;
    height: 1167px;
    display: inline-block;
  
    } 
    </style>
 
</head>

<body>
    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
          <%@ include file="/views/common/header2.jsp" %> 
          <main class="mdl-layout__content">
          <div class="mdl-layout__tab-panel is-active" id="overview">
            
         <div class="main">      
            <div class="side-bar">
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
              </div>
	

                <div class="foodlist" style="display: inline-block;">
                
             <form  id="frm">     
                <div id="inputfood">
                    <p>음식 리스트 추가하기</p>
                    <label >날짜 : </label><input name="day" type="date" id="daycheck" style="height: 27px;">
                    <label >밥 : </label><input name="rice" type="text" id="rice">
                    <label >국 : </label><input name="soup" type="text" id="soup">
                    <label >주메뉴 : </label><input name="mainfood" type="text" id="mainfood">
                    <div style="text-align: right;">
                    <div id="save" >저장</div> 
               
                    </div>
                </div>
             </form>

                <div id="line"></div>
               <table id="listArea" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
              	<tbody>
              
               <% int count = 0;
               for(FoodList f : list) {
                %>
                <tr id="dayfood">
              				   <td><input type="hidden" value="<%=f.getNo() %>" id="fno<%=count %>"></td>
                                <td style="padding-left: 100px;">● 날짜 : <input class="getfood" type="date" value="<%=f.getDay() %>" id="getday<%=count %>" name="getday" style="height : 30px"></td> 
                                <td style="padding-left: 100px;">밥 : <input class="getfood" tyep="text"  value="<%=f.getRice() %>" id="getrice<%=count %>" name="getrice" style="height : 30px; width : 130px;"></td>
                                <td style="padding-left: 100px;">국 : <input class="getfood" type="text"  value="<%=f.getSoup() %>"id="getsoup<%=count %>"  name="getfood" style="height : 30px; width : 130px;"></td>
                                <td style="padding-left: 100px;">주메뉴 :<input class="getfood" type="text" value="<%=f.getMainfood() %>" id="getmainfood<%=count %>" name="getmainfood"style="height : 30px; width : 130px; margin-right: 60px;"></td> 
                                <td style="padding-left: 100px;"><input type="button" value="수정" id="save" onclick="fupdate(<%=count++%>)"></td>
                 </tr>
                <% } %>
                </tbody>
                </table>
                <script>
                	function fupdate(count){
                		var fno = document.getElementById("fno"+count).value;
                		var dayup = document.getElementById("getday"+count).value;
                		var riceup = document.getElementById("getrice"+count).value;
                		var soupup = document.getElementById("getsoup"+count).value;
                		var mainfoodup = document.getElementById("getmainfood"+count).value;
                		
                		location.href="/Semi/fUpdate.fo?dayup="+dayup+"&riceup="+riceup+"&soupup="+soupup+"&mainfoodup="+mainfoodup+"&fno="+fno;
                	}
							
                		
                
                </script>	
                	
                
              <div class="pagingArea" align="center" style="     left: 543px;position: relative;"><br>
		<button onclick="location.href='<%= request.getContextPath() %>/flist.fo?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/flist.fo?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/flist.fo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/flist.fo?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/flist.fo?currentPage=<%= maxPage %>'">>></button>
			
		</div><br>
                            <div  id="searchForm" class="text-center" style="left: 240px;position: relative;">
                              <form action="/Semi/fsearch.fo" style="    position: relative;
    left: 310px;">
                                  <select name="category" style="height: 25px";>
                                      <option value="day">날짜</option>
                                  </select>
                                  <input type="date" size="20" name="keyword" style="height: 25px;"/>&nbsp;
                                  <input type="submit" class="btn btn-default btn-primary" value="검색">
                              </form>    
                          </div>
           </div>           
                   
        </div>   
        </div>
       <%@ include file="./common/footer.jsp" %>
            </main>


			<script>
				$('#save').click(function(){
					$.ajax({
						url:"/Semi/foodDup.fo",
						type:"post",
						data:{daycheck: $('#daycheck').val()},
						success:function(data){
							console.log(data);
							if(data=='ok'){
								$("#frm").attr("action","/Semi/fInsert.fo").submit();
							}else{
								alert('이미 등록된 날짜 입니다');
								
							}
						},error:function(){
							console.log("Error 입니다.");
						}
					});
				});
				
	
				
				
	
			</script>


            <script>
              window.onfocus=function(){
              }
              window.onload=function(){
              window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
              window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
              window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
              window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
              };

          
            </script>
              <script>
                function writeOpen(){ //메세지창 열기
                  window.open('write.html','메세지함','width=1280px,height=960px');
                }
                      </script>
            
</body>
</html>