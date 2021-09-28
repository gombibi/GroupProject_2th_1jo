package kr.dogcat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.dogcat.dto.Member;
import kr.dogcat.utils.ConnectionHelper;

public class MemberDao {
	
	//회원가입
	public int insertMember(Member m) {
	Connection conn = null;// 추가
	int resultrow = 0;
	PreparedStatement pstmt = null;

	try {
		conn = ConnectionHelper.getConnection("oracle");// 추가

		String sql = "insert into Member(email,mnic,mname,mpwd,madd,mphone) values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m.getEmail());
		pstmt.setString(2, m.getMnic());
		pstmt.setString(3, m.getMname());
		pstmt.setString(4, m.getMpwd());
		pstmt.setString(5, m.getMadd());
		pstmt.setString(6, m.getMphone());

		resultrow = pstmt.executeUpdate();

	} catch (Exception e) {
		System.out.println("Insert : " + e.getMessage());
	} finally {
		ConnectionHelper.close(pstmt);
		ConnectionHelper.close(conn);
		try {
			conn.close(); // 반환하기
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return resultrow;
}

	//로그인 시 email pwd 체크
	public boolean checkEmailPwd(String email, String pwd) {
		Connection conn = null;// 추가
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginok = false;

		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가
			String sql = "select email, pwd from Member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (pwd.equals(rs.getString("pwd"))) {
					// ID 존재
					loginok = true;
				} else {
					loginok = false;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		try {
			conn.close();// 반환하기
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return loginok;
	}
	
	// 추가함수 (ID 존재 유무 판단 함수)
	public String isCheckByEmail(String email) {
		Connection conn = null;// 추가
		String isEmail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가
			String sql = "select email from Member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				isEmail = "false";
			} else {
				isEmail = "true";
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			try {
				conn.close();// 반환하기
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return isEmail;
	}	
}
