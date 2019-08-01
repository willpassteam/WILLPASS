package net.reservationcheck.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import net.reservation.db.ReservationDTO;
import net.reservationcheck.db.RserCheckDAO;

public class ShowOneReserAction implements Action{

	public ActionForward execute(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws Exception {

		String num = request.getParameter("num");
		RserCheckDAO dao = new RserCheckDAO();
		PrintWriter out= response.getWriter();
		ArrayList list= new ArrayList();
		JSONArray jsonarr= new JSONArray();
		jsonarr=dao.showOneReservation(num);
		out.print(jsonarr);
	
		return null;
		
		
	}
	
}
