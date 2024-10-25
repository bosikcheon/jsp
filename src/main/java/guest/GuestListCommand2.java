package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand2 implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		GuestDAO dao = new GuestDAO();
		
		List<GuestVO> vos = dao.getGuestList();
		
		request.setAttribute("vos", vos);
		request.setAttribute("guestCnt", vos.size());
		*/
	}

}
