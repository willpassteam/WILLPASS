package Board.M;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;

public class replyBoard implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		
		boolean result = new BoardDAO().replyWrite(board_num,board_title,board_content);
		if(result){
			request.setAttribute("MSG", "답글 완료");
		}else{
			request.setAttribute("MSG", "답글 실패");
		}
		forward.setPath("Question.Board");
		forward.setRedirect(false);
		return forward;
	}
	
	

}
