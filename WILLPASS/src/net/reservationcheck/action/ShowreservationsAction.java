package net.reservationcheck.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reservationcheck.db.RserCheckDAO;

public class ShowreservationsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		String re=request.getParameter("resersta");
		String from=request.getParameter("from");
		String to = request.getParameter("to");
		RserCheckDAO dao = new RserCheckDAO();
		String useremail=(String)request.getSession().getAttribute("user_email");
		ArrayList list = new ArrayList();
		list=dao.showReservation(useremail,from,to);			
		request.setAttribute("reserresult", list);
		request.setAttribute("resersta",re);
		forward.setPath("/resercheck/resercheckview.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
