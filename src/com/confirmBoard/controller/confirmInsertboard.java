package com.confirmBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.confirmBoard.model.service.cBoardService;
import com.confirmBoard.model.vo.cBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class confirmInsertboard
 */
@WebServlet("/confirmInsert.bo")
public class confirmInsertboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmInsertboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024*1024*10;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 만약 올바른 multipart/form-data로 전송되지 않았을 경우
			// 에러페이지로 즉시 이동시킨다.
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/");
		System.out.println("root : " + root);
		
		String savePath = root + "resources/boardUploadFiles";
		
		MultipartRequest mrequest = new MultipartRequest(request,	// 변경하기 위한 원본 객체
				 savePath,  // 파일 저장 경로
				 maxSize,	// 저장할 파일의 최대크기
				 "UTF-8",
				 new DefaultFileRenamePolicy()
				 // 동일한 이름의 파일을 저장했을 경우
				 // 기존의 파일과 구분하기 위해
				 // 새로운 파일명 뒤에 숫자를 붙이는 규칙
				);
		
//		접속한 사람의 아이디
		int empNo = Integer.parseInt(mrequest.getParameter("EmpNo"));
		
//		--문서번호
//		--문서제목
		String title = mrequest.getParameter("title");
		System.out.println("title : " + title);
//		--기밀등급
		int cbSecType= Integer.parseInt(mrequest.getParameter("options2"));
		System.out.println("cbSecType : " + cbSecType);
//		--본문
		String cBcontent= mrequest.getParameter("ir1");
		System.out.println("cbContent : " + cBcontent);
//		--기안자
		String cBwriter= mrequest.getParameter("EmpName");
		System.out.println("cbWriter : " + cBwriter);
//		--조회수
//		--등록일
//		--삭제여부
//		--검토자
		String checkList= mrequest.getParameter("checklist_value");
		System.out.println("checkList : " + checkList);
//		--협조자
		String referList= mrequest.getParameter("reflist_value");
		System.out.println("referList : " + referList);
//		--승인자
		String approval= mrequest.getParameter("approvallist_value");
		System.out.println("approval : " + approval);
//		--보존기간
		int keepingDoc= Integer.parseInt(mrequest.getParameter("options"));
		System.out.println("keepingDoc : " + keepingDoc);
//		--첨부파일
		String cBoardfile = mrequest.getFilesystemName("file");
		System.out.println("fileName : " + cBoardfile);
//		--기안자 아이디
		String bwriterId= mrequest.getParameter("EmpNo");
		System.out.println("cbWriterId : " + bwriterId);
		
		cBoard cb = new cBoard();

//		--문서번호
//		--기밀등급
		cb.setCbsecType(cbSecType);
//		--문서제목
		cb.setcBtitle(title);
//		--본문
		cb.setcBcontent(cBcontent);
//		--기안자
		cb.setcBwriter(cBwriter);
//		--조회수
//		--등록일
//		--삭제여부
//		--검토자
		cb.setCheckList(checkList);
//		--협조자
		cb.setReferList(referList);
//		--승인자
		cb.setConfirm(approval);
//		--보존기간
		cb.setKeepingDoc(keepingDoc);
//		--첨부파일
		cb.setcBoardfile(cBoardfile);
//		--기안자 아이디
		cb.setBwriterId(bwriterId);
		
		int result = new cBoardService().insertBoard(cb);
		
		if(result > 0) {
			response.sendRedirect("confirmList.bo?type=0&empNo=" + empNo);
		}else {
			request.setAttribute("msg", "게시글 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
