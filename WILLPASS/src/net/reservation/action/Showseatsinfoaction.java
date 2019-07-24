package net.reservation.action;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.search.db.searchDTO;

public class Showseatsinfoaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
			ActionForward forward = new ActionForward();
		
			forward.setPath("/reserve/ReserStep3.jsp");
			forward.setRedirect(false);
			int possibleseats1[] = new int[90];   
	        int possibleseats2[] = new int[90];   
	        
	        
	        ReserDAO reserdao = new ReserDAO();
	        
	        ArrayList searcharrlist = (ArrayList)request.getSession().getAttribute("searcharr");
	        
	        searchDTO searvo=(searchDTO)searcharrlist.get(0);
	        
	        String searflight= searvo.getFlight();
	        System.out.println("searflight: "+searflight);
	        Date seardate = searvo.getDate();
	        System.out.println("seardate: "+seardate.toString());

	        possibleseats1=reserdao.selpossibleseat(seardate,searflight);


	        if(searcharrlist.size()==2){
	        	searchDTO searvo2= (searchDTO)searcharrlist.get(1);
	           String searflight2= searvo2.getFlight();
	           Date seardate2 = searvo2.getDate();
	           possibleseats2=reserdao.selpossibleseat(seardate2,searflight2);
	        }
	        
	   
	      
	        request.setAttribute("possibleseats1", possibleseats1);
	        request.setAttribute("possibleseats2", possibleseats2);
		
		return forward;
	}
	
}
