package net.reservationcheck.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.reservation.db.ReservationDTO;

public class RserCheckDAO {

	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs; 
	
	
	public RserCheckDAO() {
		// TODO Auto-generated constructor stub
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
	
	
	public int listcnt(String User_id) {
		
		int count=0;
		try {
			
			con=ds.getConnection();
			String sql ="select count(*) from reservationtbl  where reser_email = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,User_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
			count=rs.getInt(1);
			}
			
			free() ;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("listcnt()에서 오류남"+e);
		}
		
		return count;
	}

	
	public JSONArray showOneReservation(String reser_round_trip){
		JSONArray datarr= new JSONArray();
		JSONArray datarr2= new JSONArray();

		
		try {
			con=ds.getConnection();
			String sql="select * from reservationtbl  where reser_round_trip =  ?" ;
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,reser_round_trip);
			rs=pstmt.executeQuery();
			int count=0;
			while(rs.next()){
				JSONObject data = new JSONObject();
				data.put("reser_familyname",rs.getString("reser_familyname"));
				data.put("reser_airline",rs.getString("reser_airline"));
				data.put("reser_date",rs.getDate("reser_date").toString());
				data.put("reser_departure_time",rs.getString("reser_departure_time"));
				data.put("reser_destination",rs.getString("reser_destination"));
				data.put("reser_flight",rs.getString("reser_flight"));
				data.put("reser_givename",rs.getString("reser_givename"));
				data.put("reser_price",rs.getInt("reser_price"));
				data.put("reser_reserved_seat",rs.getString("reser_reserved_seat"));
				data.put("reser_Starting",rs.getString("reser_Starting"));
				data.put("reser_arrival_time",rs.getString("reser_arrival_time"));
				data.put("reser_givename",rs.getString("reser_givename"));
				datarr.add(count, data);
				count++;
			}
			
		String aa=(String)(((JSONObject)datarr.get(0)).get("reser_Starting"));
		String bb=(String)(((JSONObject)datarr.get(datarr.size()-1)).get("reser_Starting"));
		
		if(aa.equals(bb)){
			for(int i=0;i<datarr.size();i++){
				datarr2.add(((JSONObject)datarr.get(i)).put("isrou", "false"));
			}
			
		}else{
			for(int i=0;i<datarr.size();i++){
			datarr2.add(((JSONObject)datarr.get(i)).put("isrou", "true"));
			}
		}
			
			
	} catch (Exception e) {

	
	System.out.println(" showOneReservation"+e);
	}finally {
		free() ;
	}
	return datarr;
		
	}
	
	public ArrayList showAllReservation(String User_id,int startlist,int listsize){
		
		ArrayList list = new ArrayList();
		ArrayList list2= new ArrayList();
		
		try {
			con=ds.getConnection();
			
			String sql = "select distinct reser_Starting,reser_destination,reser_destination,reser_round_trip , reser_date from reservationtbl where reser_email = ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,User_id);
//			pstmt.setInt(2,startlist);
//			pstmt.setInt(3,listsize);
			
			rs=pstmt.executeQuery();
			
			int count=0;
			while(rs.next()){
		
						ReserResultDTO dto= new ReserResultDTO();
						dto.setReser_Starting(rs.getString("reser_Starting"));
						dto.setReser_destination(rs.getString("reser_destination"));
						dto.setReser_date(rs.getDate("reser_date").toString());
						dto.setReser_round_trip(Integer.parseInt(rs.getString("reser_round_trip")));
					
						list.add(dto);			
						
					}
					count++;
	
					
		} catch (Exception e) {

		
		System.out.println("showAllReservation에서 오류남"+e);
		}finally {
			free() ;
		}
		return list;
	}//showAllReservation끝

	public ArrayList showReservation(String useremail, String from, String to) {

		ArrayList list = new ArrayList();
		
		try {
			con=ds.getConnection();
			String sql = "";
			pstmt=con.prepareStatement(sql);
			
			if((from.equals("") || from == null ) && (to.equals("") || to == null )){
				
				
				sql="select distinct reser_Starting,reser_destination,reser_destination,reser_round_trip , reser_date from reservationtbl "+
						"where reser_email = ? ";		
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,useremail);
				
			}else{
				
				sql="select distinct reser_Starting,reser_destination,reser_destination,reser_round_trip , reser_date from reservationtbl "+
						"where reser_email = ?   and ( reser_date between  ? and ? ) ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,useremail);
				pstmt.setDate(2,new Date(new SimpleDateFormat("yyyyMMdd").parse(from).getTime()));
				pstmt.setDate(3,new Date(new SimpleDateFormat("yyyyMMdd").parse(to).getTime()));
				
			}
			
			

			rs=pstmt.executeQuery();
			
			int count=0;
			while(rs.next()){
				ReserResultDTO dto= new ReserResultDTO();
				dto.setReser_Starting(rs.getString("reser_Starting"));
				dto.setReser_destination(rs.getString("reser_destination"));
				dto.setReser_date(rs.getDate("reser_date").toString());
				dto.setReser_round_trip(Integer.parseInt(rs.getString("reser_round_trip")));
			
				list.add(dto);	
				
			}
			
		}catch (Exception e) {
		System.out.println("showReservation에서 오류남"+e);
		}	finally {
			free() ;
		}	

		
		return list;
	}//showReservation끝
	
	
}
