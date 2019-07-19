package net.reservation.action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.crypto.spec.PSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.reservation.db.ReservationDTO;

public class ReserDAO {
	
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs; 
	
	public ReserDAO() {
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

	public int[] selpossibleseat(Date reser_date,String reser_flight) {
		
		int seat[]= new int[90];
		
		   try {
		         con = ds.getConnection();
		         System.out.println("비행번호"+reser_flight);
		         System.out.println("시간"+reser_date.toString());
		         String sql = "select reser_reserved_seat from reservationtbl where reser_date =? and  reser_flight =? ";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setDate(1,reser_date);
		         pstmt.setString(2,reser_flight);
		         rs=pstmt.executeQuery();
		         int count=0;
		         
		         while(rs.next()){
		        	 
		        	 seat[rs.getInt("reser_reserved_seat")]=1;
		        	 System.out.println(rs.getInt("reser_reserved_seat"));
		        	 
		         }
		         
		         System.out.println("dao출력");
	
		       
		      } catch (Exception e) {
		         System.out.println("selpossibleseat에서 오류남"+e);
		      }finally {
		         free();
		      }

		
		return seat;
	}
	
	
	 public void inserttemp(){
	      System.out.println("얍얍");
	      java.sql.Date d=java.sql.Date.valueOf("2019-07-20");
	      
	      try {
	         con = ds.getConnection();
	         
	         String sql = "INSERT INTO reservationtbl(reser_Starting,reser_destination,reser_date,reser_flight,reser_Reserved_seat) values(?,?,?,?,?)";
	         for(int i =30;i<36;i++){
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1,"김해(PUS)");
	         pstmt.setString(2,"간사이(KIX)");
	         pstmt.setDate(3,d);
	         pstmt.setString(4,"LJ215");
	         pstmt.setInt(5,i);

	         pstmt.executeUpdate();

	         }
	         
	      } catch (Exception e) {
	         System.out.println(" inserttemp에서 오류남"+e);
	      }finally {
	         free();
	      }
	      
	      
	   }
	 public void insertreserresult(ArrayList Reservationarr){
		 
		  try {
		         con = ds.getConnection();
		         
		         String sql = "INSERT INTO reservationtbl (reser_Starting,reser_destination,reser_date,"+
		        		 	 "reser_departure_time,reser_arrival_time,reser_airline,reser_flight,reser_price,reser_reserved_seat,reser_round_trip,reser_email,reser_gender,reser_familyname,reser_givename)"+
		        		 	 "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		        
		         pstmt = con.prepareStatement(sql);
		         
		         for(int i=0;i<Reservationarr.size();i++){
		        	
		        	 ReservationDTO  reserdto =(ReservationDTO)Reservationarr.get(i);
		        	 pstmt.setString(1,reserdto.getReser_Starting());
		        	 pstmt.setString(2,reserdto.getReser_destination());
		        	 pstmt.setDate(3,reserdto.getReser_date());
		        	 pstmt.setString(4,reserdto.getReser_departure_time());
		        	 pstmt.setString(5,reserdto.getReser_arrival_time());
		        	 pstmt.setString(6,reserdto.getReser_airline());
		        	 pstmt.setString(7,reserdto.getReser_flight());
		        	 pstmt.setInt(8,reserdto.getReser_price());
		        	 pstmt.setString(9,reserdto.getReser_reserved_seat());
		        	 pstmt.setBoolean(10,reserdto.isReser_round_trip());
		        	 pstmt.setString(11,reserdto.getReser_email());
		        	 pstmt.setString(12,reserdto.getReser_gender());
		        	 pstmt.setString(13,reserdto.getReser_familyname());
		        	 pstmt.setString(14,reserdto.getReser_givenname());
		        	 
		        	 pstmt.executeUpdate();
		        	 
		        	 
		         }
		         
		   
		         
		     
		  	} catch (Exception e) {
		  			System.out.println("insertreserresult에서 오류남"+e);
		  	}finally {
		  			free();
		  	}
	 }
	

}
