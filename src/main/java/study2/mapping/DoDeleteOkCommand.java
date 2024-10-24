package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoDeleteOkCommand implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse resposne) throws ServletException, IOException {
		System.out.println("이곳은 DoDeleteOkCommand 입니다.");
		
		// 현재 등록된 회원의 정보를 DB에서 삭제처리한다.
		
		request.setAttribute("message", "회원에서 탈퇴 되었습니다.");
		request.setAttribute("url", "/study2/mapping/Test2");
	}

}
