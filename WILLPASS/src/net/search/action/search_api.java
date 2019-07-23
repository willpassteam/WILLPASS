package net.search.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import jinwoo.db.searchDAO;
import jinwoo.db.searchDTO;

public class search_api {
	
	public String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}



	public ArrayList getAir(String date , String c1,String c2) throws Exception {
		ArrayList list = new ArrayList<>(); 
		
		searchDAO dao= new searchDAO();
		String id= dao.internationalCheck(c2);
		
	    StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/FlightScheduleList/get"+id+"flightScheduleList"); /*URL*/
	    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=hy3yFxUxPWppB2g9c3c190BKAN8twqLLK3cwhgclxY%2F0DyS3%2FYXJMAAdT2jmUhzaGBgx1aSHaMZf8Flz5ZAUhA%3D%3D&numOfRows=300"); /*Service Key*/
	    urlBuilder.append("&" + URLEncoder.encode("schDate","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8")); /*검색일자*/
	    urlBuilder.append("&" + URLEncoder.encode("schDeptCityCode","UTF-8") + "=" + URLEncoder.encode(c1, "UTF-8")); /*출발 도시 코드*/
	    urlBuilder.append("&" + URLEncoder.encode("schArrvCityCode","UTF-8") + "=" + URLEncoder.encode(c2, "UTF-8")); /*도착 도시 코드*/
	    System.out.println(urlBuilder.toString());
	    //URL만드는곳 
	    URL url = new URL(urlBuilder.toString());
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    //접속
	    conn.setRequestMethod("POST");
	    conn.setRequestProperty("Content-type", "application/json");
	    
	    System.out.println("Response code: " + conn.getResponseCode());
	    BufferedReader rd;
	    
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    } else {
	        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    StringBuilder sb = new StringBuilder();
	    String line;
	    
	    while ((line = rd.readLine()) != null) {
	        sb.append(line);
	    }
	    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	    Document doc = dBuilder.parse(urlBuilder.toString());
	    
	    doc.getDocumentElement().normalize();
	    System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
	    
	    NodeList nList = doc.getElementsByTagName("item");
	    System.out.println("파싱할 리스트 수 : "+ nList.getLength());
	   
	    for(int temp = 0; temp < nList.getLength(); temp++){		
	    	Node nNode = nList.item(temp);
	    	if(nNode.getNodeType() == Node.ELEMENT_NODE){
	    						
	    		Element eElement = (Element) nNode;
	    		searchDTO dto= new searchDTO();
	    		if(id.equals("D")){
		    		dto.setAirport(getTagValue("startcity", eElement));
		    		dto.setCity(getTagValue("arrivalcity", eElement));
		    		dto.setInternationalTime(getTagValue("domesticStartTime", eElement));
		    		dto.setAirlineKorean(getTagValue("airlineKorean", eElement));
		    		dto.setInternationalMon(getTagValue("domesticMon", eElement));
		    		dto.setInternationalTue(getTagValue("domesticTue", eElement));
		    		dto.setInternationalWed(getTagValue("domesticWed", eElement));
		    		dto.setInternationalThu(getTagValue("domesticThu", eElement));
		    		dto.setInternationalFri(getTagValue("domesticFri", eElement));
		    		dto.setInternationalSat(getTagValue("domesticSat", eElement));
		    		dto.setInternationalSun(getTagValue("domesticSun", eElement));
		    		dto.setInternationalNum(getTagValue("domesticNum", eElement));
		    		
	    		}else if(id.equals("I")){
		    		dto.setAirport(getTagValue("airport", eElement));
		    		dto.setCity(getTagValue("city", eElement));
		    		dto.setInternationalTime(getTagValue("internationalTime", eElement));
		    		dto.setAirlineKorean(getTagValue("airlineKorean", eElement));
		    		dto.setInternationalMon(getTagValue("internationalMon", eElement));
		    		dto.setInternationalTue(getTagValue("internationalTue", eElement));
		    		dto.setInternationalWed(getTagValue("internationalWed", eElement));
		    		dto.setInternationalThu(getTagValue("internationalThu", eElement));
		    		dto.setInternationalFri(getTagValue("internationalFri", eElement));
		    		dto.setInternationalSat(getTagValue("internationalSat", eElement));
		    		dto.setInternationalSun(getTagValue("internationalSun", eElement));
		    		dto.setInternationalNum(getTagValue("internationalNum", eElement));
		    		
	    		}
	    		list.add(dto);
	    	}	// for end
	    }	

	    return list;
		}
}
