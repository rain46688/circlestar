package com.nbbang.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;
import com.nbbang.member.model.vo.Report;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업로드 오류(form:enctype)");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		String path=getServletContext().getRealPath("/")+"upload/report";
		int maxSize=1024*1024*10;
		String encode="UTF-8";
		MultipartRequest mr=new MultipartRequest(request, path, maxSize, encode, new DefaultFileRenamePolicy());
		
		Report r=new Report();
		int rusid=Integer.parseInt(mr.getParameter("rusid"));
		int rboardId=Integer.parseInt(mr.getParameter("rboardId"));
		int rtargetUsid=Integer.parseInt(mr.getParameter("rtargetUsid"));
		String rtype=mr.getParameter("rtype");
		String reportTitle=mr.getParameter("reportTitle");
		String rcontent=mr.getParameter("rcontent");
		String rfile=mr.getFilesystemName("rfile");
		String rtargetNickname=mr.getParameter("rtargetNickname");
		String rnickname=mr.getParameter("rnickname");
		
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
