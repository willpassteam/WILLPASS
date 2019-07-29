package net.question.chat.m;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.question.chat.c.Action;
import net.question.chat.c.ActionForward;

public class chatLogin implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		if(request.getSession(true).getAttribute("user_email") == null && false ){
			PrintWriter out =  response.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능한 페이지 입니다.')");
			out.println("</script>");
			forward.setPath("../user/Userlogin.jsp");
			forward.setRedirect(true);
		}else{
			forward = null;
		}
		return forward;
	}
	
	

}
