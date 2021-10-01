package kr.dogcat.service.pboard;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.dogcat.action.Action;
import kr.dogcat.action.ActionForward;
import kr.dogcat.dao.PboardDao;
import kr.dogcat.dto.Member;
import kr.dogcat.dto.Pboard;

public class PboardEditService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
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
			
			PboardDao dao = new PboardDao();
	    	Pboard pboard = dao.getEditContent(phnum);

			PrintWriter out = response.getWriter();
			
	        if(pboard == null){
	        	out.print("데이터 오류");
				out.print("<hr><a href='PboardList.pg'>목록가기</a>");
	        }
	        
	        request.setAttribute("phnum", phnum);
	        request.setAttribute("pboard", pboard);
	        
	        forward = new ActionForward();
	        forward.setRedirect(false);
	        forward.setPath("/WEB-INF/board/board_edit.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
