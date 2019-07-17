package Notice.Board.M;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;
import Board.DB.BoardDTO;
import Notice.Board.DB.NoticeDAO;
import Notice.Board.DB.NoticeDTO;

public class getListNotice implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		// 현재 페이지를 저장
		int notice_page = 0;
		// 만약 자기의 글이 3번 페이지에 있엇는데 View 페이지에서 읽다가 목록으로 나올시. 원래 페이지로 돌아가기위해
		if(request.getParameter("Notice_page") != null){
			notice_page = Integer.parseInt(request.getParameter("Notice_page")); 
		}
		ArrayList<NoticeDTO> NoticeList = new NoticeDAO().getNoticeList(notice_page);
		
		//게시판 글 갯수를 저장하는 변수
		int NoticeAllCount = new NoticeDAO().NoticeAllCount();
		//얻어온 자료 ArrayList 넘기기
		request.setAttribute("NoticeList", NoticeList);
		//현재 페이지 넘버 넘기기
		request.setAttribute("Notice_page", notice_page);
		//게시판 글 갯수 넘기기
		request.setAttribute("NoticeAllCount", NoticeAllCount);
		
		
		
		forward = new ActionForward();
		forward.setPath("./Board.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	

}
