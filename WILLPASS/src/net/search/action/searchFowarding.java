
package net.search.action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import net.search.db.searchDAO;
import net.search.db.searchDTO;
import net.search.db.timeDTO;
import net.search.db.timeDTO;

public class searchFowarding implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.getSession().removeAttribute("list1");
		request.getSession().removeAttribute("list2");
		
		ActionForward forward = new ActionForward();
		searchDAO dao = new searchDAO();
		String starting = request.getParameter("starting");
		String st = dao.linecheck(starting);
		String destination = request.getParameter("destination");
		String ed = dao.linecheck(destination);
		int round_trip = Integer.parseInt(request.getParameter("round_trip"));
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String people = request.getParameter("adult");
		String date = "";

		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			long time;
			time = (format.parse(from).getTime() - System.currentTimeMillis());
			long calDateDays = ((time / (24 * 60 * 60 * 1000)) + 1) % 7 - 7;
			int now = Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(System.currentTimeMillis()))
					+ (int) calDateDays;
			date = Integer.toString(now);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Document airline = Jsoup.connect(
				"http://www.airportal.co.kr/servlet/aips.life.airinfo.RaSkeCTL?gubun=c_getList&curr_page=1&one_page=70&one_group=10&dep_airport="
						+ st + "&arr_airport=" + ed + "&srch_type=dep&current_dt_from=" + from + "&current_dt_to=" + from
						+ "&regCls=1&al_icao=&fp_iata=")
				.post();
		Elements tr = airline.getElementsByTag("tbody").get(2).getElementsByTag("tr");
		ArrayList list = new ArrayList<>();
		timeDTO times = new timeDTO();

		for (int i = 0; i < tr.size(); i += 2) {
			searchDTO vo = new searchDTO();
			String sAirline = tr.get(i).getElementsByTag("td").get(2).text();
			String sFlight = tr.get(i).getElementsByTag("td").get(4).text();
			String sStarting = tr.get(i).getElementsByTag("td").get(6).text().split("->")[0];
			String sDestination = tr.get(i).getElementsByTag("td").get(6).text().split("->")[1];

			vo.setAirline(sAirline);
			vo.setFlight(sFlight);
			vo.setStarting(sStarting);
			vo.setDestination(sDestination);
			vo.setRound_trip(false);
			vo.setDate(new Date(new SimpleDateFormat("yyyyMMdd").parse(from).getTime()));
			vo.setPeople(people);

			int seat=dao.seatcheck(new Date(new SimpleDateFormat("yyyyMMdd").parse(from).getTime()),sFlight);
			int seatcheck=90-seat;
			if(seatcheck==0 || seatcheck-Integer.parseInt(people)<0){
				vo.setCheckseat(false);
			}else{
				vo.setCheckseat(true);
			}
			vo.setLeftseat(seatcheck);
			
			list.add(vo);
		}
		
		System.out.println(list.size());
		/*
		 * Thread 시작
		 */
		ExecutorService threadPool = Executors.newFixedThreadPool(list.size());

		Thread thread = new Thread();
		System.out.println("Thread검색시작");

		for (int i = 0; i < list.size(); i++) {
			
			searchDTO searchDTO_for = (searchDTO) list.get(i);
			String sfFlight = dao.flightcheck(searchDTO_for.getAirline());
			String sFlight = searchDTO_for.getFlight();
			sfFlight = sFlight.replace(sfFlight, sfFlight + "/");

			String date_for = new SimpleDateFormat("yyyyMMdd").format(searchDTO_for.getDate());
			
			thread = new Thread(new timecheck(sfFlight, date_for, i, list));
			
			System.out.println("나시작");
			
			threadPool.submit(thread);
			
		}
		
		

		System.out.println("Thread검색종료");

		/*
		 * Thread 끝
		 * 왕복의 경우 시작
		 */
		request.getSession().setAttribute("list1", list);

		if (round_trip == 1) {
			ArrayList list_1 = new ArrayList<>();
			Document airline_1 = Jsoup.connect(
					"http://www.airportal.co.kr/servlet/aips.life.airinfo.RaSkeCTL?gubun=c_getList&curr_page=1&one_page=70&one_group=10&dep_airport="
							+ ed + "&arr_airport=" + st + "&srch_type=dep&current_dt_from=" + to + "&current_dt_to=" +to
							+ "&regCls=1&al_icao=&fp_iata=")
					.post();
			Elements tr_1 = airline_1.getElementsByTag("tbody").get(2).getElementsByTag("tr");
			String date_1 = "";
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
				long time;
				time = (format.parse(to).getTime() - System.currentTimeMillis());
				long calDateDays = ((time / (24 * 60 * 60 * 1000)) + 1) % 7 - 7;
				int now = Integer.parseInt(new SimpleDateFormat("yyyyMMdd").format(System.currentTimeMillis()))
						+ (int) calDateDays;
				date_1 = Integer.toString(now);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			for (int i = 0; i < tr_1.size(); i += 2) {
				searchDTO vo = new searchDTO();
				String sAirline = tr_1.get(i).getElementsByTag("td").get(2).text();
				String sFlight = tr_1.get(i).getElementsByTag("td").get(4).text();
				String sStarting = tr_1.get(i).getElementsByTag("td").get(6).text().split("->")[0];
				String sDestination = tr_1.get(i).getElementsByTag("td").get(6).text().split("->")[1];
				vo.setAirline(sAirline);
				vo.setFlight(sFlight);
				vo.setStarting(sStarting);
				vo.setDestination(sDestination);
				vo.setRound_trip(true);
				vo.setDate(new Date(new SimpleDateFormat("yyyyMMdd").parse(to).getTime()));
				vo.setPeople(people);
				
				int seat_1=dao.seatcheck(new Date(new SimpleDateFormat("yyyyMMdd").parse(to).getTime()),sFlight);
				int seatcheck_1=90-seat_1;
				if(seatcheck_1==0 || seatcheck_1-Integer.parseInt(people)<0){
					vo.setCheckseat(false);
				}else{
					vo.setCheckseat(true);
				}
				vo.setLeftseat(seatcheck_1);

				list_1.add(vo);
			}

			// Thread 시작
			timecheck dto_1 = new timecheck();
			Thread thread1 = new Thread();
			System.out.println("왕복 Thread검색시작");

			for (int i = 0; i < list_1.size(); i++) {
				searchDTO searchDTO_for = (searchDTO) list_1.get(i);
				String sfFlight = new searchDAO().flightcheck(searchDTO_for.getAirline());
				String sFlight = searchDTO_for.getFlight();
				sfFlight = sFlight.replace(sfFlight, sfFlight + "/");

				String date_for = new SimpleDateFormat("yyyyMMdd").format(searchDTO_for.getDate());
				thread1 = new Thread(new timecheck(sfFlight, date_for, i, list_1));

				threadPool.submit(thread1);
			}


			System.out.println("Thread검색종료");
			request.getSession().setAttribute("list2", list_1);
		}
		threadPool.shutdown();
		threadPool.awaitTermination(20, TimeUnit.SECONDS);
		return forward;
	}
}

