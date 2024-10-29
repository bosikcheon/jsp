package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 저장된 비밀번호에서 salt키를 분리시켜서 다시 암호화후 비교처리해야 한다.
		String salt = vo.getPwd().substring(0,3);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		// System.out.println("pwd(암호화) : " + pwd);
		// System.out.println("pwd(DB) : " + vo.getPwd().substring(3));
		
		if(!vo.getPwd().substring(3).equals(pwd)) {
			request.setAttribute("message", "회원정보가 없습니다.\\n확인하고 다시 로그인하세요.");
			request.setAttribute("url", "MemberLogin.mem");
			return;
		}
		
		// 동일한 아이디가 검색되었다면 비밀번호가 맞는지 확인다.
		// 입력받은 비밀번호를 암호화 시켜서 DB에 암호화 되어 저장되어 있는 비밀번호와 비교한다. 
		
//		if(!vo.getPwd().equals(pwd)) {
//			request.setAttribute("message", "비밀번호가 틀립니다.\\n확인하고 다시 로그인하세요.");
//			request.setAttribute("url", "MemberLogin.mem");
//			return;
//		}
		
		// 정상 인증이 완료되었을때 처리할 내용들을 기술한다.
		// 아이디를 쿠키로 저장처리
		// 방문포인트를 5회 미만일경우에 10point씩 증가처리한다. 방문횟수(총/오늘) 누적, 마지막 방문일자 처리, 준회원을 자동으로 등업처리할경우 수행내용등등..==>> DB에 저장...
		// 처리완료된 자료들은 작업수행이 지속되는동한 꼭 필요한 정보만을 session에 저장처리한다.
		
		
		// 방문포인트 10증가, 방문카운트(총/오늘) 1증가, 마지막날짜(최종방문일자) 수정
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		if(!strToday.equals(vo.getLastDate().substring(0, 10))) {
			// 오늘 처음 방문한경우 수행처리(오늘방문카운트를 1로하고, 기존 포인트+10)
			vo.setTodayCnt(1);
			vo.setPoint(vo.getPoint() + 10);
		}
		else {
			// 오늘 다시 방문한 경우(오늘 방문카운트+1, 포인트증가? 오늘 방문횟수가 5회까지만 포인트+10)
			vo.setTodayCnt(vo.getTodayCnt()+1);
			if(vo.getTodayCnt() <= 5) vo.setPoint(vo.getPoint() + 10);
		}
		
		//dao.setPointPlus(mid);
		
		// 세션에 저장할 항목 : mid, nickName
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		
		
		request.setAttribute("message", mid + "님 로그인 되었습니다.");
		request.setAttribute("url", "MemberMain.mem");
	}

}
