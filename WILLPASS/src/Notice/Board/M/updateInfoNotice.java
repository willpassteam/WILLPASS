package Notice.Board.M;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Notice.Board.DB.NoticeDAO;
import Notice.Board.DB.NoticeDTO;

public class updateInfoNotice implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		
		int Notice_num = Integer.parseInt(request.getParameter("Notice_num"));
		//한개의 보드 정보를 얻어옴
		NoticeDTO result = new NoticeDAO().getBoard(Notice_num );
		
		//dto에 저장하여 보냄
		request.setAttribute("NoticeDTO", result);
		//View페이지로
		forward.setPath("./Boardwrite.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
	}
	

}
