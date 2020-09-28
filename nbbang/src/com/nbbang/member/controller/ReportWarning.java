package com.nbbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Report;

/**
 * Servlet implementation class ReportWarning
 */
@WebServlet("/warning")
public class ReportWarning extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportWarning() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportId=Integer.parseInt(request.getParameter("reboardId"));
		Report r=new MemberService().reportDetail(reportId);
		int tusid=r.getReportTargetUsid();
		int result=new MemberService().reportWarning(tusid);
		System.out.println(reportId);
		if(result>0) {
			request.setAttribute("msg", "해당 회원에게 경고를 주었습니다.");
			request.setAttribute("loc", "/admin/reportDetail?reportId="+reportId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "경고주기에 실패했습니다.");
			request.setAttribute("loc", "/admin/reportDetail?reportId="+reportId);
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
