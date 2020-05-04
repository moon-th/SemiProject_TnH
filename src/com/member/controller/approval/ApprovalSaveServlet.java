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
 * Servlet implementation class ApprovalSaveServlet
 */
@WebServlet("/AplSave.ap")
public class ApprovalSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovalSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String checklist = request.getParameter("checklist");
		String Approver = request.getParameter("Approver");
		String referlist = request.getParameter("referlist");
		
		System.out.println(checklist);
		System.out.println(Approver);
		System.out.println(referlist);
		
		String ConfirmList = checklist + Approver + referlist;
		
		String[] ConfirmListArr = ConfirmList.split(" ");
		
		System.out.println(ConfirmListArr);
		
//		ArrayList<Member> list = new MemberService().selectConfirmListcheck();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
