package kr.dogcat.board.reviewservice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;
import kr.dogcat.dto.Member;
import kr.dogcat.dto.ReviewBoard;

public class ReviewBoardEditGoService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
				
		String rbnum = request.getParameter("rbnum");
		String cpage = request.getParameter("cp"); // 현재 페이지
		String pagesize = request.getParameter("ps"); // 한 페이지당 조회 건수
		String mnic = request.getParameter("mnic");

		String msg="";
	    String url="";
	    
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String usernick = m.getMnic();

		ReviewBoardDao rbd = new ReviewBoardDao();
		ActionForward forward = null;
		
		if(rbnum == null || rbnum.trim().equals("")){
			try {
				response.sendRedirect("ReviewBoardList.bd");  //cpage=1 , ps=10
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		if(request.getSession()==null) {
			
			msg="로그인이 필요합니다 !";
		    url="로그인 도메인";
		    
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
			
		}else if(!usernick.equals(mnic)){
			
			msg="해당 글의 작성자가 아닙니다 !";
		    url="ReviewBoardContent.bd?cp="+cpage+"&ps="+pagesize+"&rbnum="+rbnum;
		    
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
		    
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/board/redirect.jsp");
			
		}else {
			
			try {		

				ReviewBoard board = rbd.getEditContent(rbnum);
				
				if(board == null){
					
					msg ="데이터 오류";
					url ="ReviewBoardList.bd";
					
					request.setAttribute("board_msg", msg);
					request.setAttribute("board_url", url);
					
					forward = new ActionForward();
					forward.setRedirect(false);
					forward.setPath("/WEB-INF/views/redirect.jsp");
					
				}else {
					
					request.setAttribute("rbnum", rbnum);
					request.setAttribute("board", board);
					
					forward = new ActionForward();
					forward.setRedirect(false);
					forward.setPath("/WEB-INF/views/rboard/reviewupdate.jsp");
					
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		return forward;
	}

}
