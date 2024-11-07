package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.GuestDAO;
import guest.GuestVO;

public class MemberMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		// 로그인한 회원의 정보를 vo에 담아서 넘겨준다.
		MemberDAO mDao = new MemberDAO();
		MemberVO mVo = mDao.getMemberIdCheck(mid);
		
		request.setAttribute("mVo", mVo);
		
		// 방명록에 글 올린 자료 담아오기
		GuestDAO gDao = new GuestDAO();
		ArrayList<GuestVO> gVos = gDao.getGuestCnt(mVo.getMid(),mVo.getName(),mVo.getNickName());
		request.setAttribute("guestCnt", gVos.size());
		request.setAttribute("gVos", gVos);
	}

}
