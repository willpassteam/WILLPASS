package net.search.db;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class airline {

	public airline() {
		try {
//			Connection.Response resp=Jsoup.connect("http://www.airportal.go.kr/knowledge/airports/KbAirport01.jsp?PAGENO=1&PAGEROWS=00&START=&keyword1=0~9&keyword2=%C8%F7&gubun=name2&sortvalue=&order=&target=&search=")
//									.method(Connection.Method.GET)
//									.execute();
			
			
			Document print=Jsoup.connect("http://www.airportal.go.kr/knowledge/airlines/KbAirline01.jsp?PAGENO=1&PAGEROWS=1800&START=&keyword1=%C6%C4&keyword2=%C8%F7&gubun=name2&sortvalue=&order=&area=code&target=&search=")
					.post();
			/*body > table > tbody > tr:nth-child(5) > td:nth-child(2) > 
			table > tbody > tr:nth-child(1) > td:nth-child(2) > table > tbody > tr:nth-child(6)
			.select("tr").get(0).select("td").get(0)
			*/
			
			Element tr=print.getElementsByTag("tbody").get(15);
			Elements tt=tr.getElementsByTag("tr");
			System.out.println(tt.size());
			
			searchDAO dao=new searchDAO();
			for(int i=0;i<tt.size();i++){
				String airline=tt.get(i).getElementsByTag("td").get(3).text();
				String iata=tt.get(i).getElementsByTag("td").get(4).text();
				String icao=tt.get(i).getElementsByTag("td").get(5).text();
				String country=tt.get(i).getElementsByTag("td").get(6).text();
				if(iata.equals("")) iata=" ";
				if(icao.equals("")) icao=" ";
				if(country.equals("")) country=" ";
				
				dao.insertCode(airline, iata, icao, country);
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new airline();
	}
	
}
