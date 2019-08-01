package net.question.chat.m;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.question.chat.c.Action;
import net.question.chat.c.ActionForward;
import net.question.chat.db.chatDAO;

public class closeChat implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int chat_no = Integer.parseInt(request.getParameter("chat_no"));
		new chatDAO().outUser(chat_no);
		PrintWriter out =response.getWriter();
		out.println("<script>");
		out.println("window.close();");
		out.println("</script>");
		return null;
		
	}

}
