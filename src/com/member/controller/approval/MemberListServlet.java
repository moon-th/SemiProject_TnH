package com.member.controller.approval;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.vo.Member;
import com.member.service.MemberService;



/**
 * Servlet implementation class ApprovalMemberListServlet
 */
@WebServlet("/MemberList.ap")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int empNo = Integer.parseInt(request.getParameter("empNo"));
		System.out.println(empNo);
		
		
		
//		모든 사원 정보 부서명으로 sorting해 불러오는 메소드		
		ArrayList<Member> list = new MemberService().selectAllList(empNo);
		
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

		String page = "";
		
		if(list != null) {
			page = "views/approval/approval.jsp";
			
			request.setAttribute("list", list);
			request.setAttribute("deptList", deptList);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사원 정보 불러오기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
