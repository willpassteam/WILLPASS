package net.search.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

	ArrayList<searchDTO> list = null;
	
	String yy="";
	String mm="";
	String dd="";
	int index;
	int end;
	
	
	String sfFlight;
	public timecheck(String sfFlight,String date,int index, ArrayList list ) {
		this.sfFlight=sfFlight;
		this.index= index;
		this.list = list;
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
	
	
		
		
		
		
	}
	//기본생성자
	public timecheck() {};
	
	@Override
	public void run() {
		try {
			Long starttime = System.currentTimeMillis();
			Document flight = Jsoup.connect("https://www.flightstats.com/v2/flight-details/"+sfFlight+"?year="+yy+"&month="+mm+"&date="+dd).post();
			Elements timeblock=flight.getElementsByClass("timeBlock");
			
			String departure_time=timeblock.get(0).children().last().text();
			String arrival_time=timeblock.get(4).children().last().text();
			String time=flight.getElementsByClass("flightTimeBlock").get(0).children().last().text();
			time=time.replace("h", "시간");
			time=time.replace("m", "분");
			System.out.println(arrival_time +":"+ index);
			System.out.println(departure_time +":"+ index);
			System.out.println(time +":"+ index);
			
			System.out.println(list.size());
			list.get(index).setArrival_time(arrival_time);
			list.get(index).setDeparture_time(departure_time);
			list.get(index).setTime(time);
			
			
			
			
			Long endtime = System.currentTimeMillis();
			System.out.println("검색 시간 :"+(endtime - starttime));
			
					
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
}
