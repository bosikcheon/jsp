package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoInputOkCommand implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse resposne) throws ServletException, IOException {
		System.out.println("이곳은 DoInputOkCommand 입니다.");
		
		// 앞의 회원가입시 등록된 자료를 모두 받아서 유효성 검사후 DB에 저장완료시킨다.
		
		request.setAttribute("message", "회원 가입에 성공 하셨습니다.");
		request.setAttribute("msg", "DoInputOkCommand");
	}

}
