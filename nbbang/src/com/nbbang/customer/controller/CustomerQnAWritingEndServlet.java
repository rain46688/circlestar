package com.nbbang.customer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.nbbang.common.temp.uploadRename;
import com.nbbang.customer.model.service.CustomerService;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.nbbang.customer.model.vo.CustomerFile;

/**
 * Servlet implementation class CustomerQnAWritingEndServlet
 */
@WebServlet("/customer/customerQnAWritingEnd")
public class CustomerQnAWritingEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String UPLOAD_FOLDER = "customerImages";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerQnAWritingEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath = request.getServletContext().getRealPath("/upload/") + UPLOAD_FOLDER;

		File fileSaveDir = new File(uploadPath);// 경로 없으면 생성
		if (!fileSaveDir.exists())
			fileSaveDir.mkdirs();
		
		List<String> fileNames = new ArrayList<String>();
		int index = 0;
		for (Part part : request.getParts()) {
			if (part.getName().equals("file")) {
				String renamed = new uploadRename().randomString(getFileName(part));
				part.write(uploadPath + File.separator + renamed);
				fileNames.add(renamed);
				
				
			}
		}
		
		if(fileNames.size()==0) {//파일 업로드가 됐는지 확인
			request.setAttribute("msg", "파일 업로드 오류입니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/customer/customerQnAWritingEnd");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		CustomerCenter c=new CustomerCenter();
		CustomerFile cf=new CustomerFile();
		
		c.setCsWriter(request.getParameter("writer"));
		c.setCsType(request.getParameter("type"));
		c.setCsTitle(request.getParameter("title"));
		c.setCsContent(request.getParameter("contentwrite"));
		c.setCsNickname(request.getParameter("nickname"));
		c.setCsAnswer(request.getParameter("answer"));
		cf.setCsFileName(fileNames.toArray(new String[fileNames.size()]));
		//나머지 csFile,csFileId는 NULL
		
		int result=new CustomerService().insertQnA(c);
		int result2=new CustomerService().insertQnA2(cf);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="등록 성공";
			loc="/customer/customerQnA";
		}else {
			msg="등록 실패";
			loc="/customer/customerQnAWritingEnd";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}
		return "";
	}
}
