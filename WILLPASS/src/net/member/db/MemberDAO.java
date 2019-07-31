package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//DB작업
public class MemberDAO {
	
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	DataSource ds = null;
	
	//Connection객체를 얻는 메소드
	private void getConnection() throws Exception{
		Context init = new InitialContext();
		
		ds = (DataSource)init.lookup("java:comp/env/jdbc/willpass");
		con = ds.getConnection();
	}
	
	public void FreeResource(){
		try {
			if(con != null) con.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	//입력한 회원정보를 DB에 추가 시키는 메소드!
	public boolean insertMember(MemberBean mb){
		
		String sql = "";
		
		//회원가입 성공 여부값 저장
		int result = 0;
		
		try {
			getConnection();
			//디비연결(Connection얻기)
			//SQL작성 insert
			sql = "insert into user(user_id,user_pwd,user_name,user_email,user_mobile,user_address,user_non) values(?,?,?,?,?,?,?)";
			//?에 대응되는값을 제외한 위의 sql변수에 저장되어 있는 insert 구문 전체를 PreparedStatement객체에 저장 한 후
			//PreparedStatement객체를 반환받아 얻기
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getUser_id());
			pstmt.setString(2, mb.getUser_pwd());
			
			pstmt.setString(3, mb.getUser_name());
			pstmt.setString(4, mb.getUser_email());
			//pstmt.setDate(5, mb.getUser_age());
			pstmt.setString(5, mb.getUser_mobile());
			pstmt.setString(6, mb.getUser_address());
			pstmt.setString(7,mb.getUser_non());
			//pstmt.setString(8, mb.getUser_gender());
			
			result = pstmt.executeUpdate();	//회원가입 성공 1리턴, 실패 0리턴
			if (result != 0) {
				return true;
			}
			
			
		} catch (Exception e) {
			System.out.println("insertMember에서 오류 : "+e.getMessage());
		} finally {
			FreeResource();
		}
		return false;
	}//insertMember메소드 끝

	
	/*로그인 처리시.. 사용하는 메소드*/
	//사용자가 입력한 아이디, 패스워드를 매개변수로 전달 받아.. DB에 저장되어 있는 데이터와 비교하여 반환함.
	public int userCheck(String user_email, String user_pwd) {
		
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		int check = -1;	//  1 -> 아이디, 비밀번호 맞음
						//  0 -> 아이디 맞음 비밀번호 틀림
						// -1 -> 아이디 틀림
		try {
			//con = getConnection();
			getConnection();
			//pstmt = con.prepareStatement("select user_pwd from member2 where user_id=?");
			pstmt = con.prepareStatement("select user_pwd from user where user_email=?");
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){	//id에 해당하는 데이터pass가 있으면 (입력한 아이디가 DB에 존재 하면)
				//로그인시 입력한 pass와 DB에 저장되어 있는 pass가 같으면
				if (user_pwd.equals(rs.getString("user_pwd"))) {
					check = 1;	//아이디 맞음, 비밀번호 맞음 판별값 저장
				}else {//아이디 맞음, 비밀번호 틀림
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("userCheck에서 오류 : "+e.getMessage());
		} finally {
			//자원 해제
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
///////////////////////////////////////////////////////////////////////////////////12/july 중복체크 	
//아디 중복체크를 하려고 위의 로그인 파트를 복사해서 고침 pwd없이 
	
	
	/*로그인 처리시.. 사용하는 메소드*/
	//사용자가 입력한 아이디, 패스워드를 매개변수로 전달 받아.. DB에 저장되어 있는 데이터와 비교하여 반환함.
	public int userCheck(String user_email) {
		
		con = null;
		pstmt = null;
		rs = null;
		String sql = "";
		int check = -1;	//  1 -> 아이디, 비밀번호 맞음
						//  0 -> 아이디 맞음 비밀번호 틀림
						// -1 -> 아이디 틀림
		try {
			//con = getConnection();
			getConnection();
			
			pstmt = con.prepareStatement("select * from user where user_email=?");
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			
			
			//password비교가 필요없으니 빼줌 
			if(rs.next()){	//id에 해당하는 데이터pass가 있으면 (입력한 아이디가 DB에 존재 하면)
//				//로그인시 입력한 pass와 DB에 저장되어 있는 pass가 같으면
//				if (user_email.equals(rs.getString("user_email"))) {
//					check = 1;	//아이디 맞음, 비밀번호 맞음 판별값 저장
//				}else {//아이디 맞음, 비밀번호 틀림
//					check = 0;
//				}
 			}
		} catch (Exception e) {
			System.out.println("userCheck에서 오류 : "+e.getMessage());
		} finally {
			//자원 해제
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	
	
///////////////////////////////////////////////////////////////////////////////////////
	
	
	
	// modify 하는 중임 
	public MemberBean getMember(String user_id) { //이름을 머로 ? getMemberModify되나?
		
		String sql="";
		
		MemberBean mb=null;
	
		try {
			//con = getConnection();
			getConnection();
			//pstmt = con.prepareStatement("select user_pwd from member2 where user_id=?");
			
			sql="select * from user where user_email=?";
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1,bean.getUser_id());
			
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mb=new MemberBean();
				mb.setUser_id(rs.getString("user_id"));
				mb.setUser_pwd(rs.getString("user_pwd"));
				mb.setUser_email(rs.getString("user_email"));
				mb.setUser_name(rs.getString("user_name"));
				mb.setUser_mobile(rs.getString("user_mobile"));
				//mb.setDate(rs.getTimestamp("date"));
				mb.setUser_address(rs.getString("user_address"));
				mb.setUser_non(rs.getString("user_non"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return mb;		
	}	
	
	
	/////////////////////////////////////////////////////////////////////////
	
	
	public void updateMember(MemberBean bean){
		//이거 void 인가 boolean 인가 ?  
		
		 con=null;
		 pstmt = null;
		 rs=null;
		
		System.out.println("update실행");
		//질문 disabled된 id하고 email파트는 빼나?
		String sql = "update user set user_pwd=?,user_mobile=?,user_address=? where user_email=?";

		try {
			 getConnection();
		
			pstmt= con.prepareStatement(sql);
			//pstmt.setString(1,bean.getUser_id());
			pstmt.setString(1,bean.getUser_pwd());
			//pstmt.setString(3,bean.getUser_email());
			//pstmt.setString(2,bean.getUser_name());
			pstmt.setString(2,bean.getUser_mobile());
			pstmt.setString(3,bean.getUser_address());
			//pstmt.setString(5,bean.getUser_non());
			pstmt.setString(4,bean.getUser_email());
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("메서드 내부에서 오류");
			e.printStackTrace();
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	//11 july pm doublecheck try//////////////////////////////////////////////////////////// 
	
	
	// 샘꺼 에서 가져온거같음  //id 아니면 email아님 둘다 일지도
	 //회원가입을 위해 사용자가 입력한 id값을 매개변수로 전달받아..
		//DB에 사용자가 입력한 id값이 존재하는지 select하여
		//만약에 사용자가 입력한 id에 해당하는 회원레코드가 있으면?
		//check변수값을 1로 저장
		//만약 사용자가 입력한 id에 해당하는 회원 레코드가 없으면?
		//check변수값을 0으로 저장하여 <-- 아이디 중복 아님을 나타내고,
		//.....결과적으로 아이디 중복이냐 중복이 아니냐는 check변수의 값으로 판단 할 수 있음

		public int idCheck(String user_email){
		
			con=null;
			pstmt=null;
			rs=null;
			String sql="";
			int check=1;
			
			
			try {
				getConnection();
				
				//sql = "select * from member where user_email=?";
				pstmt = con.prepareStatement("select * from member where user_email=?");
				pstmt.setString(1, user_email);
				rs = pstmt.executeQuery();
				
				if(rs.next()){	//검색한 레코드가 있으면
					if (user_email.equals(rs.getString("user_email"))) {
					check = 1;	//중복
				}else {			//검색한 레코드가 없으면
					check = 0;	//중복아님
				}
				
			}
				
			} catch (Exception e) {
				System.out.println("userCheck에서 오류 : "+e.getMessage());
			}finally {
				//자원 해제
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					if(rs != null) rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				
			return check;
	}

		public String getUserId(String user_email) {
			String user_id="";
			//return user_id;
			
			
			con=null;
			pstmt=null;
			rs=null;
			
			try {
				getConnection();
				
				//sql = "select * from member where user_email=?";
				pstmt = con.prepareStatement("select * from user where user_email=?");
				pstmt.setString(1, user_email);
				rs = pstmt.executeQuery();
				
				rs.next();
				user_id=rs.getString("user_id");
				
//				if(rs.next()){	//검색한 레코드가 있으면
//					if (user_email.equals(rs.getString("user_email"))) {
//					check = 1;	//중복
//				}else {			//검색한 레코드가 없으면
//					check = 0;	//중복아님
//				}
				
//			}
				
			} catch (Exception e) {
				System.out.println("userCheck에서 오류 : "+e.getMessage());
			}finally {
				//자원 해제
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					if(rs != null) rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				
			return user_id;
			
			
		}
		
		
		
		
	//////////////////////////////////////////////////////////25/ JULY 전번으로 아디찾기
//		
//		public String getUserMobile(String user_mobile) {
//			String user_id="";
//			//return user_id;
//			
//			
//			con=null;
//			pstmt=null;
//			rs=null;
//			
//			try {
//				getConnection();
//				
//				//sql = "select * from member where user_email=?";
//				pstmt = con.prepareStatement("select * from user where user_mobile=?");
//				pstmt.setString(1, user_mobile);
//				rs = pstmt.executeQuery();
//				
//				rs.next();
//				user_mobile=rs.getString("user_mobile");
//				
////				아마도 이걸써야할듯 음 25/july
//				
////				if(rs.next()){	//검색한 레코드가 있으면
////					if (user_mobile.equals(rs.getString("user_mobile"))) {
////					check = 1;	//중복
////				}else {			//검색한 레코드가 없으면
////					check = 0;	//중복아님
////				}
//				
////			}
//				
//			} catch (Exception e) {
//				System.out.println("userCheck에서 오류 : "+e.getMessage());
//			}finally {
//				//자원 해제
//				try {
//					if(pstmt != null) pstmt.close();
//					if(con != null) con.close();
//					if(rs != null) rs.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//				
//			return user_mobile;
//}
}
	
	
	
	
	
	
	
	

