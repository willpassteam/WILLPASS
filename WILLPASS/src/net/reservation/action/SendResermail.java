package net.reservation.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import net.reservation.db.ReservationDTO;

public class SendResermail {

	
	public String changeSeat(int seatnum){ //숫자 좌석을 문자+숫자로 변환해주는 함수 
		
		String col="";
		col=((seatnum/6)+1)+"";
		
		switch (seatnum%6) {
		case 0:col+="A";break;
		case 1:col+="B";break;
		case 2:col+="C";break;
		case 3:col+="D";break;
		case 4:col+="E";break;
		case 5:col+="F";break;
	}
		
		return col;
		
		
	}
	
	void sendEmail(String email,ArrayList Reservationarr1 ,ArrayList Reservationarr2) { //예약완료 이메일을 보내는 함수 
	
			ReservationDTO dto = new ReservationDTO();
        	String subject="WILLPASS 예약확인 이메일입니다.";
    		String fromName="WILLPASS 관리자";
    		String to=email;
    		String content="<!DOCTYPE html><html><head><meta charset='UTF-8'><title>Insert title here</title><style>"
    				+"</style></head><body style='width: 1000px'><div align='center'><div align='center'><img src='#'><h3 >항공권 예약/결제 확인</h3>"
    				+"<table style='width: 800px'><tr style='background-color: #dddddd;'><th>탑승일</th><th >탑승구간</th><th>탑승자</th>"
    				+"<th>항공사/항공편</th><th>좌석번호</th></tr>";
    		
    		for(int i=0;i<Reservationarr1.size();i++){
    			dto=(ReservationDTO)Reservationarr1.get(i);
    			content+="<tr>";
    			content+="<td>"+dto.getReser_date()+"</td>";
    			content+="<td>"+dto.getReser_Starting()+"->"+dto.getReser_destination()+"</td>";
    			content+="<td>"+dto.getReser_familyname()+dto.getReser_givenname()+"</td>";
    			content+="<td>"+dto.getReser_airline()+dto.getReser_flight()+"</td>";
    			content+="<td>"+changeSeat(Integer.parseInt(dto.getReser_reserved_seat()))+"</td>";
    			content+="</tr>";
    			
    		}
    		for(int i=0;i<Reservationarr2.size();i++){
    			dto=(ReservationDTO)Reservationarr2.get(i);
    			content+="<tr>";
    			content+="<td>"+dto.getReser_date()+"</td>";
    			content+="<td>"+dto.getReser_Starting()+"->"+dto.getReser_destination()+"</td>";
    			content+="<td>"+dto.getReser_familyname()+dto.getReser_givenname()+"</td>";
    			content+="<td>"+dto.getReser_airline()+dto.getReser_flight()+"</td>";
    			content+="<td>"+changeSeat(Integer.parseInt(dto.getReser_reserved_seat()))+"</td>";
    			content+="</tr>";
    			
    		}
    		
    		content+="</table></div></body></html>";
    		Properties p = new Properties(); // 정보를 담을 객체
    		  
    		p.put("mail.smtp.host","smtp.naver.com");
    		p.put("mail.smtp.port", "587");
    		p.put("mail.smtp.starttls.enable", "true");
    		p.put("mail.smtp.auth", "true");
    		p.put("mail.smtp.debug", "true");

    		try{
    			Authenticator auth = new Authenticator() {
    				protected PasswordAuthentication getPasswordAuthentication() {
    					return new PasswordAuthentication("bigpark666@naver.com", "bigpark6");
    				}
    			};
    		    Session ses = Session.getInstance(p, auth);
    		      
    		    ses.setDebug(true);
    		    
    		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
    		    msg.setFrom(new InternetAddress("bigpark666@naver.com", MimeUtility.encodeText(fromName,"UTF-8","B")));
    		    
    		    
    		    InternetAddress[] add={new InternetAddress(to)};
    		    msg.setRecipients(Message.RecipientType.TO, add);
    		    msg.setSubject(subject);
    		    msg.setSentDate(new Date());
    		    msg.setContent(content, "text/html;charset=euc-kr");
    		    
    		    Transport.send(msg);
    		} catch(Exception e){
    		   System.out.println("메일 전송 오류 : "+e.getMessage());
    		    return;
    		}
    	}
		
}
	
	
	

