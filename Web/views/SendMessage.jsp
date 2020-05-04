<%@page import="com.message.model.vo.Message"%>
<%@page import="com.message.MessageService.MessageService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.model.vo.Member"%>
<%@page import="com.member.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%

int no = Integer.parseInt(request.getParameter("my_emp_no"));
Member m = new MemberService().adminMemberDetail(no);
System.out.println(m.toString());

ArrayList<Member> mlist = new MemberService().allEmployee();
ArrayList<Message> msglist = new MessageService().allmsglist(no);

%>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>메신저임</title>
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
  <link rel="stylesheet" href="https://code.getmdl.io/1.0.6/material.grey-pink.min.css" />
  <link rel="stylesheet" href="css/styles.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
  <!-- <link type="text/css" rel="stylesheet" href="../jquery-te-1.4.0.css"> -->
  <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
  <!-- <link type="text/css" rel="stylesheet" href="demo.css"> -->
  <link type="text/css" rel="stylesheet" href="jquery-te-1.4.0.css">

  <script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="jquery-te-1.4.0.min.js" charset="utf-8"></script>
</head>

<body class="a">
  <div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
    <div class="mdl-layout__drawer">
     <span class="mdl-layout-title" style="font-size: 20pt;"> <a href=../msglist.do?my_emp_no=<%=no %>>받은 메세지함</a></span>
      <span class="mdl-layout-title" style="font-size: 20pt;"> <a href=../sendmsglist.do?my_emp_no=<%=no %>>보낸 메세지함</a></span>
      
      <nav class="mdl-navigation">
 <ul class="demo-list-two mdl-list">
        <%for(int i=0;i<mlist.size();i++) {
     	   int nonread=0;
     		   for(int j=0;j<msglist.size();j++){
				if(msglist.get(j).getReaded()==0 && msglist.get(j).getSend_emp_no()==mlist.get(i).getEmpNo())
				{
					nonread++;
				}
        	}
     		  if(mlist.get(i).getEmpNo()==0 || mlist.get(i).getEmpNo()==no){
     	      		
         	   }else{
        	%>
          <li class="mdl-list__item mdl-list__item--two-line mdl-navigation__link" style="cursor: pointer;" onclick="filterling(<%=mlist.get(i).getEmpNo() %>);">
            <span class="mdl-list__item-primary-content ">
              <i class="material-icons mdl-list__item-avatar">person</i>
              <span><%=mlist.get(i).getEmpName() %></span>
              <span class="mdl-list__item-sub-title" style="font-size: 6px;"><%=nonread %>개의 읽지않은 메세지</span>
            </span>
            <span class="mdl-list__item-secondary-content">
              <span class="mdl-list__item-secondary-info"><%=mlist.get(i).getJobName() %></span>
            </span>
          </li>
		<%} }%>
          </ul>
           <form id=filter action="../FilterName.do">
          <input id=send_emp_no type=hidden value="" name=send_emp_no>
		  <input id=my_emp_no type=hidden value="" name="my_emp_no">
			</form>
			
			<script>
			function filterling(no){
				document.getElementById("send_emp_no").value=no;
				document.getElementById("my_emp_no").value=<%=no%>;
				document.getElementById("filter").submit();
				
			}
			</script>

      </nav>
    </div>
    <main class="mdl-layout__content">
      <div class="container-fluid">

        <!-- Page Heading -->
        <br>
        <h1 class="h3 mb-2 text-gray-800">매세지 보내기</h1>
        <p class="mb-4"> </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
          </div>
          
          <div class="card-body">
              <label> 보내는이 : </label>
              <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable" id="">
                  <div class="mdl-textfield">
                    <input type="text"  class="mdl-textfield__input" id="" readonly>
                    <label class="mdl-textfield__label" for="sample-expandable"> <%=m.getEmpName() %> <%=m.getJobName() %></label>
                  </div>
                </div>
          <br>
            <label id=findreceiveone> 받는 이 찾기: </label>
              <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable" id="searchicon" >
                  <label class="mdl-button mdl-js-button mdl-button--icon" for="sample6">
                    <i class="material-icons">search</i>
                  </label>
                  <div class="mdl-textfield__expandable-holder">
                   
                    <input type="text" list="mylist"  class="mdl-textfield__input" id="sample6">
                    
                    <datalist id="mylist">
                    <%for(int i = 0;i<mlist.size();i++) {
                    %>
                        <option id="<%=mlist.get(i).getEmpNo() %>" value="<%=mlist.get(i).getDeptName()%> <%=mlist.get(i).getEmpName()%>"> <%=mlist.get(i).getJobName() %> </option>
                      	
                        <%
                        
                    }
                        %>
                    </datalist> 

                    <script>
                    var sendlist = new Array(); //받는이 이름목록
                    var sendnolist = new Array(); //받는이 번호목록
                    
                    <%for(int i=0;i<mlist.size();i++){%>
                    sendlist.push('<%=mlist.get(i).getDeptName()%> <%=mlist.get(i).getEmpName()%>');
                    sendnolist.push('<%=mlist.get(i).getEmpNo()%>');
                    
                    
                    <%}%>
                   
                    </script>
                    
                    <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
                  </div>
                      <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" onclick="addlist();">
                          <i class="material-icons">add</i>
                        </button>
                </div>
                <br>
                <label> 받는 이: </label>
                <div id="sendlist">

                </div>
                <label> 제목 : </label> 
                 <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label"
                 style = "position: relative;
                 font-size: 16px;
                 display: inline-block;
                 box-sizing: border-box;
                 width: 600px;
                 max-width: 100%;
                 margin: 0;
                 padding: 20px 0;"
                 id="sendlist">
                  <input class="mdl-textfield__input" type="text" id="sample3">
                  <label class="mdl-textfield__label" for="sample3"></label>
                </div>
            </select>

            <script>

              var SendListIndex = 0;
              var receivelist = new Array(); //받은 목록
              var receivelist2 = new Array(); //받을 사원번호 목록
              
           
           function findno(){
            	  for(var i=0;i<sendlist.length;i++){
            		  for(var j=0;j<receivelist;j++){
	            		  if(sendlist[i]==receivelist[j]){ console.log(sendlist[i]); break;}            		  
            		  }
            	  }
              }
              
          function addlist() {

              if(sendlist.indexOf(document.getElementById('sample6').value) != -1){//목록에 이름이 있으면
              document.getElementById('sendlist').innerHTML += '<span class="mdl-chip mdl-chip--deletable" id = SLI'+ SendListIndex +'>'
                + '<span class="mdl-chip__text">'+document.getElementById('sample6').value+'</span>'
                + '<button type="button" class="mdl-chip__action" onclick="DeleteSendlist('+SendListIndex+');"><i class="material-icons">cancel</i></button>'
                + '</span>';
                SendListIndex++;
                receivelist.push(document.getElementById('sample6').value) ; //목록에 이름을 추가
                receivelist2.push(sendnolist[sendlist.indexOf(document.getElementById('sample6').value)]); //??? 슈발어케한거지
                console.log("받는사원 : "+receivelist);
                console.log("받는 사원번호 : " + receivelist2);
                
              }else if(document.getElementById('sample6').value==""){
            	  alert("사원 정보를 입력후 +버튼을 눌러주세요.")
              }else{
                alert('해당 사원은 존재하지 않습니다!');
              }
                document.getElementById('sample6').value = '';
            }

            function DeleteSendlist(index){ //지우기
              document.getElementById("SLI"+index).remove();
            	receivelist.splice(index,1);
            	receivelist2.splice(index,1); //배열 리무브 하자!
                console.log("받는사원 : "+receivelist);
                console.log("받는 사원번호 : " + receivelist2);
            }
            </script>

            <div class="table-responsive  mdl-textfield--align-right">
              <!-- Right aligned menu below button -->
              <button id="demo-menu-lower-right" class="mdl-button mdl-js-button mdl-button--icon ">
                <i class="material-icons">more_vert</i>
              </button>

          
            </div>
            <!--텍스트 에디터-->
        

	<!------------------------------------------------------------ jQUERY TEXT EDITOR ------------------------------------------------------------>

	<textarea name="textarea"
		class="jqte-test" id="jqte-test"></textarea>



	<script>
		$('.jqte-test').jqte();

		// settings of status
		var jqteStatus = true;
		$(".status").click(function () {
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({ "status": jqteStatus })
			
		});
	</script>

	<!------------------------------------------------------------ jQUERY TEXT EDITOR ------------------------------------------------------------>

	<hr>
  <div style="text-align: center;">
    
  	<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" onclick="send();">
      	전송하기
    </button>
    <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
        취소
      </button>
  </div>
		<div class="footer">
	
	<form id=sendfrm action="<%=request.getContextPath() %>/msgSend.do" method=post>
	
		<input type=hidden id=sendno name=sendno>
		<input type=hidden id=sendname name=sendname>
		<input type=hidden id=senddeptname name=senddeptname>
		<input type=hidden id=sendjobname name=sendjobname>
		<input type=hidden id=title name=title>
        <input type=hidden id=content name=content>
        <input type=hidden id=receivelist name=receivelist>
        <input type=hidden id=receivenum name=receivenum>
         
        </form>
        
	</div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

  </div>
  </div>

  
  <!-- Bootstrap core JavaScript-->
  <script>

    function test1(){ //보내기전 테스트
 
    }

    function send(){ //최종보내기
    	
    	
    	if(receivelist2.length==0){
    		alert("받는사람을 입력하지 않았습니다!");
    		document.getElementById("findreceiveone").style="border :2px solid red;";
    		
    	}else{
        var str ="";
        
       str += document.getElementsByClassName("jqte_editor")[0].innerHTML; //content 변수
       
       document.getElementById("sendno").value = <%=no%>;
       document.getElementById("title").value = document.getElementById('sample3').value;
       document.getElementById("content").value = str;
       document.getElementById("receivelist").value = receivelist;
       document.getElementById("receivenum").value = receivelist2;
       document.getElementById("sendname").value = '<%=m.getEmpName()%>';
       document.getElementById("senddeptname").value = '<%=m.getDeptName()%>';
       document.getElementById("sendjobname").value = '<%=m.getJobName()%>';
       document.getElementById("sendfrm").submit();
    	}
       
    }
    
 
      


    

  </script>


  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->

  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>
  
</body>

</html>