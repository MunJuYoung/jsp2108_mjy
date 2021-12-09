package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoUpdateOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		// title필드에는 태그 사용금지(< ---> &lt;  , > --->  &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setEmail(email);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setIdx(idx);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoUpdateOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "boUpdateOk");
			request.setAttribute("url", request.getContextPath()+"/boContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "boUpdateNo");
			request.setAttribute("url", request.getContextPath()+"/boUpdate.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}

	}

}
