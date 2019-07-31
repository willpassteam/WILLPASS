package net.reservationcheck.db;

import java.sql.Date;

public class ReserResultDTO {

	  private int reser_num;//에약번호 
	  private String  reser_Starting; //출발지
	  private String reser_destination; //도착지
	  private String reser_familyname; // 탑승자이름 
	  private String reser_givenname; //탑승자 이름 
	  private String reser_date;//탑승일
	  
	  public ReserResultDTO() {
		// TODO Auto-generated constructor stub
	}
	  
	  
	  
	public ReserResultDTO(int reser_num, String reser_Starting, String reser_destination, String reser_familyname,
			String reser_givenname, String reser_date) {
		super();
		this.reser_num = reser_num;
		this.reser_Starting = reser_Starting;
		this.reser_destination = reser_destination;
		this.reser_familyname = reser_familyname;
		this.reser_givenname = reser_givenname;
		this.reser_date = reser_date;
	}



	public int getReser_num() {
		return reser_num;
	}
	public void setReser_num(int reser_num) {
		this.reser_num = reser_num;
	}
	public String getReser_Starting() {
		return reser_Starting;
	}
	public void setReser_Starting(String reser_Starting) {
		this.reser_Starting = reser_Starting;
	}
	public String getReser_destination() {
		return reser_destination;
	}
	public void setReser_destination(String reser_destination) {
		this.reser_destination = reser_destination;
	}
	public String getReser_familyname() {
		return reser_familyname;
	}
	public void setReser_familyname(String reser_familyname) {
		this.reser_familyname = reser_familyname;
	}
	public String getReser_givenname() {
		return reser_givenname;
	}
	public void setReser_givenname(String reser_givenname) {
		this.reser_givenname = reser_givenname;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	  
	  
	
	
}
