package com.foodlist.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.member.common.JDBCTemplate.*;
import com.foodlist.model.vo.FoodList;

public class FoodDao {

	private Properties prop;
	
	public FoodDao() {
		
		 prop = new Properties();
	      
	      String filePath = FoodDao.class.getResource("/config/foodlist-query.properties").getPath();
	      
	      try {
	         prop.load(new FileReader(filePath));
	      } catch(FileNotFoundException e) {
	         e.printStackTrace();
	      } catch(IOException e){
	         e.printStackTrace();
	      } 
		
	}

	public int insertFood(Connection con, FoodList fl) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertfoodlist");
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, fl.getDay());
			pstmt.setString(2, fl.getRice());
			pstmt.setString(3, fl.getSoup());
			pstmt.setString(4, fl.getMainfood());


			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<FoodList> foodList(Connection con,int currentPage,int limit) {

		ArrayList<FoodList> list = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		FoodList fl = null;
		
		try {
		
			String sql = prop.getProperty("selectlist");

			list = new ArrayList<FoodList>();
			
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
			
				fl = new FoodList();
				
				fl.setNo(rset.getInt("F_NO"));
				fl.setDay(rset.getString("F_DATE"));
				fl.setRice(rset.getString("F_RICE"));
				fl.setSoup(rset.getString("F_SOUP"));
				fl.setMainfood(rset.getString("F_MAINFOOD"));
				
				list.add(fl);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);	
			close(pstmt);
		}
		return list;
	}

	public int updateFood(Connection con, FoodList fl) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updatefood");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, fl.getDay());
			pstmt.setString(2, fl.getRice());
			pstmt.setString(3, fl.getSoup());
			pstmt.setString(4, fl.getMainfood());
			pstmt.setInt(5, fl.getNo());
		
			result = pstmt.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

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

	public ArrayList<FoodList> foodSearchList(Connection con, String category,String keyword) {

		ArrayList<FoodList> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(category) {
		
		case "day":sql=prop.getProperty("searchlist"); break;
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,keyword);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<FoodList>();
			
		while(rset.next()) {
			FoodList f = new FoodList();
				
				f.setNo(rset.getInt("F_NO"));
				f.setDay(rset.getString("F_DATE"));
				f.setRice(rset.getString("F_RICE"));
				f.setSoup(rset.getString("F_SOUP"));
				f.setMainfood(rset.getString("F_MAINFOOD"));
					list.add(f);
					
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<FoodList> fooddayList(Connection con) {

		Statement stmt = null;
		ArrayList<FoodList> list = null;
		ResultSet rset = null;
		
       String sql = prop.getProperty("dayfood");
		
		try {
		
		stmt = con.createStatement();	
			
		rset = stmt.executeQuery(sql);	
			
		list = new ArrayList<FoodList>();
		
		while(rset.next()) {
			FoodList f = new FoodList();
				
				f.setNo(rset.getInt("F_NO"));
				f.setDay(rset.getString("F_DATE"));
				f.setRice(rset.getString("F_RICE"));
				f.setSoup(rset.getString("F_SOUP"));
				f.setMainfood(rset.getString("F_MAINFOOD"));
					list.add(f);
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int foodDayDupCheck(Connection con, String daycheck) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("foodDayCheck");
		ResultSet rset = null;
		
		try {

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, daycheck);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				// -1 : 에러!
				// 0 : id중복 사용자 없음
				// 1 : id를 누군가 이미 사용 중임
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return result;
	}
}
