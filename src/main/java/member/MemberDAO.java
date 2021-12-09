package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	MemberVO vo = null;

	// 아이디 중복체크 
	public String idCheck(String mid) {
		String name = "";
		try {
			sql = "SELECT * FROM member WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
		}catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return name;
	}

	// 닉네임 중복체크
	public String nickCheck(String nickName) {
		String name = "";
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) name = rs.getString("name");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return name;
	}

	// 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO member VALUES (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
					+ "default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getJob());
			pstmt.setString(11, vo.getHobby());
			pstmt.setString(12, vo.getPhoto());
			pstmt.setString(13, vo.getContent());
			pstmt.setString(14, vo.getUserInfor());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 로그인시 DB에 저장된 아이디라면 vo에 담아서 넘긴다.
	public MemberVO loginCheck(String mid) {
		vo = new MemberVO();
		try {
			sql = "select * from member where mid = ? and userDel = 'NO'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setLevel(rs.getInt("level"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setPoint(rs.getInt("point"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				// 회원정보 수정을 위해서 member.sql에 있는 모든 정보를 다 담아서 넘겨준다.
				
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setPhoto(rs.getString("photo"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				
				// 자꾸 안오는 것들 (joinOK에서 name이 이상한듯)
				vo.setName(rs.getString("name"));
				
//				System.out.println("VO : " + vo );
			}
			else {
				vo = null;
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	
	// 로그인시 갱신 처리해야할 항목들
	public void setLastDateUpdate(String mid, int newPoint, int todayCnt) {
		try {
			sql = "update member set lastDate = now(), point = point + ?, visitCnt = visitCnt + 1, todayCnt = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newPoint);
			pstmt.setInt(2, todayCnt);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 비밀번호 확인(회원정보 수정시)
	public String pwdConfirm(String mid) {
		String res = "";
		try {
			sql = "SELECT pwd FROM member WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) res = rs.getString("pwd");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return res;
	}
	
	// 회원정보 수정처리
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set pwd=?,nickName=?,name=?,email=?,gender=?,"
					+ "birthday=?, tel=?, address=?, job=?, hobby=?,"
					+ "content=?, userInfor=?,photo=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getContent());
			pstmt.setString(12, vo.getUserInfor());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	// 개별정보 상세보기
	public MemberVO getMemberInfo(String mid) {
		vo = new MemberVO();
		try {
			sql = "SELECT * FROM member WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}
	
	// 개별정보 상세보기
		public MemberVO getMemberInfo(int idx) {
			vo = new MemberVO();
			try {
				sql = "SELECT * FROM member WHERE idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setNickName(rs.getString("nickName"));
					vo.setName(rs.getString("name"));
					vo.setGender(rs.getString("gender"));
					vo.setBirthday(rs.getString("birthday"));
					vo.setTel(rs.getString("tel"));
					vo.setAddress(rs.getString("address"));
					vo.setEmail(rs.getString("email"));
					vo.setJob(rs.getString("job"));
					vo.setHobby(rs.getString("hobby"));
					vo.setPhoto(rs.getString("photo"));
					vo.setContent(rs.getString("content"));
					vo.setUserInfor(rs.getString("userInfor"));
					vo.setUserDel(rs.getString("userDel"));
					vo.setPoint(rs.getInt("point"));
					vo.setLevel(rs.getInt("level"));
					vo.setVisitCnt(rs.getInt("visitCnt"));
					vo.setLastDate(rs.getString("lastDate"));
					vo.setStartDate(rs.getString("startDate"));
					vo.setTodayCnt(rs.getInt("todayCnt"));
				}
				
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				getConn.rsClose();
			}
			return vo;
		}
	
	// 회원 삭제
	public void memberDelete(String mid) {
		try {	
			sql = "UPDATE member SET userDel = 'OK' WHERE mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 신규회원이 몇명인지 가져오기
	public int getNewMember() {
		int newMember = 0;
		try {
			sql = "select count(*) from member where level = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			newMember = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return newMember;
	}
	
	// 페이징처리를 위해 총 회원수 구하기
	public int totRecCnt(int level, String mid) {
		int totRecCnt = 0;
		try {
			if(level == 99 && mid.equals("")) {
				sql = "select count(*) from member";
				pstmt = conn.prepareStatement(sql);
			}
			else if(level != 99 && mid.equals("")) {
				sql = "select count(*) from member where level = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			else {
				sql = "select count(*) from member where mid like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+mid+"%");
			}
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	// 회원 전체 리스트 가저오기
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize, int level, String mid) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			if(level == 99 && mid.equals("")) {
				sql = "select * from member order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else if(level != 99 && mid.equals("")) {
				sql = "select * from member where level = ? order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			else {
				sql = "select * from member where mid like ? order by idx desc limit ?, ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+mid+"%");
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	// 회원 탈퇴처리 (테이블에서 삭제)
	public void setMemberReset(int idx) {
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	// 회원 등급 변경
	public void setMemberLevelChange(int idx, int level) {
		try {
			sql = "update member set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

}
