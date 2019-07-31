package net.question.chat.m;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.question.chat.c.Action;
import net.question.chat.c.ActionForward;
import net.question.chat.db.chatDAO;
import net.question.chat.db.chatDTO;

public class ajaxGetAllList implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int chat_no = Integer.parseInt(request.getParameter("chat_no"));
		
		
		String user_email = (String)request.getSession(true).getAttribute("user_email");
		
		ArrayList<chatDTO> result = new chatDAO().getChatList(user_email, chat_no);
		JSONArray array = new JSONArray();
		for (int i = 0; i < result.size(); i++) {
			JSONObject obj = new JSONObject();
			
			
			obj.put("chat_content", result.get(i).getChat_content());
			obj.put("chat_date","\""+result.get(i).getChat_date()+"\"");
			obj.put("chat_no", "\""+result.get(i).getChat_no()+"\"");
			obj.put("user_email", result.get(i).getUser_email());
			obj.put("chat_who", "\""+result.get(i).isChat_who()+"\"");
			
			array.add(obj);
		}
		
		/*String outresult = array.toJSONString();*/
		
		PrintWriter out = response.getWriter();
		
		System.out.println(array.toString());
		out.print(array.toString());
		out.close();
		
		return forward;
		
	}

}
