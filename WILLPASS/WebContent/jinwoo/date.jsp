<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
   String today = getDate(); //java.util 패키지의 Calendar 클래스를 이용
   out.println(today);
   out.println("<br>\n");

   Date today2 = new Date(); //java.util 패키지의 Date 클래스를 이용
   out.println(today2.toString());
%>
<%!
public static String getDate()
{
   DecimalFormat df = new DecimalFormat("00");
   Calendar calendar = Calendar.getInstance();


   String year = Integer.toString(calendar.get(Calendar.YEAR)); //년도를 구한다
   String month = df.format(calendar.get(Calendar.MONTH) + 1); //달을 구한다
   String day = df.format(calendar.get(Calendar.DATE)); //날짜를 구한다

   String hour = ""; //시간을 구한다
   if( calendar.get(Calendar.AM_PM) == Calendar.PM){
      hour = df.format(calendar.get(Calendar.HOUR)+12); //Calendar.PM이면 12를 더한다
   } else {
      hour = df.format(calendar.get(Calendar.HOUR));
   }

   String minute = df.format(calendar.get(Calendar.MINUTE)); //분을 구한다
   String second = df.format(calendar.get(Calendar.SECOND)); //초를 구한다
   String date = year + month + day + hour + minute + second;

   int iDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); //요일을 구한다

   String strDayOfWeek = "";
   switch(iDayOfWeek){
      case 1: 
         strDayOfWeek = "일요일";
         break;
      case 2: 
         strDayOfWeek = "월요일";
         break;
      case 3: 
         strDayOfWeek = "화요일";
         break;
      case 4: 
         strDayOfWeek = "수요일";
         break;
      case 5: 
         strDayOfWeek = "목요일";
         break;
      case 6: 
         strDayOfWeek = "금요일";
         break;
      case 7: 
         strDayOfWeek = "토요일";
         break;

      }
   date = date + strDayOfWeek;
   return date;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>