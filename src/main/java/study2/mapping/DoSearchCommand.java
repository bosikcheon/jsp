package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DoSearchCommand implements DoInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse resposne) throws ServletException, IOException {
		System.out.println("이곳은 DoSearchCommand 입니다.");
		request.setAttribute("msg2", "DoSearchCommand");
	}

}
