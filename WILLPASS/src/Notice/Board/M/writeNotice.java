package Notice.Board.M;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Notice.Board.DB.NoticeDAO;


public class writeNotice implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		boolean result = new NoticeDAO().writeNotice(notice_title,notice_content);
		
		if(result){
			request.setAttribute("MSG", "글 작성 완료");
			forward.setPath("Board.Notice");
			forward.setRedirect(false);
		}else{
			request.setAttribute("MSG", "글 작성 실패");
			forward.setPath("Board.Notice");
			forward.setRedirect(false);
		}
		
		
		// TODO Auto-generated method stub
		return forward;
	}
	

}
