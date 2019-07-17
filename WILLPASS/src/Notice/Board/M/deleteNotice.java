package Notice.Board.M;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Notice.Board.DB.NoticeDAO;

public class deleteNotice implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		boolean result = new NoticeDAO().deleteNotice(notice_num);
		
		if(result){
			request.setAttribute("MSG", "글 삭제 완료");
			forward.setPath("Board.Notice");
			forward.setRedirect(false);
		}else{
			request.setAttribute("MSG", "글 삭제 실패");
			forward.setPath("Board.Notice");
			forward.setRedirect(false);
		}
		
		
		// TODO Auto-generated method stub
		return forward;
	}
	

}
