package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import net.search.db.searchDTO;


public class SearchPriceAction implements Action {

		
	//가격정렬 함수
	Comparator<searchDTO> priceCompare1 = new Comparator<searchDTO>() {
		@Override
		public int compare(searchDTO o1, searchDTO o2) {
			return o1.getPrice() - o2.getPrice();
		}
	};
	
	Comparator<searchDTO> priceCompare2 = new Comparator<searchDTO>() {
		@Override
		public int compare(searchDTO o1, searchDTO o2) {
			return o2.getPrice() - o1.getPrice();
		}
	};
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.getSession().removeAttribute("newlist");
		request.getSession().removeAttribute("newlist2");
		
		ArrayList<searchDTO> newlist = new ArrayList<searchDTO>();
		
		String order = request.getParameter("order");
		List list = (ArrayList)request.getSession().getAttribute("list1");
		List list2 = (ArrayList)request.getSession().getAttribute("list2");
		
		int pck1, pck2;
		SearchDAO sdao = new SearchDAO();
		searchDTO svo = new searchDTO();
							
			int min1 = 0;
			int hour1 = 0;
			for (int i=list.size()-1; i>=0; i--){
				svo = (searchDTO)list.get(i);
				if (svo.getTime()==null) {
					list.remove(i);
				}
			}
			
			for (int i=0; i<list.size(); i++){
			
			svo = (searchDTO)list.get(i);
			pck1 = sdao.pricecheck(svo.getAirline());
			String t1 = svo.getTime();
				 if(t1.contains("시간")){
					t1=t1.replace(" ", "");
					String hr1[] = t1.split("시간"); 
						if(hr1.length == 1){
							hour1 = Integer.parseInt(hr1[0])*60;
							min1 = 0;
						}else{
							hour1 = Integer.parseInt(hr1[0])*60;
							min1 = Integer.parseInt(hr1[1].split("분")[0]);
						}
				}else{
					t1=t1.replace(" ", "");
					min1 = Integer.parseInt(t1.split("분")[0]);
				}
										
			int time1 = hour1 + min1;
			int price1 = pck1 * time1; 
			
			svo.setPrice(price1);		
			newlist.add(svo);
		}
				
		if(order == null){
			request.getSession().setAttribute("newlist", newlist);
		
		}else if(order.equals("1")){
			Collections.sort(newlist, priceCompare1);
			request.getSession().setAttribute("newlist", newlist);
			
		}else if(order.equals("2")){
			Collections.sort(newlist, priceCompare2);
			request.getSession().setAttribute("newlist", newlist);
			
		}else if(order.equals("3")){
			request.getSession().setAttribute("newlist", newlist);
		}
//======================================================================

		if(list2 != null){
		ArrayList<searchDTO> newlist2 = new ArrayList<searchDTO>();
			
		int min2 = 0;
		int hour2 = 0;
		
		for (int i=list2.size()-1; i>=0; i--){
			svo = (searchDTO)list2.get(i);
			if (svo.getTime()==null) {
				list2.remove(i);
			}
		}
		
		for (int i=0; i<list2.size(); i++){
			svo = (searchDTO)list2.get(i);
			pck2 = sdao.pricecheck(svo.getAirline());
			String t2 = svo.getTime();
				 if(t2.contains("시간")){
					String hr2[] = t2.trim().split("시간"); 
						if(hr2.length == 1){
							hour2 = Integer.parseInt(hr2[0].trim())*60;
							min2 = 0;
						}else{
							hour2 = Integer.parseInt(hr2[0].trim())*60;
							min2 = Integer.parseInt(hr2[1].trim().split("분")[0]);
						}
				}else{
					min2 = Integer.parseInt(t2.trim().split("분")[0]);
				}

			int time2 = hour2 + min2;
			int price2 = pck2 * time2; 
			
			svo.setPrice(price2);	
			newlist2.add(svo);
		}
		
		if(order == null){
			request.getSession().setAttribute("newlist2", newlist2);
		
		}else if(order.equals("1")){
			Collections.sort(newlist2, priceCompare1);
			request.getSession().setAttribute("newlist2", newlist2);
			
		}else if(order.equals("2")){
			Collections.sort(newlist2, priceCompare2);
			request.getSession().setAttribute("newlist2", newlist2);
			
		}else if(order.equals("3")){
			request.getSession().setAttribute("newlist2", newlist2);
		}

	}
	
	ActionForward forward = new ActionForward();
	
	forward.setRedirect(false);
	forward.setPath("/reserve/ReserStep1.jsp");
	
	return forward;
		
			
	} //ActionForward

} //SearchPriceAction

