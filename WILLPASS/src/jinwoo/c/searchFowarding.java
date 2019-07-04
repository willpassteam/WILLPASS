package jinwoo.c;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import jinwoo.db.searchDAO;
import jinwoo.db.searchVO;

public class searchFowarding implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		
		String starting=request.getParameter("starting");
		String destination=request.getParameter("destination");
		int round_trip=Integer.parseInt(request.getParameter("round_trip"));
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		List list=new ArrayList();
		if(round_trip==0){
			Document airline=Jsoup.connect("http://www.airportal.co.kr/servlet/aips.life.airinfo.RaSkeCTL?gubun=c_getList&curr_page=1&one_page=50&one_group=10&dep_airport=RKSI&arr_airport=RKPK&srch_type=dep&current_dt_from="+from+"&current_dt_to="+from+"&regCls=0&al_icao=&fp_iata=").post();
			Elements tr=airline.getElementsByTag("tbody").get(2).getElementsByTag("tr");
			
			int now=Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(new Date()))+1;
			String date=Integer.toString(now);
			
			String yy=date.substring(0,4);
			String mm=date.substring(4,6);
			String dd=date.substring(6);
			
			searchDAO dao= new searchDAO();
			
			
			for(int i=0; i<tr.size();i+=2){
				searchVO vo= new searchVO();
				
				String sAirline=tr.get(i).getElementsByTag("td").get(2).text();
				String sFlight=tr.get(i).getElementsByTag("td").get(4).text();
				String sStarting=tr.get(i).getElementsByTag("td").get(6).text().split("->")[0];
				String sDestination=tr.get(i).getElementsByTag("td").get(6).text().split("->")[1];
				String sfFlight =dao.flightcheck(sAirline);
				sfFlight=sFlight.replace(sfFlight, sfFlight+"/");
				
				
				Document flight=Jsoup.connect("https://www.flightstats.com/v2/flight-details/"+sfFlight+"?year="+yy+"&month="+mm+"&date="+dd).post();
				Elements timeblock=flight.getElementsByClass("timeBlock");
				
				String departure_time=timeblock.get(0).getElementsByTag("div").get(1).text();
				String arrival_time=timeblock.get(4).getElementsByTag("div").get(1).text();
				String time=flight.getElementsByClass("flightTimeBlock").get(0).children().get(2).text();
				time=time.replace("h", "시간");
				time=time.replace("m", "분");
				System.out.println(time);
				
				vo.setAirline(sAirline);
				vo.setFlight(sFlight);
				vo.setStarting(sStarting);
				vo.setDestination(sDestination);
				vo.setDeparture_time(departure_time);
				vo.setArrival_time(arrival_time);
				vo.setTime(time);
				vo.setRound_trip(false);
				vo.setDate(new SimpleDateFormat("yyyyMMdd").parse(from));
				
				list.add(vo);
			}
		}
		else if(round_trip==1){
			Document airline=Jsoup.connect("http://www.airportal.co.kr/servlet/aips.life.airinfo.RaSkeCTL?gubun=c_getList&curr_page=1&one_page=50&one_group=10&dep_airport=RKSI&arr_airport=RKPK&srch_type=dep&current_dt_from="+from+"&current_dt_to="+from+"&regCls=0&al_icao=&fp_iata=").post();
			Elements tr=airline.getElementsByTag("tbody").get(2).getElementsByTag("tr");
			
			int now=Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(new Date()))+1;
			String date=Integer.toString(now);
			
			String yy=date.substring(0,4);
			String mm=date.substring(4,6);
			String dd=date.substring(6);
			
			searchDAO dao= new searchDAO();
			
			
			for(int i=0; i<tr.size();i+=2){
				searchVO vo= new searchVO();
				
				String sAirline=tr.get(i).getElementsByTag("td").get(2).text();
				String sFlight=tr.get(i).getElementsByTag("td").get(4).text();
				String sStarting=tr.get(i).getElementsByTag("td").get(6).text().split("->")[0];
				String sDestination=tr.get(i).getElementsByTag("td").get(6).text().split("->")[1];
				String sfFlight =dao.flightcheck(sAirline);
				sfFlight=sFlight.replace(sfFlight, sfFlight+"/");
				
				
				Document flight=Jsoup.connect("https://www.flightstats.com/v2/flight-details/"+sfFlight+"?year="+yy+"&month="+mm+"&date="+dd).post();
				Elements timeblock=flight.getElementsByClass("timeBlock");
				
				String departure_time=timeblock.get(0).getElementsByTag("div").get(1).text();
				String arrival_time=timeblock.get(4).getElementsByTag("div").get(1).text();
				String time=flight.getElementsByClass("flightTimeBlock").get(0).children().get(2).text();
				time=time.replace("h", "시간");
				time=time.replace("m", "분");
				
				vo.setAirline(sAirline);
				vo.setFlight(sFlight);
				vo.setStarting(sStarting);
				vo.setDestination(sDestination);
				vo.setDeparture_time(departure_time);
				vo.setArrival_time(arrival_time);
				vo.setTime(time);
				vo.setRound_trip(true);
				vo.setDate(new SimpleDateFormat("yyyyMMdd").parse(from));
				
				list.add(vo);
			}
		}
		request.setAttribute("list",list );
		
		return forward;
	}
}
