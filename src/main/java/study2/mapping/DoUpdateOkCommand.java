package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoUpdateOkCommand implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse resposne) throws ServletException, IOException {
		System.out.println("이곳은 DoUpdateOkCommand 입니다.");
		
		// 수정처리한 정보들을 DB에 다시 업데이트처리하고 돌아온다.
		
		request.setAttribute("message", "회원 정보가 수정되었습니다.");
		request.setAttribute("url", "/study2/mapping/Test2");
	}

}
