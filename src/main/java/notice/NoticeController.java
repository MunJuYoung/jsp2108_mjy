package notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.no")
public class NoticeController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeInterface command = null;
		String viewPage = "/WEB-INF/notice";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		if(com.equals("/noticeList")) {
			command = new NoticeListCommand();
			command.execute(request, response);
			viewPage += "/noticeList.jsp";
		}
		else if(com.equals("/noticeInput")) {
			command = new NoticeInputCommand();
			command.execute(request, response);
			viewPage += "/noticeInput.jsp";
		}
		else if(com.equals("/noticeInputOk")) {
			command = new NoticeInputOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/noticeContent")) {
			command = new NoticeContentCommand();
			command.execute(request, response);
			viewPage += "/noticeContent.jsp";
		}
		else if(com.equals("/noticeDelete")) {
			command = new NoticeDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/noticeUpdate")) {
			command = new NoticeUpdateCommand();
			command.execute(request, response);
			viewPage += "/noticeUpdate.jsp";
		}
		else if(com.equals("/noticeUpdateOk")) {
			command = new NoticeUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/noticeSearch")) {
			command = new NoticeSearchCommand();
			command.execute(request, response);
			viewPage += "/noticeSearch.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
