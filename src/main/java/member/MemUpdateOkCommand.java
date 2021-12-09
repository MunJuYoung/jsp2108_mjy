package member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class MemUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO vo = new MemberVO();
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("data/member"); //파일 업로드위치
		int maxSize = 1024*1024*2; // 업로드용량 2Mbyte (1000kbyte = 1Mbyte)
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String mid = multipartRequest.getParameter("mid")==null ? "": multipartRequest.getParameter("mid").trim();
		String pwd = multipartRequest.getParameter("pwd")==null ? "": multipartRequest.getParameter("pwd").trim();
		String nickName = multipartRequest.getParameter("nickName")==null ? "": multipartRequest.getParameter("nickName").trim();
		String name = multipartRequest.getParameter("name")==null ? "": multipartRequest.getParameter("name").trim();
		String name_ = name;
		String email1 = multipartRequest.getParameter("email1")==null ? "": multipartRequest.getParameter("email1").trim();
		String email2 = multipartRequest.getParameter("email2")==null ? "": multipartRequest.getParameter("email2").trim();
		String email = email1 + "@" + email2;
		String gender = multipartRequest.getParameter("gender")==null ? "": multipartRequest.getParameter("gender").trim();
		String birthday = multipartRequest.getParameter("birthday")==null ? "": multipartRequest.getParameter("birthday");
		String tel1 = multipartRequest.getParameter("tel1")==null ? "": multipartRequest.getParameter("tel1").trim();
		String tel2 = multipartRequest.getParameter("tel2")==null ? "": multipartRequest.getParameter("tel2").trim();
		String tel3 = multipartRequest.getParameter("tel3")==null ? "": multipartRequest.getParameter("tel3").trim();
		String tel = tel1 + "/" + tel2 + "/" + tel3;
		String address = multipartRequest.getParameter("address")==null ? "": multipartRequest.getParameter("address");
		String job = multipartRequest.getParameter("job")==null ? "": multipartRequest.getParameter("job").trim();
		String userInfor = multipartRequest.getParameter("userInfor")==null ? "": multipartRequest.getParameter("userInfor");
		String[] hobbys = multipartRequest.getParameterValues("hobby");
		String hobby = "";	
		for(int i=0; i<hobbys.length; i++) {
			hobby += hobbys[i] + "/";
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		
		// 회원사진이 업로드(갱신)처리 되었을때 처리
		String fName = multipartRequest.getFilesystemName("fName"); //새로 올라간 이미지
		String photo = multipartRequest.getParameter("photo"); // 원래 있던 이미지
		
		if(fName != null) {
			vo.setPhoto(fName);
			if(!photo.equals("noimage.jpg")) {
				new File(realPath + "/" + photo).delete();
			}
		}
		else {
			vo.setPhoto(photo);
		}
		
		MemberDAO dao = new MemberDAO();
		
		//SHA-256 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 모든 체크 완료후 정확한 회원정보를 DB에 저장할 준비(vo)를 한다.
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name_);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setJob(job);
		vo.setHobby(hobby);
		// 이미지 처리.....
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		vo.setPhoto(photo);

		int res = dao.setMemberUpdateOk(vo);
		
		if(res == 1) {  // 정상적으로 회원정보수정처리완료
			request.setAttribute("msg", "memberUpdateOk");
		}
		else {
			request.setAttribute("msg", "memberUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/memPwdConfirm.mem");
	}

}
