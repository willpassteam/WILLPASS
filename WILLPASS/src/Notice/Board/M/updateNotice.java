package Notice.Board.M;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Notice.Board.DB.NoticeDAO;

public class updateNotice implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		boolean result = new NoticeDAO().updateNotice(notice_num,notice_title,notice_content);
		
		if(result){
			request.setAttribute("MSG", "글 수정 완료");
		}else{
			request.setAttribute("MSG", "글 수정 실패");
			
		}
		forward.setPath("View.Notice?Notice_num="+notice_num);
		forward.setRedirect(false);
		
		
		// TODO Auto-generated method stub
		return forward;
	}
	

}
