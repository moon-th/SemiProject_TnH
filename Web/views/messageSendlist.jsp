<%@page import="com.message.MessageService.MessageService"%>
<%@page import="com.member.service.MemberService"%>
<%@page import="com.member.model.vo.Member"%>
<%@page import="com.message.model.vo.Message"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%
      int no = Integer.parseInt(request.getParameter("my_emp_no"));
  ArrayList<Message> msglist = (ArrayList<Message>)request.getAttribute("msglist");
      ArrayList<Member> mlist = new MemberService().allEmployee();
      for(int i=0;i<mlist.size();i++){
      System.out.println(mlist.get(i).getEmpName());
      }
      for(int i=0;i<msglist.size();i++){
    	  System.out.println(msglist.get(i));
      }
      ArrayList<Message> leftmsglist= new MessageService().allmsglist(no);
  %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>메신저임</title>
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
  <link rel="stylesheet" href="https://code.getmdl.io/1.0.6/material.grey-pink.min.css" />
  <link rel="stylesheet" href="views/css/styles.css" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
  <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="views/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="views/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body>
  <div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
    <div class="mdl-layout__drawer">
      <span class="mdl-layout-title" style="font-size: 20pt;"> <a href=msglist.do?my_emp_no=<%=no %>>받은 메세지함</a></span>
      <span class="mdl-layout-title" style="font-size: 20pt;"> <a href=sendmsglist.do?my_emp_no=<%=no %>>보낸 메세지함</a></span>
      <nav class="mdl-navigation">


        <ul class="demo-list-two mdl-list">
        <%for(int i=0;i<mlist.size();i++) {
     	   int nonread=0;
     		   for(int j=0;j<leftmsglist.size();j++){
				if(leftmsglist.get(j).getReaded()==0 && leftmsglist.get(j).getSend_emp_no()==mlist.get(i).getEmpNo())
				{
					nonread++;
				}
        	}if(mlist.get(i).getEmpNo()==0 || mlist.get(i).getEmpNo()==no){
          		
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
            <form id=filter action="FilterName.do">
          <input id=send_emp_no type=hidden value="" name=send_emp_no>
		  <input id=my_emp_no type=hidden value="" name="my_emp_no">
			</form>

<form id=deletefrm action="deletesendmessage.do">
  <input type=hidden id="deleteinput" value="" name=deletelist>
  <input type=hidden value=<%=no %> name="my_emp_no">
  </form>
 <script>

	function filterling(no){
		document.getElementById("send_emp_no").value=no;
		document.getElementById("my_emp_no").value=<%=no%>;
		document.getElementById("filter").submit();
		
	}
    </script>

<!-- 아 이거 수정했음 아무튼수정함 -->
      </nav>
    </div>
    <main class="mdl-layout__content">
      <div class="container-fluid">

        <!-- Page Heading -->
        <br>
        <h1 class="h3 mb-2 text-gray-800">보낸 메세지 함</h1>
        <p class="mb-4"> </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">총 <b>"<%=msglist.size() %>"</b>개의 메세지가 있습니다.</h6>
            <br>
            <div style="text-align: left;">
              <a href="views/SendMessage.jsp?my_emp_no=<%=request.getParameter("my_emp_no")%>">  
              <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                    새 메세지 쓰기
                  </button>
                  </a>
                  
                   <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="background:#fd000c" onclick="deletearray();">
                    	선택항목 삭제
                  </button>
                  
            </div>
          </div>
          <div class="card-body">
            <div class="table-responsive">
				<table class="table table-bordered mdl-js-data-table mdl-data-table--selectable" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>받는 이</th>
                    <th>직급</th>
                    <th>부서</th>
                    <th>제목</th>
                    <th>보낸날짜</th>
                    <th>수신 여부</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>받는 이</th>
                    <th>직급</th>
                    <th>부서</th>
                    <th>제목</th>
                    <th>보낸날짜</th>
                    <th>수신 여부</th>
                    <th>전체 선택</th>
                  </tr>
                </tfoot>

                <tbody id='tablebody'>

                                                  </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

  </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  

  <script>
	var datalist = new Array();
     var str="";
     <% for(int i=0;i<msglist.size();i++){%>
     <%
     	  Message m = msglist.get(i);%>
    	  str+="<tr role='row'>" + "<td>" + "<%=m.getSend_emp_name()%>" + "</td>";
    	  str+="<td>"+"<%=m.getSend_job_name()%>" + "</td>";
    	  str+="<td>"+"<%=m.getSend_dept_name()%>" + "</td>";
    	  
    	  str+="<td>"+"<a href=sendmsgRead.do?MessageId=<%=m.getMessage_Id()%>&my_emp_no=<%=request.getParameter("my_emp_no")%>><%=m.getSend_title()%>"+"</a></td>";
    	  
    	  str+="<td>"+"<%=m.getSend_date()%>" + "</td>";
    	  
    	 <% if(m.getReaded()!=0){%>
    	  str+="<td>읽음</td>";
    	  <%}else{%>
    		 str+="<td>읽지 않음</td>";
    	  <%}%>
    	  str+="<input type=hidden value='<%=m.getMessage_Id()%>'></tr>";
      <%
     }
      %>
      str+="</tr>";

      document.getElementById('tablebody').innerHTML += str;


    
    
    
    function deletearray(){
  	  var deletelist = new Array();
  	  
  	var selected = document.getElementsByClassName("is-selected");
  	
  	  for(var i=0;i<selected.length;i++){
  		  deletelist.push(selected[i].children[7].value);
  	  }
  	  document.getElementById("deleteinput").value=deletelist;
  	  
  	  console.log(deletelist);
  	  if(deletelist[0]==null){
  		  alert("삭제할 메세지를 선택해주세요");
  	  }else{
  		  
  		  alert(deletelist.length+"개 메세지가 삭제되었습니다.");
  	  document.getElementById("deletefrm").submit();
  	  }
    }
    </script>



  <script src="views/vendor/jquery/jquery.min.js"></script>
  <script src="views/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!-- Core plugin JavaScript-->
  <script src="views/vendor/jquery-easing/jquery.easing.min.js"></script>
  
  <!-- Custom scripts for all pages-->
  <script src="views/js/sb-admin-2.min.js"></script>
  
  <!-- Page level plugins -->
  <script src="views/vendor/datatables/jquery.dataTables.min.js">  </script> <!--테이블 페이징-->
  <script src="views/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  
  <!-- Page level custom scripts -->
  <script src="views/js/demo/datatables-demo.js"></script>

 
</body>
</html>