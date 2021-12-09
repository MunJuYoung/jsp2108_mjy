package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemInforCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		 
		MemberVO vo = dao.getMemberInfo(idx);
		
		request.setAttribute("vo", vo);

	}

}
