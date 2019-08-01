package net.reservation.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.reservation.db.PassengerDTO;
import net.search.db.searchDTO;


@WebServlet("/reservation/*")
public class ReservationFrontController extends HttpServlet{

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
		System.out.println("sohee:command = "+command);
		
		if(command.equals("/passengerInfoaction")) {//사용자에게 입력받은 예약자 정보들을 저장
				
				         forward = new ActionForward(); 
				         action =new PassengerInfoaction(); 
				         
				         try {
				        	 forward= action.execute(request, response);
							
						} catch (Exception e) {
							// TODO: handle exception
						}
			
			
		}else if(command.equals("/selectseatsaction")){//사용자가 선택한 예약좌석정보들을 받아옴. 
					forward = new ActionForward(); 
					action= new Selectseatsaction();
					
					try {

						forward=action.execute(request, response);

					} catch (Exception e) {
						// TODO: handle exception
					}
			
			
		}else if(command.equals("/resercompleteaction")){ //예약 완료 
			
				forward = new ActionForward();
				action= new Resercompleteaction();
				
				try {
					forward=action.execute(request, response);
					
				} catch (Exception e) {
				
				}

		}else if(command.equals("/showseatsinfoaction")){//좌석정보들 db에서 검색해서 예약가능한 좌석들만 예약가능하게 하는 기능 
			
			forward = new ActionForward();
			action= new Showseatsinfoaction();
			try {
				forward=action.execute(request, response);
				
			} catch (Exception e) {
			
			}
			
		}else if(command.equals("/reserstep4forward")){//Reserstep4.jsp로 이동
			
			forward = new ActionForward();
			
			forward.setPath(request.getContextPath()+"/reserve/ReserStep4.jsp");
			forward.setRedirect(true);
			
		}else if(command.equals("/backtoReserStep2")){
			
			 	request.getSession().removeAttribute("pasinfoarr");
				forward = new ActionForward();
				forward.setPath(request.getContextPath()+"/reserve/ReserStep2.jsp");
				forward.setRedirect(false);
		}else if(command.equals("/backtoReserStep3")){
			request.getSession().removeAttribute("seatsinfoarr");
			forward = new ActionForward();
			forward.setPath(request.getContextPath()+"/reserve/ReserStep3.jsp");
			forward.setRedirect(false);
		}
		
	
		//이동
		if(forward!=null){
			if(forward.isRedirect()){//redirect방식인경우
				response.sendRedirect(forward.getPath());
			}else{//dispatcher방식인 경우 
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
	
	
	
}
