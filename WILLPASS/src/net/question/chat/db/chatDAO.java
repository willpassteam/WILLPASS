package net.question.chat.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class chatDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	private ResultSet rs;
	
	public chatDAO() {
		try {
			
			Context ctx=new InitialContext();
			ds=(DataSource) ctx.lookup("java:comp/env/jdbc/willpass");
			free();
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
	//유저의 이메일 기준으로 
	public ArrayList<chatDTO> getChatList(int chat_no){
		ArrayList<chatDTO> result = new ArrayList();
		try {
			con = ds.getConnection();
		
			String sql = "select * from chat where chat_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, chat_no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				chatDTO dto = new chatDTO();
				dto.setChat_content(rs.getString("chat_content"));
				dto.setChat_date(rs.getTimestamp("chat_date"));
				dto.setChat_no(rs.getInt("chat_no"));
				dto.setChat_who(rs.getBoolean("chat_who"));
				dto.setUser_email(rs.getString("user_email"));
				
				result.add(dto);
			}
			/*private String user_email;
			private String 	chat_content;
			private Timestamp chat_date;
			private int chat_no;
			private boolean chat_who;*/
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	// 유저 조인 메소드
	public void joinUser(String user_email){
		try {
			con = ds.getConnection();
			
			String sql = "insert into chat_ref(chat_no,chat_userjoin,chat_adminjoin,chat_adminouttime,user_email) values(null,true,false,sysdate(),?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,user_email);
			
			if(pstmt.executeUpdate() == 1 ){
			}
					
			/*private int chat_no; 
			private boolean chat_userjoin,chat_adminjoin;
			private Timestamp chat_adminouttime;*/
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			free();
		}
				
	}
	// 유저 아웃 메소드
	public void outUser(int chat_no){
		try {
			con = ds.getConnection();
			
			String sql = "update chat_ref set chat_userjoin = false where chat_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, chat_no);
			
			if(pstmt.executeUpdate() == 1 ){
			}
					
			/*private int chat_no; 
			private boolean chat_userjoin,chat_adminjoin;
			private Timestamp chat_adminouttime;*/
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			free();
		}
				
	}
	
	// 처음 방생성 메소드
	public int createRoom(String user_email){
		int result = 0;
		try {
			
			int chat_no = getMax_Chat_no(user_email);
			con = ds.getConnection();
			String sql = "insert into chat(chat_no,chat_who,user_email,chat_date,chat_content) values(?,?,?,sysdate(),?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, chat_no);
			pstmt.setBoolean(2, false);
			pstmt.setString(3, user_email);
			pstmt.setString(4, "안녕하세요. 신청하신 질문에 순차적으로 답변해드리고 있습니다. 잠시만 기다려주세요.");
			
			if(pstmt.executeUpdate() == 1 ){
				result = getMax_Chat_no(user_email);
			}
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			free();
		}
		return result;
		
		
		
	}
	//상담사 조인시 "상담사가 입장했습니다" 문구를 띄워줄 메소드 
	
	// 상담사 조인 메소드
	public void joinAdmin(int chat_no){
		try {
			System.out.println("joinAdmint 실행");
			con = ds.getConnection();
			
			String sql = "update chat_ref set chat_adminjoin = true where chat_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, chat_no);
			
			if(pstmt.executeUpdate() == 1 ){
			}
					
			/*private int chat_no; 
			private boolean chat_userjoin,chat_adminjoin;
			private Timestamp chat_adminouttime;*/
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			free();
		}
				
	}
	
	// 상담사 아웃 메소드
	public void outAdmin(int chat_no){
	try {
		System.out.println("joinOut 실행");
		con = ds.getConnection();
		
		String sql = "update chat_ref set chat_adminjoin = false ,chat_adminouttime = sysdate() where chat_no = ?";
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, chat_no);
		
		if(pstmt.executeUpdate() == 1 ){
		}
				
		/*private int chat_no; 
		private boolean chat_userjoin,chat_adminjoin;
		private Timestamp chat_adminouttime;*/
				
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}finally{
		
		free();
	}
			
}
	// 유저의 대화 내역 가져오기 
	public ArrayList<ArrayList> getChatAllList(String user_email){
		ArrayList<ArrayList> result = new ArrayList();
		
		try {
			
			ArrayList<Integer> max = getAll_chat_no(user_email);
			con = ds.getConnection();
			for (int i= 0;  i< max.size(); i++) {
				ArrayList<chatDTO> dtoList = new ArrayList<>();
				int chat_no = max.get(i);
				
				String sql = "select * from chat where chat_no = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, chat_no);
				rs = pstmt.executeQuery();
				while(rs.next()){
					chatDTO dto = new chatDTO();
					dto.setChat_content(rs.getString("chat_content"));
					dto.setChat_date(rs.getTimestamp("chat_date"));
					dto.setChat_no(rs.getInt("chat_no"));
					dto.setChat_who(rs.getBoolean("chat_who"));
					dto.setUser_email(rs.getString("user_email"));
					
					dtoList.add(dto);
				}
				result.add(dtoList);
			}
			
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	// 유저에 해당하는 chat_no을 모두 가져오는 메소드
	public ArrayList<Integer> getAll_chat_no(String user_email){
		ArrayList<Integer> resultList = new ArrayList<>();
		try {
			con = ds.getConnection();
			
		
			String sql = "select chat_no from chat_ref where user_email = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				resultList.add(rs.getInt("chat_no"));
			}
			/*private String user_email;
			private String 	chat_content;
			private Timestamp chat_date;
			private int chat_no;
			private boolean chat_who;*/
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return resultList;
	}
	// 모든 chat_no을 가져오는 메소드
	public int[] getAll_chat_no(){
		ArrayList<Integer> result = new ArrayList<>();
		try {
			con = ds.getConnection();
			
		
			String sql = "select chat_no from chat_ref";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				result.add(rs.getInt("chat_no"));
				
			}
			/*private String user_email;
			private String 	chat_content;
			private Timestamp chat_date;
			private int chat_no;
			private boolean chat_who;*/
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		int[] resultint = new int[result.size()];
		for (int i = 0; i < resultint.length; i++) {
			resultint[i] = result.get(i);
		}
		return resultint;
	}
	
	
	
	// 유저의 이메일 기준으로 가장 높은 chat_no 가져오는 메소드
	public int getMax_Chat_no(String user_email){
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = "select max(chat_no) AS chat_no from chat_ref where user_email = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_email);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("chat_no");
			}
			
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	
	//Admin모든 대화내용을 가져오는 메소드 
	public ArrayList<ArrayList> getAllChat_List(){
		ArrayList<ArrayList> result = new ArrayList();
		
		try {
			
			int[] max = getAll_chat_no();
			
			con = ds.getConnection();
			for (int i= 0;  i< max.length; i++) {
				int chat_no = max[i];
				
				String sql = "select * from chat where chat_no = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, chat_no);
				rs = pstmt.executeQuery();
				ArrayList<chatDTO> dtoList = new ArrayList<>();
				while(rs.next()){
					chatDTO dto = new chatDTO();
					dto.setChat_content(rs.getString("chat_content"));
					dto.setChat_date(rs.getTimestamp("chat_date"));
					dto.setChat_no(rs.getInt("chat_no"));
					dto.setChat_who(rs.getBoolean("chat_who"));
					dto.setUser_email(rs.getString("user_email"));
					
					dtoList.add(dto);
				}
				result.add(dtoList);
			}
			
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	//V2 모든 내용과 모든 걸 다가져오니 속도가 느림 -> 해결 이름만 가져오기 + 마지막 내용 + 확인안한 내용까지 
	public ArrayList getAllChat_List_Name(){
		ArrayList result = new ArrayList();
		try {
			
			int[] max = getAll_chat_no();
			
			con = ds.getConnection();
			for (int i= 0;  i< max.length; i++) {
				int chat_no = max[i];
				
				String sql = "select *,(select count(chat_date) from chat where chat_who = true AND chat_no = ? AND chat_date > (select chat_adminouttime from chat_ref where chat_no = ? AND chat_adminjoin = false)) AS count from chat where chat_no =?  order by chat_date DESC limit 1;";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, chat_no);
				pstmt.setInt(2, chat_no);
				pstmt.setInt(3, chat_no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					HashMap dto = new HashMap<>();
					dto.put("chat_content",rs.getString("chat_content"));
					dto.put("chat_date",rs.getTimestamp("chat_date"));
					dto.put("chat_no",rs.getInt("chat_no"));
					dto.put("chat_who",rs.getBoolean("chat_who"));
					dto.put("user_email",rs.getString("user_email"));
					dto.put("count", rs.getInt("count"));
					
					result.add(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			free();
		}
		return result;
	}
	//작성 유저용 
	public void writeChat(int chat_no, String content,String user_email) {
		int result = 0;
		try {
			
			con = ds.getConnection();
			
			String sql = "insert into chat(chat_no,chat_who,user_email,chat_date,chat_content) values(?,?,?,sysdate(),?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, chat_no);
			pstmt.setBoolean(2, true);
			pstmt.setString(3, user_email);
			pstmt.setString(4, content);
			
			if(pstmt.executeUpdate() == 1 ){
			}
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			free();
		}
		// TODO Auto-generated method stub
		
	}
	//작성 어드민용 
	public void writeChat(int chat_no, String content,String user_email,int admin) {
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = "insert into chat(chat_no,chat_who,user_email,chat_date,chat_content) values(?,?,?,sysdate(),?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, chat_no);
			pstmt.setBoolean(2, false);
			pstmt.setString(3, user_email);
			pstmt.setString(4, content);
			
			if(pstmt.executeUpdate() == 1 ){
			}
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			free();
		}
		// TODO Auto-generated method stub
		
	}
	//어드민이 나간후 온 메세지 갯수 확인용 
	public int adminChatCount(int chat_no) {
		int result = 0;
		try {
			con = ds.getConnection();
			
			String sql = "select count(a.chat_no) from chat a JOIN chat_ref b ON a.chat_no = b.chat_no where b.chat_adminjoin = false and b.chat_adminouttime < a.chat_date AND a.chat_no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, chat_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
					
					
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			free();
		}
		return result;
		// TODO Auto-generated method stub
		
	}
	
}
