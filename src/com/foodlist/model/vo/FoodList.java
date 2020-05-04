package com.foodlist.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class FoodList implements Serializable{
	
	private int no;
	private String day;
	private String rice;
	private String soup;
	private String mainfood;

	public FoodList() {}

	public FoodList(String day, String rice, String soup, String mainfood) {
		this.day = day;
		this.rice = rice;
		this.soup = soup;
		this.mainfood = mainfood;
	}

	public FoodList(int no, String day, String rice, String soup, String mainfood) {
		this.no = no;
		this.day = day;
		this.rice = rice;
		this.soup = soup;
		this.mainfood = mainfood;
	}

	public String getDay() {
		return day;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getRice() {
		return rice;
	}

	public void setRice(String rice) {
		this.rice = rice;
	}

	public String getSoup() {
		return soup;
	}

	public void setSoup(String soup) {
		this.soup = soup;
	}

	public String getMainfood() {
		return mainfood;
	}

	public void setMainfood(String mainfood) {
		this.mainfood = mainfood;
	}

	@Override
	public String toString() {
		return "FoodList [day=" + day + ", rice=" + rice + ", soup=" + soup + ", mainfood=" + mainfood + "]";
	}

	
	
}
