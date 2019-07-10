package net.reservation.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
			try {
				
		ReserDAO redao= new ReserDAO();
	
		System.out.println("dao 생성완료");
				
		forward = new ActionForward();
		forward.setPath("/reserve/ReserStep2.jsp");
		forward.setRedirect(false);
		searchVO first = new searchVO();
		first.setAirline("에어부산");
			first.setArrival_time("10:05");
			SimpleDateFormat transFormat = new SimpleDateFormat("yy-mm-dd");
			first.setDate(transFormat.parse("2019-07-25"));
			System.out.println(first.getDate());
			first.setDeparture_time("8:35");
			first.setDestination("오사카");
			first.setFlight("BX124");
			first.setPeople("2");
			first.setRound_trip(true);
			first.setStarting("부산");
			first.setTime("2시간30분");
			
			searchVO second = new searchVO();
			second.setAirline("에어부산");
			second.setArrival_time("12:35");
			second.setDate(transFormat.parse("2019-07-30"));
			second.setDeparture_time("11:00");
			second.setDestination("부산");
			second.setFlight("BX123");
			second.setPeople("2");
			second.setRound_trip(true);
			second.setStarting("오사카");
			second.setTime("2시간30분");

			ArrayList searcharr = new ArrayList();
			searcharr.add(first);
			searcharr.add(second);
		
			request.getSession().setAttribute("searcharr",searcharr);
			request.getSession().setAttribute("searchprice",550000);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
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
			 ReserDAO reserdao = new ReserDAO();
			 ArrayList searcharrlist = (ArrayList)request.getSession().getAttribute("searcharr");
			
			 searchVO searvo=(searchVO)searcharrlist.get(0);
			 String searflight= searvo.getFlight();
			  java.util.Date utilDate = searvo.getDate();
//			  java.sql.Date seardate = new java.sql.Date(utilDate.getTime());
			 java.sql.Date seardate= new java.sql.Date(searvo.getDate().getTime());
			 possibleseats1=reserdao.selpossibleseat(seardate,searflight);
			 
//			 System.out.println("배열크기"+possibleseats1.length);
			 
//			 System.out.println("결과출력");
			 for(int i=0;i<possibleseats1.length;i++){
//				 
				 System.out.println(possibleseats1[i]);
			 }
			 
			 if(searvo.isRound_trip()){
				 searchVO searvo2= (searchVO)searcharrlist.get(1);
				 String searflight2= searvo2.getFlight();
				 java.sql.Date seardate2= (java.sql.Date)searvo2.getDate();
				 possibleseats2=reserdao.selpossibleseat(seardate2,searflight2);
				 
				 
			 }
			
			 
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
