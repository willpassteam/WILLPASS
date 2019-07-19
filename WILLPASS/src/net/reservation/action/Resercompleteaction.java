package net.reservation.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reservation.db.PassengerDTO;
import net.reservation.db.ReservationDTO;
import net.search.db.searchDTO;

public class Resercompleteaction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward= new ActionForward();
		ReserDAO reserdao = new ReserDAO();
		forward.setPath("/main/index.jsp");
		forward.setRedirect(false);

		ArrayList pasinfoarr=(ArrayList)request.getSession().getAttribute("pasinfoarr"); //PassengerDTO 들어있음 승객수별로 
		ArrayList seatsinfoarr=(ArrayList)request.getSession().getAttribute("seatsinfoarr"); //String[] 들어있음 왕복 편도 여부따라서 
		ArrayList searcharr = (ArrayList)request.getSession().getAttribute("searcharr"); //선택된 항공편에대한 정보 
		
		ArrayList Reservationarr1= new ArrayList();
		ArrayList Reservationarr2= new ArrayList();
		
		ReservationDTO reserdto ;
		PassengerDTO psdto;
		String[] onepartseat;
		searchDTO sreardt;
		
		String seatinfo1[]= (String[])seatsinfoarr.get(0);
		sreardt = (searchDTO)searcharr.get(0); 
		onepartseat=(String[])seatsinfoarr.get(0);
			
			for(int i=0;i<pasinfoarr.size();i++)
			{
				String searnum=onepartseat[i];
				psdto = (PassengerDTO)pasinfoarr.get(i);
				String v1=psdto.getPafname();
				String v2=psdto.getPagender();
				Date  v3=sreardt.getDate();
				String v4= psdto.getPaname();
				String v5= psdto.getPareemail();
				String v6=sreardt.getAirline();
				String v7=sreardt.getFlight();
				String v8=sreardt.getDeparture_time();
				String v9=sreardt.getStarting();
				String v11=sreardt.getDestination();
				String v12= sreardt.getArrival_time();
				int v13=sreardt.getPrice();
				String v14=searnum;
				boolean v15=sreardt.isRound_trip();
				reserdto= new ReservationDTO(v1,v2,v3,v4,v5,v6,v7,v8,v9,v11,v12,v13,v14,v15);
				Reservationarr1.add(reserdto);
		
			}
			reserdao.insertreserresult(Reservationarr1,1); //1구간에 대한 예약정보를 디비에 넣기 
			
			if(searcharr.size()==2){
				System.out.println("왕복이라는 의미자나");
				String seatinfo2[]= (String[])seatsinfoarr.get(1);
				System.out.println("if문2인경우");
				sreardt = (searchDTO)searcharr.get(1);
				System.out.println(sreardt.getStarting());
				onepartseat=(String[])seatsinfoarr.get(1);
			
				for(int i=0;i<pasinfoarr.size();i++)
				{	String searnum=onepartseat[i];
				psdto = (PassengerDTO)pasinfoarr.get(i);
				String v1=psdto.getPafname();
				String v2=psdto.getPagender();
				Date  v3=sreardt.getDate();
				String v4= psdto.getPaname();
				String v5= psdto.getPareemail();
				String v6=sreardt.getAirline();
				String v7=sreardt.getFlight();
				String v8=sreardt.getDeparture_time();
				String v9=sreardt.getStarting();
				String v11=sreardt.getDestination();
				String v12= sreardt.getArrival_time();
				int v13=sreardt.getPrice();
				String v14=searnum;
				boolean v15=sreardt.isRound_trip();
					
				reserdto= new ReservationDTO(v1,v2,v3,v4,v5,v6,v7,v8,v9,v11,v12,v13,v14,v15);
				Reservationarr2.add(reserdto);
					
				}
				
				reserdao.insertreserresult(Reservationarr2,2);  //2구간에 대한 예약정보를 디비에 넣기 
					
			}
			
		
			
		
		
		return forward;
	}

}
