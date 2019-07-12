package net.search.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import net.search.db.searchDAO;
import net.search.db.searchDTO;
import net.search.db.timeDTO;

public class timecheck extends Thread{
	final static int THREADS = 10; 
	private static CountDownLatch lacth = new CountDownLatch(THREADS);

	int THREADS_1 ; 
	private CountDownLatch lacth_1 = new CountDownLatch(THREADS_1);
	
	
	timeDTO dto1=null;
	
	String yy="";
	String mm="";
	String dd="";
	
	String sfFlight;
	
	public timecheck(String sfFlight,String date) {
		this.sfFlight=sfFlight;
		String date_1="";
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			long time;
			
				time = (format.parse(date).getTime()-System.currentTimeMillis());
				 long calDateDays = ((time / ( 24*60*60*1000))+1)%7-7;
				 int now=Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(System.currentTimeMillis()))+(int)calDateDays;
				 date_1=Integer.toString(now);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		this.yy=date_1.substring(0,4);
		this.mm=date_1.substring(4,6);
		this.dd=date_1.substring(6);
		
		dto1=new timeDTO();
		
		
		
	}
	public timecheck() {
	}
	@Override
	public void run() {
		try {
			
			Document flight = Jsoup.connect("https://www.flightstats.com/v2/flight-details/"+sfFlight+"?year="+yy+"&month="+mm+"&date="+dd).post();
			Elements timeblock=flight.getElementsByClass("timeBlock");
			
			String departure_time=timeblock.get(0).children().last().text();
			String arrival_time=timeblock.get(4).children().last().text();
			String time=flight.getElementsByClass("flightTimeBlock").get(0).children().last().text();
			time=time.replace("h", "시간");
			time=time.replace("m", "분");
			
			lacth_1.countDown();
			
			dto1.setArrival_time(arrival_time);
			dto1.setDeparture_time(departure_time);
			dto1.setTime(time);
					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public List times(List list) {
		THREADS_1=list.size();
		searchDAO dao= new searchDAO();
		List list_1=new ArrayList();
		System.out.println("b"+list_1.size());
		for(int i = 0; i < list.size(); ++i) { 
			searchDTO dto=(searchDTO)list.get(i);
			String sfFlight =dao.flightcheck(dto.getAirline());
			String sFlight=dto.getFlight();
			sfFlight=sFlight.replace(sfFlight, sfFlight+"/");
			String date=new SimpleDateFormat("yyyyMMdd").format(dto.getDate());
			timecheck tcheck= new timecheck(sfFlight,date);
			
			
			tcheck.start();
			
			list_1.add(tcheck.dto1);
			
			} 
		try { // lacth 의 카운트가 0이 될 때 까지 대기한다. 
			
			lacth.await(4000, TimeUnit.MILLISECONDS); 
			
			} catch (InterruptedException e) {
				e.printStackTrace(); 
			}

		System.out.println("c"+list_1.size());
		for(int i=0; i<list.size();i++){
			searchDTO dto=(searchDTO)list.get(i);
			timeDTO dto2=(timeDTO)list_1.get(i);
			
			dto.setArrival_time(dto2.getArrival_time());
			System.out.println("times2"+dto2.getArrival_time());
			dto.setDeparture_time(dto2.getDeparture_time());
			dto.setTime(dto2.getTime());
		}
		
		return list;
	}
}
