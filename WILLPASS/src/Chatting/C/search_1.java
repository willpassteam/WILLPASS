package Chatting.C;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class search_1 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//회원가입 폼(join.jsp)에서 입력한 회원정보들중에 한글이 존재하면 한글이 깨지므로..
				//한글깨짐 방지를 위한 인코딩 방식 설정
				request.setCharacterEncoding("utf-8");
				//1. 클라이언트 요청 데이터 받기
				//2. 요청 데이터를 자바빈 MemberBean에 저장
				
				String start=request.getParameter("start");
				String end=request.getParameter("end");
				String date=request.getParameter("date");
				//Date date=(Date) request.getParameter("date");
				
				//api 검색값 결과 
				//forward의 값만 넘어가기 때문에 controller에서 request값을 못받아옴.
				//session 으로 전송 또는 jsp 페이지로 바로 RequestDispatcher 방식으로 전송
				
				
				//회원 가입 성공시.. 로그인 페이지로 이동 시킨다.
				//객체 생성 -> 페이지 이동 방식 여부값, 이동할 페이지 경로 주소값을 저장하여 리턴해주는 객체 생성
				ActionForward forward=new ActionForward();
				//페이지 이동방식 여부 값을 true로 저장
				// -> 리다이렉트 방식 Response.sendRedirect()메소드 이용
				forward.setRedirect(true);
				// ./membet/login.jsp 이동할 페이지 주소 저장
				forward.setPath("./searchpro.jin");
				
				return forward;
	}

}
