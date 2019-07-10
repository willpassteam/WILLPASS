package net.reservation.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jinwoo.db.searchVO;
import net.reservation.db.PassengerDTO;


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
		System.out.println("command = "+command);
		
		
		if(command.equals("/before")) { //신효 - > 소희 
			forward = new ActionForward();
		forward.setPath("/reserve/ReserStep2.jsp");
		forward.setRedirect(false);
		searchVO first = new searchVO();
		first.setAirline("대한항공");
		first.setArrival_time("5시간30분");
		first.setDate(new Date(System.currentTimeMillis()));
		first.setDeparture_time("오후3시");
		first.setDestination("오사카");
		first.setFlight("ke1234");
		first.setPeople("2");
		first.setRound_trip(true);
		first.setStarting("김해");
		first.setTime("오후3시");
		
		searchVO second = new searchVO();
		second.setAirline("대한항공");
		second.setArrival_time("5시간30분");
		second.setDate(new Date(System.currentTimeMillis()));
		second.setDeparture_time("오후3시");
		second.setDestination("김해");
		second.setFlight("ke1234");
		second.setPeople("2");
		second.setRound_trip(true);
		second.setStarting("오사카");
		second.setTime("오후3시");

		ArrayList searcharr = new ArrayList();
		searcharr.add(first);
		searcharr.add(second);
	
		request.getSession().setAttribute("searcharr",searcharr);
		request.getSession().setAttribute("searchprice",550000);
		}else if(command.equals("/passengerInfo")) {
			forward = new ActionForward();
			forward.setPath("/reserve/ReserStep3.jsp");
			forward.setRedirect(false);
			int num=Integer.parseInt(request.getParameter("num_people"));
			ArrayList pasinfoarr= new ArrayList();
		String pagender;
		 String pafname; 
		 String paname;
		 String paretel;
		 String pareemail; 
			for (int i=0;i<num;i++) {
				
				
				 pagender=(String)request.getParameter("gender"+(i+1));
				 pafname=(String)request.getParameter("familyName"+(i+1));
				 paname=(String)request.getParameter("givenName"+(i+1));
				 paretel=(String)request.getParameter("tel1")+(String)request.getParameter("tel2")+(String)request.getParameter("tel3");
				 pareemail=(String)request.getParameter("email1")+(String)request.getParameter("email2");
				 PassengerDTO dto = new PassengerDTO(pagender, pafname, paname, paretel, pareemail);
				 pasinfoarr.add(dto);	 
				
			}

			int possibleseats1[] = new int[90];	
			int possibleseats2[] = new int[90];	
			
			for(int i=0;i<possibleseats1.length;i++) {
			if(i%7==0) {
				possibleseats1[i]=1;
			}else possibleseats1[i]=0;
				
			}
			
			for(int i=0;i<possibleseats2.length;i++) {
			if(i%8==0) {

				possibleseats2[i]=1;
			}else possibleseats2[i]=0;
				
			}
			
			System.out.println(pasinfoarr.size());
			request.setAttribute("possibleseats1", possibleseats1);
			request.setAttribute("possibleseats2", possibleseats2);
			request.getSession().setAttribute("pasinfoarr",pasinfoarr);
			
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
