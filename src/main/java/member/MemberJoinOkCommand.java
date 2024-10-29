package member;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null ? "" : request.getParameter("birthday");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String address = request.getParameter("address2")==null ? "" : request.getParameter("address2");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String photo = request.getParameter("photo")==null ? "" : request.getParameter("photo");
		String userInfor = request.getParameter("userInfor")==null ? "" : request.getParameter("userInfor");
		
		if(photo.equals("")) photo = "noimage.jpg";
		if(birthday.equals("")) {
			LocalDate today = LocalDate.now();
			birthday = today.toString();
		}
		
		// 비밀번호 암호화 : (int) Math.random() * (최댓값-최소값+1) + 최소값
		long temp = (int)(Math.random()*(999-100+1))+100;
		String salt = temp + "";
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		pwd = salt + pwd;
		
		MemberVO vo = new MemberVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setContent(content);
		vo.setPhoto(photo);
		vo.setUserInfor(userInfor);
		
		//System.out.println("vo : " + vo);
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원에 가입 되셨습니다.");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원가입 실패~~~");
			request.setAttribute("url", "MemberJoin.mem");
		}
			
	}

}
