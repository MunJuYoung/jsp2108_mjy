package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.ProductDAO;

public class DuplicationCheckCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String mainCategory = request.getParameter("mainValue");
		String middleCategory = request.getParameter("middleValue");
		int res = 100;
		int cate_idx = 0;
		ProductDAO dao = new ProductDAO();
		
		cate_idx = dao.getCategoryIdx(mainCategory, middleCategory);
		res = dao.productCheck(cate_idx, name);
		
		request.setAttribute("res", res);
		request.setAttribute("name", name);

	}

}
