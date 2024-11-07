package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberDeleteCheckOk(mid);
		session.invalidate();
		
		if(res != 0) {
			request.setAttribute("message", "회원 탈퇴 되였습니다.\\n같은아이디로 1달간 재가입 불가입니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원 탈퇴 실패~~~");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
