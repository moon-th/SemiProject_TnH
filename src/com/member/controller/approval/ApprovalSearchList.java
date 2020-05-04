package com.member.controller.approval;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.member.model.vo.Member;
import com.member.service.MemberService;

/**
 * Servlet implementation class ApprovalSearchList
 */
@WebServlet("/SearchList.ap")
public class ApprovalSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalSearchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		String empName = request.getParameter("empName");
//		String empName = request.getParameter("searchValue");
		
		MemberService ms = new MemberService();
		
		ArrayList<Member> list = ms.searchEmpName(empName);
		
		ArrayList<String> deptList = new ArrayList<String>();
		
		boolean check2 = true;
		
		for (int i=0; i<list.size(); i++) {
			
			if(check2) {
				
				deptList.add(list.get(i).getDeptName());
				
			}
			
			if(i==(list.size()-1)) {
				break;
			}
			
			if(list.get(i).getDeptName().equals(list.get(i+1).getDeptName())){
				
				check2 = false;
				
			}else {
				
				check2 = true;
			}

		}
		
		Map map = new HashMap<>();
		
		map.put("list", list);
		map.put("deptList", deptList);
		
		new Gson().toJson(map, response.getWriter());
		
//		String page = "";
//		
//		if(list != null) {
//			page = "views/approval/approval.jsp";
//			
//			request.setAttribute("list", list);
//			request.setAttribute("deptList", deptList);
//			
//		}else {
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "사원 정보 불러오기 실패");
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
