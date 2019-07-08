package net.reservation.db;

public class PassengerDTO {

	
	private String pagender; //탑승자성별
	private String pafname; //탑승자 familyname
	private String paname; //탑승자 givenname
	private String paretel; //예약자 전화번호
	private String pareemail; //예역자 이메일
	
	public PassengerDTO() {
		// TODO Auto-generated constructor stub
	}

	public PassengerDTO(String pagender, String pafname, String paname, String paretel, String pareemail) {
		super();
		this.pagender = pagender;
		this.pafname = pafname;
		this.paname = paname;
		this.paretel = paretel;
		this.pareemail = pareemail;
	}
	public String getPagender() {
		return pagender;
	}
	public void setPagender(String pagender) {
		this.pagender = pagender;
	}
	public String getPafname() {
		return pafname;
	}
	public void setPafname(String pafname) {
		this.pafname = pafname;
	}
	public String getPaname() {
		return paname;
	}
	public void setPaname(String paname) {
		this.paname = paname;
	}
	public String getParetel() {
		return paretel;
	}
	public void setParetel(String paretel) {
		this.paretel = paretel;
	}
	public String getPareemail() {
		return pareemail;
	}
	public void setPareemail(String pareemail) {
		this.pareemail = pareemail;
	}
	
	
}
