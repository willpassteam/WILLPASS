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
		ArrayList Reservationarr= new ArrayList();
		
		
		try {
			System.out.println("좌석정보 "+seatsinfoarr.size());
			String seatinfo1[]= (String[])seatsinfoarr.get(0);
			String seatinfo2[]= (String[])seatsinfoarr.get(1);
			
			
			for(int i=0;i<seatinfo1.length;i++){
				System.out.println("좌석정보1"+seatinfo1[i]);
				
			}
			
			for(int i=0;i<seatinfo2.length;i++){
				
				System.out.println("좌석정보2"+seatinfo2[i]);
			}
			
			searchDTO ssd= new searchDTO();
			for(int i=0;i<searcharr.size();i++){
				
				ssd=(searchDTO)searcharr.get(i);
				System.out.println("출발지"+ssd.getStarting());
				System.out.println("도착지"+ssd.getDestination());
			}
			
			System.out.println("항공편에대한정보"+searcharr.size());
			System.out.println("승객정보"+pasinfoarr.size());
			
		} catch (Exception e) {
			System.out.println("오류났당 ================="+e);
		}
		
		
	
		ReservationDTO reserdto ;
		PassengerDTO psdto;
		String[] onepartseat;
		searchDTO sreardt;
		
		
		
			
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
		
				
				Reservationarr.add(reserdto);
			
				
			}
			
			if(seatsinfoarr.size()==2){
				
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
				Reservationarr.add(reserdto);
					
				}
				
				
			}
			reserdao.insertreserresult(Reservationarr);
			System.out.println(Reservationarr.size()+"넘어갈 배열의 사이즈인데 설마 5?");
		
		
		
		return forward;
	}

}
