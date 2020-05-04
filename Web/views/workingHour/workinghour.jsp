<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int empNo = Integer.parseInt(request.getParameter("empNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkingHour</title>

<script src='<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js'></script>
<script src='<%=request.getContextPath()%>/resources/js/workingHour.js'></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/working_box2.css">

<!-- 폰텔로 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/src/tree_fontello/css/fontello.css">
<!-- 폰텔로 -->

</head>
<body style="width: 100%;height: 100%;padding-left: 2%;padding-top: 2%;padding-right: 2%;">

<input type='hidden' id='empNo' value='<%= empNo %>'>
<!------------------------------ box1 상단바 ------------------------------>
    <div id='box1'>
        <br><br>
        <div id='box1-1'>
            반갑습니다.
            <span id='empInfo'></span>
        </div>
    </div>
<!------------------------------ box1 상단바 ------------------------------>

<!------------------------------ box2 중앙 ------------------------------>
    <div id='box2'>
        <div id='box2-1'>
            <button type="button" class='inline3' id='beforew' onclick='beforew();' style='color: #877da2; font-family:fontello; border: hidden; font-size: 22px;'>&nbsp;&nbsp;&#xe80b&nbsp;&nbsp;</button>
            <p id='twoweeks' class='inline3' style='color:#877da2; font-size: 22px; margin-left: 1%; margin-right: 1%;'></p>
            <button type="button" class='inline3' id='nextw' onclick='nextw();' style='color: #877da2; font-family:fontello; border: hidden; font-size: 22px;'>&nbsp;&nbsp;&#xe80c&nbsp;&nbsp;</button>
        	<br>
        </div>    
        	<p style='margin-right: 3%; text-align: right; font-family:fontello;'>&#xe816 : 휴일 / &#xf0f7 : 근무 / &#xe812 : 외근 / &#xe810 : 반차 / &#xe80a : 특이사항 없음</p>

        <br>
        <!-- div창!! -->
        <div id='box2-2'>
            <div id='sun1' class='day inline1 weekend hv1'></div>
            <div id='mon1' class='day inline1 weekday hv2'></div>
            <div id='tue1' class='day inline1 weekday hv2'></div>
            <div id='wed1' class='day inline1 weekday hv2'></div>
            <div id='thur1' class='day inline1 weekday hv2'></div>
            <div id='fri1' class='day inline1 weekday hv2'></div>
            <div id='sat1' class='day inline1 weekend hv1'></div>
        </div>
        <br>
        <!-- div창!! -->
        <div id='box2-3'>
            <div id='sun2' class='day inline1 weekend hv1'></div>
            <div id='mon2' class='day inline1 weekday hv2'></div>
            <div id='tue2' class='day inline1 weekday hv2'></div>
            <div id='wed2' class='day inline1 weekday hv2'></div>
            <div id='thur2' class='day inline1 weekday hv2'></div>
            <div id='fri2' class='day inline1 weekday hv2'></div>
            <div id='sat2' class='day inline1 weekend hv1'></div>
        </div>     
    </div>

<!------------------------------ box3 선택 ------------------------------>
    <div id='box3'>
        <div id='box3-1'>
            <p style="display: inline-block;">
                STEP1<br>
                근무 일자 선택 >
            </p>
            <input type="date" style="display: inline-block;" id='select' value=''>
        </div>
<!------------------------------ box3 -2 선택 ------------------------------>
        <div id='box3-2'>
            <p style="display: inline-block;">
                STEP2<br>
                근무시간 선택 >
            </p>
            <input type="button" value='9:00~18:00' style="display: inline-block;" onclick='sel1();'>
            <input type="button" value='9:30~18:30' style="display: inline-block;" onclick='sel2();'>
            <input type="button" value='10:00~19:00' style="display: inline-block;" onclick='sel3();'>
            <script>
            	
            	function sel1(){
            		$('#workHour1').val(9);
            		$('#workHour2').val(18);
            		$('#workMin1').val(0);
            		$('#workMin2').val(0);
            	};
            	
            	function sel2(){
            		$('#workHour1').val(9);
            		$('#workHour2').val(18);
            		$('#workMin1').val(30);
            		$('#workMin2').val(30);
            	};
            	
            	function sel3(){
            		$('#workHour1').val(10);
            		$('#workHour2').val(19);
            		$('#workMin1').val(0);
            		$('#workMin2').val(0);
            	};
            </script>
            <br>
            <label>근무시간1</label>&nbsp;&nbsp;&nbsp;
            <select name="" id="workType1">
                <option value="1">근무</option>
                <option value="2">외근</option>
                <option value="3">반차</option>
            </select>&nbsp;&nbsp;
            
            <select name="workHour1" id="workHour1">
            </select>
            &nbsp;&nbsp;:&nbsp;&nbsp;
            <select name="workMin1" id="workMin1">
            </select>
            &nbsp;&nbsp;~&nbsp;&nbsp;
            <select name="workHour2" id="workHour2">
            </select>
            &nbsp;&nbsp;:&nbsp;&nbsp;
            <select name="workMin2" id="workMin2">
            </select>
			
			<input type="button" value="+" id='timeboxplus'>

        </div>
<!------------------------------ box3-2 선택 ------------------------------>
<!------------------------------ box3-3 선택 ------------------------------>
        <div id='box3-3'>
            <br>
            <!-- <div id='box3-3-1'>
                
            </div> -->
            <br>
            <div align='center'>
                <button onclick='window.close();'>닫기</button>
                <button type="submit" id='savetime'>저장</button>
            </div>
        </div>
    </div>

<!------------------------------ box3 선택창 ------------------------------>
</body>
</html>