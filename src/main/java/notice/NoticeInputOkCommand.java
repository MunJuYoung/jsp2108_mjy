package notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardVO;

public class NoticeInputOkCommand implements NoticeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
				
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		// title필드에는 태그 사용금지(< ---> &lt;  , > --->  &gt;)
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
//		System.out.println("title : " + title);
//		System.out.println("content : " + content);
		
		NoticeVO vo = new NoticeVO();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		NoticeDAO dao = new NoticeDAO();
		
		int res = dao.setNoticeInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "noticeInputOk");
			request.setAttribute("url", request.getContextPath()+"/noticeList.no");
		}
		else {
			request.setAttribute("msg", "noticeInputNo");
			request.setAttribute("url", request.getContextPath()+"/noticeInput.no");
		}


	}

}
