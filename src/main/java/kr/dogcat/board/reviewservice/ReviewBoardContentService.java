package kr.dogcat.board.reviewservice;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.ReviewBoardDao;
import kr.dogcat.dto.ReviewBoard;

public class ReviewBoardContentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		String rbnum = request.getParameter("rbnum"); // 글번호
		String cpage = request.getParameter("cp"); // 현재 페이지
		String pagesize = request.getParameter("ps"); // 한 페이지당 조회 건수
		
		ReviewBoard board = new ReviewBoard();

		try {
			
			ReviewBoardDao rbd = new ReviewBoardDao();
			
			// 글 번호를 가지고 오지 않았을 경우 예외처리
			if (rbnum == null || rbnum.trim().equals("")) {
				response.sendRedirect("ReviewBoardList.bd");
				return null;
			}
			
			rbnum = rbnum.trim();

			// 처음 들어왔을 때 - 초기값 설정
			if(cpage == null || cpage.trim().equals("")){
				cpage = "1"; 
			}
		
			if(pagesize == null || pagesize.trim().equals("")){
				pagesize = "10"; 
			}

			board = rbd.getContent(Integer.parseInt(rbnum));
			
			
			request.setAttribute("board", board);
			request.setAttribute("rbnum", rbnum);
			request.setAttribute("cp", cpage);
			request.setAttribute("ps", pagesize);
			
			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/rboard/reviewboard.jsp");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return forward;
	}

}
