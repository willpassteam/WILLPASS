package net.search.db;

import java.sql.Date;

public class searchDTO {
	private String starting;	//출발지
	private String destination;	//목적지
	private Date date;			//날짜
	private String departure_time;	//출발 시간
	private String arrival_time;	//도착 시간
	private String people;		//인원
	private String airline;		//항공사
	private String flight;		//항공편
	private String time;		//소요시간
	private boolean round_trip;	//왕복 편도 (왕복시 출발 번호 매칭)
	private int price;			//금액
	private boolean checkseat;	//예약가능 여부
	private int leftseat;		//여유좌석
	
	public String getStarting() {
		return starting;
	}
	public void setStarting(String starting) {
		this.starting=starting;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getFlight() {
		return flight;
	}
	public void setFlight(String flight) {
		this.flight = flight;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public boolean isRound_trip() {
		return round_trip;
	}
	public void setRound_trip(boolean round_trip) {
		this.round_trip = round_trip;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isCheckseat() {
		return checkseat;
	}
	public void setCheckseat(boolean checkseat) {
		this.checkseat = checkseat;
	}
	public int getLeftseat() {
		return leftseat;
	}
	public void setLeftseat(int leftseat) {
		this.leftseat = leftseat;
	}

}
