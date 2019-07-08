package Chatting.C;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class searchcontroller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	protected void doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String RequestURI= req.getRequestURI();
		System.out.println(RequestURI);
		String contextPath=req.getContextPath();
		System.out.println(contextPath);
		
		System.out.println(contextPath.length());
		
		String command= RequestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		
		Action action=null;
		
			if(command.equals("/jinwooo/search.jin")){
			System.out.println("search.jin");
			try {
				forward=action.execute(req, resp);
				
				
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		else if(command.equals("/jinwoo/searchpro.jin")){
			System.out.println("searchpro.jin");
			try {
				action=new searchFowarding();
				forward=action.execute(req, resp);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			forward.setRedirect(false);
			forward.setPath("/jinwoo/searchpro.jsp");
		}else{
			System.out.println("예외");
		}
			
			
			
			
		if(forward != null){//new ActrionForward()객체가 저장되어 있고
			
			if(forward.isRedirect()){ //true ->Response.sendRedirect()
				
				resp.sendRedirect(forward.getPath());
				
			}else {//false->dis.forward(request,response)
				
				RequestDispatcher dis= req.getRequestDispatcher(forward.getPath());
				dis.forward(req, resp);
			}
			
		}
		
	}
}
