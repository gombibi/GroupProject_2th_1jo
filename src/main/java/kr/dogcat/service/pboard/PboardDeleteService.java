package kr.dogcat.service.pboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dto.Member;

public class PboardDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");

		//로그인한 멤버 객체 불러오기
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		String useremail = m.getEmail();
		
		//글번호 받기
		String phnum= request.getParameter("phnum"); 
		
		ActionForward forward = null;
		
		try {
			//글 번호를 가지고 오지 않았을 경우 예외처리
			if(phnum == null || phnum.trim().equals("")){
				System.out.println("글번호 입력 오류");
				response.sendRedirect("PboardList.pg");
			}
			
	        request.setAttribute("phnum", phnum);
	        
	        forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("/WEB-INF/board/board_delete.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
