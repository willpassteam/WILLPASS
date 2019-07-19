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
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		
        forward.setPath("/reserve/ReserStep3.jsp");
        forward.setRedirect(false);
        System.out.println("이거는실행됨");
        	
        	int num=Integer.parseInt(request.getParameter("num_people"));
        	
        	ArrayList pasinfoarr= new ArrayList();
        	
        	String pagender;
        	String pafname; 
        	String paname;
        	String paretel;
        	String pareemail; 
        
        	System.out.println("여기느낌은데1");
        	
        for (int i=0;i<num;i++) {
           
           
            pagender=(String)request.getParameter("gender"+(i+1));
            pafname=(String)request.getParameter("familyName"+(i+1));
            paname=(String)request.getParameter("givenName"+(i+1));
            paretel=(String)request.getParameter("tel1")+(String)request.getParameter("tel2")+(String)request.getParameter("tel3");
            pareemail=(String)request.getParameter("email1")+"@"+(String)request.getParameter("email2");
            PassengerDTO dto = new PassengerDTO(pagender, pafname, paname, paretel, pareemail);
            pasinfoarr.add(dto);    
           
        }

        int possibleseats1[] = new int[90];   
        int possibleseats2[] = new int[90];   
        
        
        ReserDAO reserdao = new ReserDAO();
//        reserdao.inserttemp();
        
        System.out.println("여기느낌은데2");
    
    	
        ArrayList searcharrlist = (ArrayList)request.getSession().getAttribute("searcharr");
        
        System.out.println(searcharrlist.size()+"넘어오는 사이즈 확인하기");
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
        request.getSession().setAttribute("pasinfoarr",pasinfoarr);
		return forward;
	}
	
	
}
