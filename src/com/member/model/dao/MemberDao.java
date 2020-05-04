package com.member.model.dao;

import static com.member.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import java.util.StringTokenizer;

import com.member.model.exception.MemberException;
import com.member.model.vo.Attachment;
import com.member.model.vo.Member;

public class MemberDao {

	 private Properties prop;
	   
	   public MemberDao() {
	      prop = new Properties();
	      
	      String filePath = MemberDao.class.getResource("/config/member-query.properties").getPath();
	      
	      try {
	         prop.load(new FileReader(filePath));
	      } catch(FileNotFoundException e) {
	         e.printStackTrace();
	      } catch(IOException e){
	         e.printStackTrace();
	      } 
	      
	   }
	
	/**
	 * @param con
	 * @param m
	 * @return
	 * @throws MemberException
	 * @작성자 : 문태환
	 * @내용  : 사원로그인
	 */
	public Member loginMember(Connection con, Member m) throws MemberException {

		PreparedStatement pstmt =null;

		ResultSet rset = null;


		Member mem = null;
		try {
			
			String sql = prop.getProperty("selectMember");
		

			pstmt = con.prepareStatement(sql);
		
			
			pstmt.setString(1, m.getEmpId());
			pstmt.setString(2, m.getEmpPwd());
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				mem = new Member();
				
				mem.setEmpNo(rset.getInt("EMP_NO"));
				mem.setEmpName(rset.getString("EMP_NAME"));
				mem.setEmpId(rset.getString("EMP_ID"));
				mem.setEmpPwd(rset.getString("EMP_PWD"));
				mem.setEmpSsn(rset.getString("EMP_SSN"));
				mem.setDeptName(rset.getString("DEPT_NAME"));
				mem.setJobName(rset.getString("JOB_NAME"));
				mem.setPhone(rset.getString("PHONE_NO"));
				mem.setHome(rset.getString("HOME_NO"));
				mem.setAddress(rset.getString("ADDRESS"));
				mem.setEmail(rset.getString("EMAIL"));
				mem.setEntYN(rset.getString("ENT_YN"));	
				
			}
			
		     
	      }catch(SQLException e) {
	    	  e.printStackTrace();
	      }
		
		catch(Exception e) {
	         throw new MemberException(e.getMessage());
	      } finally {
	            close(rset);
	            close(pstmt);
	      }
		return mem;
	}
	/**
	 * @param con
	 * @param m
	 * @return
	 * @throws MemberException
	 * @작성자 : 문태환
	 * @내용  : 사원 개인정보 수정
	 */
	public int memberUpdate(Connection con, Member m) throws MemberException {

		PreparedStatement pstmt = null;
		
		int result = 0;
		String sql = prop.getProperty("memberUpdate");
		
		try {

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getPhone());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getEmpPwd());
			pstmt.setString(4, m.getEmpId());
			
	     	result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			
		 throw new MemberException(e.getMessage());
			
			
		}finally {
			close(pstmt);
			
		}
		return result;
	}
	/**
	 * @param con
	 * @param m
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원정보 추가
	 */
	public int memberAdd(Connection con, Member m) {
		
		int result =0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("MemberAdd");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getEmpName());
			pstmt.setString(2, m.getEmpId());
			pstmt.setString(3, m.getEmpPwd());
			pstmt.setString(4, m.getEmpSsn());
			pstmt.setString(5, m.getDeptName());
			pstmt.setString(6, m.getJobName());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getHome());
			pstmt.setString(9, m.getAddress());
			pstmt.setString(10, m.getEmail());
			pstmt.setString(11, "N");
			
			result = pstmt.executeUpdate();
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	/**
	 * @param con
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원목록 
	 */
	public ArrayList<Member> memberList(Connection con,int currentPage,int limit) {

		Member m = null;
		
		ArrayList<Member> list = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberList");
		
		try {
		
		list = new ArrayList<Member>();	
		
		pstmt = con.prepareStatement(sql);
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow+limit-1;
		
		pstmt.setInt(1, endRow);
		pstmt.setInt(2, startRow);
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			
		m = new Member();		
		
		m.setEmpNo(rset.getInt("EMP_NO"));	
		m.setEmpName(rset.getString("EMP_NAME"));
		m.setEmpSsn(rset.getString("SUBSTR(EMP_SSN,1,6)"));
		m.setDeptName(rset.getString("DEPT_NAME"));
		m.setJobName(rset.getString("JOB_NAME"));
		m.setHireDate(rset.getDate("HIRE_DATE"));
		m.setEntDate(rset.getDate("ENT_DATE"));
				list.add(m);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}



	/**
	 * @param con
	 * @param no
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원정보 상세보기
	 */
	public Member adminMemberDetail(Connection con, int no) {

		
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
				
		String sql = prop.getProperty("adminMemberDetail");
		
		try {
		
		m = new Member();	
			
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, no);

		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			
			m.setEmpNo(rset.getInt("EMP_NO"));
			m.setEmpName(rset.getString("EMP_NAME"));
			m.setEmpId(rset.getString("EMP_ID"));
			m.setEmpPwd(rset.getString("EMP_PWD"));
			m.setEmpSsn(rset.getString("EMP_SSN"));
			m.setDeptName(rset.getString("DEPT_NAME"));
			m.setJobName(rset.getString("JOB_NAME"));
			m.setPhone(rset.getString("PHONE_NO"));
			m.setHome(rset.getString("HOME_NO"));
			m.setAddress(rset.getString("ADDRESS"));
			m.setEmail(rset.getString("EMAIL"));
			m.setEntYN(rset.getString("ENT_YN"));
			m.setBank(rset.getString("BANK"));
			m.setBankNo(rset.getString("BANK_NO"));
			m.setSalary(rset.getInt("SALARY"));
			m.setBonus(rset.getDouble("BONUS"));
		
		}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}



	/**
	 * @param con
	 * @param m
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원정보 수정
	 */
	public int adminMemberUpdate(Connection con, Member m) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = "";
		
		try {
			
			if(m.getEntYN().equals("Y")) {
				//ENT_YN이 Y로 바뀌고
				//ENT_DATE가 퇴사날짜로 변경
				sql = prop.getProperty("adminMemberUpdate");
			}else{
				//ENT_YN이 N으로 변경
				//ENT_DATE가 NULL로 변경
				sql = prop.getProperty("adminMemberUpdate2");
			}
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, m.getEmpName());
		pstmt.setString(2, m.getEmpSsn());
		pstmt.setString(3, m.getEntYN());
		pstmt.setString(4, m.getAddress());
		pstmt.setString(5, m.getPhone());
		pstmt.setString(6, m.getHome());
		pstmt.setString(7, m.getEmpId());
		pstmt.setString(8, m.getEmpPwd());
		pstmt.setString(9, m.getDeptName());
		pstmt.setString(10,m.getJobName());
		pstmt.setInt(11, m.getEmpNo());
			
		result = pstmt.executeUpdate();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	/**
	 * @param con
	 * @param del
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원정보 삭제
	 */
	public int adminMemberDelete(Connection con, String[] del) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adminMemberDelete");
		for(int i =0;i<del.length;i++)
		{
		int A = Integer.parseInt(del[i]);
		
		try {
		
			pstmt = con.prepareStatement(sql);
			

			pstmt.setInt(1, A);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	}
		return result;
	}



	/**
	 * @param con
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 총 사원정보 갯수
	 */
	public int getListCount(Connection con) {

		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	

	/**
	 * @param 모든 사원정보 갖고오기 (작성자 김선엽)
	 * @return
	 */
	public ArrayList<Member> getAllEmployee(Connection con){
		ArrayList<Member> mlist = new ArrayList<Member>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllList");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setEmpNo(rset.getInt(1));
				m.setEmpName(rset.getString(2));
				m.setEmpId(rset.getString(3));
				m.setEmpPwd(rset.getString(4));
				m.setEmpSsn(rset.getString(5));
				m.setDeptName(rset.getString(6));
				m.setJobName(rset.getString(7));
				m.setPhone(rset.getString(8));
				m.setHome(rset.getString(9));
				m.setAddress(rset.getString(10));
				m.setEmail(rset.getString(11));
				m.setHireDate(rset.getDate(12));
				m.setEntDate(rset.getDate(13));
				m.setEntYN(rset.getString(14));
				
				mlist.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return mlist;
	}
	/**
	  * @Method Name : selectAllList
	  * @작성일 : 2020. 2. 9.
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : 모든 사원 정보를 부서명으로 sorting해 불러오기
	  * @param con
	  * @return
	  */
	public ArrayList<Member> selectAllList(Connection con, int empNo) {
		
		ArrayList<Member> list = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllList2");
			
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, empNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				// 생성자 하나 만들어서 최소 정보만 불러오기
				Member m = new Member(
						rset.getInt("EMP_NO"),
						rset.getString("EMP_NAME"),
						rset.getString("DEPT_NAME"),
						rset.getString("JOB_NAME")
						);
				list.add(m);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}
	
	
	/**
	 * @param con
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 사원급여정보 생성
	 */
	public int memberSalaryAdd(Connection con) {

		int result = 0;
	
		Statement stmt = null;
		
		String sql = prop.getProperty("MemberSalaryAdd");
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);	
		}
		
	
	return result;
}
	/**
	 * @param con
	 * @param m
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원급여 정보수정 
	 */
	public int adminMemberSalary(Connection con, Member m) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("adminMemberSalary");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getBank());
			pstmt.setString(2, m.getBankNo());
			pstmt.setInt(3, m.getSalary());
			pstmt.setDouble(4, m.getBonus());
			pstmt.setInt(5, m.getEmpNo());
			
	    	result = pstmt.executeUpdate();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	/**
	 * @param con
	 * @param category
	 * @param keyword
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원목록 검색
	 */
	public ArrayList<Member> adminSearchMember(Connection con, String category, String keyword) {

		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(category) {
		
		case "empno":sql=prop.getProperty("adminSearchMemberNo"); break;
		case "empname":sql=prop.getProperty("adminSearchMemberName");break;
		case "deptname":sql=prop.getProperty("adminSearchDeptName");break;
		case "jobname":sql=prop.getProperty("adminSearchJobName"); break;
		
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
		while(rset.next()) {
			
			Member m = new Member();
			
			rset.getString("EMP_SSN");
			
			m.setEmpNo(rset.getInt("EMP_NO"));	
			m.setEmpName(rset.getString("EMP_NAME"));
			String ssn = rset.getString("EMP_SSN").substring(0,6);
			m.setEmpSsn(ssn);
			m.setDeptName(rset.getString("DEPT_NAME"));
			m.setJobName(rset.getString("JOB_NAME"));
			m.setHireDate(rset.getDate("HIRE_DATE"));
			m.setEntDate(rset.getDate("ENT_DATE"));
					list.add(m);
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	/**
	 * @param con
	 * @param at
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 사진추가 쿼리
	 */
	public int memberPhotoAdd(Connection con, Attachment at) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertPhoto");
		
		try {
			
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,at.getOriginname());
				pstmt.setString(2, at.getChangename());
				pstmt.setString(3, at.getFilepath());
				
				// 첫번째로 들어가는 데이터는 대표 이미지로,
				// 나머지는 서브 이미지로 레벨을 결정한다.
				
				result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			
		} finally {
			close(pstmt);
		}
		
		return result;
			
	}



	/**
	 * @param con
	 * @param empNo
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 사원사진 선택
	 */
	public Attachment selectMemberPhoto(Connection con, int empNo) {

		PreparedStatement pstmt = null;
		
		Attachment at = new Attachment();
		
		ResultSet rset = null;
		
	
		
		try {
			
			String sql = prop.getProperty("selectMemberPhoto");
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,empNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at.setChangename(rset.getString("CHANGENAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return at;
	}



	/**
	 * @param con
	 * @param at
	 * @param m
	 * @return
	 * @작성자 : 문태환
	 * @내용  : 관리자 사원사진 수정
	 */
	public int adminMemberPhoto(Connection con, Attachment at, Member m) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updatePhoto");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginname());
			pstmt.setString(2, at.getChangename());
			pstmt.setString(3, at.getFilepath());
			pstmt.setInt(4, m.getEmpNo());
			
		result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
           e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	/**
	 * @param con
	 * @return
	 * @작성자 :문태환 
	 * @내용  : 주소록 사원목록 가져오기
	 */
	public ArrayList<Member> companyAddress(Connection con) {
		
		ArrayList<Member> mlist = new ArrayList<Member>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("companyAddressList");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setEmpNo(rset.getInt(1));
				m.setEmpName(rset.getString(2));
				m.setEmpId(rset.getString(3));
				m.setEmpPwd(rset.getString(4));
				m.setEmpSsn(rset.getString(5));
				m.setDeptName(rset.getString(6));
				m.setJobName(rset.getString(7));
				m.setPhone(rset.getString(8));
				m.setHome(rset.getString(9));
				m.setAddress(rset.getString(10));
				m.setEmail(rset.getString(11));
				m.setHireDate(rset.getDate(12));
				m.setEntDate(rset.getDate(13));
				m.setEntYN(rset.getString(14));
				m.setChangename(rset.getString("CHANGENAME"));
				mlist.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return mlist;
	}



	public int idDupCheck(Connection con, String id) {

		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				// -1 : 에러!
				// 0 : id중복 사용자 없음
				// 1 : id를 누군가 이미 사용 중임
				result = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	  * @Method Name : selectConfirmListcheck
	  * @작성일 : 2020. 2. 11.
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : confirm에 list 정보 가져오는 메소드
	  * @param con
	  * @param confirmListArr
	  * @return
	  */
	public ArrayList<Member> selectConfirmListcheck(Connection con, String[] confirmListArr) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectConfirmListcheck");
			
		try {
			
			pstmt = con.prepareStatement(sql);
			
			for (String str : confirmListArr) {
				
				pstmt.setString(1, str);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					// 생성자 하나 만들어서 최소 정보만 불러오기
					
					Member m = new Member(
							rset.getInt("EMP_NO"),
							rset.getString("EMP_NAME"),
							rset.getString("DEPT_NAME"),
							rset.getString("JOB_NAME")
							);
					list.add(m);
				}

			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	/**
	  * @Method Name : nameSearchCheck
	  * @작성일 : 2020. 2. 13.
	  * @작성자 : songinseok
	  * @변경이력 : 
	  * @Method 설명 : approval에서 사원 검색
	  * @param con
	  * @param empName
	  * @returnm
	  */
	public int nameSearchCheck(Connection con, String empName) {
		
		int result = -1;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("nameSearchCheck");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, empName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}



	/**
	 * 1. 메소드명 : searchEmpName
	 * 2. 작성일 : 2020. 2. 13. 오후 5:36:57
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 검색 검색 지정자 검색 ㅅㅂ
	 * @param con
	 * @param empName
	 * @return
	 */
	public ArrayList<Member> searchEmpName(Connection con, String empName) {
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchEmpName");
			
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, empName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member(
						rset.getInt("EMP_NO"),
						rset.getString("EMP_NAME"),
						rset.getString("DEPT_NAME"),
						rset.getString("JOB_NAME")
						);
				list.add(m);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}



	/**
	 * 1. 메소드명 : selcetOneNo
	 * 2. 작성일 : 2020. 2. 18. 오전 9:20:04
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 사원정보 하나 가져오는 메소드
	 * @param con
	 * @param writerId
	 * @return
	 */
	public Member selcetOneNo(Connection con, String writerId) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selcetOneNo");
			
		try {
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(writerId));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				m = new Member(
						rset.getInt("EMP_NO"),
						rset.getString("EMP_NAME"),
						rset.getString("DEPT_NAME"),
						rset.getString("JOB_NAME")
						);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return m;
	}
	
}
