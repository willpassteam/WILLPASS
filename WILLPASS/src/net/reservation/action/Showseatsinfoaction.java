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
			
			ReserDAO reserdao = new ReserDAO();

			int possibleseats1[] = new int[90];   
	        int possibleseats2[] = new int[90];   
	        
	        ArrayList searcharrlist = (ArrayList)request.getSession().getAttribute("searcharr"); 
	        
	        searchDTO searvo=(searchDTO)searcharrlist.get(0);
	        
	        String searflight= searvo.getFlight();
	        Date seardate = searvo.getDate();

	        //선택한 날짜 ,항공편을 이용해서 db에서 좌석들의 예약 여부를 검색해서 배열에 저장 이미 예약이 된 좌석이면 1 을 예약이 가능한 좌석이면 0을 배열에 저장함
	        possibleseats1=reserdao.selpossibleseat(seardate,searflight);


	        if(searcharrlist.size()==2){ //왕복일 경우 
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
