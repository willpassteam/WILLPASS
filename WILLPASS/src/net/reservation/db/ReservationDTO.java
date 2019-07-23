package net.reservation.db;

import java.sql.Date;

public class ReservationDTO {
	
	  private int reser_num;//에약번호 
	  private String  reser_Starting; //출발지
	  private String reser_destination; //도착지
	  private String reser_departure_time; //출발시간
	  private String reser_arrival_time; //도착시간 
	  private String reser_airline; //항공사
	  private String reser_flight; //항공편
	  private int reser_price; //가격
	  private String reser_reserved_seat; //좌석번호
	  private int reser_round_trip; //왕복 편도 여부 
	  private String reser_email; //예약자 이메일
	  private String reser_gender; //탑승자 성별 
	  private String reser_familyname; // 탑승자이름 
	  private String reser_givenname; //탑승자 이름 
	  private Date reser_date;//탑승일
	  

	  public ReservationDTO() {
		// TODO Auto-generated constructor stub
	}
	  
	public ReservationDTO(String reser_familyname, String reser_gender, Date reser_date, String reser_givenname,
			String reser_email, String reser_airline, String reser_flight, String reser_departure_time,
			String reser_Starting, String reser_destination, String reser_arrival_time, int reser_price,
			String reser_reserved_seat, int reser_round_trip) {
		super();
		this.reser_familyname = reser_familyname;
		this.reser_gender = reser_gender;
		this.reser_date = reser_date;
		this.reser_givenname = reser_givenname;
		this.reser_email = reser_email;
		this.reser_airline = reser_airline;
		this.reser_flight = reser_flight;
		this.reser_departure_time = reser_departure_time;
		this.reser_Starting = reser_Starting;
		this.reser_destination = reser_destination;
		this.reser_arrival_time = reser_arrival_time;
		this.reser_price = reser_price;
		this.reser_reserved_seat = reser_reserved_seat;
		this.reser_round_trip = reser_round_trip;
	}
	
	public ReservationDTO(String reser_familyname, String reser_gender, Date reser_date, String reser_givenname,
			String reser_email, String reser_airline, String reser_flight, String reser_departure_time,
			String reser_Starting, String reser_destination, String reser_arrival_time, int reser_price,
			String reser_reserved_seat) {
		super();
		this.reser_familyname = reser_familyname;
		this.reser_gender = reser_gender;
		this.reser_date = reser_date;
		this.reser_givenname = reser_givenname;
		this.reser_email = reser_email;
		this.reser_airline = reser_airline;
		this.reser_flight = reser_flight;
		this.reser_departure_time = reser_departure_time;
		this.reser_Starting = reser_Starting;
		this.reser_destination = reser_destination;
		this.reser_arrival_time = reser_arrival_time;
		this.reser_price = reser_price;
		this.reser_reserved_seat = reser_reserved_seat;
		
	}
	
	
	public int getReser_num() {
		return reser_num;
	}

	public void setReser_num(int reser_num) {
		this.reser_num = reser_num;
	}

	public Date getReser_date() {
		return reser_date;
	}
	public void setReser_date(Date reser_date) {
		this.reser_date = reser_date;
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
	public String getReser_departure_time() {
		return reser_departure_time;
	}
	public void setReser_departure_time(String reser_departure_time) {
		this.reser_departure_time = reser_departure_time;
	}
	public String getReser_arrival_time() {
		return reser_arrival_time;
	}
	public void setReser_arrival_time(String reser_arrival_time) {
		this.reser_arrival_time = reser_arrival_time;
	}
	public String getReser_airline() {
		return reser_airline;
	}
	public void setReser_airline(String reser_airline) {
		this.reser_airline = reser_airline;
	}
	public String getReser_flight() {
		return reser_flight;
	}
	public void setReser_flight(String reser_flight) {
		this.reser_flight = reser_flight;
	}
	public int getReser_price() {
		return reser_price;
	}
	public void setReser_price(int reser_price) {
		this.reser_price = reser_price;
	}
	public String getReser_reserved_seat() {
		return reser_reserved_seat;
	}
	public void setReser_reserved_seat(String reser_reserved_seat) {
		this.reser_reserved_seat = reser_reserved_seat;
	}

	public int getReser_round_trip() {
		return reser_round_trip;
	}

	public void setReser_round_trip(int reser_round_trip) {
		this.reser_round_trip = reser_round_trip;
	}

	public String getReser_email() {
		return reser_email;
	}
	public void setReser_email(String reser_email) {
		this.reser_email = reser_email;
	}
	public String getReser_gender() {
		return reser_gender;
	}
	public void setReser_gender(String reser_gender) {
		this.reser_gender = reser_gender;
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
	  
	  

}
