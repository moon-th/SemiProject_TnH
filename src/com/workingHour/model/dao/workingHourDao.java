package com.workingHour.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.member.common.JDBCTemplate.*;

import com.workingHour.model.vo.workingHour;

public class workingHourDao {

	private Properties prop;
	
	public workingHourDao() {
		
		prop = new Properties();
		
		String filePath = workingHourDao.class.getResource("/config/workingHour-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 1. 메소드명 : workingHourOpen
	 * 2. 작성일 : 2020. 2. 20. 오후 12:10:58
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 실행시 db에서 근태정보 불러오는 메소드
	 * @param con
	 * @param firstDay
	 * @param empNo
	 * @return
	 */
	public ArrayList<workingHour> workingHourOpen(Connection con, String firstDay, int empNo) {
		
		ArrayList<workingHour> list = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("workingHourOpen");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, firstDay);
			pstmt.setInt(2, empNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<workingHour>();
			
			while(rset.next()) {
				
				workingHour wh = new workingHour();
				
				wh.setWorkDate(rset.getDate("WORK_DATE"));
				
				wh.setWorkType1(rset.getInt("WORK_TYPE1"));
				wh.setWorkType2(rset.getInt("WORK_TYPE2"));
				wh.setWorkType3(rset.getInt("WORK_TYPE3"));
				
				wh.setWorkTime1(rset.getString("WORK_TIME1"));
				wh.setWorkTime2(rset.getString("WORK_TIME2"));
				wh.setWorkTime3(rset.getString("WORK_TIME3"));
				
				wh.setWorkTime11(rset.getString("WORK_TIME1_1"));
				wh.setWorkTime21(rset.getString("WORK_TIME2_1"));
				wh.setWorkTime31(rset.getString("WORK_TIME3_1"));
				
				list.add(wh);
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
	 * 1. 메소드명 : workingHourInsert
	 * 2. 작성일 : 2020. 2. 21. 오전 10:58:30
	 * 3. 작성자 : songinseok
	 * 4. 설명 : 근태 입력 메소드
	 * @param con
	 * @param wh
	 * @return
	 */
	public int workingHourInsert(Connection con, workingHour wh) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("workingHourInsert");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, wh.getWorkNo());
			pstmt.setDate(2, wh.getWorkDate());
			
			pstmt.setInt(3, wh.getWorkType1());
			pstmt.setString(4, wh.getWorkTime1());
			pstmt.setString(5, wh.getWorkTime11());
			
			pstmt.setInt(6, wh.getWorkType2());
			pstmt.setString(7, wh.getWorkTime2());
			pstmt.setString(8, wh.getWorkTime21());
			
			pstmt.setInt(9, wh.getWorkType3());
			pstmt.setString(10, wh.getWorkTime3());
			pstmt.setString(11, wh.getWorkTime31());
			
			pstmt.setString(12, wh.getInputYN());
			
			result = pstmt.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



}
