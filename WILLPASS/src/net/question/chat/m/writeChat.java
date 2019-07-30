package net.question.chat.m;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.question.chat.c.Action;
import net.question.chat.c.ActionForward;
import net.question.chat.db.chatDAO;

public class writeChat implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int chat_no = Integer.parseInt(request.getParameter("chat_no"));
		String content = request.getParameter("content");
		String user_email = (String)request.getSession(true).getAttribute("user_email");
		new chatDAO().writeChat(chat_no,content,user_email);
		
		
		
		return forward;
	}
	

}
