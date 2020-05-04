<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> 
<script type="text/javascript">
   
/*    var lastId = 'ten';
   
   function submitfunction(){
      var chatName = $('#chatName').val();
      var chatContent = $('#chatContent').val();
      
      $.ajax({
            type:"POST",
            url : "/Semi/ChatSubmitServlet",
            data : {
               chatName: chatName,
               chatContent: chatContent
               },
            success: function(result){
               if(result==1){
                  autoClosingAlert('#successMessage',2000);
                  
               }else if(result ==0){
                  autoClosingAlert('#dangerMessage',2000);
               }else{
                  autoClosingAlert('#warningMessage',2000);
               }
            }
         });
               $('#chatContent').val('');
         }
      function autoClosingAlert(selector , delay){
         var alert = $(selector).alert();
         alert.show();
         window.setTimeout(function() {alert.hide()}, delay);
         
      }
      
      
      var i=0;
      
      
      function chatListFunction(type){
       
       $.ajax({
            type:"POST",
            url : "/Semi/ChatListServlet",
            data : {
                  listType : type,
            },
            success  : function(data){
               if(data == "") return;
               var parsed = JSON.parse(data);
               var result = parsed.result;
               
           		console.log(result);
               
               for(  i; i< result.length; i++){
           // 	   var j =0;
                   addChat(result[i][0].value, result[i][1].value, result[i][2].value);
                 //  j++;
        //           if(j>=result.length)break;
                  
               }         
               lastId = Number(parsed.last);
            }
         });
       
      } */
      function addChat(chatName,chatContent,chatTime){
    	  
         $('#chatList').append('<div class="row"'+
                          '</div class="col-lg-12">' + 
                          '<div class="media">' +
                          '<a class="pull-left" href="#">'+
                          '<img class="media-object img-circle" chatListFunctionchatListFunctionchatListFunctionsrc="images/icon.png" alt="">'+
                          '</a>' + 
                          '<div class="media-body">'+
                          '<h4 class="media-heading">'+
                          chatName+
                          '<span class="small pull-right">'+
                          chatTime+
                          '</span>'+
                          '</h4>'+
                          '<p>'+
                          chatContent+
                          '</p>'+
                          '</div>'+
                          '</div>'+
                          '</div>'+
                          '</div>'+
                          '<hr>')      
                  $('#chatList').scrollTop($('#chatList')[0].scrollHeight);
         
            }
            function getInfiniteChat(){
               setInterval(function(){
               chatListFunction(lastId);   
            },1000);
      }
               
</script>

</head>

<body>
<div class="container">
 <div class="container bootstrap snippet">
      <div class=row >
         <div class="col-xs-12" style="width: 530px;">
            <div class="portlet portlet-default" style="position: relative;left: -30px;     top: 3px;;">
               <div class="portlet-heading">
                  <div class="portlet-title">
                     <h4><i class="fa fa-circle text-green"></i>실시간 채팅</h4>
                  </div>
                  <div class="clearfix"></div>
               </div>
               <div id="chat" class="panel-collapse collapse in">
                  <div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto;height: 700px;">
                  </div>
                    <div class="portlet-footer">
                      <div class="row">
                         <div class="form-group col-xs-4">
                         </div>
                      </div>
                      <div class="row" style="height: 90px">
                         <div class="form-group col-xs-10">
                         내용
                             <textarea style="height: 80px;" id="chatContent" class="form-control"  placeholder="메세지를 입력하세요" maxlength="100" ></textarea>
                         </div>
                         <div class="form-group col-xs-2">
                              <button type="button" class="btn btn-default pull-right" onclick="submitfunction();">전송</button>
                              <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>      
               </div>
            </div>
         </div>
      </div>
   </div>
 
   <div class="alert alert-success" id="dangerMessage" style="display: none;"> 
      <strong> 이름과 내용을 모두 입력해 주세요</strong>
   </div>
   <div class="alert alert-success" id="warningMessage" style="display: none;"> 
      <strong>데이터베이스 오류가 발생했습니다. </strong>
   </div>
   </div>
   </body>
   <script type="text/javascript">
   $(document).ready(function(){
      chatListFunction('ten');
      getInfiniteChat();
      
   });
   
   </script>
</html>