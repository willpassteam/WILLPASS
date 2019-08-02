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

public class ajaxGetAdminchat implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int chat_no = Integer.parseInt(request.getParameter("chat_no"));
		
		ArrayList<chatDTO> result = new chatDAO().getChatList( chat_no);
		JSONArray array = new JSONArray();
		for (int i = 0; i < result.size(); i++) {
			JSONObject obj = new JSONObject();
			
			String date = result.get(i).getChat_date().toString().substring(5,16);
			obj.put("chat_content", result.get(i).getChat_content());
			obj.put("chat_date",date);
			obj.put("chat_no", "\""+result.get(i).getChat_no()+"\"");
			obj.put("user_email", result.get(i).getUser_email());
			obj.put("chat_who", "\""+result.get(i).isChat_who()+"\"");
			obj.put("size", result.size());
			array.add(obj);
		}
		
		/*String outresult = array.toJSONString();*/
		
		PrintWriter out = response.getWriter();
		
		out.print(array.toString());
		out.close();
		return null;
	}

}
