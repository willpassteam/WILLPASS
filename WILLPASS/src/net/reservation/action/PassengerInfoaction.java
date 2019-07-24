package net.reservation.action;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reservation.db.PassengerDTO;
import net.search.db.searchDTO;

public class PassengerInfoaction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
        forward.setPath(request.getContextPath()+"/reservation/showseatsinfoaction");
        forward.setRedirect(true);
        	
        	int num=Integer.parseInt(request.getParameter("num_people"));
        	
        	ArrayList pasinfoarr= new ArrayList();
        	
        	String pagender;
        	String pafname; 
        	String paname;
        	String paretel;
        	String pareemail; 
        
        	
        for (int i=0;i<num;i++) {
           
            pagender=(String)request.getParameter("gender"+(i+1));
            pafname=(String)request.getParameter("familyName"+(i+1)).toUpperCase();
            paname=(String)request.getParameter("givenName"+(i+1)).toUpperCase();
            paretel=(String)request.getParameter("tel1")+(String)request.getParameter("tel2")+(String)request.getParameter("tel3");
            pareemail=(String)request.getParameter("email1")+"@"+(String)request.getParameter("email2");
            PassengerDTO dto = new PassengerDTO(pagender, pafname, paname, paretel, pareemail);
            pasinfoarr.add(dto);    
           
        }
        
        request.getSession().setAttribute("pasinfoarr",pasinfoarr);
   
		return forward;
	}
	
	
}
