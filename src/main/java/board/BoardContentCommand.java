package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardContentCommand implements BoardInterface {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = (request.getParameter("pag")==null || request.getParameter("pag").equals("")) ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = (request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("")) ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		BoardDAO dao = new BoardDAO();
		
		// 글 조회수 1씩 증가하기(중복 불허)
		HttpSession session = request.getSession();
		ArrayList<String> contentArray = (ArrayList<String>) session.getAttribute("sContentArray");
		if(contentArray == null) contentArray = new ArrayList<String>();
		String imsiContentArray = "board" + idx;
		if(!contentArray.contains(imsiContentArray)) {
			dao.setContentReadNumPlus(idx);
			contentArray.add(imsiContentArray);
		}
		session.setAttribute("sContentArray", contentArray);
		
		// 이전글/다음글 검색하기
		BoardVO preVo  = dao.getPreNextSearch(idx, "pre");
		BoardVO nextVo = dao.getPreNextSearch(idx, "next");
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		// 현재 게시글 vo에 담아오기
		BoardVO vo = dao.getBoardContent(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		// 댓글처리
		ArrayList<BoardReplyVO> replyVos = dao.getBoardReply(idx);
		request.setAttribute("replyVos", replyVos);
	}

}
