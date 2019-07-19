package net.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//회원가입 폼(join.jsp)에서 입력한 회원 정보들 중에 한글이 존재하면 한글이 깨지므로..
		//한글깨짐 방지를 위한 인코딩 방식 설정
		request.setCharacterEncoding("utf-8");
		
		//1.클라이언트 요청 데이터 받기
		//2.요청 데이터를 자바빈 MemberBean에 저장
		MemberBean mb = new MemberBean();
		
		// 1,2를(동시에) 쓰거나 3을 쓰거나 ??
		//String id = (String)request.getSession().getAttribute("id"); //fist
		//mb.setId(request.getParameter(id));//second
		
		mb.setUser_id(request.getParameter("user_id"));			//입력한 회원 id 저장  //third
		mb.setUser_pwd(request.getParameter("user_pwd"));		//입력한 회원 pass 저장
		mb.setUser_email(request.getParameter("user_email"));
	    mb.setUser_mobile(request.getParameter("user_mobile"));//입력한 회원 이름 저장
		//mb.setUser_name(request.getParameter("user_name"));		//입력한 회원 이메일 저장
		mb.setUser_address(request.getParameter("user_address"));	//입력한 회원 주소 저장
		//mb.setUser_non(request.getParameter("user_non"));		//입력한 회원 전화번호 저장
			//입력한 회원 핸드폰번호 저장
		//mb.setAge(Integer.parseInt(request.getParameter("age")));	//입력한 회원 나이 저장
		//mb.setAge(0);
		//mb.setDate(new Timestamp(System.currentTimeMillis()));	//회원가입 날짜(시스템 날짜) 저장

		MemberDAO mdao = new MemberDAO();
		
		mdao.updateMember(mb);

		//회원 가입 설공시.. 로그인 페이지로 이동 시킨다.
		//객체 생성 -> 페이지 이동 방식 여부값, 이동할 페이지 경로 주소값을 저장하여 리턴 해주는 객체 생성
		ActionForward forward = new ActionForward();
		//페이지 이동방식 여부값을 true로 저장
		//-> 리다이렉트 방식 Response.sendRedirect()메소드 이용
		forward.setRedirect(true);
		// ./member/login.jsp 이동할 페이지 주소 저장
		forward.setPath("./Main.me");
		
		return forward;
	}
}

