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
		
		
		if(command.equals("/before")) { //신효 - > 소희 
			System.out.println("실행됨");
		
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    Date parsed1 = null;
		    Date parsed2 = null;
		    try {
		        parsed1 = sdf.parse("20/07/2019");
		        parsed2 = sdf.parse("27/07/2019");
		    } catch (Exception e1) {
		        // TODO Auto-generated catch block
		        e1.printStackTrace();
		    }
		    java.sql.Date d1 = new java.sql.Date(parsed1.getTime());
		    java.sql.Date d2 = new java.sql.Date(parsed2.getTime());
			
		    
		      forward = new ActionForward();
		      forward.setPath("/reserve/ReserStep2.jsp"); 
		      forward.setRedirect(false);
			
			searchDTO serdto = new searchDTO();
			serdto.setAirline("진에어");
			serdto.setStarting("김해(PUS)");
			serdto.setArrival_time("09:25 JST");
			serdto.setCheckseat(true);
			serdto.setDate(d1);
			serdto.setDeparture_time("08:05 KST");
			serdto.setDestination("간사이(KIX)");
			serdto.setFlight("LJ215");
			serdto.setPeople("2");
			serdto.setPrice(500000);
			serdto.setRound_trip(true);
			
			searchDTO serdto2 = new searchDTO();

			serdto2.setAirline("진에어");
			serdto2.setStarting("간사이(KIX)");
			serdto2.setArrival_time("11:55 KST");
			serdto2.setCheckseat(true);
			serdto2.setDate(d2);
			serdto2.setDeparture_time("10:25 JST");
			serdto2.setDestination("김해(PUS)");
			serdto2.setFlight("LJ216");
			serdto2.setPeople("2");
			serdto2.setPrice(500000);
			serdto2.setRound_trip(true);
			
	         	ArrayList searcharr = new ArrayList();
	         	searcharr.add(serdto);
	         	searcharr.add(serdto2);

	         	request.getSession().setAttribute("searcharr",searcharr);
	         	request.getSession().setAttribute("searchprice",100000);
	         	
			
			
		}else if(command.equals("/passengerInfoaction")) {
				
				         forward = new ActionForward(); 
				         action =new PassengerInfoaction(); 
				         
				         try {
				        	 forward= action.execute(request, response);
							
						} catch (Exception e) {
							// TODO: handle exception
						}
			
			
		}else if(command.equals("/selectseatsaction")){
					forward = new ActionForward(); 
					action= new Selectseatsaction();
					
					try {

						forward=action.execute(request, response);

					} catch (Exception e) {
						// TODO: handle exception
					}
			
			
		}else if(command.equals("/resercompleteaction")){
			
				forward = new ActionForward();
				action= new Resercompleteaction();
				
				try {
					forward=action.execute(request, response);
					
				} catch (Exception e) {
				
				}

			
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
