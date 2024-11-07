package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberPwdCheckAjaxOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwdCheck")==null ? "" : request.getParameter("pwdCheck");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		// 비밀번호 암호화 : (int) Math.random() * (최댓값-최소값+1) + 최소값
		long temp = (int)(Math.random()*(999-100+1))+100;
		String salt = temp + "";
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		pwd = salt + pwd;
		
		MemberDAO dao = new MemberDAO();
		int res = dao.setMemberPwdCheckAjaxOk(mid, pwd);
		
		if(res != 0) {
			request.setAttribute("message", "비밀번호가 변경되었습니다.\\n다시 로그인해 주세요.");
			request.setAttribute("url", "MemberLogout.mem");
		}
		else {
			request.setAttribute("message", "비밀번호 변경 실패~~~");
			request.setAttribute("url", "MemberPwdCheckAjax.mem");
		}
	}

}
