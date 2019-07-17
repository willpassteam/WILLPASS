package Notice.Board.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.DB.BoardDTO;

public class NoticeDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	public NoticeDAO() {
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
	public boolean writeNotice(String notice_title, String notice_content) {
		boolean result = false;
		try {
			con =ds.getConnection();
			
			String sql = "insert into notice values(null,?,?,now(),0)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, notice_title);
			pstmt.setString(2, notice_content);
			
			if(pstmt.executeUpdate()==1)result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	public NoticeDTO getBoard(int notice_num) {
		System.out.println(notice_num);
		NoticeDTO result = new NoticeDTO();
		try {
			con =ds.getConnection();
			
			String sql = "select * from notice where notice_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, notice_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result.setNotice_content(rs.getString("notice_content"));
				result.setNotice_count(rs.getInt("notice_count"));
				result.setNotice_date(rs.getDate("notice_date"));
				result.setNotice_num(rs.getInt("notice_num"));
				result.setNotice_title(rs.getString("notice_title"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	
	
	public boolean deleteNotice(int notice_num) {
		boolean result = false;
		try {
			con =ds.getConnection();
			
			String sql = "delete from notice where notice_num= ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, notice_num);
			
			if(pstmt.executeUpdate()==1)result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	public boolean updateNotice(int notice_num, String notice_title, String notice_content) {
		boolean result = false;
		try {
			con =ds.getConnection();
			
			String sql = "update notice set notice_title = ? , notice_content = ?  where notice_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice_title);
			pstmt.setString(2, notice_content);
			pstmt.setInt(3, notice_num);
			
			if(pstmt.executeUpdate()==1) result = true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	public ArrayList<NoticeDTO> getNoticeList(int limit) {
		ArrayList<NoticeDTO> result = new ArrayList<NoticeDTO>();
		
		
		try {
			con = ds.getConnection();
			
			String sql = "select * from notice order by notice_num DESC limit ?,10";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, limit*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_count(rs.getInt("notice_count"));
				dto.setNotice_date(rs.getDate("notice_date"));
				dto.setNotice_num(rs.getInt("notice_num"));
				dto.setNotice_title(rs.getString("notice_title"));
				
				result.add(dto);
			}
				
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			free();
		}
		
		return result;
	}
	public int NoticeAllCount() {
		int result = 0;
		
		
		try {
			con = ds.getConnection();
			
			String sql = "select count(*) from notice";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			free();
		}
		
		return result;
	}
	public void addCountBoard(int notice_num) {
		try {
			con =ds.getConnection();
			System.out.println(notice_num);
			String sql = "update notice set notice_count = notice_count +1 where notice_num = ?";
			System.out.println("작동");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		
	}
	
	

}
