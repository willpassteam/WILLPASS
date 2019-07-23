package net.reservationcheck.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

	
	public ArrayList showAllReservation(String User_id,int startlist,int listsize){
		
		ArrayList list = new ArrayList();
		
		try {
			con=ds.getConnection();
			
			String sql = "select * from reservationtbl where reser_email = ?  order by reser_round_trip limit ? , ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,User_id);
			pstmt.setInt(2,startlist);
			pstmt.setInt(3,listsize);
			
			rs=pstmt.executeQuery();
			
			System.out.println("여기까지는 실행되는지 테스트!");
			while(rs.next()){
		
				ReservationDTO dto= new ReservationDTO();
				
				int tf=0;
				int ifround=-1;
				
				for(int i=0;i<list.size();i++){
					
					if(((ReservationDTO)list.get(i)).getReser_round_trip()==rs.getInt("reser_round_trip")){
						tf=1;
						ifround=i;
					} 
				}
				
//				if(tf==0){
					
					dto.setReser_airline(rs.getString("reser_airline"));
					dto.setReser_Starting(rs.getString("reser_Starting"));
					dto.setReser_arrival_time(rs.getString("reser_arrival_time"));
					dto.setReser_date(rs.getDate("reser_date"));
					dto.setReser_departure_time(rs.getString("reser_departure_time"));
					dto.setReser_destination(rs.getString("reser_destination"));
					dto.setReser_email(rs.getString("reser_email"));
					dto.setReser_familyname(rs.getString("reser_familyname"));
					dto.setReser_flight(rs.getString("reser_flight"));
					dto.setReser_gender(rs.getString("reser_gender"));
					dto.setReser_givenname(rs.getString("reser_givename"));
					dto.setReser_num(rs.getInt("reser_num"));
					dto.setReser_price(rs.getInt("reser_price"));
					dto.setReser_reserved_seat(rs.getString("reser_reserved_seat"));
					dto.setReser_round_trip(rs.getInt("reser_round_trip"));
					list.add(dto);			
				}
		
//			}
			
			
		} catch (Exception e) {

		
		System.out.println("showAllReservation에서 오류남"+e);
		}finally {
			free() ;
		}
		return list;
	}//showAllReservation끝
	
	
}
