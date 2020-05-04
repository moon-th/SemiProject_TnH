<%@ 
	page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.member.model.vo.*"
%>
<%
Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
<!-- 버튼 CSS 끝 -->

<!------------------------ SmartEditor 시작 ------------------------>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/src/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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


<title>전자결제</title>
</head>

    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
        	<%@ include file="/views/common/header.jsp" %> 
     
          <div class="mdl-layout__tab-panel is-active" id="overview">

	<div class=main>
	
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
/* hover로 메뉴에 css 적용하기 */
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
		
/* span onclick event 적용하기 */
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
  <!-- section 시작 -->
    <section id='board' style="margin-left: 5%; margin-right: 5%;">

    <form action="<%= request.getContextPath() %>/confirmInsert.bo" method="post" enctype="multipart/form-data">
      <hr>

<!-- hidden 시작 --><!-- hidden 시작 -->   <!-- hidden 시작 -->   <!-- hidden 시작 -->
<input type='hidden' name='checklist_value' id='checklist_value'>
<input type='hidden' name='approvallist_value' id='approvallist_value'>
<input type='hidden' name='reflist_value' id='reflist_value'>
<input type='hidden' name='EmpNo' value="<%= m.getEmpNo() %>">
<input type='hidden' name='type' value="0">
<input type='hidden' name='EmpName' value="<%= m.getEmpName() %>">

      <input onclick='confirmline();' type='button' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" value='결재선 지정'>
      
      <button type="submit" onclick='submitContents();' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">결재 요청</button>
      
      <!-- <input type="button" value='임시 저장' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"> -->
      
      <button type="reset" id='cancel' class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">취소</button>
      
      <hr>
      <br>
      <!-- 부트스트랩 테이블 -->
      <table class="table">
        <thead class="thead-light">
          <tr>
            <th>기안</th>
            <th><%= m.getDeptName() %></th>
            <th><%= m.getJobName() + " " + m.getEmpName() %></th>
          </tr>
        </thead>
        <tbody>

          <tr id='list1'>
            <td>검토</td>
            <td></td>
            <td></td>
          </tr>
          
		  <tr id='list2'>
            <td>협조</td>
            <td></td>
            <td></td>            
          </tr>
          
          <thead class="thead-dark" id='list3'>
          <tr>
            <th>승인</th>
            <th></th>
            <th></th>
          </tr>
          </thead>
        </tbody>
      </table>

      <!-- 부트스트랩 테이블 -->

      <!-- <label>제목 : </label>
      <input type="text"> -->
      <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <input class="mdl-textfield__input" type="text" id="sample3"  name='title' placeholder="제목을 입력하세요.">
        <label class="mdl-textfield__label" for="sample3"></label>
      </div>

      <br>
      <!-- period = name : options -->
      <label>보존 기간 / </label>
      <!-- <select>
        <option>6개월</option>
        <option>1년</option>
        <option>2년</option>
      </select> -->
      <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
        <input type="radio" id="option-1" class="mdl-radio__button" name="options" value="1" checked>
        <span class="mdl-radio__label">6개월</span>
      </label>      
      <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
        <input type="radio" id="option-2" class="mdl-radio__button" name="options" value="2">
        <span class="mdl-radio__label">1년</span>
      </label>
      <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-3">
        <input type="radio" id="option-3" class="mdl-radio__button" name="options" value="3">
        <span class="mdl-radio__label">2년</span>
      </label>
      <br>
      <label>기밀 등급 / </label>
      <!-- <select>
        <option>기밀</option>
        <option>일반</option>
        <option>공개</option>
      </select> -->
      <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-4">
        <input type="radio" id="option-4" class="mdl-radio__button" name="options2" value="3">
        <span class="mdl-radio__label">기밀</span>
      </label>      
      <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-5">
        <input type="radio" id="option-5" class="mdl-radio__button" name="options2" value="2" checked>
        <span class="mdl-radio__label">일반</span>
      </label>
      <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-6">
        <input type="radio" id="option-6" class="mdl-radio__button" name="options2" value="1">
        <span class="mdl-radio__label">공개</span>
      </label>

      <br>
      <!-- <textarea style="resize : none;" cols="40" rows="10"></textarea> -->
		<!-- 폰트바꿔주는 놈  -->
		
		<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
		
		<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			 oAppRef: oEditors,
			 elPlaceHolder: "ir1",
			 sSkinURI: "/Semi/resources/src/smartEditor/SmartEditor2Skin.html",
			 fCreator: "createSEditor2"
			});
		</script>
		
		<!-- 폰트바꿔주는 놈  -->
		
      <br>
      <label style='font-family: fontello;'>&#xe809첨부파일 : </label>
      <input type="file" name="file" id="file">
		<label>(첨부 파일의 최대 용량은 10MB 입니다.)</label>
    </form>

  </section>
  <!-- section 끝 -->
  </div>
  </div>
  </div>
    <script>

    function confirmline() {
		window.open("<%=request.getContextPath()%>/MemberList.ap?empNo=<%= m.getEmpNo() %>","결재선 지정","width=1100, height=700,resizable=yes");
    };
	
    function submitContents(elClickedObj) {
   	 // 에디터의 내용이 textarea에 적용된다.
   	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

   	 // 에디터의 내용에 대한 값 검증은 이곳에서
   	 // document.getElementById("ir1").value를 이용해서 처리한다.

   	 try {
   	     elClickedObj.form.submit();
   	 } catch(e) {
   		 }
   	 };
    
    $('#cancel').click(function(){
		location.href='<%=request.getContextPath()%>/views/confirm/confirm.jsp';
	});
    
  </script>

</body>
</html>