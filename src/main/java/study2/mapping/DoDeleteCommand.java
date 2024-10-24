package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoDeleteCommand implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse resposne) throws ServletException, IOException {
		System.out.println("이곳은 DoDeleteCommand 입니다.");
		request.setAttribute("msg2", "DoDeleteCommand");
	}

}
