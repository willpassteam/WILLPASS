package Notice.Board.C;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.C.Action;
import Board.C.ActionForward;
import Board.DB.BoardDAO;
import Board.DB.BoardDTO;
import Board.M.deleteBoard;
import Board.M.getListBoard;
import Board.M.replyBoard;
import Board.M.viewBoard;
import Board.M.writeBoard;
import Notice.Board.M.deleteNotice;
import Notice.Board.M.getListNotice;
import Notice.Board.M.updateInfoNotice;
import Notice.Board.M.updateNotice;
import Notice.Board.M.viewNotice;
import Notice.Board.M.writeNotice;

@WebServlet("*.Notice")
public class NoticeBoardCotroller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	protected void doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		//공지사항 게시판은 기능이 글작성 수정 삭제만 존재 
		
		String RequestURI= req.getRequestURI();
		System.out.println("ReqeustURI 요청 :"+RequestURI);
		
		String contextPath=req.getContextPath();
		System.out.println("contextPath 요청 :"+contextPath);
		
		//requestURI 내용이  "프로젝트명/폴더/해당하는 jsp페이지" 로 넘어올때 split 으로 폴더 뒷부분의 값만 가져와서 사용
		String command= RequestURI.split("question/")[1];
		System.out.println("command 요청 :"+command);

		ActionForward forward=null;
		Action action=null;
		
		
		if(command.equals("writePage.Notice")){// 공지사항 게시판 뷰 페이지로 이동
			
			forward = new ActionForward();
			forward.setPath("./Boardwrite.jsp");
			forward.setRedirect(true);
		}else if(command.equals("write.Notice")){//공지사항 게시판 작성 페이지 작성후 DB 연동 후 -> View 페이지로
			
			//else if 문 안으로 들어왔는지 확인용 
			System.out.println("write.Board");
			
			try {
				action=new writeNotice();
				forward=action.execute(req, resp);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("View.Notice")){// 게시판 View 페이지로 이동
			System.out.println(command);
			try {
				action = new viewNotice();
				forward = action.execute(req, resp);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(command.equals("Board.Notice")){// 공지사항 게시판으로 이동 
			try {
				action = new getListNotice();
				forward= action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(command.equals("Delete.Notice")){//삭제 요청
			try {
				action = new deleteNotice();
				forward= action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(command.equals("Update1.Notice")){//업데이트 페이지로 이동
			try {
				action = new updateInfoNotice();
				forward= action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(command.equals("Update2.Notice")){//업데이트 정보를 가진 채로 요청
			try {
				action = new updateNotice();
				forward= action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		
	if(forward != null){//new ActrionForward()객체가 저장되어 있고
		
		
		if(forward.isRedirect()){ //true ->Response.sendRedirect()
			resp.sendRedirect(forward.getPath());
			
			
		}else {//false->dis.forward(request,response)
			
			RequestDispatcher dis= req.getRequestDispatcher(forward.getPath());
			dis.forward(req, resp);
		}
		
	}
	
	}

}
