package Board.C;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.Board")
public class boardController extends HttpServlet {
	//로그인 여부  그리고 이 게시판은 자기 자신의 게시글만 읽을수 있기에 작성자가 로그인을 하였는지에 대한 확인을 거치는 메소드이다.
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHendle(req, resp);
	}
	protected void doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//현재 글작성만 이루어진 상태.
		req.setCharacterEncoding("utf-8");
		
		String RequestURI= req.getRequestURI();
		System.out.println(RequestURI);
		
		String contextPath=req.getContextPath();
		System.out.println(contextPath);
		
		//requestURI 내용이  "프로젝트명/폴더/해당하는 jsp페이지" 로 넘어올때 split 으로 폴더 뒷부분의 값만 가져와서 사용
		String command= RequestURI.split("question/")[1];
		System.out.println(command);
		
		ActionForward forward=null;
		
		Action action=null;
		// 이 게시판은 본인의 글만 읽을수 있고 글작성 또한 로그인후 가능하기에 먼저 확인을 거친다.
		// view 페이지로 이동하는것 또한 boardLoginCheck()객체 안에서 처리함.
		try {
			action = new boardLoginCheck();
			forward= action.execute(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(command.equals("writePage.Board")){//게시판 작성 페이지로 이동
				
			forward = new ActionForward();
			forward.setPath("./Questionwrite.jsp");
			forward.setRedirect(true);
		}
		else if(command.equals("write.Board")){//게시판 작성 페이지 작성후 DB 연동 후 -> View 페이지로
			
			//else if 문 안으로 들어왔는지 확인용 
			System.out.println("write.Board");
			
			try {
				// action 인터페이스를 구현하고있는 writeBoard 를 action 인터페이스 객체에 넣어주고
				// action 인터페이스에 구현되어있는 execute 메소드를 이용해 request,response를 넘겨줘서 DB작업이 가능하도록한다.
				action=new writeBoard();
				forward=action.execute(req, resp);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("View.Board")){
			System.out.println(command);
			
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
