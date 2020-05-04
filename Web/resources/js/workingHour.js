week = ['일','월','화','수','목','금','토'];
    weekarr = new Array();

    plus = 0;

    function isEmpty(str){
        
        if(typeof str == "undefined" || str == null || str == "")
            return true;
        else
            return false ;
    }
    
    /* 시작하자마자 바로 실행. */
    $(document).ready(function(){
        // 현재 요일
        var now1 = new Date();

        /* 일~토 구하는 로직 */
        // var week = ['일','월','화','수','목','금','토'];
        // 현재요일을 받음
        var dayOfWeek = week[new Date().getDay()];

        if(dayOfWeek == '일'){
            // 아모고토 안하고 바로 직통
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

//        console.log(weekarr);


// ----------- 일단 모든 데이터 출력할값 ArrayList로 뽑아오기 ----------- 일단 모든 데이터 출력할값 ArrayList로 뽑아오기 -----------
        
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
//        		console.log(data);
        	    
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
        		
//                    console.log(weekarr2[index]);
//                    console.log(yymmdd);
                    
                    for(var i=0; weekarr2.length>i; i++){
                    	
                    	if(yymmdd==weekarr2[i]){
                    		
                    		
                    		if(data[i].workType1==1){
                    			date.innerHTML += "&#xf0f7 ";
                    		}else if (data[i].workType1==2){
                    			date.innerHTML += "&#xe812 ";
                    		}else if (data[i].workType1==3){
                    			date.innerHTML += "&#xe810 ";
                    		}
                    		
                    		
                    		date.innerHTML += data[i].workTime1 + " : " + data[i].workTime11;
                    		
                    		check = false;
                    		
                    		if(data[i].workType2==0){
                    			date.innerHTML += "<br><br>&#xe80a";
                    		}else{
                    			
                    			if(data[i].workType2==1){
                        			date.innerHTML += "<br><br>&#xf0f7 ";
                        		}else if (data[i].workType2==2){
                        			date.innerHTML += "<br><br>&#xe812 ";
                        		}else if (data[i].workType2==3){
                        			date.innerHTML += "<br><br>&#xe810 ";
                        		}

                    			date.innerHTML += data[i].workTime2 + " : " + data[i].workTime21;
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
        
// ----------- ajax로 날짜 뿌려 보.리.기 ----------- ajax로 날짜 뿌려 보.리.기 ----------- ajax로 날짜 뿌려 보.리.기 ----------- 근무시간 만들어보리기 -----------

        document.getElementById('twoweeks').innerHTML = 
                weekarr[0].getFullYear() + " " + (weekarr[0].getMonth()+1) + ". " +
                weekarr[0].getDate() + " ~ " + 
                " " + (weekarr[13].getMonth()+1) + ". " +
                weekarr[13].getDate();
// ----------- 근무시간 만들어보리기 ----------- 근무시간 만들어보리기 ----------- 근무시간 만들어보리기 ----------- 근무시간 만들어보리기 -----------
        for(var i=0; 23>i; i++) {

          var optionHour1 = $('<option>').val(i+1).text(i+1);
          var optionHour2 = $('<option>').val(i+1).text(i+1);
          var optionHour3 = $('<option>').val(i+1).text(i+1);
          var optionHour4 = $('<option>').val(i+1).text(i+1);

            if(i==8){
              optionHour1.attr('selected','true');
            }else if(i==11){
              optionHour3.attr('selected','true');
            }else if(i==17){
              optionHour2.attr('selected','true');
            }else if(i==19){
              optionHour4.attr('selected','true');
            }

          $('#workHour1').append(optionHour1);
          $('#workHour2').append(optionHour2);
          $('#workHour3').append(optionHour3);
          $('#workHour4').append(optionHour4);

        }

        for(var i=0; 12>i; i++) {

          var optionMin1 = $('<option>').val(i*5).text(i*5);
          var optionMin2 = $('<option>').val(i*5).text(i*5);
          var optionMin3 = $('<option>').val(i*5).text(i*5);
          var optionMin4 = $('<option>').val(i*5).text(i*5);

          $('#workMin1').append(optionMin1);
          $('#workMin2').append(optionMin2);
          $('#workMin3').append(optionMin3);
          $('#workMin4').append(optionMin4);
        }
// ----------- timeboxplus ----------- timeboxplus ----------- timeboxplus ----------- timeboxplus -----------
        
        $('#timeboxplus').click(function(){

            var brbr = $('<div>');

            brbr.append("<br><label>근무시간2</label>&nbsp;&nbsp;<select name='' id='workType2'><option value='1'>근무</option><option value='2'>외근</option><option value='3'>반차</option></select>&nbsp;&nbsp;<select name='workHour3' id='workHour3'></select>&nbsp;&nbsp;:&nbsp;&nbsp;<select name='workMin3' id='workMin3'></select>&nbsp;&nbsp;~&nbsp;&nbsp;<select name='workHour4' id='workHour4'></select>&nbsp;&nbsp;:&nbsp;&nbsp;<select name='workMin4' id='workMin4'></select><input type='button' value='+' id='timeboxplus2'>");

            $(brbr).insertAfter(this);
            
              for(var i=0; 23>i; i++) {
                var optionHour1 = $('<option>').val(i+1).text(i+1);
                var optionHour2 = $('<option>').val(i+1).text(i+1);

                $('#workHour3').append(optionHour1);
                $('#workHour4').append(optionHour2);
              }
            
              for(var i=0; 12>i; i++) {

                var optionMin1= $('<option>').val(i*5).text(i*5);
                var optionMin2 = $('<option>').val(i*5).text(i*5);

                $('#workMin3').append(optionMin1);
                $('#workMin4').append(optionMin2);
              }
            
              
              $('#timeboxplus2').click(function(){
            	  
            	  var brbr = $('<div>');
            	  
            	  brbr.append('<br><label>근무시간3</label>&nbsp;&nbsp;&nbsp;<select name="workType3" id="workType3"><option value="1">근무</option><option value="2">외근</option><option value="3">반차</option></select>&nbsp;&nbsp;<select name="workHour5" id="workHour5"></select>&nbsp;&nbsp;:&nbsp;&nbsp;<select name="workMin5" id="workMin5"></select>&nbsp;&nbsp;~&nbsp;&nbsp;<select name="workHour6" id="workHour6"></select>&nbsp;&nbsp;:&nbsp;&nbsp;<select name="workMin6" id="workMin6"></select>');
            	  
            	  $(brbr).insertAfter(this);
            	  
            	  for(var i=0; 23>i; i++) {
            		  var optionHour1 = $('<option>').val(i+1).text(i+1);
            		  var optionHour2 = $('<option>').val(i+1).text(i+1);
            		  
            		  $('#workHour5').append(optionHour1);
            		  $('#workHour6').append(optionHour2);
            	  }
            	  
            	  for(var i=0; 12>i; i++) {
            		  
            		  var optionMin1= $('<option>').val(i*5).text(i*5);
            		  var optionMin2 = $('<option>').val(i*5).text(i*5);
            		  
            		  $('#workMin5').append(optionMin1);
            		  $('#workMin6').append(optionMin2);
            	  }
            	  
            	  $(this).remove();
            	  
              });
              
              
            $(this).remove();

          });
        
        
        

// ----------- div on click ----------- div on click ----------- div on click ----------- div on click -----------
        $('#box2-2>div, #box2-3>div').each(function(index,date){
          $(date).click(function(){
            
            // alert(weekarr[index]);

            var yymmdd = "";

            if((weekarr[index].getMonth()+1)<10){
              var yymmdd = weekarr[index].getFullYear() + "-0" + (weekarr[index].getMonth()+1);
            }else{
              var yymmdd = weekarr[index].getFullYear() + "-" + (weekarr[index].getMonth()+1);
            }

            if(weekarr[index].getDate()<10){
                yymmdd += "-0"+ weekarr[index].getDate();
            }else{
                yymmdd += "-"+ weekarr[index].getDate();
            }

            $('#select').val(yymmdd);

          });
        });


// ----------- 회원정보 가져와 보리 ----------- 회원정보 가져와 보리 ----------- 회원정보 가져와 보리 ----------- 회원정보 가져와 보리 -----------
        
        $.ajax({
        	url:"/Semi/empNoinfo.wf",
        	type:"get",
        	data:{
        		empNo:$('#empNo').val(),
        	},success:function(data){

        		$('#empInfo').text(data.deptName + " " + data.jobName + " " + data.empName + " 님");
        		
        	},error:function(){
        		alert("오류");
        	}
        });

// ----------- hover ----------- hover ----------- hover ----------- hover -----------
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
// ----------- hover ----------- hover ----------- hover ----------- hover -----------
    
        
        $('#savetime').click(function(){
        	
        	var save;
        	var workTime1;
        	var workTime2;
        	var workType1;
        	
        	var workTime3 = 'N';
        	var workTime4 = 'N';
        	var workType2 = 0;
        	
        	var workTime5 = 'N';
        	var workTime6 = 'N';
        	var workType3 = 0;
        	
    		if( isEmpty($('#select').val()) ){
    			alert("근무일자는 반드시 입력하셔야 합니다.");
    		}else{
    			save = confirm("저장이 진행됩니다. 진행합니까?");
    		}

        	if(save){
            	
            	var workHour1 = "";
            	var workMin1 = "";
            	
            	if($('#workHour1').val()<10){
            		workHour1 = "0" + $('#workHour1').val();
            	}else{
            		workHour1 = $('#workHour1').val();
            	}
            	
            	if($('#workMin1').val()<10){
            		workMin1 = "0" + $('#workMin1').val();
            	}else{
            		workMin1 = $('#workMin1').val();
            	}
            	// 결과물
            	
            	workTime1 = workHour1 + " : " + workMin1;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            	var workHour2 = "";
            	var workMin2 = "";
            	
            	if($('#workHour2').val()<10){
            		workHour2 = "0" + $('#workHour2').val();
            	}else{
            		workHour2 = $('#workHour2').val();
            	}
            	
            	if($('#workMin2').val()<10){
            		workMin2 = "0" + $('#workMin2').val();
            	}else{
            		workMin2 = $('#workMin2').val();
            	}
            	
            	// 결과물
            	var workTime2 = workHour2 + " : " + workMin2;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////        	
            	var workTime3 = 'N';
            	var workTime4 = 'N';
            	var workType2 = 0;
            	
            	if(isEmpty($('#workHour3').val())){
            		
            	}else{
            		workType2 = $('#workType2').val();
            		var workHour3 = "";
                	var workMin3 = "";
                	
                	if($('#workHour3').val()<10){
                		workHour3 = "0" + $('#workHour3').val();
                	}else{
                		workHour3 = $('#workHour3').val();
                	}
                	
                	if($('#workMin3').val()<10){
                		workMin3 = "0" + $('#workMin3').val();
                	}else{
                		workMin3 = $('#workMin3').val();
                	}
                	
                	// 결과물
                	var workTime3 = workHour3 + " : " + workMin3;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                	var workHour4 = "";
                	var workMin4 = "";
                	
                	if($('#workHour4').val()<10){
                		workHour4 = "0" + $('#workHour4').val();
                	}else{
                		workHour4 = $('#workHour4').val();
                	}
                	
                	if($('#workMin4').val()<10){
                		workMin4 = "0" + $('#workMin4').val();
                	}else{
                		workMin4 = $('#workMin4').val();
                	}
                	
                	// 결과물
                	var workTime4 = workHour4 + " : " + workMin4;
            	}
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            	var workTime5 = 'N';
            	var workTime6 = 'N';
            	var workType3 = 0;
            	
            	if(isEmpty($('#workHour5').val())){
            		
            	}else{
            		workType3 = $('#workType3').val();
            		var workHour5 = "";
                	var workMin5 = "";
                	
                	if($('#workHour5').val()<10){
                		workHour5 = "0" + $('#workHour5').val();
                	}else{
                		workHour5 = $('#workHour5').val();
                	}
                	
                	if($('#workMin5').val()<10){
                		workMin5 = "0" + $('#workMin5').val();
                	}else{
                		workMin5 = $('#workMin5').val();
                	}
                	
                	// 결과물
                	var workTime5 = workHour5 + " : " + workMin5;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                	var workHour6 = "";
                	var workMin6 = "";
                	
                	if($('#workHour6').val()<10){
                		workHour6 = "0" + $('#workHour6').val();
                	}else{
                		workHour6 = $('#workHour6').val();
                	}
                	
                	if($('#workMin6').val()<10){
                		workMin6 = "0" + $('#workMin6').val();
                	}else{
                		workMin6 = $('#workMin6').val();
                	}
                	
                	// 결과물
                	var workTime6 = workHour6 + " : " + workMin6;
            	}
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            	
            	$.ajax({
            		url:"/Semi/InsertTime.wh",
            		type:"get",
            		data:{
            			empNo:$('#empNo').val(),
            			selectDay:$('#select').val(),
            			workType1:$('#workType1').val(),
            			workType2:workType2,
            			workType3:workType3,
            			workTime1:workTime1,
            			workTime2:workTime2,
            			workTime3:workTime3,
            			workTime4:workTime4,
            			workTime5:workTime5,
            			workTime6:workTime6
            		},success:function(data){
            			
            			if(data > 0){
            				alert("입력이 완료되었습니다.");
            				
            				location.reload();
            				
            			}else{
            				alert("오류입니다. \n(*근태등록은 하루에 한번만 가능합니다. \n해당 날짜에 등록되어있는지 확인해주세요.)");
            			}
            			
            		},error:function(){
            			alert("오류");
            		}
            	});
            	
        	}else{
        		alert("취소되었습니다.");
        	}
        	
        });
    });



    function beforew(){
        
        for(var i =0; i<14; i++){
            var minus = weekarr[i].getTime()-(14*(24*60*60*1000));
            weekarr[i] = new Date(minus);
        }
        
//        $('#box2-2>div, #box2-3>div').each(function(index,date){
//            date.innerHTML = 
//                weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")";
//        });
        
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

//        $.ajax({
//        	url:"/Semi/openWindow.wh",
//        	type:"get",
//        	data:{
//        		empNo:$('#empNo').val(),
//        		firstDay:firstDay
//        	},success:function(data){
//        		var weekarr2 = new Array();
////        		console.log(data);
//
//        		for(var index = 0; index < data.length; index++){
//        				var datacall = data[index].workDate;
//        				weekarr2.push(datacall);
//        		}
//        		
//        		$('#box2-2>div, #box2-3>div').each(function(index,date){
//                    date.innerHTML = 
//                         weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")<br><br>&#xf0f7 ";
//        		
//                    var yymmdd = (weekarr[index].getMonth()+1) + "월 " + weekarr[index].getDate() + ", " + weekarr[index].getFullYear();
//        		
////                    console.log(weekarr2[index]);
////                    console.log(yymmdd);
//                    
//                    for(var i=0; weekarr2.length>i; i++){
//                    	
//                    	if(yymmdd==weekarr2[i]){
//                    		
//                    		date.innerHTML += data[i].workTime1 + " : " + data[i].workTime11;
//                    		
//                    	}
//                    	
//                    }
//
//        		});
//        		
//        	},error:function(){
//        		alert("오류");
//        	}
//        });
        
        $.ajax({
        	url:"/Semi/openWindow.wh",
        	type:"get",
        	data:{
        		empNo:$('#empNo').val(),
        		firstDay:firstDay
        	},success:function(data){
        	    var weekarr2 = new Array();
//        		console.log(data);

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
        		
//                    console.log(weekarr2[index]);
//                    console.log(yymmdd);
                    
                    for(var i=0; weekarr2.length>i; i++){
                    	
                    	if(yymmdd==weekarr2[i]){
                    		
                    		
                    		if(data[i].workType1==1){
                    			date.innerHTML += "&#xf0f7 ";
                    		}else if (data[i].workType1==2){
                    			date.innerHTML += "&#xe812 ";
                    		}else if (data[i].workType1==3){
                    			date.innerHTML += "&#xe810 ";
                    		}
                    		
                    		
                    		date.innerHTML += data[i].workTime1 + " : " + data[i].workTime11;
                    		
                    		check = false;
                    		
                    		if(data[i].workType2==0){
                    			date.innerHTML += "<br><br>&#xe80a";
                    		}else{
                    			
                    			if(data[i].workType2==1){
                        			date.innerHTML += "<br><br>&#xf0f7 ";
                        		}else if (data[i].workType2==2){
                        			date.innerHTML += "<br><br>&#xe812 ";
                        		}else if (data[i].workType2==3){
                        			date.innerHTML += "<br><br>&#xe810 ";
                        		}

                    			date.innerHTML += data[i].workTime2 + " : " + data[i].workTime21;
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

    function nextw(){

        for(var i =0; i<14; i++){
            var minus = weekarr[i].getTime()+(14*(24*60*60*1000));
            weekarr[i] = new Date(minus);
        }

//        $('#box2-2>div, #box2-3>div').each(function(index,date){
//            date.innerHTML = 
//                weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")";
//        });
        
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

//        $.ajax({
//        	url:"/Semi/openWindow.wh",
//        	type:"get",
//        	data:{
//        		empNo:$('#empNo').val(),
//        		firstDay:firstDay
//        	},success:function(data){
//        		var weekarr2 = new Array();
////        		console.log(data);
//
//        		for(var index = 0; index < data.length; index++){
//        				var datacall = data[index].workDate;
//        				weekarr2.push(datacall);
//        		}
//        		
//        		$('#box2-2>div, #box2-3>div').each(function(index,date){
//                    date.innerHTML = 
//                         weekarr[index].getDate() + " (" + week[weekarr[index].getDay()] + ")<br><br>&#xf0f7 ";
//        		
//                    var yymmdd = (weekarr[index].getMonth()+1) + "월 " + weekarr[index].getDate() + ", " + weekarr[index].getFullYear();
//        		
////                    console.log(weekarr2[index]);
////                    console.log(yymmdd);
//                    
//                    for(var i=0; weekarr2.length>i; i++){
//                    	
//                    	if(yymmdd==weekarr2[i]){
//                    		
//                    		date.innerHTML += data[i].workTime1 + " : " + data[i].workTime11;
//                    		
//                    	}
//                    	
//                    }
//
//        		});
//        		
//        	},error:function(){
//        		alert("오류");
//        	}
//        });
        
        $.ajax({
        	url:"/Semi/openWindow.wh",
        	type:"get",
        	data:{
        		empNo:$('#empNo').val(),
        		firstDay:firstDay
        	},success:function(data){
        	    var weekarr2 = new Array();
//        		console.log(data);
        	    
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
        		
//                    console.log(weekarr2[index]);
//                    console.log(yymmdd);
                    
                    for(var i=0; weekarr2.length>i; i++){
                    	
                    	if(yymmdd==weekarr2[i]){
                    		
                    		
                    		if(data[i].workType1==1){
                    			date.innerHTML += "&#xf0f7 ";
                    		}else if (data[i].workType1==2){
                    			date.innerHTML += "&#xe812 ";
                    		}else if (data[i].workType1==3){
                    			date.innerHTML += "&#xe810 ";
                    		}
                    		
                    		
                    		date.innerHTML += data[i].workTime1 + " : " + data[i].workTime11;
                    		
                    		check = false;
                    		
                    		if(data[i].workType2==0){
                    			date.innerHTML += "<br><br>&#xe80a";
                    		}else{
                    			
                    			if(data[i].workType2==1){
                        			date.innerHTML += "<br><br>&#xf0f7 ";
                        		}else if (data[i].workType2==2){
                        			date.innerHTML += "<br><br>&#xe812 ";
                        		}else if (data[i].workType2==3){
                        			date.innerHTML += "<br><br>&#xe810 ";
                        		}

                    			date.innerHTML += data[i].workTime2 + " : " + data[i].workTime21;
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
    
    

    
    
    
    
    
    
    
    
    
    
    
    