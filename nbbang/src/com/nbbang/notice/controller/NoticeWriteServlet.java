package com.nbbang.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.notice.model.service.NoticeService;
import com.nbbang.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeWriteServlet
 */
@WebServlet("/notice/noticeWrite")
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeWriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" === NoticeWriteServlet get 실행 === ");
		request.getRequestDispatcher("/views/notice/noticeWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" === NoticeWriteServlet post 실행 === ");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String nickname = "";
		int usid = 0;
		if (!request.getParameter("nickname").equals("") && !request.getParameter("usid").equals("")) {
			nickname = request.getParameter("nickname");
			usid = Integer.parseInt(request.getParameter("usid"));
		} else {
			System.out.println(" === 로그인 세션 없음 === ");
		}
		System.out.println(
				"title : " + content + ", content : " + content + ", nickname : " + nickname + ", usid : " + usid);
		Notice n = new Notice();
		n.setNoticeAdminUsid(usid);
		n.setNoticeContent(content);
		n.setNoticeWriteNickname(nickname);
		n.setNoticeTitle(title);
		int result = new NoticeService().insertNotice(n);
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "공지사항 등록 완료!";
			loc = "/notice/noticeList";
		} else {
			msg = "공지사항 등록에 실패하였습니다.";
			loc = "/notice/noticeList";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
