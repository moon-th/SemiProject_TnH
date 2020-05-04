<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int empNo = Integer.parseInt(request.getParameter("empNo"));
%>

<!DOCTYPE html>
<html>
<head>

<!-- 폰텔로 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/src/tree_fontello/css/fontello.css">
<!-- 폰텔로 -->

<script src='<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js'></script>
<!------------------------------- script입니다 ------------------------------->
<script>
week = ['일','월','화','수','목','금','토'];
weekarr = new Array();

plus = 0;
/*                            isEmpty메소드입니다.                              */
function isEmpty(str){
    
    if(typeof str == "undefined" || str == null || str == "")
        return true;
    else
        return false ;
}

/*                            문서가 시작될때 불러옵니다.                              */
$(document).ready(function(){

    var now1 = new Date();

    var dayOfWeek = week[new Date().getDay()];

    if(dayOfWeek == '일'){

    }
    if(dayOfWeek == '월'){
        var minusday = now1.getTime() - (1*(24*60*60*1000));
        now1 = new Date(minusday);
    }
    if(dayOfWeek == '화'){
        var minusday = now1.getTime() - (2*(24*60*60*1000));
        now1 = new Date(minusday);
    }
    if(dayOfWeek == '수'){
        var minusday = now1.getTime() - (3*(24*60*60*1000));
        now1 = new Date(minusday);
    }
    if(dayOfWeek == '목'){
        var minusday = now1.getTime() - (4*(24*60*60*1000));
        now1 = new Date(minusday);
    }
    if(dayOfWeek == '금'){
        var minusday = now1.getTime() - (5*(24*60*60*1000));
        now1 = new Date(minusday);
    }
    if(dayOfWeek == '토'){
        var minusday = now1.getTime() - (6*(24*60*60*1000));
        now1 = new Date(minusday);
    }

    for(var i =0; i<14; i++){
        weekarr[i] = now1;
        var plusday = now1.getTime()+(24*60*60*1000);
        now1 = new Date(plusday);
    }   

/*                            문서가 시작될때 불러옵니다.                              */
    
    var fyear = weekarr[0].getFullYear();
    
    var fmonth = "";
    if((weekarr[0].getMonth()+1)<10){
    	fmonth += "0" + (weekarr[0].getMonth()+1);
    }else{
    	fmonth += (weekarr[0].getMonth()+1);
    }
    
    var fday = "";
    if(weekarr[0].getDate()<10){
    	fday += "0" + weekarr[0].getDate();
    }else{
    	fday += weekarr[0].getDate();
    }
    
    var firstDay = fyear + "-" + fmonth + "-" + fday;

    $.ajax({
    	url:"/Semi/openWindow.wh",
    	type:"get",
    	data:{
    		empNo:$('#empNo').val(),
    		firstDay:firstDay
    	},success:function(data){
    	    var weekarr2 = new Array();

    		/* for(var index = 0; index < data.length; index++){
    				var datacall = data[index].workDate;
    				weekarr2.push(datacall);
    		} */
var datalength = 0;
    	    
    	    if(isEmpty(data)){
    	    	datalength = 0;
    	    }else{
    	    	datalength = data.length;
    	    }
    	    
    		for(var index = 0; index < datalength; index++){
    				var datacall = data[index].workDate;
    				weekarr2.push(datacall);
    		}
    		
    		var checkarr = new Array();
    		
    		$('#box2-2>div, #box2-3>div').each(function(index,date){
                
    			var check = true;
    			
    			date.innerHTML = 
                     weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")<br><br>";
    			
                var yymmdd = (weekarr[index].getMonth()+1) + "월 " + weekarr[index].getDate() + ", " + weekarr[index].getFullYear();
                
                for(var i=0; weekarr2.length>i; i++){
                	
                	if(yymmdd==weekarr2[i]){
                		
                		
                		if(data[i].workType1==1){
                			date.innerHTML += "&#xf0f7 ";
                		}else if (data[i].workType1==2){
                			date.innerHTML += "&#xe812 ";
                		}else if (data[i].workType1==3){
                			date.innerHTML += "&#xe810 ";
                		}
                		
                		
                		date.innerHTML += data[i].workTime1 + "  ~ <br> " + data[i].workTime11;
                		
                		check = false;
                		
                		if(data[i].workType2==0){
                			date.innerHTML += "<br>&#xe80a";
                		}else{
                			
                			if(data[i].workType2==1){
                    			date.innerHTML += "<br><br>&#xf0f7 ";
                    		}else if (data[i].workType2==2){
                    			date.innerHTML += "<br><br>&#xe812 ";
                    		}else if (data[i].workType2==3){
                    			date.innerHTML += "<br><br>&#xe810 ";
                    		}

                			date.innerHTML += data[i].workTime2 + " ~ <br> " + data[i].workTime21;
                		}
                	}
                };
                
                if(check){
                	date.innerHTML += "&#xe818<br>&#xe817<br>&#xe816";
                }
                
    		});
    		
    	},error:function(){
    		alert("오류");
    	}
    });
    
/*                              근무시간을 만듭니다.                              */

    document.getElementById('twoweeks').innerHTML = 
            weekarr[0].getFullYear() + " " + (weekarr[0].getMonth()+1) + ". " +
            weekarr[0].getDate() + " ~ " + 
            " " + (weekarr[13].getMonth()+1) + ". " +
            weekarr[13].getDate();

/*                              hover입니다.                              */
    $('.hv1').hover(function(){
      // mouseenter
      $(this).addClass('divhovercss1');
    },function(){
      // mouseleave
      $(this).removeClass('divhovercss1');
    });
    
    $('.hv2').hover(function(){
      // mouseenter
      $(this).addClass('divhovercss2');
    },function(){
      // mouseleave
      $(this).removeClass('divhovercss2');
    });

});
    
/*                              이전버튼입니다.                              */
function beforew(){
    
    for(var i =0; i<14; i++){
        var minus = weekarr[i].getTime()-(14*(24*60*60*1000));
        weekarr[i] = new Date(minus);
    }
    
    var fyear = weekarr[0].getFullYear();
    
    var fmonth = "";
    if((weekarr[0].getMonth()+1)<10){
    	fmonth += "0" + (weekarr[0].getMonth()+1);
    }else{
    	fmonth += (weekarr[0].getMonth()+1);
    }
    
    var fday = "";
    if(weekarr[0].getDate()<10){
    	fday += "0" + weekarr[0].getDate();
    }else{
    	fday += weekarr[0].getDate();
    }
    
    var firstDay = fyear + "-" + fmonth + "-" + fday;
    
    document.getElementById('twoweeks').innerHTML = 
            weekarr[0].getFullYear() + " " + (weekarr[0].getMonth()+1) + ". " +
            weekarr[0].getDate() + " ~ " + 
            " " + (weekarr[13].getMonth()+1) + ". " +
            weekarr[13].getDate();
    
    $.ajax({
    	url:"/Semi/openWindow.wh",
    	type:"get",
    	data:{
    		empNo:$('#empNo').val(),
    		firstDay:firstDay
    	},success:function(data){
    	    var weekarr2 = new Array();

    		/* for(var index = 0; index < data.length; index++){
    				var datacall = data[index].workDate;
    				weekarr2.push(datacall);
    		} */
var datalength = 0;
    	    
    	    if(isEmpty(data)){
    	    	datalength = 0;
    	    }else{
    	    	datalength = data.length;
    	    }
    	    
    		for(var index = 0; index < datalength; index++){
    				var datacall = data[index].workDate;
    				weekarr2.push(datacall);
    		}
    		
    		var checkarr = new Array();
    		
    		$('#box2-2>div, #box2-3>div').each(function(index,date){
                
    			var check = true;
    			
    			date.innerHTML = 
                     weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")<br><br>";
    			
                var yymmdd = (weekarr[index].getMonth()+1) + "월 " + weekarr[index].getDate() + ", " + weekarr[index].getFullYear();
                
                for(var i=0; weekarr2.length>i; i++){
                	
                	if(yymmdd==weekarr2[i]){
                		
                		
                		if(data[i].workType1==1){
                			date.innerHTML += "&#xf0f7 ";
                		}else if (data[i].workType1==2){
                			date.innerHTML += "&#xe812 ";
                		}else if (data[i].workType1==3){
                			date.innerHTML += "&#xe810 ";
                		}
                		
                		
                		date.innerHTML += data[i].workTime1 + " ~ <br> " + data[i].workTime11;
                		
                		check = false;
                		
                		if(data[i].workType2==0){
                			date.innerHTML += "<br>&#xe80a";
                		}else{
                			
                			if(data[i].workType2==1){
                    			date.innerHTML += "<br><br>&#xf0f7 ";
                    		}else if (data[i].workType2==2){
                    			date.innerHTML += "<br><br>&#xe812 ";
                    		}else if (data[i].workType2==3){
                    			date.innerHTML += "<br><br>&#xe810 ";
                    		}

                			date.innerHTML += data[i].workTime2 + " ~ <br> " + data[i].workTime21;
                		}
                	}
                };
                
                if(check){
                	date.innerHTML += "&#xe818<br>&#xe817<br>&#xe816";
                }
                
    		});
    		
    	},error:function(){
    		alert("오류");
    	}
    });

}
/*                              다음버튼입니다.                              */
function nextw(){

    for(var i =0; i<14; i++){
        var minus = weekarr[i].getTime()+(14*(24*60*60*1000));
        weekarr[i] = new Date(minus);
    }
    
    var fyear = weekarr[0].getFullYear();
    
    var fmonth = "";
    if((weekarr[0].getMonth()+1)<10){
    	fmonth += "0" + (weekarr[0].getMonth()+1);
    }else{
    	fmonth += (weekarr[0].getMonth()+1);
    }
    
    var fday = "";
    if(weekarr[0].getDate()<10){
    	fday += "0" + weekarr[0].getDate();
    }else{
    	fday += weekarr[0].getDate();
    }
    
    var firstDay = fyear + "-" + fmonth + "-" + fday;
    
    document.getElementById('twoweeks').innerHTML = 
            weekarr[0].getFullYear() + " " + (weekarr[0].getMonth()+1) + ". " +
            weekarr[0].getDate() + " ~ " + 
            " " + (weekarr[13].getMonth()+1) + ". " +
            weekarr[13].getDate();
    
    $.ajax({
    	url:"/Semi/openWindow.wh",
    	type:"get",
    	data:{
    		empNo:$('#empNo').val(),
    		firstDay:firstDay
    	},success:function(data){
    	    var weekarr2 = new Array();
//    		console.log(data);

    		/* for(var index = 0; index < data.length; index++){
    				var datacall = data[index].workDate;
    				weekarr2.push(datacall);
    		} */
var datalength = 0;
    	    
    	    if(isEmpty(data)){
    	    	datalength = 0;
    	    }else{
    	    	datalength = data.length;
    	    }
    	    
    		for(var index = 0; index < datalength; index++){
    				var datacall = data[index].workDate;
    				weekarr2.push(datacall);
    		}
    		
    		var checkarr = new Array();
    		
    		$('#box2-2>div, #box2-3>div').each(function(index,date){
                
    			var check = true;
    			
    			date.innerHTML = 
                     weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")<br><br>";
    			
                var yymmdd = (weekarr[index].getMonth()+1) + "월 " + weekarr[index].getDate() + ", " + weekarr[index].getFullYear();
    		
//                console.log(weekarr2[index]);
//                console.log(yymmdd);
                
                for(var i=0; weekarr2.length>i; i++){
                	
                	if(yymmdd==weekarr2[i]){
                		
                		
                		if(data[i].workType1==1){
                			date.innerHTML += "&#xf0f7 ";
                		}else if (data[i].workType1==2){
                			date.innerHTML += "&#xe812 ";
                		}else if (data[i].workType1==3){
                			date.innerHTML += "&#xe810 ";
                		}
                		
                		
                		date.innerHTML += data[i].workTime1 + " ~ <br> " + data[i].workTime11;
                		
                		check = false;
                		
                		if(data[i].workType2==0){
                			date.innerHTML += "<br>&#xe80a";
                		}else{
                			
                			if(data[i].workType2==1){
                    			date.innerHTML += "<br><br>&#xf0f7 ";
                    		}else if (data[i].workType2==2){
                    			date.innerHTML += "<br><br>&#xe812 ";
                    		}else if (data[i].workType2==3){
                    			date.innerHTML += "<br><br>&#xe810 ";
                    		}

                			date.innerHTML += data[i].workTime2 + " ~ <br> " + data[i].workTime21;
                		}
                	}
                };
                
                if(check){
                	date.innerHTML += "&#xe818<br>&#xe817<br>&#xe816";
                }
                
    		});
    		
    	},error:function(){
    		alert("오류");
    	}
    });
    
    
}
</script>
<!------------------------------- style입니다 ------------------------------->
<style>
#box2 {


    width: 99%;
    height: 99%;
	
/* 	padding-left: 1%;
    padding-right: 1%;
	
    margin-top: 1%;
    margin-bottom: 1%;
    padding-bottom: 1%;
    padding-top: 1%; */
}
#box2-1 {
    width: 98%;
    height: 10%;
    text-align: center;
}

#box2-2 {
    width: 98%;
    height: 20%;
    padding-left: 2%;
    
}
#box2-3 {
    width: 98%;
    height: 68%;
    padding-left: 2%;
}
.day {
    width: 11%;
    height: 120px;
    
    font-size:10px;

    padding-left: 1%;
    padding-top: 1%;

    margin-right: 0.8%;
    margin-left: 0.8%;

    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    font-family: fontello;
}
.inline1 {
    display: inline-block;
}
.weekday {
	color:#877da2;
	border: 1px solid #e0e0e0;
  background: rgb(248, 244, 255)
}

.weekend {
	color:#ff758d;
	border: 1px solid #ffb6b6;
  background: rgb(255, 225, 230);
}
.divhovercss1{
	color:#ff758d;
  border: 2px solid #ffb6b6;
  background: rgb(255, 210, 217)
}
.divhovercss2{
	color:877da2;
  border: 2px solid #cacaca;
  background: rgb(242, 234, 255);
}
</style>

<meta charset="UTF-8">
<title>WorkingHour</title>
</head>
<body>
<input type='hidden' id='empNo' value='<%= empNo %>'>
    <div id='box2'>
<!------------------------------- box2-1 입니다 ------------------------------->
        <div id='box2-1'>
            <button type="button" class='inline1' id='beforew' onclick='beforew();' style='color: #877da2; font-family:fontello; border: hidden; font-size: 22px;'>&nbsp;&nbsp;&#xe80b&nbsp;&nbsp;</button>
            <p id='twoweeks' class='inline1' style='color:#877da2; font-size: 22px; margin-left: 1%; margin-right: 1%;'></p>
            <button type="button" class='inline1' id='nextw' onclick='nextw();' style='color: #877da2; font-family:fontello; border: hidden; font-size: 22px;'>&nbsp;&nbsp;&#xe80c&nbsp;&nbsp;</button>
        	<br>
        </div>    
        	<p style='margin-right: 3%; text-align: right; font-family:fontello;'>&#xe816 : 휴일 / &#xf0f7 : 근무 / &#xe812 : 외근 / &#xe810 : 반차 / &#xe80a : 특이사항 없음</p>

        <br>
<!------------------------------- box2-2 입니다 ------------------------------->
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
<!------------------------------- box2-3 입니다 ------------------------------->
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

</body>
</html>