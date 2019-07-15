package Board.M;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;


public class writeBoard implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
				//한글깨짐 방지를 위한 인코딩 방식 설정
				request.setCharacterEncoding("utf-8");
				
				// 제목 / 내용 / 작성자 이메일받아오기
				String board_title=request.getParameter("board_title");
				String board_content=request.getParameter("board_content");
				String board_email= (String)request.getSession(true).getAttribute("user_email");
				//임시로 사용하는 아이디
				if(board_email == null){
					board_email = "asdsad";
				}
				
				System.out.println(board_title);
				System.out.println(board_content);
				System.out.println(board_email);
				
				
				
				//메소드 호출 매개변수 전달 그리고 결과값저장
				boolean result = new BoardDAO().writeBoard(board_title, board_content, board_email);
				
				ActionForward forward= new ActionForward();
				if(result){
					//작성 성공시 처리
					forward.setRedirect(true);
					forward.setPath("Question.Board");
				}else{
					//작성 실패시 처리
					
					request.setAttribute("MSG", "오류가 발생했습니다.");
					
					forward.setRedirect(true);
					forward.setPath("Question.Board");
					
					
				}
				
				
				return forward;
	}

}
