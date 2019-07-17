package Board.M;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;
import Board.DB.BoardDTO;

public class getListBoard implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		// 현재 페이지를 저장
		int Board_page_num = 0;
		// 만약 자기의 글이 3번 페이지에 있엇는데 View 페이지에서 읽다가 목록으로 나올시. 원래 페이지로 돌아가기위해
		if(request.getParameter("Board_page_num") != null){
			Board_page_num = Integer.parseInt(request.getParameter("Board_page_num")); 
		}
		ArrayList<BoardDTO> BoardList = new BoardDAO().getBoardList(Board_page_num);
		System.out.println("Board_page_num : "+Board_page_num);
		
		//게시판 글 갯수를 저장하는 변수
		int BoardCount = new BoardDAO().BoardCount();
		//얻어온 자료 ArrayList 넘기기
		request.setAttribute("BoardList", BoardList);
		//현재 페이지 넘버 넘기기
		request.setAttribute("Board_page_num", Board_page_num);
		//게시판 글 갯수 넘기기
		request.setAttribute("BoardCount", BoardCount);
		
		
		
		forward = new ActionForward();
		forward.setPath("./Question.jsp?Board_page_num="+Board_page_num);
		forward.setRedirect(false);
		
		return forward;
	}
	
	
	

}
