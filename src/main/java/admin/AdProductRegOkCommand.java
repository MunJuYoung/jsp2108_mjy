package admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.dao.ProductDAO;

public class AdProductRegOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/data/product");
		int maxSize = 1024*1024*5; // 5Mbyte
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// ---------------------------------------데이터 받아오기------------------------------------------
		String mainCategory = multipartRequest.getParameter("mainCategory");
		String middleCategory = multipartRequest.getParameter("middleCategory");
		String name = multipartRequest.getParameter("name");
		int price = Integer.parseInt(multipartRequest.getParameter("price"));
		String[] colors = multipartRequest.getParameterValues("color");
		String color = "";
		for(int i=0; i<colors.length; i++) {
			color += colors[i] + "/";
		}
		color = color.substring(0, color.lastIndexOf("/"));
		
		String[] sizes = multipartRequest.getParameterValues("size");
		String size = "";
		for(int i=0; i<sizes.length; i++) {
			size += sizes[i] + "/";
		}
		size = size.substring(0, size.lastIndexOf("/"));
		
		int cnts = Integer.parseInt(multipartRequest.getParameter("cnts"));
		String photo = multipartRequest.getParameter("photo");
		String content = multipartRequest.getParameter("content")==null ? "": multipartRequest.getParameter("content");
		/*----------------------------데이터 받아오기 끝 ----------------------------------------------*/
		
		// ---------------------------------파일 업로드----------------------------------------------
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String fileSystemName = null;
		
		//이미지를 여러개 넣었을 경우
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			fileSystemName = multipartRequest.getFilesystemName(file);
		}
		// 이미지를 안올렸을 시
		if(!photo.equals("noimage")) {
			fileSystemName = multipartRequest.getFilesystemName("fName"); // 실제 서버에 저장되는 파일명
		}
		else {
			fileSystemName = "noimage.jpg";
		}
		
		System.out.println("업로드시 원본 파일명 : " + originalFileName);
		System.out.println("서버에 저장된 실제 파일명 : " + fileSystemName);
		//-------------------------------------파일 업로드 끝----------------------------------------
		
		//--------------------------------*--- DB에 저장시작----------------------------------------
		ProductDAO dao = new ProductDAO();
		
		int cate_idx = 0;           /* 카테고리 idx  */
		int product_idx = 0;        /* 상품 idx */
		int res = 0;
		
		// 카테고리 idx 찾기
		cate_idx = dao.getCategoryIdx(mainCategory, middleCategory);
		
		// product 테이블에 상품 등록하고 product_idx 찾기
		dao.setProductRegister(cate_idx, name);
		product_idx = dao.getProductIdx(cate_idx, name);
		
		// productOption 테이블에 옵션 등록하고 결과 받기
		res = dao.setProductOptionRegister(product_idx, price, color, size, cnts, photo, content);
				
		if(res == 1) {
			request.setAttribute("msg", "productRegOk");
		}
		else {
			request.setAttribute("msg", "productRegNo");
		}
		request.setAttribute("url", request.getContextPath()+"/adProductReg.ad");
			
	}

}
