package net.search.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class searchDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	public searchDAO() {
		try {
			Context ctx=new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/willpass");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void free() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close(); 
		} catch (Exception e) {
			System.out.println("자원해제 오류 "+e.getMessage());
		}
	}

	public ArrayList<searchCityDTO> citycheck(String city) {
		ArrayList<searchCityDTO> list= new ArrayList();
		try {
			con=ds.getConnection();
			String sql="select * from airport where city like ? or airport like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+city+"%");
			pstmt.setString(2, "%"+city+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				searchCityDTO dto=new searchCityDTO();
				dto.setAirport(rs.getString("airport"));
				dto.setIata(rs.getString("iata"));
				dto.setIcao(rs.getString("icao"));
				dto.setCountry(rs.getString("country"));
				dto.setCity(rs.getString("city"));
				
				list.add(dto);
				
			}
			
			
			free();
		} catch (Exception e) {
			System.out.println("출발지 검색 오류 "+e.getMessage());
		}
		return list;
	}
	public String linecheck(String city) {
		String airport="";
		try {
			con=ds.getConnection();
			String city_1=city.split("\\[")[0];
			String city_2=city.split("\\[")[1].split("\\]")[0];
			String sql="select * from airport where city=? and airport=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,city_1);
			pstmt.setString(2,city_2);
			rs=pstmt.executeQuery();
			
			rs.next();
				
				
			airport=rs.getString("icao");
				
			
			
			
			free();
		} catch (Exception e) {
			System.out.println("공항검색 오류 "+e.getMessage());
		}
		return airport;
	}

	
	public void insertCode(String airport,String aircode,String airportcode,String country){
		try {
			con=ds.getConnection();
			
			String sql = "INSERT INTO airline(airline, iata, icao, country) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, airport);
			pstmt.setString(2, aircode);
			pstmt.setString(3, airportcode);
			pstmt.setString(4, country);
//			String sql = "delete from airline where airline=?";
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setString(1, airport);
			
			pstmt.executeUpdate();
			
			free();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	public String flightcheck(String airline) {
		String flight="";
		try {
			con=ds.getConnection();
			
			String sql = "select * from airline where replace(airline, ' ', '')=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, airline);
			
			rs=pstmt.executeQuery();
			rs.next();
			flight=rs.getString("iata");
			
			free();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return flight;
	}
	public timeDTO timecheck(String sfFlight, String date) {
		timeDTO vo=new timeDTO();

		
		String yy=date.substring(0,4);
		String mm=date.substring(4,6);
		String dd=date.substring(6);
		
		String departure_time="";
		String arrival_time="";
		String time="";
		
		
		
		try {
			Document flight = Jsoup.connect("https://www.flightstats.com/v2/flight-details/"+sfFlight+"?year="+yy+"&month="+mm+"&date="+dd).post();
			Elements timeblock=flight.getElementsByClass("timeBlock");
			
			departure_time=timeblock.get(0).children().last().text();
			arrival_time=timeblock.get(4).children().last().text();
			time=flight.getElementsByClass("flightTimeBlock").get(0).children().last().text();
			time=time.replace("h", "시간");
			time=time.replace("m", "분");
					
					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		vo.setDeparture_time(departure_time);
		vo.setArrival_time(arrival_time);
		vo.setTime(time);
		
		free();
		return vo;
		
	}
	public int seatcheck(java.sql.Date date, String sFlight) {
		int cnt=0;
		try {
			con=ds.getConnection();
			
			String sql = "select count(*) cnt from reservationtbl where reser_date=? and reser_flight=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setDate(1, date);
			pstmt.setString(2, sFlight);
			
			rs=pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
			free();
		} catch (Exception e) {
			System.out.println("seatcheck 오류");
			e.printStackTrace();
			
		}
		
		return cnt;
	}

}
