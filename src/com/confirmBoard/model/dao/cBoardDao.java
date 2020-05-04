package com.confirmBoard.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.confirmBoard.model.vo.cBoard;

import static com.member.common.JDBCTemplate.*;

public class cBoardDao {

	private Properties prop;
	
	public cBoardDao() {
		
		prop = new Properties();
		
		String filePath = cBoardDao.class.getResource("/config/cboard-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 1. 메소드명 : getListCount
	 * 2. 작성일 : 2020. 2. 17. 오전 10:18:25
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 페이징 처리 , 결제 타입별로 바뀔수도!
	 * @param con
	 * @return
	 */
	public int getListCount(Connection con,int type, int empNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = "";
		
		try {
		
			switch(type) {
			
			case 0 : // 내가 올린 결재
				
				sql = prop.getProperty("listCount0");

				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, empNo);
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 1 : // 결재할 문서
				
				sql = prop.getProperty("listCount1");
				
				pstmt = con.prepareStatement(sql);
				
				int intlength = (int)(Math.log10(empNo)+1);
				
				pstmt.setString(1, Integer.toString(empNo));
				
				pstmt.setInt(2, intlength);
				
				pstmt.setString(3, Integer.toString(empNo));
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 2 : // 결재 완료 문서
				
				sql = prop.getProperty("listCount2");

				pstmt = con.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 3 : // 반려된 문서
				
				sql = prop.getProperty("listCount3");

				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, empNo);
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 4 : // 참조 문서
				
				sql = prop.getProperty("listCount4");

				pstmt = con.prepareStatement(sql);
				
				int intlength2 = (int)(Math.log10(empNo)+1);
				
				pstmt.setString(1, Integer.toString(empNo));
				
				pstmt.setInt(2, intlength2);

				rset = pstmt.executeQuery();
				
				break;
				
			}

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return listCount;

	}

	/**
	 * 1. 메소드명 : selectList
	 * 2. 작성일 : 2020. 2. 17. 오전 11:23:31
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 리스트 불러오는 메소드 , 결제 타입별로 바뀔수도!
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<cBoard> selectList(Connection con, int currentPage, int limit, int type, int empNo) {
		
		ArrayList<cBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		String sql = "";
		int startRow = 0;
		int endRow = 0;
		
		try {
			
			switch(type) {
			
			case 0: // 내가 올린 결재
				
				sql = prop.getProperty("selectList0");
				
				pstmt = con.prepareStatement(sql);
				
				startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
				endRow = startRow + limit -1;
				
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, empNo);
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 1: // 결재할 문서
				
				sql = prop.getProperty("selectList1");
				
				pstmt = con.prepareStatement(sql);
				
				startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
				endRow = startRow + limit -1;
				
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				
				int intlength = (int)(Math.log10(empNo)+1);
				
				pstmt.setString(3, Integer.toString(empNo));
				pstmt.setInt(4, intlength);
				pstmt.setString(5, Integer.toString(empNo));
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 2: // 결재 완료 문서
				
				sql = prop.getProperty("selectList2");
				
				pstmt = con.prepareStatement(sql);
				
				startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
				endRow = startRow + limit -1;
				
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 3 : // 반려된 문서
				
				sql = prop.getProperty("selectList3");
				
				pstmt = con.prepareStatement(sql);
				
				startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
				endRow = startRow + limit -1;
				
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, empNo);
				
				rset = pstmt.executeQuery();
				
				break;
				
			case 4 :
				
				sql = prop.getProperty("selectList4");
				
				pstmt = con.prepareStatement(sql);
				
				startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
				endRow = startRow + limit -1;
				
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				
				int intlength2 = (int)(Math.log10(empNo)+1);
				
				pstmt.setString(3, Integer.toString(empNo));
				pstmt.setInt(4, intlength2);
				
				rset = pstmt.executeQuery();
				
				break;
				
			}

			list = new ArrayList<cBoard>();
			
			while(rset.next()) {
				cBoard b = new cBoard();
				
				b.setcBno(rset.getInt("CBNO"));
				b.setCbsecType(rset.getInt("CBSECTYPE"));
				b.setcBtitle(rset.getString("BTITLE"));
				b.setcBcontent(rset.getString("CBCONTENT"));
				b.setcBwriter(rset.getString("USERNAME"));
				b.setcBcount(rset.getInt("CBCOUNT"));
				b.setcBdate(rset.getDate("CBDATE"));
				b.setcBoardfile(rset.getString("CBOARDFILE"));
				
				list.add(b);
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
	 * 1. 메소드명 : selectOne
	 * 2. 작성일 : 2020. 2. 17. 오후 12:30:30
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 게시물 불러오기
	 * @param con
	 * @param bno
	 * @return
	 */
	public cBoard selectOne(Connection con, int bno) {
		
		cBoard b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new cBoard();
				
				b.setcBno(bno);
				b.setCbsecType(rset.getInt("CBSECTYPE"));
				b.setcBtitle(rset.getString("BTITLE"));
				b.setcBcontent(rset.getString("CBCONTENT"));
				b.setcBwriter(rset.getString("USERNAME"));
				b.setBwriterId(rset.getString("CBWRITERID"));
				b.setcBcount(rset.getInt("CBCOUNT"));
				b.setcBoardfile(rset.getString("CBOARDFILE"));
				b.setcBdate(rset.getDate("CBDATE"));
				b.setKeepingDoc(rset.getInt("KEEPINGDOC"));
				
				b.setCheckList(rset.getString("CHECKLIST"));
				b.setReferList(rset.getString("REFERLIST"));
				b.setConfirm(rset.getString("CONFIRM"));
				
				b.setOptionCheck(rset.getString("OPTIONCHECK"));
				b.setOptionApproval(rset.getString("OPTIONAPPROVAL"));
				b.setDenyEmpNo(rset.getString("DENYEMP_NO"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return b;
	}

	/**
	 * 1. 메소드명 : insertBoard
	 * 2. 작성일 : 2020. 2. 17. 오후 10:37:10
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 결재 게시물 저장
	 * @param con
	 * @param cb
	 * @return
	 */
	public int insertBoard(Connection con, cBoard cb) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cb.getCbsecType());
			pstmt.setString(2, cb.getcBtitle());
			pstmt.setString(3, cb.getcBcontent());
			pstmt.setString(4, cb.getcBwriter());
			
			pstmt.setString(5, cb.getCheckList());
			pstmt.setString(6, cb.getReferList());
			pstmt.setString(7, cb.getConfirm());
			pstmt.setInt(8, cb.getKeepingDoc());
			pstmt.setString(9, cb.getcBoardfile());
			pstmt.setString(10, cb.getBwriterId());
			
			pstmt.setNull(11, java.sql.Types.NULL);
			pstmt.setNull(12, java.sql.Types.NULL);
			pstmt.setNull(13, java.sql.Types.NULL);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1. 메소드명 : confirmChecking
	 * 2. 작성일 : 2020. 2. 18. 오후 8:14:32
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 체크완료 실행메소드
	 * @param con
	 * @param bno
	 * @return
	 */
	public int confirmChecking(Connection con, int bno,int empCount) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("confirmChecking");
		
		String count = "";
		
		for(int i=0; empCount>i; i++) {
			count += "Y ";
		}
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, count);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1. 메소드명 : denyConfirmDoc
	 * 2. 작성일 : 2020. 2. 18. 오후 9:00:42
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 디나이
	 * @param con
	 * @param bno
	 * @param denyEmpNo
	 * @return
	 */
	public int denyConfirmDoc(Connection con, int bno, int denyEmpNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("denyConfirmDoc");
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "N");
			pstmt.setInt(2, denyEmpNo);
			pstmt.setInt(3, bno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1. 메소드명 : confirmAppcomp
	 * 2. 작성일 : 2020. 2. 18. 오후 9:07:14
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 찐 완료 완료 메소드
	 * @param con
	 * @param bno
	 * @return
	 */
	public int confirmAppcomp(Connection con, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("confirmAppcomp");
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "Y");
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 1. 메소드명 : updateReadCount
	 * 2. 작성일 : 2020. 2. 18. 오후 9:19:34
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 조회수 증가 카운트
	 * @param con
	 * @param bno
	 * @return
	 */
	public int updateReadCount(Connection con, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReadCount");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * 1. 메소드명 : getSearchListCount
	 * 2. 작성일 : 2020. 2. 19. 오전 10:23:26
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 서치용 페이징처리 메소드
	 * @param con
	 * @param type
	 * @param empNo
	 * @param category
	 * @param keyword
	 * @return
	 */
	public int getSearchListCount(Connection con, int type, int empNo, String category, String keyword) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = "";
		
		try {
		
			switch(type) {
			
			case 0 : // 내가 올린 결재
				
				switch(category) {
				
				case "writer" : // 작성자
					
					sql = prop.getProperty("listCount0writer");
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					pstmt.setString(2, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
				
				case "title" :	// 제목
					
					sql = prop.getProperty("listCount0title");
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					pstmt.setString(2, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :	// 문서번호
					
					sql = prop.getProperty("listCount0docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					pstmt.setInt(2, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
					
				}
				
				break;
				
			case 1 : // 결재할 문서
				
				switch(category) {
				
				case "writer" : // 작성자
					
					sql = prop.getProperty("listCount1writer");
					
					pstmt = con.prepareStatement(sql);
					
					int intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength);
					
					pstmt.setString(3, keyword);
					
					pstmt.setString(4, Integer.toString(empNo));
					
					pstmt.setString(5, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
				
				case "title" :	// 제목
					
					sql = prop.getProperty("listCount1title");
					
					pstmt = con.prepareStatement(sql);
					
					int intlength2 = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength2);
					
					pstmt.setString(3, keyword);
					
					pstmt.setString(4, Integer.toString(empNo));
					
					pstmt.setString(5, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :	// 문서번호
					
					sql = prop.getProperty("listCount1docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					int intlength3 = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength3);
					
					pstmt.setInt(3, Integer.parseInt(keyword));
					
					pstmt.setString(4, Integer.toString(empNo));
					
					pstmt.setInt(5, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
					
				}
				
				break;

			case 2 : // 결재 완료 문서
				
				switch(category) {
				
				case "writer" : 
					
					sql = prop.getProperty("listCount2writer");

					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "title" : 
					
					sql = prop.getProperty("listCount2title");

					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" : 
					
					sql = prop.getProperty("listCount2docnumber");

					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
				}
				
				break;
				
			case 3 : // 반려된 문서
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("listCount3writer");

					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					
					pstmt.setString(2, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
				
				case "title" : 
					
					sql = prop.getProperty("listCount3title");

					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					
					pstmt.setString(2, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :
					
					sql = prop.getProperty("listCount3docnumber");

					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					
					pstmt.setInt(2, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
				
				}

				break;
				
			case 4 : // 참조 문서
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("listCount4writer");

					pstmt = con.prepareStatement(sql);
					
					int intlength1 = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength1);
					
					pstmt.setString(3, keyword);

					rset = pstmt.executeQuery();
					
					break;
				
				case "title" :
					
					sql = prop.getProperty("listCount4title");

					pstmt = con.prepareStatement(sql);
					
					int intlength2 = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength2);
					
					pstmt.setString(3, keyword);

					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" : 
					
					sql = prop.getProperty("listCount4docnumber");

					pstmt = con.prepareStatement(sql);
					
					int intlength3 = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength3);
					
					pstmt.setInt(3, Integer.parseInt(keyword));

					rset = pstmt.executeQuery();
					
					break;

				}
				
				break;
				
			}

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	/**
	 * 1. 메소드명 : selectSearchList
	 * 2. 작성일 : 2020. 2. 19. 오전 10:23:51
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 서치용 리스트 처리 메소드
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @param type
	 * @param empNo
	 * @param category
	 * @param keyword
	 * @return
	 */
	public ArrayList<cBoard> selectSearchList(Connection con, int currentPage, int limit, int type, int empNo,
			String category, String keyword) {
		
		ArrayList<cBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		String sql = "";
		int startRow = 0;
		int endRow = 0;
		
		int intlength = 0;
		
		try {
			
			switch(type) {
			
			case 0: // 내가 올린 결재
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("selectList0writer");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, empNo);
					pstmt.setString(4, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "title" :
					
					sql = prop.getProperty("selectList0title");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, empNo);
					pstmt.setString(4, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :
					
					sql = prop.getProperty("selectList0docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, empNo);
					pstmt.setInt(4, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
					
				}

				break;
				
			case 1: // 결재할 문서
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("selectList1writer");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					
					intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(3, Integer.toString(empNo));
					pstmt.setInt(4, intlength);
					
					pstmt.setString(5, keyword);
					
					pstmt.setString(6, Integer.toString(empNo));
					
					pstmt.setString(7, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "title" :
					
					sql = prop.getProperty("selectList1title");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					
					intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(3, Integer.toString(empNo));
					pstmt.setInt(4, intlength);
					
					pstmt.setString(5, keyword);
					
					pstmt.setString(6, Integer.toString(empNo));
					
					pstmt.setString(7, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :
					
					sql = prop.getProperty("selectList1docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					
					intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(3, Integer.toString(empNo));
					pstmt.setInt(4, intlength);
					
					pstmt.setInt(5, Integer.parseInt(keyword));
					
					pstmt.setString(6, Integer.toString(empNo));
					
					pstmt.setInt(7, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
				
				}
				
				break;
				
			case 2: // 결재 완료 문서
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("selectList2writer");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setString(3, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "title" :
					
					sql = prop.getProperty("selectList2title");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setString(3, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :
					
					sql = prop.getProperty("selectList2docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
				
				}

				break;
				
			case 3 : // 반려된 문서
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("selectList3writer");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, empNo);
					pstmt.setString(4, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "title" :
					
					sql = prop.getProperty("selectList3title");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, empNo);
					pstmt.setString(4, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :
					
					sql = prop.getProperty("selectList3docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, empNo);
					pstmt.setInt(4, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
				
				}

				break;
				
			case 4 :
				
				switch(category) {
				
				case "writer" :
					
					sql = prop.getProperty("selectList4writer");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					
					intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(3, Integer.toString(empNo));
					pstmt.setInt(4, intlength);
					
					pstmt.setString(5, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "title" :
					
					sql = prop.getProperty("selectList4title");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					
					intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(3, Integer.toString(empNo));
					pstmt.setInt(4, intlength);
					
					pstmt.setString(5, keyword);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case "docnumber" :
					
					sql = prop.getProperty("selectList4docnumber");
					
					pstmt = con.prepareStatement(sql);
					
					startRow = (currentPage-1)*limit + 1;	// 1, 11	1 10, 11 20
					endRow = startRow + limit -1;
					
					pstmt.setInt(1, endRow);
					pstmt.setInt(2, startRow);
					
					intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(3, Integer.toString(empNo));
					pstmt.setInt(4, intlength);
					
					pstmt.setInt(5, Integer.parseInt(keyword));
					
					rset = pstmt.executeQuery();
					
					break;
				
				}

				break;
				
			}

			list = new ArrayList<cBoard>();
			
			while(rset.next()) {
				cBoard b = new cBoard();
				
				b.setcBno(rset.getInt("CBNO"));
				b.setCbsecType(rset.getInt("CBSECTYPE"));
				b.setcBtitle(rset.getString("BTITLE"));
				b.setcBcontent(rset.getString("CBCONTENT"));
				b.setcBwriter(rset.getString("USERNAME"));
				b.setcBcount(rset.getInt("CBCOUNT"));
				b.setcBdate(rset.getDate("CBDATE"));
				b.setcBoardfile(rset.getString("CBOARDFILE"));
				
				list.add(b);
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
	 * 메인페이지 카운트 보이게하기
	 * @param con
	 * @return
	 */
	public ArrayList<Integer> confirmView(Connection con, int empNo) {
		
		int listCount = 0;
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = "";
		
		try {
			
			for(int i=0; 5>i; i++) {
				
				switch(i) {
				
				case 0 : // 내가 올린 결재
					
					sql = prop.getProperty("listCount0");
	
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case 1 : // 결재할 문서
					
					sql = prop.getProperty("listCount1");
					
					pstmt = con.prepareStatement(sql);
					
					int intlength = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength);
					
					pstmt.setString(3, Integer.toString(empNo));
					
					rset = pstmt.executeQuery();
					
					break;
					
				case 2 : // 결재 완료 문서
					
					sql = prop.getProperty("listCount2");
	
					pstmt = con.prepareStatement(sql);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case 3 : // 반려된 문서
					
					sql = prop.getProperty("listCount3");
	
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, empNo);
					
					rset = pstmt.executeQuery();
					
					break;
					
				case 4 : // 참조 문서
					
					sql = prop.getProperty("listCount4");
	
					pstmt = con.prepareStatement(sql);
					
					int intlength2 = (int)(Math.log10(empNo)+1);
					
					pstmt.setString(1, Integer.toString(empNo));
					
					pstmt.setInt(2, intlength2);
	
					rset = pstmt.executeQuery();
					
					break;
					
				}
			
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
				
				list.add(listCount);
			}
			
		}catch (SQLException e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	/**
	 * 인사관리 보여지는 게시물
	 * @param con
	 * @param empNo
	 * @param type
	 * @return
	 */
	public ArrayList<cBoard> confirmHumanview(Connection con, int empNo, int type) {
		
		ArrayList<cBoard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		
		String sql = "";
		
		try {
			
			sql = prop.getProperty("selectList11");
			
			pstmt = con.prepareStatement(sql);
			
			int intlength = (int)(Math.log10(empNo)+1);
			
			pstmt.setString(1, Integer.toString(empNo));
			pstmt.setInt(2, intlength);
			pstmt.setString(3, Integer.toString(empNo));
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<cBoard>();
			
			while(rset.next()) {
				cBoard b = new cBoard();
				
				b.setcBno(rset.getInt("CBNO"));
				b.setCbsecType(rset.getInt("CBSECTYPE"));
				b.setcBtitle(rset.getString("BTITLE"));
				b.setcBcontent(rset.getString("CBCONTENT"));
				b.setcBwriter(rset.getString("USERNAME"));
				b.setcBcount(rset.getInt("CBCOUNT"));
				b.setcBdate(rset.getDate("CBDATE"));
				b.setcBoardfile(rset.getString("CBOARDFILE"));
				
				list.add(b);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
