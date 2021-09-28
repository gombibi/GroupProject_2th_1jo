package kr.dogcat.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.MemberDao;

public class MemberLoginService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		session.setAttribute("userEmail", email);


		try {
			MemberDao dao = new MemberDao(); // POINT
			Boolean result = dao.checkEmailPwd(email, pwd);

			String msg = "";
			String url = "";
			if (result) {
				// Top.jsp 정보 로그인 상태 ...

				// 이동처리
				url = "Main.jsp";

				forward = new ActionForward();
				forward.setRedirect(false); // forward
				forward.setPath("Main.jsp"); //front 주소 확인

			} else {
				msg = "로그인 실패";
				url = "Login.jsp"; //front 주소 확인
				
				request.setAttribute("board_msg",msg);
			    request.setAttribute("board_url", url);
			
			    forward = new ActionForward();
			    forward.setRedirect(false);
			    forward.setPath("/WEB-INF/views/redirect.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
}
