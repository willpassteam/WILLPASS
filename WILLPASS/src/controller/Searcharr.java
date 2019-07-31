package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.BlobFromLocator;

import net.search.db.searchDTO;

public class Searcharr implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

				
		ArrayList searcharr = new ArrayList();
		SimpleDateFormat trans = new SimpleDateFormat("yyyyMMdd");

		//가는 항공편
		
		String from1 = request.getParameter("date1");
		Date date1 = Date.valueOf(from1);
		
	 	String round1 = request.getParameter("round_trip1");
	 	Boolean round_trip1 = Boolean.valueOf(round1).booleanValue();
	
		searchDTO sdto = new searchDTO();
		sdto.setStarting(request.getParameter("starting1"));
		sdto.setDestination(request.getParameter("destination1"));
		sdto.setDate(date1);
		sdto.setDeparture_time(request.getParameter("departure_time1"));
		sdto.setArrival_time(request.getParameter("arrival_time1"));
		sdto.setPeople(request.getParameter("people1"));
		sdto.setAirline(request.getParameter("airline1"));
		sdto.setRound_trip(round_trip1);
		sdto.setFlight(request.getParameter("flight1"));
		sdto.setPrice(Integer.parseInt(request.getParameter("price1")));
		sdto.setLeftseat(Integer.parseInt(request.getParameter("leftseat1")));
		
		searcharr.add(sdto);
		
				
		//오는 항공편
		if(request.getSession().getAttribute("newlist2") != null) {
					
		String from2 = request.getParameter("date2");
		Date date2 = Date.valueOf(from2);
		String round2 = request.getParameter("round_trip2");
	 	Boolean round_trip2 = Boolean.valueOf(round2).booleanValue();
		
		searchDTO sdto2 = new searchDTO();
		sdto2.setStarting(request.getParameter("starting2"));
		sdto2.setDestination(request.getParameter("destination2"));
		sdto2.setDate(date2);
		sdto2.setDeparture_time(request.getParameter("departure_time2"));
		sdto2.setArrival_time(request.getParameter("arrival_time2"));
		sdto2.setPeople(request.getParameter("people2"));
		sdto2.setAirline(request.getParameter("airline2"));
		sdto2.setRound_trip(round_trip2);
		sdto2.setFlight(request.getParameter("flight2"));
		sdto2.setPrice(Integer.parseInt(request.getParameter("price2")));
		sdto2.setLeftseat(Integer.parseInt(request.getParameter("leftseat2")));
		
		searcharr.add(sdto2);
		
		}
		
		//세션저장
		HttpSession session = request.getSession();
		session.setAttribute("searcharr", searcharr);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("/reserve/ReserStep2.jsp");
		
		return forward;
	}

}
