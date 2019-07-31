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
		int maxnum= reserdao.getmaxnum();
		forward.setPath(request.getContextPath()+"/main/index.jsp");
		forward.setRedirect(true);

		
		ArrayList pasinfoarr=(ArrayList)request.getSession().getAttribute("pasinfoarr"); //PassengerDTO 들어있음 승객수별로 
		ArrayList seatsinfoarr=(ArrayList)request.getSession().getAttribute("seatsinfoarr"); //String[] 들어있음 왕복 편도 여부따라서 
		ArrayList searcharr = (ArrayList)request.getSession().getAttribute("searcharr"); //선택된 항공편에대한 정보 
		
		ArrayList Reservationarr1= new ArrayList();
		ArrayList Reservationarr2= new ArrayList();
		
		ReservationDTO reserdto ;
		PassengerDTO psdto;
		String[] onepartseat;
		searchDTO sreardt;
		
		String email="";
		
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
				int v13=sreardt.getPrice()+9000+32000;
				String v14=searnum;
				reserdto= new ReservationDTO(v1,v2,v3,v4,v5,v6,v7,v8,v9,v11,v12,v13,v14);
				email=v5;
				Reservationarr1.add(reserdto);
		
			}
			reserdao.insertreserresult(Reservationarr1,maxnum); //1구간에 대한 예약정보를 디비에 넣기 
			
			if(searcharr.size()==2){
				String seatinfo2[]= (String[])seatsinfoarr.get(1);
				sreardt = (searchDTO)searcharr.get(1);
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
				int v13=sreardt.getPrice()+9000+32000;
				String v14=searnum;
					
				reserdto= new ReservationDTO(v1,v2,v3,v4,v5,v6,v7,v8,v9,v11,v12,v13,v14);
				Reservationarr2.add(reserdto);
					
				}
				reserdao.insertreserresult(Reservationarr2,maxnum);  //2구간에 대한 예약정보를 디비에 넣기 
					
			}
			
			SendResermail sendResermail = new SendResermail(); //예약확인 이메일 
			 sendResermail.sendEmail(email,Reservationarr1,Reservationarr2);
			 request.getSession().removeAttribute("pasinfoarr");
			 request.getSession().removeAttribute("seatsinfoarr");
			 request.getSession().removeAttribute("searcharr");
		
			 
		
		return forward;}

}
