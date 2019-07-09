package Board.C;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.DB.BoardDAO;

public class boardLoginCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward result = new ActionForward();
		// 로그인 이메일 가져오기
		String board_email = (String) request.getSession(true).getAttribute("user_email");
		// 게시판 번호 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		if(board_email == null){// 비로그인시 바로
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능한 페이지 입니다.')");
			out.println("</script>");
			
			result.setPath("../user/Userlogin.jsp");
			result.setRedirect(true);
			
		}else{// 로그인한후 게시글의 board_num 을 가져와 db와 연동확인 과정을 거친다.
			if(request.getRequestURI().split("question/")[1].equals("View.Board") ){
				if(new BoardDAO().checkBoard(board_num, board_email)){// 값이 true 는 작성자와 로그인한 사람이 같은경우
					//Attribute로 board_num을 지정해줘서 해당하는 페이지에서 board_num을 이용할수 있도록 한다.
					request.setAttribute("board_num", board_num);
					
					result.setPath("./QuestionView.jsp");
					result.setRedirect(true);
					
				}else{
					// 로그인은 하였으나 본인의 글이 아닌경우 게시판 페이지로 다시 이동.
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('본인이 작성한 글이 아닙니다.')");
					out.println("</script>");
					
					result.setPath("./Question.jsp");
					result.setRedirect(true);
					
				}
			}
		}
		return result;
	}

}
