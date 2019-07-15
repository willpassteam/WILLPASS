package Board.M;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;
import Board.DB.BoardDTO;

public class viewBoard implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		
		int Board_num = (int)request.getAttribute("board_num");
		//한개의 보드 정보를 얻어옴
		BoardDTO result = new BoardDAO().getBoard(Board_num );
		
		//dto에 저장하여 보냄
		request.setAttribute("BoardDTO", result);
		//View페이지로
		forward.setPath("./QuestionView.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
	}
	
	

}
