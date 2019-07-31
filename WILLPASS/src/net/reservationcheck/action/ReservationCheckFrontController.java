package net.reservationcheck.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reservationcheck/*")
public class ReservationCheckFrontController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward=null;
		Action action=null;
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String command = request.getPathInfo();
		System.out.println("command = "+command);
		if(command.equals("/viewall")) { //나의 예약 
			
			forward = new ActionForward(); 
	         action =new ShowAllReserAction();
	         
	         try {
	        	 
	        	forward= action.execute(request, response);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}else if(command.equals("/onereser")) { //예약상세 
			System.out.println("잠시 넘엉");
		
			
			forward = new ActionForward(); 
		    try {
		    	 action =new ShowOneReserAction();
	        	forward= action.execute(request, response);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(command.equals("/showreservations")){  //예약조회에서 조건검색
			
			forward = new ActionForward(); 
		    try {
		    	 action =new ShowreservationsAction();
	        	forward= action.execute(request, response);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
			
		
			
		//이동
		if(forward!=null){
			if(forward.isRedirect()){//redirect방식인경우
				response.sendRedirect(forward.getPath());
			}else{//dispatcher방식인 경우 
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				System.out.println("여기까진잘된다구");
				dispatcher.forward(request, response);
			}
		}else {
			
			System.out.println("에이젝스 이동임");
		}
		
	}

}
