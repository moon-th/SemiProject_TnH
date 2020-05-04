package com.member.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.member.common.MyRenamePolicy;
import com.member.model.vo.Attachment;
import com.member.model.vo.Member;
import com.member.service.MemberService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/madd.em")
public class AdminMemberAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	/**
	 * @작성자 : 문태환
	 * @내용 : 관리자 회원추가
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int maxSize = 1024 * 1024 * 10; // 10MB
		
		String root
		= request.getServletContext().getRealPath("/resource");
		
		String savePath = root + "/images/";
		
		MultipartRequest mrequest = new MultipartRequest(
				request, // 변경하기 위한 원본 객체
				savePath, // 파일 저장 경로
				maxSize,	// 저장할 파일의 최대 크기
				"UTF-8",	// 저장할 문자셋 설정
				new MyRenamePolicy());
		
		String name = mrequest.getParameter("name");
		String ssn = (mrequest.getParameter("ssn_1")+"-"+mrequest.getParameter("ssn_2"));
		String address = mrequest.getParameter("zipCode")+"/"+mrequest.getParameter("address1")+"/"+mrequest.getParameter("address2");
		String email = mrequest.getParameter("email")+"@"+mrequest.getParameter("email_dns");
		String phone = mrequest.getParameter("phone1")+"-"+mrequest.getParameter("phone2")+"-"+mrequest.getParameter("phone3");
		String home = mrequest.getParameter("home1")+"-"+mrequest.getParameter("home2")+"-"+mrequest.getParameter("home3");;
		String id = mrequest.getParameter("id");
		String pwd = mrequest.getParameter("pwd");
		String dept = mrequest.getParameter("dept");
		String job = mrequest.getParameter("job");
		
		Member m = new Member(name, id, pwd, ssn, dept, job, phone, home, address, email);
		MemberService ms = new MemberService();
		
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 만약 multipart/form-data로 보내지 않았으면 에러 발생!
			
			System.out.println("사진 전송실패");
		}
		
		
		String saveFile = new String();
		
		String originFiles = new String();
		
		
		// 폼으로 전송된 파일 이름들 가져오기
		Enumeration<String> files
		 = mrequest.getFileNames();
		
		System.out.println("files"+files);
		
		while(files.hasMoreElements()) {
		
		String filename = files.nextElement();	
			
		System.out.println("filename : " + filename);
		
		 saveFile = mrequest.getFilesystemName(filename);
		
		 originFiles = mrequest.getOriginalFileName(filename);
		
		}
		
		Attachment at = new Attachment();
		
		at.setFilepath(savePath);
		at.setOriginname(originFiles);
		at.setChangename(saveFile);
			
		try {
			
			int result = ms.MemberAdd(m,at);
			if(result > 0) {
				System.out.println("회원가입 완료");
				System.out.println("사진등록 성공");
				response.sendRedirect("mList.em");
			}else {
				System.out.println("사진등록 실패");
			}

			
		} catch (Exception e) {

			System.out.println("회원가입 실패");
			
			/*
			 * request.setAttribute("msg", "사원추가 실패입니다!!");
			 * request.setAttribute("exception", e);
			 */
			
//			request.getRequestDispatcher("views/common/errorPage.jsp");
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
