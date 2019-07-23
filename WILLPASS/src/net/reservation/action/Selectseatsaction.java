package net.reservation.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Selectseatsaction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward= new ActionForward();
		forward.setPath("/reserve/ReserStep4.jsp");
		forward.setRedirect(false);
		ArrayList pasinfoarr= (ArrayList)request.getSession().getAttribute("pasinfoarr");
		String result1[]=request.getParameterValues("selected_1");
		
		ArrayList seatsinfoarr= new ArrayList();
		
		String isroundtrip=request.getParameter("isroundtrip");
		seatsinfoarr.add(result1);
		if(isroundtrip.equals("true")){
			
			String result2[]=request.getParameterValues("selected_2");
			seatsinfoarr.add(result2);
		}
		
		request.getSession().setAttribute("seatsinfoarr",seatsinfoarr);

	
		
		return forward;
	}
	
}
