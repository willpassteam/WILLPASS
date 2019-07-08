package jinwoo.c;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jinwoo.db.checkDTO;
import jinwoo.db.searchDAO;

@WebServlet("/endcheck")
public class check extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String startLine=req.getParameter("startLine");
		
		searchDAO dao= new searchDAO();
		
		ArrayList<checkDTO> list= dao.startcheck(startLine);
		
		 JSONArray jArray = new JSONArray();//배열이 필요할때
		 try {
			
	            for (int i = 0; i < list.size(); i++) {
	                JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
	                sObject.put("startLine", list.get(i).getStartLine());
	                sObject.put("startvalue", list.get(i).getStartvalue());
	                sObject.put("endLine", list.get(i).getEndLine());
	                sObject.put("endvalue", list.get(i).getEndvalue());
	                sObject.put("international", list.get(i).getInternational());
	                jArray.add(sObject);
	            }
	 
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 JSONObject jlist= new JSONObject();
		 jlist.put("list", jArray);



		PrintWriter out=resp.getWriter();

		out.print(jlist.toString());
		
	}
}
		