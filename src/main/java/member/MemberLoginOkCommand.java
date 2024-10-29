package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.MemberIdCheck(mid);
		
		if(vo.getPwd() == null) {
			request.setAttribute("message", "회원정보가 없습니다.\\n확인하고 다시 로그인하세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		// 동일한 아이디가 검색되었다면 비밀번호가 맞는지 확인다.
		// 입력받은 비밀번호를 암호화 시켜서 DB에 암호화 되어 저장되어 있는 비밀번호와 비교한다. 
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("message", "비밀번호가 틀립니다.\\n확인하고 다시 로그인하세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		// 정상 인증이 완료되었을때 처리할 내용들을 기술한다.
		// 아이디를 쿠키로 저장처리
		// 방문포인트를 5회 미만일경우에 10point씩 증가처리한다. 방문횟수(총/오늘) 누적, 마지막 방문일자 처리, 준회원을 자동으로 등업처리할경우 수행내용등등..==>> DB에 저장...
		// 처리완료된 자료들은 작업수행이 지속되는동한 꼭 필요한 정보만을 session에 저장처리한다.
		
		
		// 방문포인트 10증가, 방문카운트(총/오늘) 1증가, 마지막날짜(최종방문일자) 수정
		dao.setPointPlus(mid);
		
		// 세션에 저장할 항목 : mid, nickName
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		
		
		request.setAttribute("message", mid + "님 로그인 되었습니다.");
		request.setAttribute("url", "MemberMain.mem");
	}

}
