package notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDeleteCommand implements NoticeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));

		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoticeDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "noticeDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/noticeList.no?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "noticeDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/noticeContent.no?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}


	}

}
