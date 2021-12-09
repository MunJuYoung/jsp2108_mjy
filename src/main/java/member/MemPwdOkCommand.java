package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemPwdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String mid = (String)session.getAttribute("sMid");
		MemberDAO dao = new MemberDAO();
		
		String res = dao.pwdConfirm(mid);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(res.equals(pwd)) {
			request.setAttribute("msg", "pwdConfirmOk");
			request.setAttribute("url", request.getContextPath()+"/memUpdate.mem");
		}
		else {
			request.setAttribute("msg", "pwdConfirmNo");
			request.setAttribute("url", request.getContextPath()+"/memPwdConfirm.mem");
		}
		
		
	}

}
