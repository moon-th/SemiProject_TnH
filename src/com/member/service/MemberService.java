package com.member.service;

import static com.member.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.member.model.dao.MemberDao;
import com.member.model.exception.MemberException;
import com.member.model.vo.Attachment;
import com.member.model.vo.Member;
public class MemberService {
	
	MemberDao mDao = new MemberDao();
	
	public MemberService() {
		
	}

	/**
	 * @param m
	 * @return
	 * @throws MemberException
	 * @작성자 : 문태환
	 * @내용  : 사원 로그인
	 */
	public Member loginMember(Member m) throws MemberException {

		
		Connection con = getConnection();
		
		Member mem = mDao.loginMember(con,m);
		
		close(con);
		
		return mem;
		
		
	}

	/**
	 * @param m
	 * @return
	 * @throws MemberException
	 * @작성자 : 문태환
	 * @내용  : 사원 개인정보 수정
	 */
	public int memberUpdate(Member m) throws MemberException {

		Connection con = getConnection();
		
		int result = mDao.memberUpdate(con,m);
				
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	/**
	 * @param m
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원추가
	 */
	public int MemberAdd(Member m,Attachment at) {

		Connection con = getConnection();
		
		int result = mDao.memberAdd(con,m);
			
		if(result >0) {
			commit(con);
		}else{
			rollback(con);
		}
		
		int result1=mDao.memberSalaryAdd(con);
			if(result1 > 0) {
				commit(con);
			}else {
				rollback(con);
		}
		
			int result2 = mDao.memberPhotoAdd(con, at);
		if( result2 > 0) {
				commit(con);
			}else {
				rollback(con);
			}	
		close(con);
		
		return result2;
	}

	/**
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원목록
	 */
	public ArrayList<Member> MemberList(int currentPage, int limit) {

		Connection con = getConnection();
		
		ArrayList<Member> result = mDao.memberList(con,currentPage,limit);
		
		close(con);
		
		return result;
		
		
	}

	/**
	 * @param no
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원목록 상세보기
	 */
	public Member adminMemberDetail(int no) {

		Member m = new Member();
		
		Connection con = getConnection();
		
		m = mDao.adminMemberDetail(con, no);
		
		close(con);
		
		return m;
	}

	/**
	 * @param m
	 * @param at 
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원정보 수정
	 */
	public void adminMemberUpdate(Member m, Attachment at) {

		Connection con =getConnection();
		//사원정보
		int result = mDao.adminMemberUpdate(con,m);
		
		if(result > 0) {
			commit(con);
		}else{
			rollback(con);
		}
		//사원계좌
		int result2 = mDao.adminMemberSalary(con,m);
			
		if(result2 > 0) {
					commit(con);
		}else {
				rollback(con);
		}
		//사원사진
		int result3 = mDao.adminMemberPhoto(con, at,m);
		if( result3 > 0) {
				commit(con);
			}else {
				rollback(con);
			}	
		close(con);
		
	}

	/**
	 * @param del
	 * @작성자 :문태환 
	 * @내용  : 관리자 사원삭제
	 */
	public void adminMemberDelete(String[] del) {

		Connection con = getConnection();
		
		int result = mDao.adminMemberDelete(con,del);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
	}
	
	/**
	 * @return
	 * @작성자 :문태환 
	 * @내용  : 총 사원정보 갯수
	 */
	public int getListCount() {
		Connection con = getConnection();
		
		int result = mDao.getListCount(con);

		close(con);
		
		return result;
	}
	
	/**
	  * @Method Name : selectAllList
	  * @작성일 : 2020. 2. 9.
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 모든 사원 정보 부서명으로 sorting해 불러오는 메소드
	  * @return
	  */
	public ArrayList<Member> selectAllList(int empNo) {
		
		Connection con = getConnection();
		
		ArrayList<Member> list = mDao.selectAllList(con, empNo);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Member> allEmployee(){
		Connection con = getConnection();
		
		ArrayList<Member> allE = mDao.getAllEmployee(con);
		
		close(con);
		
		return allE;
	}
	
	/**
	 * @param category
	 * @param keyword
	 * @return
	 * @작성자 : 문태환 
	 * @내용  : 관리자 사원목록 검색
	 */
	public ArrayList<Member> searchMember(String category, String keyword) {
		Connection con = getConnection();
		
		ArrayList<Member> list = null;
		
		if(category.length() > 0) {
			list = mDao.adminSearchMember(con,category,keyword);
		}else {
			
		}
		
		return list;
	}

	/**
	 * @param empNo
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 사원 사진선택
	 */
	public Attachment selectMemberPhoto(int empNo) {
		
		Connection con = getConnection();
		
		Attachment at = mDao.selectMemberPhoto(con,empNo);
		close(con);
		
		return at;
	}

	/**
	 * @return
	 * @작성자 : 문태환 
	 * @내용  : 주소록 리스트 가져오기
	 */
	public ArrayList<Member> companyAddress() {
		
		Connection con = getConnection();
		
		ArrayList<Member> list = mDao.companyAddress(con);
		
		close(con);
		
		return list;
	}

	/**
	 * @param id
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 사원 아이디 중복검사
	 */
	public int idDupCheck(String id) {
		
	Connection con = getConnection();
		
		int result = mDao.idDupCheck(con,id);
		
		close(con);
		
		return result;
		
		
	}
	
	/**
	* @Method Name : selectConfirmListcheck
	* @작성일 : 2020. 2. 11.
	* @작성자 : songinseok
	* @변경이력 :
	* @Method 설명 : confirm에 list 정보 가져오는 메소드
	* @param confirmListArr
	* @return
	*/
	public ArrayList<Member> selectConfirmListcheck(String[] confirmListArr) {

	Connection con = getConnection();

	ArrayList<Member> list = mDao.selectConfirmListcheck(con, confirmListArr);

	close(con);

	return list;
	}

	/**
	 * 1. 메소드명 : nameSearchCheck
	 * 2. 작성일 : 2020. 2. 13. 오후 4:56:22
	 * 3. 작성자 : songinseok
	 * 4. 설명 : Approval 검색 메소드
	 * @param empName
	 * @return
	 */
	public int nameSearchCheck(String empName) {

	Connection con = getConnection();

	int result = mDao.nameSearchCheck(con, empName);

	close(con);

	return result;
	}

	/**
	 * 1. 메소드명 : searchEmpName
	 * 2. 작성일 : 2020. 2. 13. 오후 5:27:03
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 검색 검색 지정자 검색 ㅅㅂ
	 * @param empName
	 * @return
	 */
	public ArrayList<Member> searchEmpName(String empName) {
		
		Connection con = getConnection();

		ArrayList<Member> list = mDao.searchEmpName(con, empName);

		close(con);
		
		return list;
	}

	/**
	 * 1. 메소드명 : selcetOneNo
	 * 2. 작성일 : 2020. 2. 18. 오전 9:19:13
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 사원정보 하나만 가져오는 메소드
	 * @param writerId
	 * @return
	 */
	public Member selcetOneNo(String writerId) {
		
		Connection con = getConnection();

		Member m = mDao.selcetOneNo(con, writerId);

		close(con);
		
		return m;
	}
	
}
