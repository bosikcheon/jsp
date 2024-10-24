package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DoInterface {
	public void execute(HttpServletRequest request, HttpServletResponse resposne) throws ServletException, IOException;
}
