package com.confirmBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.confirmBoard.model.service.cBoardService;
import com.confirmBoard.model.vo.cBoard;
import com.member.model.vo.Member;
import com.member.service.MemberService;

/**
 * Servlet implementation class confirmSelectOne
 */
@WebServlet("/confirmSelectOne")
public class confirmSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		// 게시글 상세 조회용
		cBoard b = new cBoardService().selectOne(bno);
		String writerId = b.getBwriterId();
		Member m2 = new MemberService().selcetOneNo(writerId);
		
		// 답글 관련 조회용
//		ArrayList<BoardComment> clist = 
//				new BoardCommentsService().selectList(bno);


//---------------------리스트 불러오기//---------------------리스트 불러오기//---------------------리스트 불러오기
		String checklist = b.getCheckList();
		String Approver = b.getConfirm();
		String referlist = b.getReferList();
		
//		System.out.println(writerId);
//		System.out.println(checklist);
//		System.out.println(Approver);
//		System.out.println(referlist);
		
//		빼는 이유는 확실치 않기 때문에
//		String ConfirmList = writerId + checklist + Approver + referlist;
		String ConfirmList = checklist + Approver + referlist;
		
		String[] ConfirmListArr = ConfirmList.split(" ");
		
		ArrayList<Member> list = new MemberService().selectConfirmListcheck(ConfirmListArr);
		
//		ArrayList<Member> writerIdArr = new ArrayList<Member>();
		ArrayList<Member> checklistArr = new ArrayList<Member>();
		ArrayList<Member> approverArr = new ArrayList<Member>();
		ArrayList<Member> referlistArr = new ArrayList<Member>();
		
//		String[] writerIdArr2 = writerId.split(" ");
		String[] checklistArr2 = checklist.split(" ");
		String[] approverArr2 = Approver.split(" ");
		String[] referlistArr2 = referlist.split(" ");
		
//		확인확인 1,3
//		System.out.println("ConfirmListArr 배열입니다."+ Arrays.toString(ConfirmListArr));
//		System.out.println("String 배열입니다."+ Arrays.toString(checklistArr2));
//		System.out.println("list 배열입니다."+ list);
		
		
		for(Member m : list) {
			
//			for(String writerIdstr : writerIdArr2) {
//				
//				int empNo = Integer.parseInt(writerIdstr);
//				
//				if(empNo==m.getEmpNo()) {
//					writerIdArr.add(m);
//				}
//			}
			
			
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
//---------------------검토자 승인 여부 판단하기.	//---------------------검토자 승인 여부 판단하기.	//---------------------검토자 승인 여부 판단하기.	
		
		int checklistArrsize = checklistArr.size();
		
		String optionCheck = b.getOptionCheck();
		ArrayList<String> optionCheckArr = new ArrayList<>();
		
		String optionApproval = b.getOptionApproval();
		
		System.out.println(optionCheck);
		System.out.println(optionApproval);
		
		
		
		// 검토자 확인 검토
		if(optionCheck!=null) {
			
			String[] optionCheckstrArr = optionCheck.split(" ");
			
			for(int i=0; checklistArrsize>i; i++) {
				
				if(optionCheckstrArr.length>i) {
					optionCheckArr.add("Y");
				}else {
					optionCheckArr.add("N");
				}
			}
			
		}else {
			
			for(int i=0; checklistArrsize>i; i++) {
				optionCheckArr.add("N");
			}
			
		}
		
		// 승인자 확인 검토
		if(optionApproval!=null) {
			optionApproval = "Y";
		}else {
			optionApproval = "N";
		}
		
		System.out.println("optionCheckArr" + optionCheckArr);
		System.out.println("optionApproval : " + optionApproval);
		
		
//		System.out.println("checklistArr 확인합니다. : " + checklistArr);
		
		String page = "";
		
		if(b != null) {
			
			page = "views/confirm/confirmDetail.jsp";
			request.setAttribute("board", b);
			
			request.setAttribute("writerId", m2);
			request.setAttribute("checkList", checklistArr);
			request.setAttribute("referList", referlistArr);
			request.setAttribute("approver", approverArr);
			
			request.setAttribute("optionCheckArr", optionCheckArr);
			request.setAttribute("optionApproval", optionApproval);
			
			request.setAttribute("type", type);
			
//			request.setAttribute("clist", clist);
			
		}else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패!");
			
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
