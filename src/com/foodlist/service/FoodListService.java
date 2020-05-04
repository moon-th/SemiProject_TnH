package com.foodlist.service;
import com.foodlist.model.dao.FoodDao;
import com.foodlist.model.vo.FoodList;
import com.member.common.JDBCTemplate.*;
import static com.member.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class FoodListService {

	private FoodDao fDao = new FoodDao();
	
	public void insertFood(FoodList fl) {

		Connection con = getConnection();
		
		int result = fDao.insertFood(con,fl);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		
	}

	public ArrayList<FoodList> foodList(int currentPage, int limit) {

		Connection con = getConnection();
		
		ArrayList<FoodList> list = fDao.foodList(con,currentPage,limit);
		
		close(con);
		
		return list;
		
	}

	public void updateFood(FoodList fl) {
		
		Connection con = getConnection();
		
		int result = fDao.updateFood(con,fl);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int result = fDao.getListCount(con);

		close(con);
		
		return result;
	}

	public ArrayList<FoodList> foodSeachList(String category, String keyword) {

			Connection con = getConnection();
		
		ArrayList<FoodList> list = fDao.foodSearchList(con,category,keyword);
		
		close(con);
		
		return list;
		
		
	}
	
	public ArrayList<FoodList> fooddayList() {

		Connection con = getConnection();
	
	ArrayList<FoodList> list = fDao.fooddayList(con);
	
	close(con);
	
	return list;
	
	
}

	public int foodDayDupCheck(String daycheck) {
		
		Connection con = getConnection();
		
		int result = fDao.foodDayDupCheck(con,daycheck);
		
		close(con);
		
		return result;
	}

	
	
	
	
	
}
