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
	

	}else if(command.equals("/MemberJoinAction.me")){

		
		action=new MemberJoinAction();
		
		try {
	
			forward=action.execute(request, response);
					
		} catch (Exception e) {
			e.printStackTrace();
		}

	}else if(command.equals("/Memberlogin.me")){ 
		forward=new ActionForward();
		forward.setRedirect(false); //주소값 노출 안됨
		forward.setPath("/user/UserJoinstep3.jsp");
		
	
	
	}else if(command.equals("/MemberloginAction.me")){	
		
		action=new MemberLoginAction();
		
		try {
	
			forward=action.execute(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//////////////////////////////////////////////////////////
		
		
	}else if(command.equals("/Main.me")){ 

		forward=new ActionForward();
		forward.setRedirect(true); //주소값 노출 안됨


		forward.setPath(ContextPath+"/main/index.jsp");
		
		
		
		}else if(command.equals("/Usermodify.me")){	
			
			
		String id = (String)request.getSession().getAttribute("user_email");
	
		MemberDAO mdao = new MemberDAO();
		MemberBean mem = mdao.getMember(id);
			
		request.setAttribute("mem",mem );
			
			forward=new ActionForward();
			forward.setRedirect(false); //주소값 노출 안됨

			forward.setPath("/user/Usermodify.jsp");

		
	}else if(command.equals("/MemberUpdateAction.me")){	
		
				action=new MemberUpdateAction();
				
				try {
		
					forward=action.execute(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		
		
	}else if(command.equals("/logout.me")){
		
		//로그아웃 처리를 위한 Action객체 생성  
		action=new MemberLogoutAction();
		try {
	
			forward=action.execute(request, response); //return null;

		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

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
