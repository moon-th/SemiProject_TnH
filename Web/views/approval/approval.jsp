<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.member.model.vo.*, java.util.*"%>

<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	ArrayList<String> deptList = (ArrayList<String>)request.getAttribute("deptList");
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/approval.js"></script>
	
	<!-- 트리 CSS 시작 -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/approval_tree.css">
	<!-- 폰텔로 -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/src/tree_fontello/css/fontello.css">
	<!-- 트리 CSS 끝 -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/approval_box.css">
    
    <!-- 버튼 CSS 시작 -->
    
    <!-- Material Design Lite -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- 버튼 CSS 끝 -->

<title>결재선 지정</title>

</head>

<body style="width: 100%; height: 100%; background-color:whitesmoke;">

    <table style="border-style : double; border-color: grey; margin-left: 2%;
    margin-top: 2%;">

<!------------------------------------ 결재자 지정 ------------------------------------>
        <tr>
            <td rowspan="3">
            
                <div id='box1'>
                
                    <ul class="tree" id="tree">
                        <% 
                        	int index = 0; 
							for(String str : deptList) { 
							String idfor = "a" + Integer.toString(index);
						%>
                        <li>
                        	<input type="checkbox" id="<%= idfor %>">
                        	<label for="<%= idfor %>"><%= str %></label>
                        	
                        	<ul>
	                        	<% for(int i=0; i<list.size(); i++){ %>
	                        		<% if(list.get(i).getDeptName().equals(str)) { %>
	                        		<li><%= list.get(i).getJobName() + " " + list.get(i).getEmpName() %>
	                        			<input type='hidden' id='<%= list.get(i).getEmpNo() %>' value='<%= list.get(i).getEmpNo() %>'>
	                        		</li>
									<% } %>
	                        	<% } %>
                        	</ul>
                        </li>
                        <% ++index; %>
                        <% } %>	       
                    </ul>

                </div>

                <div id='box1-1'>

<!--                     <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                        <label class="mdl-button mdl-js-button mdl-button--icon" for="sample6">
                          <i class="material-icons">search</i>
                        </label>
                        <div class="mdl-textfield__expandable-holder">
                          <input class="mdl-textfield__input" type="text" id="sample6">
                          <label class="mdl-textfield__label" for="sample-expandable">Expandable Input</label>
                        </div>
                    </div> -->
                    <br>
                    <form action="<%= request.getContextPath() %>/SearchList.ap" method="post">
                    <span style="font-family: fontello;">&#xe804</span>
                    <input type="text" placeholder="사원명을 입력하세요." id='searchValue' name='searchValue'>
<!--                     <input type="submit" value='검색' id="searchEmp">&nbsp;&nbsp; -->
                    <input type="button" value='검색' id="searchEmp">&nbsp;&nbsp;
                    <input type="button" value='재설정' id='reset'>&nbsp;&nbsp;
                    <br>
                    <span id='searchTempresult'></span>
                    </form>
                </div>
            </td>
            <td>
<!------------------------------------ 결재자 목록 ------------------------------------>
                <div id='box2'>
                    <table align='center'>
                        <tr>
                            <td>
                                <input type="radio" name='approval' id='approval1'>
                                <label for="approval1">검토</label>
                                <br><br>
                                <input type="radio" name='approval' id='approval2'>
                                <label for="approval2">승인</label>
                            </td>
                            <td>
                                <div align='center'>
                                    결재자 목록&nbsp;&nbsp;
                                    <input type="button" value='전체삭제' id='checkAlllistbtn_del'>
                                </div>
                                <div id='menu'>
<!--------------------------------------------------------  -------------------------------------------------------->
									<ul class="tree2" id="tree2">
                                                            
                                        <li>
                                            <input type="checkbox" id="checklist">
                                            <label for="checklist">검토자</label>
                                            <ul id='app_checklist'>
                                                
                                            </ul>
                                        </li>

                                        <li>
                                            <input type="checkbox" id="Approver">
                                            <label for="Approver">승인자</label>
                                            <ul id='app_Approver'>
												
                                            </ul>
                                        </li>
                                        
                                    </ul>
<!--------------------------------------------------------  -------------------------------------------------------->
                                </div>
                            </td>
                            <td>
                                <input type="button" value='위' id='checklistbtn_up'><br><br>
                                <input type="button" value='아래' id='checklistbtn_down'><br><br>
                                <input type="button" value='삭제' id='checklistbtn_del'>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
<!------------------------------------ 협조자 목록 ------------------------------------>
                <div id='box3'>
                    <table align='center'>
                        <tr>
                            <td>
                                <input type="radio" name='approval' id='approval3'>
                                <label for="approval3">협조</label>
                            </td>
                            <td>
                                <div align='center'>
                                    협조자 목록&nbsp;&nbsp;
                                    <input type="button" value='전체삭제' id='referAlllistbtn_del'>
                                </div>
                                <div id='refer'>
									
									<ul class="tree2" id="tree2">
<!--------------------------------------------------------  -------------------------------------------------------->                  
                                        <li>
                                            <input type="checkbox" id="referlist">
                                            <label for="referlist">참조자</label>
                                            <ul id='app_referlist'>

                                            </ul>
                                        </li>
<!--------------------------------------------------------  -------------------------------------------------------->
                                    </ul>
									
                                </div>
                            </td>
                            <td>
                                <input type="button" value='위' id='referlistbtn_up'><br><br>
                                <input type="button" value='아래' id='referlistbtn_down'><br><br>
                                <input type="button" value='삭제' id='referlistbtn_del'>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
<!------------------------------------ 자주 쓰는 결제선 ------------------------------------>
                <div id='box4' align='center'>
                    <!-- <label>자주쓰는 결제선</label> &nbsp;&nbsp;
                    <select>
                        <option value='문태환'>문태환</option>
                        <option value='김선엽'>김선엽</option>
                        <option value='김동혁'>김동혁</option>
                        <option value='송인석'>송인석</option>
                        <option value='신재영'>신재영</option>
                        <option value='장창수'>장창수</option>
                    </select>
                    <input type="button" value='삭제'> -->
                </div> 
<!------------------------------------ 자주 쓰는 결제선 ------------------------------------>
            </td>
        </tr>
        <tr>
            <td colspan='2'>
                <div align='center'>
                
                	<!------------------------------------ para로 튕길 hidden 값 ------------------------------------>
					
					<%-- <form action="<%= request.getContextPath() %>/goConfirm.ap" method="post"> --%>
					
						<%-- <input type='hidden' name='checklist_value' id='checklist_value' value='<%= %>'>
						<input type='hidden' name='approvallist_value' id='approvallist_value'>
						<input type='hidden' name='reflist_value' id='reflist_value'> --%>
						
	                    <!-- <input type="button" value='저장' id='save_btn'> -->
	                    <input type="button" value='작성 완료' id='submit_btn'>
	                    <input type="reset" value='닫기' id='close'>
	                    
					<!-- </form> -->
					
					<!------------------------------------ para로 튕길 hidden 값 ------------------------------------> 

                </div>
            </td>
        </tr>
    </table>
</body>
</html>