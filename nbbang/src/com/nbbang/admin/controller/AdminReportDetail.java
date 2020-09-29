package com.nbbang.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbbang.board.model.vo.Board;
import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;
import com.nbbang.member.model.vo.Report;

/**
 * Servlet implementation class AdminReportDetail
 */
@WebServlet("/admin/reportDetail")
public class AdminReportDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member loginnedMember=(Member)session.getAttribute("loginnedMember");
		if(loginnedMember.getUsid()==9999) {
			int reportId=Integer.parseInt(request.getParameter("reportId"));
			Report r=new MemberService().reportDetail(reportId);
			int boardId=r.getReportBoardId();
			Board b=new MemberService().boardData(boardId);
			request.setAttribute("reportDetail",r);
			request.setAttribute("boardData", b);
			request.getRequestDispatcher("/views/admin/adminReportDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "접근불가능한 페이지입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);				
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
