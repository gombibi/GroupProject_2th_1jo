package kr.dogcat.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;

@WebServlet("*.ph")
public class FrontPhotoGalleryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontPhotoGalleryController() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	
    	/*
    	if(url_Command.equals("/BoardList.bd")) { //게시판 목록
    		//UI+로직
    		action = new BoardListService();
    		forward = action.execute(request, response);
    		System.out.println("BoardListService 실행");
    		
    	}else if(url_Command.equals("/BoardWrite.bd")) { //게시판 글쓰기
    		//UI+로직
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("WEB-INF/views/board/Boardwrite.jsp");
    		
    	}
    	       	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			//UI
    			//UI + 로직
    			//forward url 주소 변환 없어 View 내용을 받을 수 있다
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	*/
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
