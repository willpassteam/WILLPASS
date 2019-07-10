package net.search.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jinwoo.do/*")
public class searchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	protected void doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		//가상 요청 주소값 얻기
		// /CarProject/MemberJoin.me
		// /CarProject/MemberJoinAction.me
		// /CarProject/MemberLogin.me
		// /CarProject/MemberLoginAction.me
		String RequestURI= req.getRequestURI();
		System.out.println(RequestURI);
		//클라이언트가 요청한 컨텍스트 패스 경로 얻기
		// /CarProject
		// /CarProject
		String contextPath=req.getContextPath();
		System.out.println(contextPath);
		
		
		// /MemberJoin.me 얻기 (회원가입 입력양식 화면으로 이동시켜줘~ 라는 요청 주소값)
		// /MemberJoinAction.me 얻기 (DB와 연결하여 회원가입 insert요청 주소값)
		// /CarProject/MemberLogin.me (회원가입에 성공했을때. 로그인 페이지로 이동하는 요청값)
		// /CarProject/MemberLoginAction.me (로그인 처리 해주세요!!라는 비즈니스 로직 요청값)
		String command= RequestURI.substring(contextPath.length());
		
		//페이지 이동 방식여부값, 이동할 페이지 경로 주소값을 변수에 저장하여 리턴해주는 객체를 저장할 참조 변수 선언
		ActionForward forward=null;
		
		//Action인터페이스를 구현한 자식 객체를 저장할 참조 변수
		Action action=null;
		
		//Top.jsp페이지에서 join링크를 누르면 회원가입 페이지로 이동하는 요청이 들어왔을대..
//		if(command.equals("/jinwoo/search.jin")){
//			//페이지 이동 방식 여부값, 이동할 페이지 경로 주소값을 변수에 저장하여 리턴해주는 객체 생성
//			forward=new ActionForward();
//			//false를 저장 -> 디스패치 방식으로 포워딩 dis.forward(request,response)방식
//			forward.setRedirect(false);
//			//이동할 페이지 경로(회원가입 입력 화면) 주소값 저장
//			forward.setPath("/jinwoo/searchpro.jsp");
//			
//		//join.jsp화면에서 등록할 회원정보를 입력하고 DB에 회원 추가 요청이 들어 왔을때..
//		}else
			if(command.equals("/jinwooo/search.jin")){
			//회원가입 처리를 위한 부하직원(MemberJoinAction객체)생성
//			action=new search_1();
			try {
				//join.jsp페이지에서 입력한 회원가입 내용을 담고 있는
				//request영역을 execute()메소드의 매개변수로 전달하여..
				//회원가입 DB작업 후 회원가입에 성공하면..
				//페이지 이동방식 여부값 true와..
				//회원가입 후 보여질 이동할 주소(./member/login.jsp)를 담고 있는..
				//new ActionForward()객체를 리턴 받는다.
				forward=action.execute(req, resp);
				
				
			} catch (Exception e) {
				e.printStackTrace();

			}
		}//회원가입에 성공후 ! 로그인화면으로 이동하라라는 요청이 들어왔을때..
		//또는
		//top.jsp에서 login링크를 클릭하여 로그인화면으로 이동하라라는 요청이 들어 왔을때..
		else if(command.equals("/jinwoo/searchpro.jin")){
			//페이지 이동 방식 여부값, 이동할 페이지 주소값을 저장해서 제공해주는 객체 생성
			System.out.println("searchpro.jin");
			try {
				action=new searchFowarding();
				forward=action.execute(req, resp);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//페이지 이동방식 여부값 false로 저장 -> 디스패치방식
			forward.setRedirect(false);
			//이동할 페이지 경로 (로그인 페이지)
			forward.setPath("/jinwoo/searchpro.jsp");
		}else{
			System.out.println("예외");
//			try {
//			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//			long time;
//			
//				time = (format.parse(req.getParameter("from")).getTime()-new Date().getTime());
//				 long calDateDays = ((time / ( 24*60*60*1000))+1)%7;
//				 if(calDateDays>3) calDateDays= calDateDays-7;
//				 System.out.println(calDateDays);
//				 
//
////				System.out.println(time);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
		}
		/*--------------------------------------------------------------------------- */
		//주소로 이동
		if(forward != null){//new ActrionForward()객체가 저장되어 있고
			
			if(forward.isRedirect()){ //true ->Response.sendRedirect()
				
				resp.sendRedirect(forward.getPath());
				
			}else {//false->dis.forward(request,response)
				
				RequestDispatcher dis= req.getRequestDispatcher(forward.getPath());
				dis.forward(req, resp);
			}
			
		}
		
	}
}
