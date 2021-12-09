package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "": request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.loginCheck(mid);
		HttpSession session = request.getSession();
		
		
		if(vo != null) { // 아이디는 존재한다. 비밀번호 맞는지 확인
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);

//			String pwd1 = "1234";
//			pwd1 = security.encryptSHA256(pwd1);
//			System.out.println("pwd1 : " + pwd1);
			
			if(vo.getPwd().equals(pwd)) { // 비밀번호가 맞다면
				session.setAttribute("sMid", vo.getMid());
				session.setAttribute("sNickName", vo.getNickName());
				session.setAttribute("sLevel", vo.getLevel());
				session.setAttribute("sLastDate", vo.getLastDate().substring(0,vo.getLastDate().lastIndexOf(".")));
				
				// 방문횟수 5회까지 포인트 10누적처리
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String strToday = sdf.format(today);
				
				int todayCnt = 0, newPoint = 0;
				
				if(vo.getLastDate().substring(0, 10).equals(strToday)) { // 최종방문이 오늘이면
					if(vo.getTodayCnt() >= 5) { // 기존이 5번째 방문이었으면 이번방문이 6회째
						newPoint = 0;
					}
					else {
						newPoint = 10;
					}
					todayCnt = vo.getTodayCnt() + 1;
				}
				else {
					todayCnt = 1;
					newPoint = 10;
				}
				
				// 앞에서 구한 todayCnt를 갱신처리
				dao.setLastDateUpdate(mid,newPoint, todayCnt);
				
				// 아이디 저장기능 체크확인후 쿠키로 저장
				String idCheck = request.getParameter("idCheck") == null ? "" : request.getParameter("idCheck");
				if(idCheck.equals("on")) {// 체크되어있었으면 on이 옴
					Cookie cookie = new Cookie("cMid", mid);
					cookie.setMaxAge(60*60*24*3); // 3일동안 아이디 저장된다. (단위는 초)
					response.addCookie(cookie);
				}
				else { // 체크 해제되어있으면 기존 쿠키삭제
					Cookie[] cookies = request.getCookies();
					for(int i=0; i<cookies.length; i++) {
						if(cookies[i].getName().equals("cMid")) {
							cookies[i].setMaxAge(0); // 쿠키삭제
							response.addCookie(cookies[i]);
							break;
						}
					}
				}
				
				request.setAttribute("msg", "memberLoginOk");
				request.setAttribute("url", request.getContextPath()+"/memMain.mem");
				request.setAttribute("nickName", vo.getNickName());
			}
			else { // 아이디는 있지만 비번이 틀림
				request.setAttribute("msg", "memberLoginPwdNo");
				request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
			}
		}
		else { // 아이디가 없음(vo==null)
			request.setAttribute("msg", "memberLoginNo");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}

	}

}
