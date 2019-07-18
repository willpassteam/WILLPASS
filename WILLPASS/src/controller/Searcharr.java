package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.search.db.searchDTO;

public class Searcharr implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("전달");
		
		//날짜 변환
		String from1 = request.getParameter("date1");
		String from2 = request.getParameter("date2");
		SimpleDateFormat trans = new SimpleDateFormat("yyyyMMdd");
		Date date1 = Date.valueOf(from1);
		Date date2 = Date.valueOf(from2);
	 	
	 	//왕복 여부
	 	String round1 = request.getParameter("round_trip1");
	 	Boolean round_trip1 = true;
	 	String round2 = request.getParameter("round_trip2");
	 	Boolean round_trip2 = true;

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
		
		ArrayList searcharr = new ArrayList();
		searcharr.add(sdto);
		searcharr.add(sdto2);
		
		System.out.println(searcharr.size()+"사이즈");
		
		//세션저장
		HttpSession session = request.getSession();
		session.setAttribute("searcharr", searcharr);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		System.out.println("삼촌 액션 실행 ~~!!!");
		forward.setPath("/reserve/ReserStep2.jsp");
		
		return forward;
	}

}
