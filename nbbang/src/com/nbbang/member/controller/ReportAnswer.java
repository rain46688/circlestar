package com.nbbang.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.member.model.service.MemberService;

/**
 * Servlet implementation class ReportAnswer
 */
@WebServlet("/member/reportAnswer")
public class ReportAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reportAnswer=request.getParameter("ranswer");
		int rboardId=Integer.parseInt(request.getParameter("rboardId"));
		int result=new MemberService().reportAnswer(reportAnswer,rboardId);
		if(result>0) {
			request.setAttribute("msg", "답변 등록에 성공했습니다.");
			request.setAttribute("loc", "/member/reportList?usid=9999");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "답변 등록에 실패했습니다.");
			request.setAttribute("loc", "/member/reportList?usid=9999");
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
