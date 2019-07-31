package net.check;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import oracle.net.aso.r;


@WebServlet("/pwdcheck")
public class PWDCHECK extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		dohan(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		dohan(req, resp);
	}
	
	
	protected void dohan(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		//String id=req.getParameter("id");
		String user_mobile=req.getParameter("user_mobile"); 
		String user_email=req.getParameter("user_email"); 
		
		checkDAO dao=new checkDAO();
		
		
		//int result=dao.searchingId(id);
		String result = dao.searchingPwd(user_mobile,user_email);
		
		//String result = dao.searchingMobile(user_mobile);
				
				if(result==""){
					result="0";
				}
				PrintWriter out= resp.getWriter();
		
		
		
		//PrintWriter out= resp.getWriter();
		
		out.println(result);
		
		out.close();
		
	}
	
	

}
