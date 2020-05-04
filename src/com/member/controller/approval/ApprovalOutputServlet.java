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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.member.model.vo.Member;
import com.member.service.MemberService;

/**
 * Servlet implementation class ApprovalOutputServlet
 */
@WebServlet("/goConfirm.ap")
public class ApprovalOutputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalOutputServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		String checklist = request.getParameter("checklist_value");
		String Approver = request.getParameter("approvallist_value");
		String referlist = request.getParameter("reflist_value");
		
		System.out.println(checklist);
		System.out.println(Approver);
		System.out.println(referlist);
		
		String ConfirmList = checklist + Approver + referlist;
		
		String[] ConfirmListArr = ConfirmList.split(" ");
		
		ArrayList<Member> list = new MemberService().selectConfirmListcheck(ConfirmListArr);
		
		ArrayList<Member> checklistArr = new ArrayList<Member>();
		ArrayList<Member> approverArr = new ArrayList<Member>();
		ArrayList<Member> referlistArr = new ArrayList<Member>();
		
		String[] checklistArr2 = checklist.split(" ");
		String[] approverArr2 = Approver.split(" ");
		String[] referlistArr2 = referlist.split(" ");
		
		for(Member m : list) {
			
			for(String checkstr : checklistArr2) {
				
				int empNo = Integer.parseInt(checkstr);
				
				if(empNo==m.getEmpNo()) {
					checklistArr.add(m);
				}
			}
			
			for(String checkstr : approverArr2) {
				
				int empNo = Integer.parseInt(checkstr);
				
				if(empNo==m.getEmpNo()) {
					approverArr.add(m);
				}
			}
			
			for(String checkstr : referlistArr2) {
				
				int empNo = Integer.parseInt(checkstr);
				
				if(empNo==m.getEmpNo()) {
					referlistArr.add(m);
				}
			}
			
		}
		
//		for(Member m : checklistArr) {
//			System.out.println(m);
//		}
//		for(Member m : approverArr) {
//			System.out.println(m);
//		}
//		for(Member m : referlistArr) {
//			System.out.println(m);
//		}
		
//		String page = "";
//		
//		if(checklistArr.isEmpty() || approverArr.isEmpty() || referlistArr.isEmpty()) {
//			
//			page = "views/common/errorPage.jsp";
//			request.setAttribute("msg", "입력하지 않은 값이 있습니다.");
//			
//		}else {
//			
//			page = "views/confirm/confirm2.jsp";
//			request.setAttribute("checklistArr", checklistArr);
//			request.setAttribute("approverArr", approverArr);
//			request.setAttribute("referlistArr", referlistArr);
//		
//		}
		
//		request.getRequestDispatcher(page).forward(request, response);

		Map<String,ArrayList<Member>> resultList = new HashMap<>();
		
		resultList.put("checklistArr", checklistArr);
		resultList.put("approverArr", approverArr);
		resultList.put("referlistArr", referlistArr);
		
		new Gson().toJson(resultList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
