package net.question.chat.db;

import java.sql.Timestamp;

public class chat_refDTO {
	
	private int chat_no; 
	private boolean chat_userjoin,chat_adminjoin;
	private Timestamp chat_adminouttime;
	private String user_email;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getChat_no() {
		return chat_no;
	}
	public boolean isChat_userjoin() {
		return chat_userjoin;
	}
	public boolean isChat_adminjoin() {
		return chat_adminjoin;
	}
	public Timestamp getChat_adminouttime() {
		return chat_adminouttime;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public void setChat_userjoin(boolean chat_userjoin) {
		this.chat_userjoin = chat_userjoin;
	}
	public void setChat_adminjoin(boolean chat_adminjoin) {
		this.chat_adminjoin = chat_adminjoin;
	}
	public void setChat_adminouttime(Timestamp chat_adminouttime) {
		this.chat_adminouttime = chat_adminouttime;
	}
	
	

	
}
