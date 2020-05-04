package com.message.model.vo;

import java.io.Serializable;

public class Message implements Serializable {

	/**
		 * 
		 */
	private static final long serialVersionUID = 1316799051552507598L;

	private int message_Id;
	private int send_emp_no;
	private String send_emp_name;
	private String send_dept_name;
	private String send_job_name;
	private String send_title;
	private String send_content;
	private String send_date;
	private int receive_emp_no;
	private int readed;
	

	public int getReaded() {
		return readed;
	}

	public void setReaded(int readed) {
		this.readed = readed;
	}

	public int getMessage_Id() {
		return message_Id;
	}

	public void setMessage_Id(int message_Id) {
		this.message_Id = message_Id;
	}

	public int getSend_emp_no() {
		return send_emp_no;
	}

	public void setSend_emp_no(int send_emp_no) {
		this.send_emp_no = send_emp_no;
	}

	public String getSend_emp_name() {
		return send_emp_name;
	}

	public void setSend_emp_name(String send_emp_name) {
		this.send_emp_name = send_emp_name;
	}

	public String getSend_dept_name() {
		return send_dept_name;
	}

	public void setSend_dept_name(String send_dept_name) {
		this.send_dept_name = send_dept_name;
	}

	public String getSend_job_name() {
		return send_job_name;
	}

	public void setSend_job_name(String send_job_name) {
		this.send_job_name = send_job_name;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public int getReceive_emp_no() {
		return receive_emp_no;
	}

	public void setReceive_emp_no(int receive_emp_no) {
		this.receive_emp_no = receive_emp_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public String getSend_title() {
		return send_title;
	}

	public void setSend_title(String send_title) {
		this.send_title = send_title;
	}

	public String getSend_content() {
		return send_content;
	}

	public void setSend_content(String send_content) {
		this.send_content = send_content;
	}

	public Message() {
	}
	

	public Message(int message_Id, int send_emp_no, String send_emp_name, String send_dept_name, String send_job_name,
			String send_title, String send_content, String send_date, int receive_emp_no, int readed) {
		super();
		this.message_Id = message_Id;
		this.send_emp_no = send_emp_no;
		this.send_emp_name = send_emp_name;
		this.send_dept_name = send_dept_name;
		this.send_job_name = send_job_name;
		this.send_title = send_title;
		this.send_content = send_content;
		this.send_date = send_date;
		this.receive_emp_no = receive_emp_no;
		this.readed = readed;
	}

	@Override
	public String toString() {
		return "Message [message_Id=" + message_Id + ", send_emp_no=" + send_emp_no + ", send_emp_name=" + send_emp_name
				+ ", send_dept_name=" + send_dept_name + ", send_job_name=" + send_job_name + ", send_title="
				+ send_title + ", send_content=" + send_content + ", send_date=" + send_date + ", receive_emp_no="
				+ receive_emp_no + "]";
	}



}
