package net.reservationcheck.action;

public class ShowOneReserAction implements Action{

	public ActionForward execute(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("/resercheck/resercheckselect.jsp");
		return forward;
		
		
	}
	
}
