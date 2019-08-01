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





public class ajaxGetAdminList implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<ArrayList> list = new chatDAO().getAllChat_List();
		JSONArray resultarray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			
			JSONArray array = new JSONArray();
			for (int j = 0; j < list.get(i).size(); j++) {
				ArrayList<chatDTO> result = list.get(i);	
				JSONObject obj = new JSONObject();
				String date = result.get(j).getChat_date().toString().substring(5,16);
				obj.put("chat_content", result.get(j).getChat_content());
				obj.put("chat_date",date);
				obj.put("chat_no", Integer.toString(result.get(j).getChat_no()));
				obj.put("user_email", result.get(j).getUser_email());
				obj.put("chat_who", Boolean.toString(result.get(j).isChat_who()));
				obj.put("chat_count", result.size());
				obj.put("allsize", list.size());
				array.add(obj);
				
			}
			
			
			resultarray.add(array);
			
		}
		
		
		PrintWriter out = response.getWriter();
		
		out.print(resultarray.toString());
		out.close();
		
		return null;
	}

}
