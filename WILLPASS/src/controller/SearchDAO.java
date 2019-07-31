package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	public SearchDAO() {
		try {
			Context ctx=new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/willpass");
			System.out.println("생성자실행");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("생성자오류");
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

	
	public String internationalCheck(String c2) {
		String id="";
		try {
			con=ds.getConnection();
			String sql="select * from airport where endvalue=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, c2);
			rs=pstmt.executeQuery();
			
			rs.next();
			id=rs.getString("international");
			free();
		} catch (Exception e) {
			System.out.println("도착지 검색 오류 "+e.getMessage());
		}
		return id;
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
			
			String sql = "select * from airline where airline=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, airline);
			
			rs=pstmt.executeQuery();
			rs.next();
			flight=rs.getString("IATA");
			
			free();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return flight;
	}
	
	public int pricecheck(String airline) {
		int price = 0;
		
		try {
			con=ds.getConnection();
			String sql = "select * from price where airline=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, airline);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				price=rs.getInt("price");
			}else{
				price= 400;
			}
			free();
		} catch (Exception e) {
			System.out.println("오류남:" + e);
			
		}
		return price;
	}

}
