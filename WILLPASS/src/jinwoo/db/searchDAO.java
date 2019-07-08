package jinwoo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

	public ArrayList<checkDTO> startcheck(String startLine) {
		ArrayList<checkDTO> list= new ArrayList();
		try {
			con=ds.getConnection();
			String sql="select * from airport where startvalue=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, startLine);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				checkDTO dto=new checkDTO();
				dto.setStartLine(rs.getString("startLine"));
				dto.setStartvalue(rs.getString("Startvalue"));
				dto.setEndLine(rs.getString("endLine"));
				dto.setEndvalue(rs.getString("endvalue"));
				dto.setInternational(rs.getString("international"));
				
				list.add(dto);
			}
			
			free();
		} catch (Exception e) {
			System.out.println("출발지 검색 오류 "+e.getMessage());
		}
		return list;
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

}
