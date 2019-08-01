package net.reservationcheck.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reservationcheck.db.RserCheckDAO;

public class ShowAllReserAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	
	ActionForward forward= new ActionForward();
	RserCheckDAO dao = new RserCheckDAO();
	
	
	if(request.getSession().getAttribute("user_email")==null){
		
		forward.setPath(request.getContextPath()+"/user/Userlogin.jsp");
		forward.setRedirect(true);
		
	}else{
		String useremail=(String)request.getSession().getAttribute("user_email");
		forward.setPath("/resercheck/resercheckview.jsp");
		forward.setRedirect(false);
			
		Paging pa = new Paging();
		pa.setNext(true);
		//전체게시물수 검색해서 변수에 set하기
		int total = dao.listcnt(useremail);
		int page=0;
		int range=0;
		if(request.getParameter("page")==null && request.getParameter("range")==null) {
			
			pa.setPage(1);
			pa.setRange(1);
			
			
		}else {
			page= Integer.parseInt(request.getParameter("page"));
			pa.setPage(page);
			range=Integer.parseInt(request.getParameter("range"));
			pa.setRange(range);
		
			}
	
		pa.setListcnt(total);
		pa.pageInfo(pa.getPage(),pa.getRange(),pa.getListcnt());
		
		ArrayList  list = dao.showAllReservation(useremail,pa.getStartlist(),pa.getListsize());
		request.setAttribute("reserresult", list);
		request.setAttribute("paginginfo",pa);

	}
	
	
	return forward;
}
	
}
