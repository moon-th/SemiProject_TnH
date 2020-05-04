// <!------------------------------------ 스크립트 ------------------------------------>
	    $(function(){
	    	
	    	
// <!------------------------------------ 검색 재설정 메소드 ------------------------------------>	
	    	
//    	$('#reset').click(function(){
//			location.href='/Semi/MemberList.ap';
//		})
		
		$('#close').click(function(){
			window.close();
		})
	    	
// <!------------------------------------ 검색 재설정 메소드 ------------------------------------>	
	    	
// <!------------------------------------ 검색 메소드 ------------------------------------>			
			
//	    	$('#searchEmp').click(function(){
//				location.href='/Semi/SearchList.ap';
//			})
	    	
	    	
	    	
			$('#searchEmp').click(function(){
				$.ajax({
					url:"/Semi/SearchList.ap",
					type:"get",
					data:{
						empName:$('#searchValue').val()
					},success:function(data){
						
						$('#tree').children().remove();
						
						var index = 0; 
						
						console.log(data);
						console.log(data.list);
						console.log(data.deptList);
						
						
						for(var str in data.deptList) {
							
							var $li = $('<li>');
							var $ul = $('<ul>');

							var idfor = "a" + index;
						
							$li.append('<input type=' + 'checkbox' + ' id=' + idfor + '>');
							$li.append('<label for=' + idfor + '>' + data.deptList[str] + '</label>');

							for(var emp in data.list) {
								
								var $li2 = $('<li>');
								
								if(data.list[emp].deptName==data.deptList[str]){
									$li2.text(data.list[emp].jobName + " " + data.list[emp].empName);
									$li2.append('<input type=' + 'hidden' + ' id=' + data.list[emp].empNo + ' value=' + data.list[emp].empNo + '>');
											
									$ul.append($li2);
								};	
								
							};
							$li.append($ul);
							$('#tree').append($li);
							++index;
						};
						
						
// <!------------------------------------ 불러온 사원목록 추가하는 기능 ------------------------------------>
						
						$('#tree>li>ul>li').click(function(){
				            
				            var DPT = $(this).parent().siblings('label').text();
				            var add = $(this).text();
				            
				            
				            var menu = $('#menu').text() + $('#refer').text();
				            var refer = $('#refer').text();
				            
				            
							var empNo = $(this).children().val();
				            
				            var name = DPT + ' ' + add;
				
				            if(menu.indexOf(name)==-1){
				
				                if($('#approval1').prop('checked')){
				                	
				                    $('#app_checklist').append("<li><input type='radio' name='updown'>" + name + "<input type='hidden' id='a"+ empNo +"' value='"+ empNo +"'></li>");
				                    
				                }else if($('#approval2').prop('checked')){
				                	
				                	if($('#app_Approver>li').length <= 0){
				                    	$('#app_Approver').append("<li><input type='radio' name='updown'>" + name + "<input type='hidden' id='a"+ empNo +"' value='"+ empNo +"'></li>");
				                	}else {
				                		alert('승인할 수 있는 인원은 1명입니다.');
				                	}
				                	
				                }else if($('#approval3').prop('checked')){
				                	
				                    $('#app_referlist').append("<li><input type='radio' name='updown'>" + name + "<input type='hidden' id='a"+ empNo +"' value='"+ empNo +"'></li>");
				                    
				                }
				            };
				        });
// <!------------------------------------ 불러온 사원목록 추가하는 기능 ------------------------------------>			
					},error:function(){
						console.log('에러입니다.');
					}
				});
			});
			
	//<!------------------------------------ 검색 메소드 ------------------------------------>   
	    	
	    	
	    	
// <!------------------------------------ 불러온 사원목록 추가하는 기능 ------------------------------------>
	        $('#tree>li>ul>li').click(function(){
	            
	            var DPT = $(this).parent().siblings('label').text();
	            var add = $(this).text();
	            
	            
	            var menu = $('#menu').text() + $('#refer').text();
	            var refer = $('#refer').text();
	            
	            
				var empNo = $(this).children().val();
	            
	            var name = DPT + ' ' + add;
	
	            if(menu.indexOf(name)==-1){
	
	                if($('#approval1').prop('checked')){
	                	
	                    $('#app_checklist').append("<li><input type='radio' name='updown'>" + name + "<input type='hidden' id='a"+ empNo +"' value='"+ empNo +"'></li>");
	                    
	                }else if($('#approval2').prop('checked')){
	                	
	                	if($('#app_Approver>li').length <= 0){
	                    	$('#app_Approver').append("<li><input type='radio' name='updown'>" + name + "<input type='hidden' id='a"+ empNo +"' value='"+ empNo +"'></li>");
	                	}else {
	                		alert('승인할 수 있는 인원은 1명입니다.');
	                	}
	                	
	                }else if($('#approval3').prop('checked')){
	                	
	                    $('#app_referlist').append("<li><input type='radio' name='updown'>" + name + "<input type='hidden' id='a"+ empNo +"' value='"+ empNo +"'></li>");
	                    
	                }
	            };
	        });
// <!------------------------------------ 불러온 사원목록 추가하는 기능 ------------------------------------>
// <!------------------------------------ list를 위 아래로 자리 바꿔주는 메소드 ------------------------------------>

			$('#checklistbtn_up').click(function(){
				
				$('#app_checklist>li').children(':even').each(function(){
					
					if($(this).prop('checked')){
                        
						$(this).parent().prev().insertAfter($(this).parent());
						
                    }
                    
           		});
			});
			
			$('#checklistbtn_down').click(function(){
				
				$('#app_checklist>li').children(':even').each(function(){
					
					if($(this).prop('checked')){
                        
						$(this).parent().next().insertBefore($(this).parent());
						
                    }
                    
           		});
			});
			
			$('#checklistbtn_del').click(function(){
				
				$('#app_checklist>li, #app_Approver>li').children(':even').each(function(){
					
					if($(this).prop('checked')){
                        
						$(this).parent().remove();
						
                    }
                    
           		});
			});
			
// <!------------------------------------ list를 위 아래로 자리 바꿔주는 메소드 ------------------------------------>
			$('#referlistbtn_up').click(function(){
				
				$('#app_referlist>li').children(':even').each(function(){
					
					if($(this).prop('checked')){
                        
						$(this).parent().prev().insertAfter($(this).parent());
						
                    }
                    
           		});
			});
			
			$('#referlistbtn_down').click(function(){
				
				$('#app_referlist>li').children(':even').each(function(){
					
					if($(this).prop('checked')){
                        
						$(this).parent().next().insertBefore($(this).parent());
						
                    }
                    
           		});
			});
			
			$('#referlistbtn_del').click(function(){
				
				$('#app_referlist>li').children(':even').each(function(){
					
					if($(this).prop('checked')){
                        
						$(this).parent().remove();
						
                    }
                    
           		});
			});
// <!------------------------------------ list를 위 아래로 자리 바꿔주는 메소드 ------------------------------------>

// <!------------------------------------ para로 튕길 hidden 값 뿌리는 메소드 ------------------------------------>
			
			
			
			$('#submit_btn').click(function(){
				
				var str1 = "";
				var str2 = "";
				var str3 = "";
				
				$('#app_checklist>li').children(':odd').each(function(){
					
					str1 += $(this).val() + " ";
			        
				});
				
				
				
				$('#app_Approver>li').children(':odd').each(function(){
					
					str2 += $(this).val() + " ";
			        
				});
				
				$('#app_referlist>li').children(':odd').each(function(){
					
					str3 += $(this).val() + " ";
			        
				});
								
// <!------------------------------------ ajax로 값 불러와서 뿌리기. ------------------------------------>
				
				$('#checklist_value', opener.document).val(str1);
				$('#approvallist_value', opener.document).val(str2);
				$('#reflist_value', opener.document).val(str3);
				
				$.ajax({
					url:"/Semi/goConfirm.ap",
					type:"post",
					data:{
						checklist_value:str1,
						approvallist_value:str2,
						reflist_value:str3
					},success:function(data){
						
						$.each(data.checklistArr,function(index, value){
							
							var $tr = $('<tr>');
							var $td = $('<td>');
							var $deptName = $('<td>').text(value.deptName);
							var empjobName = value.jobName + " " + value.empName;
							var $empjobName = $('<td>').text(empjobName);
							
							if(index==0){
								$('#list1', opener.document).children().remove();
								$('#list1', opener.document).append($td.text("검토"));
								$('#list1', opener.document).append($deptName);
								$('#list1', opener.document).append($empjobName);
								$('#list1', opener.document).css("background-color","#efefef");
							}else{
								$tr.append($td);
								$tr.append($deptName);
								$tr.append($empjobName);					
								
								$tr.insertAfter($('#list1', opener.document))	
							}
						});
						
						$.each(data.referlistArr,function(index, value){
							var $tr = $('<tr>');
							var $td = $('<td>');
							var $deptName = $('<td>').text(value.deptName);
							
							var empjobName = value.jobName + " " + value.empName;
							var $empjobName = $('<td>').text(empjobName);

							if(index==0){
								$('#list2', opener.document).children().remove();
								$('#list2', opener.document).append($td.text("협조"));
								$('#list2', opener.document).append($deptName);
								$('#list2', opener.document).append($empjobName);
								$('#list2', opener.document).css("background-color","#efefef");
							}else{
								$tr.append($td);
								$tr.append($deptName);
								$tr.append($empjobName);					
								
								$tr.insertAfter($('#list2', opener.document))	
							}
							
						});
						
						$.each(data.approverArr,function(index, value){
							var $tr = $('<tr>');
							var $th = $('<th>').text("승인");
							var $deptName = $('<th>').text(value.deptName);
							
							var empjobName = value.jobName + " " + value.empName;
							var $empjobName = $('<th>').text(empjobName);

							$tr.append($th);
							$tr.append($deptName);
							$tr.append($empjobName);					
							
							$('#list3', opener.document).children().remove();
							$('#list3', opener.document).append($tr);
							
						});
						
						window.close();
						
					},error:function(){
						alert("에러입니다.");
					}
				});
// <!------------------------------------ ajax로 값 불러와서 뿌리기. ------------------------------------>
				
			});
// <!------------------------------------ para로 튕길 hidden 값 뿌리는 메소드 ------------------------------------>

			
// <!------------------------------------ 전체 삭제 메소드 ------------------------------------>
			$('#checkAlllistbtn_del').click(function(){
				
				$('#app_checklist>li, #app_Approver>li').each(function(){

					$(this).remove();

           		});
			});
			
			
			
			$('#referAlllistbtn_del').click(function(){
				
				$('#app_referlist>li').each(function(){
					
					$(this).remove();
					
           		});
			});
			

// <!------------------------------------ 전체 삭제 메소드 ------------------------------------>

// <!------------------------------------ 검색 전 사원 이름 중복 확 메소드 ------------------------------------>	
			$('#searchValue').keyup(function(){
	            $.ajax({
	            	url:"/Semi/searchAp.ap",
	            	type:"post",
	            	data:{
	            		empName:$('#searchValue').val()
	            	},success:function(count){
	            		
	            		if(count=='0'){
		            		var str = "검색 결과 : " + count + "건 검색";
	            		}else{
	            			var str = "검색 결과 : " + count + "건 검색 (검색버튼을 눌러주세요)";
	            		}

	            		$('#searchTempresult').text(str);
	            		
	            		if($('#searchValue').val()==""){
	            			$('#searchTempresult').text('');
	            		}
	            		
	            	},error:function(){
	            		console.log("Error 입니다.");
	            	}
	            });
	        });
// <!------------------------------------ 검색 전 사원 이름 중복 확 메소드 ------------------------------------>	
			 

	    });

// <!------------------------------------ 스크립트 ------------------------------------>
	    
	    
	    
	    
 
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    