package com.nbbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;
import com.nbbang.member.model.vo.Report;

/**
 * Servlet implementation class ReportSendServlet
 */
@WebServlet("/member/reportSend")
public class ReportSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Report r=new Report();
		int rusid=Integer.parseInt(request.getParameter("rusid"));
		int rboardId=Integer.parseInt(request.getParameter("rboardId"));
		int rtargetUsid=Integer.parseInt(request.getParameter("rtargetUsid"));
		String rtype=request.getParameter("rtype");
		String reportTitle=request.getParameter("reportTitle");
		String rcontent=request.getParameter("rcontent");
		String rfile=request.getParameter("rfile");
		String rtargetNickname=request.getParameter("rtargetUsid");
		String rnickname=request.getParameter("rnickname");
		
		r.setReportUserUsid(rusid);
		r.setReportBoardId(rboardId);
		r.setReportTargetUsid(rtargetUsid);
		r.setReportType(rtype);
		r.setReportTitle(reportTitle);
		r.setReportContent(rcontent);
		r.setReportFile(rfile);
		r.setReportTargetNickname(rtargetNickname);
		r.setReportUserNickname(rnickname);
		
		int result=new MemberService().sendReport(r);
		if(result>0) {
			request.setAttribute("msg", "신고 접수가 완료되었습니다.");
			request.setAttribute("loc", "/board/boardPage?boardId="+rboardId+"&writerUsid="+rtargetUsid);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "신고 접수에 실패하였습니다.");
			request.setAttribute("loc", "/board/boardPage?boardId="+rboardId+"&writerUsid="+rtargetUsid);
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
