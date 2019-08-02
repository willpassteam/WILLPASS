package net.question.chat.m;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.fabric.Response;

import net.question.chat.c.Action;
import net.question.chat.c.ActionForward;
import net.question.chat.db.chatDAO;
import net.question.chat.db.chatDTO;





public class ajaxGetAdminList implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList list = new chatDAO().getAllChat_List_Name();
		JSONArray resultarray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			
			JSONObject obj = new JSONObject();
			HashMap map = (HashMap)list.get(i);
			String date = map.get("chat_date").toString().substring(5,16);
			obj.put("chat_content", map.get("chat_content"));
			obj.put("chat_date",date);
			obj.put("chat_no", (int)map.get("chat_no"));
			obj.put("user_email", map.get("user_email"));
			obj.put("chat_who", map.get("chat_who"));
			obj.put("count", map.get("count"));
			obj.put("allsize", list.size());
			resultarray.add(obj);
		}
		
		
		
		PrintWriter out = response.getWriter();
		
		out.print(resultarray);
		out.close();
		
		return null;
	}

}
