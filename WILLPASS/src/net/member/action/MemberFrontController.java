package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

@WebServlet("/user/member/*")
public class MemberFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String command =request.getPathInfo();
		System.out.println(command);
		ActionForward forward = null;
		String ContextPath = request.getContextPath();
		Action action = null;
		
	if(command.equals("/MemberJoin.me")){
		
	System.out.println("join실행됨");
	String name=request.getParameter("user_name");
	
	System.out.println(name);
	
//	String RequestURI=request.getRequestURI();
//	System.out.println(RequestURI);
//	String contextPath=request.getContextPath();
//	System.out.println(contextPath.length());
//	String command=RequestURI.substring(contextPath.length());
//	System.out.println(command);
//	ActionForward forward=null;
//	Action action=null;
//		

	//여기서부터 
	}else if(command.equals("/MemberJoinAction.me")){
//	}else if(command.equals("/MemberJoinAction.me")){
	
		
		//회원가입 처리를 위한 Action객체 생성
		action=new MemberJoinAction();
		
		try {
			//josin.jsp에서 입력한 회원가입 내용을 담고 있는
			//request영역을 execute메소드의 매개변수로 전달하여..
			//회원가입 DB 작업후 회원가입에 성공하면..
			// 페이지 이동 방식 여부 값 true와...
			// 이동할페이지 주소 (./member/login.jsp)를 담고 있는..
			//new ActionForward()객체를 리턴 받는다.
			forward=action.execute(request, response);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	//top.jsp에서 ..login링크를 클릭하여 로그인화면으로 이동하라 라는 요청이 들어 왔을때...	
	//또는 회원가입후!.. 로그인화면으로 이동하라 라는 요청이 들어 왔을떄...
	}else if(command.equals("/Memberlogin.me")){ 
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
		forward=new ActionForward();
		//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
		forward.setRedirect(false); //주소값 노출 안됨
		//이동할 페이지 경로(로그인 페이지) 주소값 저장
		//forward.setPath("Userlogin.jsp"); 
		//forward.setPath("/user/Userlogin.jsp"); 
		forward.setPath("/user/UserJoinstep3.jsp");
		
	
	
	//login.jsp에서... "Sign in"버튼을 눌렀을때..로그인 처리 요청받기!
	//사용자가 입력한 id와 패스워드를 request영역에 담아오기
	}else if(command.equals("/MemberloginAction.me")){	
//	}else if(command.equals("/MemberLoginAction.me")){
		
		//로그인 처리를 위한 Action객체 생성  2
		action=new MemberLoginAction();
		
		try {
			//login.jsp에서 사용자가 입력한 id와 패스워드를 담고 있는 request영역을
			//execute메소드의 매개변수로 전달하여.. DB에있는 id와 패스워드 값을 비교한다.
			//DB에 있는 아이디,비밀번호와...
			//login.jsp 화면에서 입력한 아이디,비밀번호가 일치할때...
			//login.jsp 화면에서 입력한 아이디를 세션객체영역에 저장하고...
			//페이지 이동 방식 여부 값 true와...이동할페이지 주소 (./CarMain.jsp)를 담고 있는..
			//new ActionForward()객체를 MemberFrontController로 리턴 
			forward=action.execute(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//////////////////////////////////////////////////////////
		
		
	}else if(command.equals("/Main.me")){ //2**밑에 를 /main/index.jsp로 바꿔줘도..
		//..equals("/Memberlogin.me")){ ...이부분을 바꾸지 아느니 찾을수 없음 
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
		forward=new ActionForward();
		//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
		forward.setRedirect(true); //주소값 노출 안됨
		//이동할 페이지 경로(로그인 페이지) 주소값 저장
		//forward.setPath("Userlogin.jsp"); 
		//forward.setPath("/user/Userlogin.jsp"); 
		
		
		//forward.setPath("/user/UserJoinstep3.jsp");12july위쪽 에서 DB작업이 필요없는 login.me만 가져와서 로그인뒤 설정된
		//main.me 경로와 willpass의 메인페이지인 index로 연걸을 시켜주는 거임 1**
		forward.setPath(ContextPath+"/main/index.jsp");
		
		
////////////////////////////////////////////////
		
		}else if(command.equals("/Usermodify.me")){	
			
			
		String id = (String)request.getSession().getAttribute("user_email");
	
		MemberDAO mdao = new MemberDAO();
		MemberBean mem = mdao.getMember(id);
			
		request.setAttribute("mem",mem );
			
			forward=new ActionForward();
			//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
			forward.setRedirect(false); //주소값 노출 안됨
			//이동할 페이지 경로(로그인 페이지) 주소값 저장
			//forward.setPath("Userlogin.jsp"); 
			//forward.setPath("/user/Userlogin.jsp"); 
			forward.setPath("/user/Usermodify.jsp");
//			}else if(command.equals("/MemberLoginAction.me")){
				
				//로그인 처리를 위한 Action객체 생성  2
				//action=new MemberModifyAction();
			
					//login.jsp에서 사용자가 입력한 id와 패스워드를 담고 있는 request영역을
					//execute메소드의 매개변수로 전달하여.. DB에있는 id와 패스워드 값을 비교한다.
					//DB에 있는 아이디,비밀번호와...
					//login.jsp 화면에서 입력한 아이디,비밀번호가 일치할때...
					//login.jsp 화면에서 입력한 아이디를 세션객체영역에 저장하고...
					//페이지 이동 방식 여부 값 true와...이동할페이지 주소 (./CarMain.jsp)를 담고 있는..
					//new ActionForward()객체를 MemberFrontController로 리턴 
					//forward=action.execute(request, response);
				//} catch (Exception e) {
					//e.printStackTrace();
				//}	
		
////////////////	                                                      /////////////////////////////////////////////////	
				
		
	}else if(command.equals("/MemberUpdateAction.me")){	
		
				action=new MemberUpdateAction();
				
				try {
					//josin.jsp에서 입력한 회원가입 내용을 담고 있는
					//request영역을 execute메소드의 매개변수로 전달하여..
					//회원가입 DB 작업후 회원가입에 성공하면..
					// 페이지 이동 방식 여부 값 true와...
					// 이동할페이지 주소 (./member/login.jsp)를 담고 있는..
					//new ActionForward()객체를 리턴 받는다.
					forward=action.execute(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		
		
/////////////////////////////////////////////////////
			
		
//	}else if (command.equals("/MemberUpdate.me")) {
//		String id = (String)request.getSession().getAttribute("id");
//		MemberDAO mdao = new MemberDAO();
//		MemberBean mem = mdao.getMember(id);
//		
//		forward = new ActionForward();
//		forward.setRedirect(false);
//		forward.setPath("./Main.jsp?center=member/update.jsp");
//	}else if (command.equals("/MemberUpdateAction.me")) {
//		//트라이밑에 부터 다시 해봐야함 
//		//user폴더에 update가 없음 체크해봐야할듯
//		action = new MemberJoinAction();
//		
//		try {
//			//join.jsp페이지에서 입력한 회원가입 내용을 담고 있는
//			//request영역을 execute()메소드의 매개변수로 전달하여..
//			//회원가입 DB작업 후 회원가입에 성공하면..
//			//페이지 이동방식 여부값 true와..
//			//회원가입 후 보여질 이동할 주소(./member/login.jsp)를 담고있는..
//			//new ActionForward()객체를 리턴 받는다.
//			forward = action.execute(request, response);
//		} catch (Exception e) {
//			System.out.println("MemberFrontController.java의 MemberUpdateAction.me 요청 에서 에러 : "+e.getMessage());
//		}
//		
		
/////////////////////////////////////////////////////	
		
		//주소 변경 16j	forward.setPath("./CarMain.jsp");
	
	//top.jsp에서 ..logout링크를 클릭하여 세션값초기화하고...
	//CarMain.jsp화면으로 이동하라 라는 요청이 들어 왔을때...				
	}else if(command.equals("/logout.me")){
		
		//로그아웃 처리를 위한 Action객체 생성  
		action=new MemberLogoutAction();
		try {
			//top.jsp에서  로그아웃 요청이 들어왔을때...  
			//세션값 초기화후~ 로그아웃 메세지창을 띄어주고...
			//CarList.jsp페이지로 이동하는일을 하는 execute()메소드 호출함.
			forward=action.execute(request, response); //return null;

		} catch (Exception e) {
			e.printStackTrace();
		}
	}	//"CarMain.jsp 메인 페이지 요청"이 들어 왔을떄...
		//???????????여기부분도 바꾸야함
	
	/////////////////////////////////////////////////
	//TRY
	
//	else if(command.equals("/CC")){
//		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체 생성 
//		forward=new ActionForward();
//		//페이지 이동 방식 여부 값 false로 저장-> RequestDispatcher  forward() 방식
//		forward.setRedirect(false); //주소값 노출 안됨
//		//이동할 페이지 경로(로그인 페이지) 주소값 저장
//		forward.setPath("/user/Userlogin.jsp"); 
//	}
	
//////////////////////////////////////////////////////////////			
			 
	
		//------------------------------------------------------------------------------
		//주소로 이동
		if(forward != null){	//new ActionForward()객체가 저장되어 있고
			
			if(forward.isRedirect()){	// true - > Response.sendRedirect()
				response.sendRedirect(forward.getPath());
				
			}else {	//false -> 디스패치 방식 dis.forward(request,response)
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}
		
			
	}
	
}
