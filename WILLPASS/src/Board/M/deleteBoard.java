package Board.M;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;

public class deleteBoard implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		
		int Board_num = Integer.parseInt(request.getParameter("Board_num"));
		
		boolean result = new BoardDAO().DeleteBoard(Board_num);
		
		PrintWriter out = response.getWriter();
		
		
		if(result){
			out.println("<script>");
			out.println("alert('삭제 완료되었습니다.'");
			out.println("</script>");
			forward.setPath("Question.Board");
			forward.setRedirect(true);
		}else{
			out.println("<script>");
			out.println("alert('삭제에 실패하였습니다.'");
			out.println("</script>");
			forward.setPath("Question.Board");
			forward.setRedirect(true);
		}
		return forward;
	}
	
	

}
