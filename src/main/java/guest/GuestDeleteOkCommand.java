package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestDeleteOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestDeleteOk(idx);
		
		if(res != 0) {
			request.setAttribute("message", "방명록에 현재글이 삭제되었습니다.");
		}
		else {
			request.setAttribute("message", "방명록글 삭제 실패~~");
		}
		request.setAttribute("url", "/GuestList.gu");
	}

}
