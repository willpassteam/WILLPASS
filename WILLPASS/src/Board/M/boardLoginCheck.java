package Board.M;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;

public class boardLoginCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("boardLoginCheck Start");
		ActionForward result = new ActionForward();
		// 로그인 이메일 가져오기
		String board_email = (String) request.getSession(true).getAttribute("user_email");
		// 게시판 번호 가져오기
		//임시로 사용하는 아이디
		board_email = "asdsad";

		
		if(board_email == null){// 비로그인시 바로
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능한 페이지 입니다.')");
			out.println("</script>");
			
			result.setPath("../user/Userlogin.jsp");
			result.setRedirect(true);
			
		}else{// 로그인한후 게시글의 board_num 을 가져와 db와 연동확인 과정을 거친다.
			if(request.getRequestURI().split("question/")[1].equals("View.Board") ){
				//전 페이지에서 보내준 현재 페이지저장
				String board_page_num = request.getParameter("Board_page_num");
				
				//만약 작성자의 글로 들어 갔을경우 나중에 view 페이지에서 목록으로 갈때 다시 보내기 위해 Session영역에 저장
				request.getSession(true).setAttribute("Board_page_num", board_page_num);
				
				//게시판 고유 넘버 얻어오기
				int board_num = Integer.parseInt(request.getParameter("Board_num"));
				
				if(new BoardDAO().checkBoard(board_num, board_email)){// 값이 true 는 작성자와 로그인한 사람이 같은경우
					//Attribute로 board_num을 지정해줘서 해당하는 페이지에서 board_num을 이용할수 있도록 한다.
					request.setAttribute("board_num", board_num);
					
					result.setPath("ViewTrue.Board");
					result.setRedirect(false);
					
				}else{
					// 로그인은 하였으나 본인의 글이 아닌경우 게시판 페이지로 다시 이동.
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('본인이 작성한 글이 아닙니다.')");
					out.println("</script>");
					
					result.setPath("Question.Board?Board_page_num="+board_page_num);
					result.setRedirect(true);
					
				}
			}
		}
		System.out.println("boardLoginCheck End");
		return result;
	}

}
