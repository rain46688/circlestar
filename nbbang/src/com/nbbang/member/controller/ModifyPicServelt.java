package com.nbbang.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.nbbang.member.model.service.MemberService;
import com.nbbang.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ModifyPicServelt
 */
@WebServlet("/member/modifyPicCpl")
public class ModifyPicServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyPicServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int usid=Integer.parseInt(request.getParameter("usid"));
		Member m=new MemberService().myPage(usid);
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "업로드 오류(form:enctype)");
			request.setAttribute("loc", "/member/modifyProfile?usid="+usid);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		MultipartRequest multi=null;
		int fileMaxSize=10*1024*1024;
		String savePath=getServletContext().getRealPath("/")+"upload/profilePic";
		try {
			multi=new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		}catch(Exception e) {
			request.setAttribute("msg", "파일의 크기는 10MB를 넘을 수 없습니다.");
			request.setAttribute("loc", "/member/modifyProfile?usid="+usid);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		String usidStr=multi.getParameter("usid");
		String fileName="";
		File file=multi.getFile("userProfile");
		if(file !=null) {
			String ext=file.getName().substring(file.getName().lastIndexOf(".")+1);
			if(ext.equals("jpg") || ext.equals("png") || ext.equals("gif")) {
				String prev=m.getMemberPicture();
				File prevFile=new File(savePath+"/"+prev);
				if(prevFile.exists()) {
					prevFile.delete();
				}
				fileName=file.getName();
			}else {
				if(file.exists()) {
					file.delete();
				}
				request.setAttribute("msg", "이미지 파일만 업로드 가능합니다.");
				request.setAttribute("loc", "/member/modifyProfile?usid="+usid);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}
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
