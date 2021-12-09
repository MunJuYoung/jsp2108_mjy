package member;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class MemJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		// 회원사진이 업로드 되었으니 처리(이름 DB저장)
		String photo = multipartRequest.getParameter("photo");
		String filesystemName = "";
		if(!photo.equals("noimage")) {
			filesystemName = multipartRequest.getFilesystemName("fName"); // 실제 서버에 저장되는 파일명
		}
		else {
			filesystemName = "noimage.jpg";
		}
		
		// 아이디와 닉네임 중복체크를 저장전에 한번더 수행시켜준다.
		MemberDAO dao = new MemberDAO();
		
		name = dao.idCheck(mid);
		if(!name.equals("")) {  // 사용 불가능한 아이디
			request.setAttribute("msg", "idCheckNo");	// 사용불가한 아이디(이미 사용중인 아이디)
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		// 닉네임 중복체크 할것....
		name = dao.nickCheck(nickName);
		if(!name.equals("")) {  // 사용 불가능한 아이디
			request.setAttribute("msg", "nickCheckNo");	// 사용불가한 닉네임(이미 사용중인 닉네임)
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		// 비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 모든 체크 완료후 정확한 회원정보를 DB에 저장할 준비(vo)를 한다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name_); // 회원가입시 아이디와 닉네임 중복체크를 name을 이용해서 해서 따로 저장해둔 변수로 써야함..
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(filesystemName);	// 이미지 처리.....
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res == 1) {  // 정상적으로 회원가입완료
			request.setAttribute("msg", "memberJoinOk");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}
		else {
			request.setAttribute("msg", "memberJoinNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
		}
	}

}
