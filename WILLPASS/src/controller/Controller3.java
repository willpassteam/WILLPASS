package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reserve1/*")
public class Controller3 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String command = request.getPathInfo();
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/ReserStep1.do")){
			String order = request.getParameter("order");
			System.out.println(order);
			action = new SearchPriceAction();
			
			try {
				forward = action.execute(request, response);
				System.out.println("234");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ReserStep2.do")){
			
			action = new Searcharr();
			
			try {
				forward = action.execute(request, response);
				System.out.println(forward.getPath()+"여기서 어디로 보내는거징");
				System.out.println("555");
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}// doHandle 끝

}//서블릿 끝
