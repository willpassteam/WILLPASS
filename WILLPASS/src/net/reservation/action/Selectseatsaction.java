package net.reservation.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Selectseatsaction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward= new ActionForward();
		forward.setPath("/reservation/reserstep4forward");
		forward.setRedirect(false);
		
		ArrayList pasinfoarr= (ArrayList)request.getSession().getAttribute("pasinfoarr");
		String result1[]=request.getParameterValues("selected_1");
		
		ArrayList seatsinfoarr= new ArrayList();
		
		String isroundtrip=request.getParameter("isroundtrip"); //왕복인지 아닌지 
		
		seatsinfoarr.add(result1); //1구간에 대한 사용자가 선택한 좌석정보를 배열에 저장
		
		if(isroundtrip.equals("true")){ 
			
			String result2[]=request.getParameterValues("selected_2");
			seatsinfoarr.add(result2); //왕복이라면 2구간에 대한 사용자가 선택한 좌석 정보를 배열에 저장
		}
		
		request.getSession().setAttribute("seatsinfoarr",seatsinfoarr);
		
		return forward;
	}
	
}
