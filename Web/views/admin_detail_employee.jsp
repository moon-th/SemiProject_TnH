<%@page import="java.util.StringTokenizer"%>
<%@page import="com.member.model.vo.Attachment"%>
<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% Member m = (Member)request.getAttribute("member");
    	Attachment at = (Attachment)request.getAttribute("at");
    	
    	String ssn1 = null;
    	String ssn2 = null;
		StringTokenizer strToken = new StringTokenizer(m.getEmpSsn());
		while(strToken.hasMoreTokens()){
		ssn1 = strToken.nextToken("-");
		ssn2 = strToken.nextToken();
		}
		
	 	String email = null;
    	String email2 = null;
		StringTokenizer strToken2 = new StringTokenizer(m.getEmail());
		while(strToken2.hasMoreTokens()){
		email = strToken2.nextToken("@");
		email2 = strToken2.nextToken();
		}
		
		String zipCode = null;
    	String address1 = null;
    	String address2 = null;
		StringTokenizer strToken3 = new StringTokenizer(m.getAddress());
		while(strToken3.hasMoreTokens()){
		zipCode = strToken3.nextToken("/");
		address1 = strToken3.nextToken("/");
		address2 = strToken3.nextToken();
		}
		
		String phone1 = null;
    	String phone2 = null;
    	String phone3 = null;
		StringTokenizer strToken4 = new StringTokenizer(m.getPhone());
		while(strToken4.hasMoreTokens()){
		phone1 = strToken4.nextToken("-");
		phone2 = strToken4.nextToken("-");
		phone3 = strToken4.nextToken();
		}
		
		String home1 = null;
    	String home2 = null;
    	String home3 = null;
		StringTokenizer strToken5 = new StringTokenizer(m.getPhone());
		while(strToken5.hasMoreTokens()){
		home1 = strToken5.nextToken("-");
		home2 = strToken5.nextToken("-");
		home3 = strToken5.nextToken();
		}
		
		
    %>
<!doctype html>

<html lang="en">
  <head>
    
    <meta charset="utf-8">
    
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>관리자 사원추가</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- 게시판 부트스트랩 cnd-->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- 게시판 부트스트랩 cnd-->
   
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
    

<!--태환 css-->
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
    .article{
      display: inline-block;
      margin: 5px;
      padding: 5px;
      position: relative;
    }
    .main{ position: relative; height: 1100px; padding: 10px; }
    .left{  position: absolute; left: 0px}
    .center{  position: absolute; left: 440px;} 
    .right{ position: absolute; left: 1300px;}
    .profile{position: relative;
            width: 375px;
            height: 500px;
            border-radius: 15px;
            background: #FFFFFF;
            border: 1px solid rgb(192, 189, 189);
           }
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
      left: 93.27px;
      top: 20px;
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
        width: 800px;height: 670px; border: 1px solid rgb(192, 189, 189);
      padding: 10px; border-radius: 15px; background: snow;

      }
    .board{    width: 800px;
    height: 650px;
    border: 1px solid rgb(192, 189, 189);
    padding: 10px;
    border-radius: 15px;
    background: snow;
    position: relative;
    top: 54px;}
      .write{
        position: relative left 1px;
      }
    .calendar{width: 380px; height: 550px;}
    
    #chat{ position:relative; width: 500px;height: 950px;
       background: snow;     border-radius: 15px;
            border: 1px solid rgb(192, 189, 189);}
    #chattext{
     position: relative;
    top: 894px;
    left: -45px;
    width: 410px;
    height: 60px;
    } 
    #chatbutton{
      position: relative;
    top: 834px;
    width: 93px;
    height: 60px;
    left: 204px;
    }
    .emergency{position: relative width 500px; height: 300px;border: 2px solid red;}
    .check{position: relative;
            width: 375px;
            height: 350px;

            background: #FFFFFF;
            border-radius: 15px;
            
            border: 1px solid rgb(192, 189, 189); }

      
      .checklist>li{
      font-size: 20px;
    }        
    .foodlist{
      
    position: relative;
    width: 380px;
    height: 462px;
    background: #FFFFFF;
    padding: 10px;
    border-radius: 15px;
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
        background: #FFFFFF;
    padding: 10px;
    border-radius: 15px;
    border: 1px solid rgb(192, 189, 189);
     } 
    #namearea{  
     position: relative;
    left: 20%;
    top: 13%;
    width: 900px;
    height: 650px;
    padding: 27px;
    background: snow;
    text-align: center;
    }
    .list-group-item{
      margin-bottom: 20px;
      border: 0px;
      padding-left: 50px;
    }
    .list-group-item a{
      color : black;
    }
    
    .side-bar{width: 300px; height: 1000px; text-align: left;}

    .page-content{width: 900px; height: 800px; position: absolute; left: 350px; }

    </style>
<!--태환 css-->    
  
</head>

<body>
    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
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
              <a href="/Semi/selectList.no"class="mdl-layout__tab">공지사항</a>
              <a href="/Semi/selectList.bo" class="mdl-layout__tab">게시판</a>
              <a href="#features" class="mdl-layout__tab">근태관리</a>
              <a href="#features" class="mdl-layout__tab">전자결제</a>
              <a href="mypage.jsp" class="mdl-layout__tab">인사정보</a>
              <a id="login" href="login.jsp" class="mdl-layout__tab">로그인</a>
              <a href="#features" class="mdl-layout__tab" onclick="MessageOpen();">메신저</a>
               
              
              
             
            </div>
          </header>
          
          <div class="mdl-layout__tab-panel is-active" id="overview">
            
           <div class="main">
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
                            <li class="list-group-item"><a onclick="emplist()">회원목록</a></li>
                            <li class="list-group-item"><a href="views/admin_foodlist.jsp">식단관리</a></li>
                            </ul>
                </div>                    
        </div><br>                            
                    <div class="page-content">
                 		<form action="/Semi/mUpdate.em" style="text-align: center;" enctype="multipart/form-data" method="post">
  <table cellspacing='1' cellpadding='0' class="table table-bordered" style="margin: auto; text-align: center; font-size: 16px;  background: white;">
      <tr height="2" bgcolor="#FFC8C3"></tr>
   		<tr>
        <th> 사원사진 첨부</th>
        <td>
        	<div id="titleImgArea">
			<img id="titleImg" src="./resource/images/<%=at.getChangename() %>" width="177px" height="200">
			<input type="hidden" name="photo" value="<%=at.getChangename() %>">
			</div>
		</td>
      </tr>
      
      <tr>
         <th> 이름</th>
         <td>
          <input type='hidden' name="no" value="<%=m.getEmpNo() %>" >
         <input type="text" name="name" id="name" value="<%=m.getEmpName() %>" >
         	퇴사여부 <select name="entyn">
                          	 	<%if(m.getEntYN().equals("Y")){ %>
                          	 	<option SELECTED>Y</option>
                          	 	<option>N</option>
                          	 	<%}else{ %>
                          	 	<option>Y</option>
                          	 	<option SELECTED>N</option>
                          	 	<%} %>
                          	 	</select>
         
         </td>
      </tr>
      <tr>
         <th>주민등록번호</th>
         <td><input type="text" name="ssn_1"  id="ssn_1" value="<%=ssn1%>"> -
       		 <input type="text" name="ssn_2"  id="ssn_2" value="<%=ssn2%>"></td>
       </tr>
       <tr>
         <th>아이디</th>
         <td>
         <input type="text" name="id" id="id" value="<%=m.getEmpId()%>">&nbsp;&nbsp;&nbsp;<a id="idCheck">검색</a>
         </td>
       </tr>
       <tr>
         <th>비밀번호</th>
         <td><input type="text" name="pwd" id="pwd" style="width: 228px;" value="<%=m.getEmpPwd()%>"></td>
       </tr>
       <tr>
         <th>부서</th>
         <td><select id='dept' name="dept">
         		<option value="총무팀">총무팀</option>
         		<option value="인사팀">인사팀</option>
         		<option value="영업팀">영업팀</option>
         		<option value="개발팀">개발팀</option>
         		<option value="기획팀">기획팀</option>
         		<option value="임원진">임원진</option>
         	</select></td>
       </tr>
        <tr>
           <th>직급</th>
          <td><select name="job" id="job">
         		<option value="사원">사원</option>
         		<option value="주임">주임</option>
         		<option value="대리">대리</option>
         		<option value="과장">과장</option>
         		<option value="차장">차장</option>
         		<option value="부장">부장</option>
         		<option value="이사">이사</option>
         		<option value="상무">상무</option>
         		<option value="전무">전무</option>
         	    <option value="부사장">부사장</option>
         		<option value="사장">사장</option>
         	</select>
         	</td>

        </tr>
        <tr>
          <th>이메일</th>
          <td>
            <input type='text' name="email" id="email" value="<%=email%>">@
            <input type='text' name="email_dns" id="email_dns" value="<%=email2%>">
            </td>
         </tr>
       	<tr>
			<th>우편번호</th>
			<td><input type="text" id="zipCode" name="zipCode" value="<%=zipCode %>" >&nbsp;&nbsp;&nbsp;<a id="ckZip" onclick="addrSearch();">검색</a></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input style="width: 228px;" type="text" id="address1" name="address1" value="<%=address1 %>" ></td>
				<td></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input style="width: 228px;" type="text" id="address2" name="address2" value="<%=address2 %>"></td>
				<td></td>
			</tr>
        <tr>
         <th>전화번호</th>
           <td><input type="text"name="home1" id="home1" value="<%=home1%>"> -
               <input type="text" name="home2" id="home2" title="전화번호" value="<%=home2%>"> -
               <input type="text" name="home3" id="home3" value="<%=home3%>">
            </td>
        </tr>
        <tr>
          <th>핸드폰 번호</th>
           <td><input type="text"name="phone1" id="phone1" value="<%=phone1%>"> -
               <input type="text" name="phone2" id="phone2" value="<%=phone1%>"> -
               <input type="text" name="phone3"  id="phone3" value="<%=phone1%>">
           </td>
          </tr>
			<tr>
           <th>은행</th>
           <td>
           <%if(m.getBank() != null) {%>
           <input type='text' name='bank' id="bank" value="<%=m.getBank() %>" >
           				<%} else{%>
           	<input type='text' name='bank' id="bank"  value="" placeholder="입력해주세요" >			
           	<%} %>
           </td>
        </tr>
        <tr>
        <th>계좌번호</th>
           <td>
           <%if(m.getBankNo() != null) {%>
           <input type='text' name='bankno' id="bankno" value="<%=m.getBankNo() %>" >
           				<%} else{%>
           	<input type='text' name='bankno' id="bankno" value="" placeholder="입력해주세요" >			
           	<%} %>
           </td>
        </tr>
         <tr>
           <th>급여</th>
           <td>
           <%if(m.getSalary() != 0) {%>
           <input type='text' name='salary' id="salary" value="<%=m.getSalary() %>" >
           				<%} else{%>
           	<input type='text' name='salary'id="salary"  placeholder="입력해주세요" >			
           	<%} %>
           </td>
        </tr> 
        <tr>
           <th>보너스</th>
           <td>
           <%if(m.getBonus() != 0) {%>
           <input type='text' name='bonus'  id="bonus" value="<%=m.getBonus() %>" >
           				<%} else{%>
           	<input type='text' name='bonus' id="bonus"  placeholder="입력해주세요" >			
           	<%} %>
           </td>
        </tr>
           <tr>
             <td colspan="2" align="center">
            </td>
           </tr>
           </table>
                      <br><br><br>
      <input style="position: relative;left: 75px;" onclick="return addform()" type="submit" value="수정하기" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      	<input style="position: relative;left: 60px;" type="reset" value="취소하기"class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    	<div class="fileArea" id="fileArea">
		      				<input type="file" id="thumbnailImg1"
		      				name="thumbnailImg1" onchange="loadImg(this, 1);" />
		     			 </div>
		     			 
                      </form >
                    </div>
              </div>
           </div>
          </div>
         <%@ include file="./common/footer.jsp" %>
         
         
         <script>
       //사원부서 셀렉티드
			for(var i=0;i<6;i++){
				if(document.getElementById("dept").children[i].value == '<%=m.getDeptName()%>'){
				document.getElementById("dept").children[i].selected=true;
			}
  		}
     	//사원직급 셀렉티드
			for(var i=0;i<11;i++){
				if(document.getElementById("job").children[i].value == '<%=m.getJobName()%>'){
				document.getElementById("job").children[i].selected=true;
			}
  		}
          </script> 
            <script>
            
  function addform(){
            	
            	if(document.getElementById('name').value==""){
            		alert('이름을 입력해 주세요');
            		return false;
            	}if(document.getElementById('ssn_1').value=="" || document.getElementById('ssn_2').value==""){
            		alert('주민번호를 입력해 주세요');
            		return false;
            	}if(document.getElementById('id').value==""){
            		alert('아이디를 입력해 주세요');
            		return false;
            	}if(document.getElementById('pwd').value==""){
            		alert('비밀번호를 입력해 주세요');
            		return false;
            	}if(document.getElementById('email').value=="" || document.getElementById('email_dns').value=="" ){
            		alert('이메일을 입력해 주세요');
            		return false;
            	}if(document.getElementById('zipCode').value=="" || document.getElementById('address1').value=="" || document.getElementById('address2').value==""){
            		alert('주소를 입력하세요');
            		return false;
            	}if(document.getElementById('home1').value==""||document.getElementById('home2').value=="" ||document.getElementById('home3').value==""){
            		alert('전화번호를 확인 하세요');
            		return false;
            	}if(document.getElementById('phone1').value=="" || document.getElementById('phone2').value=="" || document.getElementById('phone3').value==""){
            		alert('핸드폰 번호를 확인하세요');
            		return false;
            	}if(document.getElementById('bank').value==""){
            		alert('은행을 입력해 주세요');
            		return false;
            	}if(document.getElementById('bankno').value==""){
            		alert('계좌를 입력해 주세요');
            		return false;
            	}if(document.getElementById('salary').value==""){
            		alert('급여를 입력해 주세요');
            		return false;
            	}if(document.getElementById('bonus').value==""){
            		alert('보너스를 입력해 주세요');
            		return false;
            	}else{
            		return true;
            	}
            	
            }
            
            
            // 참조 API : http://postcode.map.daum.net/guide
    			function addrSearch() {
    		        new daum.Postcode({
    		            oncomplete: function(data) {
    		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
    		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    		                var fullAddr = ''; // 최종 주소 변수
    		                var extraAddr = ''; // 조합형 주소 변수

    		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
    		                    fullAddr = data.roadAddress;

    		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
    		                    fullAddr = data.jibunAddress;
    		                }

    		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
    		                if(data.userSelectedType === 'R'){
    		                    //법정동명이 있을 경우 추가한다.
    		                    if(data.bname !== ''){
    		                        extraAddr += data.bname;
    		                    }
    		                    // 건물명이 있을 경우 추가한다.
    		                    if(data.buildingName !== ''){
    		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    		                    }
    		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
    		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
    		                }

    		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
    		                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
    		                
    		                $('#address1').val(fullAddr);

    		                // 커서를 상세주소 필드로 이동한다.
    		                $('#address2').focus();
    		            }
    		        }).open();
    		    };
    	
    			// 사진 게시판 미리보기 기능 지원 스크립트
    			$(function(){
    				$('#fileArea').hide();
    				
    				$('#titleImgArea').click(() => {
    					$('#thumbnailImg1').click();
    				});
    			});
    			
    			function loadImg(value, num){
    				
    				if(value.files && value.files[0])  {
    					
    					var reader = new FileReader();
    					
    					reader.onload = function(e){
    						
    						switch(num) {
    						case 1 : $('#titleImg').attr('src', e.target.result);
    							break;
    						
    							
    						}
    					}
    					reader.readAsDataURL(value.files[0]);
    				}
    			}
    			//아이디 중복검사
    			$('#idCheck').click(function(){
				$.ajax({
					url:"/Semi/idDup.me",
					type:"post",
					data:{id: $('#id').val()},
					success:function(data){
						console.log(data);
						
						if(data=='ok'){
							alert("사용 가능한 아이디입니다.");
						}else{
							alert('이미 사용중인 아이디입니다.');
							$('#id').select();
						}
					},error:function(){
						console.log("Error 입니다.");
					}
    					
    				});
    			});
    			
            	function emplist() {
            		location.href="/Semi/mList.em";
				}
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