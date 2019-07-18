package net.check;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class checkDAO {private Connection con;
private PreparedStatement pstmt;
private DataSource ds;
private ResultSet rs;

public checkDAO() {
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

	public int searchingId(String id) {
		int result=0;
		try {
			con=ds.getConnection();
			
			String sql="select count(*) cnt from user where user_id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			rs.next();
			
			result=rs.getInt("cnt");
			
			
			
		} catch (Exception e) {
			System.out.println("회원 검색 오류"+e.getMessage());
		}finally {
			free();
			
		}
		return result;
	}//id중복체크 메소드
}
