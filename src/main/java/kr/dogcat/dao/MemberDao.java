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
	public boolean checkEmailPwd(String email, String mpwd) {
		Connection conn = null;// 추가
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginok = false;

		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가
			String sql = "select email, mpwd from Member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				if (mpwd.equals(rs.getString("mpwd"))) {
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
	
	//ID 존재 유무 판단
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
	
	//로그인 시 email로 회원정보 담은 Member 객체 가져오기
	public Member getMemberInfoByEmail(String email) {

		Connection conn =null;//추가
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		
		try {
				conn= ConnectionHelper.getConnection("oracle");//추가
				String sql = "select mnic,mname,mpwd,madd,mphone from Member where email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					m = new Member();
					m.setEmail(rs.getString("email"));
					m.setMnic(rs.getString("mnic"));
					m.setMname(rs.getString("mname"));
					m.setMpwd(rs.getString("mpwd"));
					m.setMadd(rs.getString("madd"));
					m.setMphone(rs.getString("mphone"));
					
				}
				
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			try {
				conn.close();//반환하기
			} catch (SQLException e) {
				
				e.printStackTrace();
			} 
		}
		return m;
	}
	
	//Delete
	//회원 삭제(회원 리스트)
	public int deleteMember(String id) {
		Connection conn = null;
		int resultrow=0;
		PreparedStatement pstmt = null;
		try {
				conn= ConnectionHelper.getConnection("oracle");
				String sql = "delete from Member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				resultrow = pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("delete : " + e.getMessage());
		}finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			try {
				conn.close(); //반환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultrow;
	}
}
