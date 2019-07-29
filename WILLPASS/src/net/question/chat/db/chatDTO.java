package net.question.chat.db;

import java.sql.Timestamp;

public class chatDTO {
	
	
	private String user_email;
	private String 	chat_content;
	private Timestamp chat_date;
	private int chat_no;
	private boolean chat_who;
	public String getUser_email() {
		return user_email;
	}
	public String getChat_content() {
		return chat_content;
	}
	public Timestamp getChat_date() {
		return chat_date;
	}
	public int getChat_no() {
		return chat_no;
	}
	public boolean isChat_who() {
		return chat_who;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public void setChat_date(Timestamp chat_date) {
		this.chat_date = chat_date;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public void setChat_who(boolean chat_who) {
		this.chat_who = chat_who;
	}
	
	

}
