package Board.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	public BoardDAO() {
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
	
	public boolean writeBoard(String Board_title,String Board_content, String Board_email){
		boolean result = false;
		
		System.out.println("writeBoard Start");
		
		try {
			con = ds.getConnection();
			
			String sql = "INSERT INTO board values(null,?,?,sysdate(),?,1,1)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, Board_title);
			pstmt.setString(2, Board_content);
			pstmt.setString(3, Board_email);
			
			
			if(pstmt.executeUpdate()==1)result = true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			free();
		}
		System.out.println("writeBoard End  result:"+result);
		
		return result;
		
	}
	
	public boolean checkBoard(int board_num,String board_email){// board_num으로 작성자가 누구인지 확인하는 메소드
		
		boolean result = false;
		
		System.out.println("checkBoard Start");
		
		try {
			con = ds.getConnection();
			
			String sql = "select board_email from board where board_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, board_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				// 디비에 존재하는 이메일값 넣어주기
				String DB_board_email = rs.getString(1);
				if(DB_board_email != null){
					if(DB_board_email.equals(board_email)){
						result =  true;
					}
				}
			}
				
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			free();
		}
		System.out.println("checkBoard End  result:"+result);
		
		return result;
	}
	
	public ArrayList<BoardDTO> getBoardList(){//모든 board 게시판의 글을 읽어오는것 
		
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		System.out.println("getBoardList Start");
		
		try {
			con = ds.getConnection();
			
			String sql = "select * from board order by board_num asc";
			
			pstmt = con.prepareStatement(sql);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				BoardDTO dto = new BoardDTO();
				
				dto.setBOARD_CONTENT(rs.getString("board_content"));
				dto.setBOARD_DATE(rs.getDate("board_date"));
				dto.setBOARD_DEPTH(rs.getInt("board_depth"));
				dto.setBOARD_EMAIL(rs.getString("board_email"));
				dto.setBOARD_NUM(rs.getInt("board_num"));
				dto.setBOARD_POS(rs.getInt("board_pos"));
				dto.setBOARD_TITLE(rs.getString("board_title"));
				
				result.add(dto);
			}
				
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			free();
		}
		System.out.println("getBoardList End  result:"+result);
		
		return result;
	}
	

}
