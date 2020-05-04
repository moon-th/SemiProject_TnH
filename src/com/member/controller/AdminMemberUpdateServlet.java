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

/**
 * Servlet implementation class AdminMemberUpdateServlet
 */
@WebServlet("/mUpdate.em")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
	/**
	 *@작성자 : 문태환
	 *@내용 : 관리자 사원정보 수정
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = new Member();
		
		MemberService ms = new MemberService();
		
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
	
		
		int emp_no = Integer.parseInt(mrequest.getParameter("no"));
		String name = mrequest.getParameter("name");
		String entyn = mrequest.getParameter("entyn");
		String ssn = (mrequest.getParameter("ssn_1")+"-"+mrequest.getParameter("ssn_2"));		
		String address = mrequest.getParameter("zipCode")+"/"+mrequest.getParameter("address1")+"/"+mrequest.getParameter("address2");
		String email = mrequest.getParameter("email")+"@"+mrequest.getParameter("email_dns");
		String phone = mrequest.getParameter("phone1")+"-"+mrequest.getParameter("phone2")+"-"+mrequest.getParameter("phone3");
		String home = mrequest.getParameter("home1")+"-"+mrequest.getParameter("home2")+"-"+mrequest.getParameter("home3");;
		String id = mrequest.getParameter("id");
		String pwd = mrequest.getParameter("pwd");
		String dept = mrequest.getParameter("dept");
		String job = mrequest.getParameter("job");
		String bank = mrequest.getParameter("bank");
		String bankNo = mrequest.getParameter("bankno");
		int salary = Integer.parseInt(mrequest.getParameter("salary"));
		double bonus = Double.parseDouble(mrequest.getParameter("bonus"));
		String photo= mrequest.getParameter("photo");
		
		m.setEmpNo(emp_no);
		m.setEmpName(name);
		m.setEmpSsn(ssn);
		m.setEntYN(entyn);
		m.setAddress(address);
		m.setEmail(email);
		m.setPhone(phone);
		m.setHome(home);
		m.setEmpId(id);
		m.setEmpPwd(pwd);
		m.setDeptName(dept);
		m.setJobName(job);
		m.setBank(bank);
		m.setBankNo(bankNo);
		m.setSalary(salary);
		m.setBonus(bonus);
		
		
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 만약 multipart/form-data로 보내지 않았으면 에러 발생!
			
			System.out.println("사진 전송실패");
		}
		
		
		String saveFile = new String();
		
		String originFiles = new String();
		
		
		// 폼으로 전송된 파일 이름들 가져오기
		Enumeration<String> files
		 = mrequest.getFileNames();
		
		
		while(files.hasMoreElements()) {
		
		String filename = files.nextElement();	
			
		
		 saveFile = mrequest.getFilesystemName(filename);
		
		 originFiles = mrequest.getOriginalFileName(filename);
		
		}
		
		Attachment at = new Attachment();
		
		at.setFilepath(savePath);
		at.setOriginname(originFiles);
		
		if(saveFile == null) {
		at.setChangename(photo);
		}
		else {
		at.setChangename(saveFile);
		}
		try {
			
			ms.adminMemberUpdate(m,at);
			System.out.println("수정성공");
			request.setAttribute("member",m);
			 request.setAttribute("at", at);
			 request.getRequestDispatcher("/mList.em").forward(request, response);
		
		} catch (Exception e) {
			System.out.println("수정실패");
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
