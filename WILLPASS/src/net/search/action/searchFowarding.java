package net.search.action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import net.search.db.searchDAO;
import net.search.db.searchDTO;
import net.search.db.timeDTO;
import net.search.db.timeDTO;

public class searchFowarding implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		searchDAO dao= new searchDAO();
		
		String starting=request.getParameter("starting");
		String st=dao.linecheck(starting);
		String destination=request.getParameter("destination");
		String ed=dao.linecheck(destination);
		
		int round_trip=Integer.parseInt(request.getParameter("round_trip"));
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String people=request.getParameter("adult");
//		String people=request.getParameter("adult")+":";
//		int people=Integer.parseInt(request.getParameter("adult"));
		
		String date="";
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			long time;
			
				time = (format.parse(from).getTime()-System.currentTimeMillis());
				 long calDateDays = ((time / ( 24*60*60*1000))+1)%7-7;
				 int now=Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(System.currentTimeMillis()))+(int)calDateDays;
				 date=Integer.toString(now);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
			Document airline=Jsoup.connect("http://www.airportal.co.kr/servlet/aips.life.airinfo.RaSkeCTL?gubun=c_getList&curr_page=1&one_page=70&one_group=10&dep_airport="+st+"&arr_airport="+ed+"&srch_type=dep&current_dt_from="+from+"&current_dt_to="+from+"&regCls=1&al_icao=&fp_iata=").post();
			Elements tr=airline.getElementsByTag("tbody").get(2).getElementsByTag("tr");
			
			
			List list=new ArrayList();
			timeDTO times=new timeDTO();
			for(int i=0; i<tr.size();i+=2){
				searchDTO vo= new searchDTO();
				
				String sAirline=tr.get(i).getElementsByTag("td").get(2).text();
				String sFlight=tr.get(i).getElementsByTag("td").get(4).text();
				String sStarting=tr.get(i).getElementsByTag("td").get(6).text().split("->")[0];
				String sDestination=tr.get(i).getElementsByTag("td").get(6).text().split("->")[1];
//				String sfFlight =dao.flightcheck(sAirline);
//				sfFlight=sFlight.replace(sfFlight, sfFlight+"/");
//				System.out.println("timecheck start");
				
				vo.setAirline(sAirline);
				vo.setFlight(sFlight);
				vo.setStarting(sStarting);
				vo.setDestination(sDestination);
//				vo.setDeparture_time(times.getDeparture_time());
//				vo.setArrival_time(times.getArrival_time());
//				vo.setTime(times.getTime());
				vo.setRound_trip(false);
				vo.setDate(new Date(new SimpleDateFormat("yyyyMMdd").parse(from).getTime()));
				vo.setPeople(people);
				
				list.add(vo);
			}
			
			timecheck dto=new timecheck();
			list=dto.times(list); 
			

			for(int i=0; i<list.size();i++){
				searchDTO vo= (searchDTO)list.get(i);
				if(vo.getArrival_time()==null){
					list.remove(list.get(i));
				}
			}

			request.getSession().setAttribute("list1",list );

		 if(round_trip==1){
			 List list_1=new ArrayList();
			Document airline_1=Jsoup.connect("http://www.airportal.co.kr/servlet/aips.life.airinfo.RaSkeCTL?gubun=c_getList&curr_page=1&one_page=70&one_group=10&dep_airport="+ed+"&arr_airport="+st+"&srch_type=dep&current_dt_from="+to+"&current_dt_to="+to+"&regCls=1&al_icao=&fp_iata=").post();
			Elements tr_1=airline_1.getElementsByTag("tbody").get(2).getElementsByTag("tr");
			String date_1="";
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
				long time;
				
					time = (format.parse(to).getTime()-System.currentTimeMillis());
					 long calDateDays = ((time / ( 24*60*60*1000))+1)%7-7;
					 int now=Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(System.currentTimeMillis()))+(int)calDateDays;
					 date_1=Integer.toString(now);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			
			for(int i=0; i<tr_1.size();i+=2){
				searchDTO vo= new searchDTO();
				
				String sAirline=tr_1.get(i).getElementsByTag("td").get(2).text();
				String sFlight=tr_1.get(i).getElementsByTag("td").get(4).text();
				String sStarting=tr_1.get(i).getElementsByTag("td").get(6).text().split("->")[0];
				String sDestination=tr_1.get(i).getElementsByTag("td").get(6).text().split("->")[1];
				
				vo.setAirline(sAirline);
				vo.setFlight(sFlight);
				vo.setStarting(sStarting);
				vo.setDestination(sDestination);
				vo.setRound_trip(true);
				vo.setDate(new Date(new SimpleDateFormat("yyyyMMdd").parse(to).getTime()));
				vo.setPeople(people);
				
				list_1.add(vo);
			}
			timecheck dto_1=new timecheck();
			list_1=dto_1.times(list_1); 

			
			for(int i=0; i<list_1.size();i++){
				searchDTO vo= (searchDTO)list_1.get(i);
				if(vo.getArrival_time()==null){
					list_1.remove(list_1.get(i));
				}
			}
			request.setAttribute("list2",list_1);

			request.getSession().setAttribute("list2",list_1);
//			request.setAttribute("list2",list_1);

		}
		
		
		return forward;
	}
}
