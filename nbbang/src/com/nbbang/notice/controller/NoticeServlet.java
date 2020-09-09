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
 * Servlet implementation class NoticeServlet
 */
@WebServlet("/notice/noticeList")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("no"));
		Notice n=new NoticeService().selectNoticeOne(no);
		String view="";
		if(n==null) {
			//선택한 자료가 없을때
			//자료가 없다는 메세지 출력
			request.setAttribute("msg", "조회된 공지사항이 없다.");
			request.setAttribute("loc", "/notice/notice.jsp");
			view="/views/common/msg.jsp";
		}else {
			//선택된 공지사항으로 이동
			request.setAttribute("notice", n);
			view="/views/notice/noticeView.jsp";
		};
		
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
