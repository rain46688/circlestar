package com.nbbang.customer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.nbbang.customer.model.service.CustomerService;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.nbbang.customer.model.vo.CustomerFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath = request.getServletContext().getRealPath("/upload/") + UPLOAD_FOLDER;

		File fileSaveDir = new File(uploadPath);// 경로 없으면 생성
		if (!fileSaveDir.exists())
			fileSaveDir.mkdirs();
		int maxSize = 1024 * 1024 * 100;// 100MB
		List<String> fileNames = new ArrayList<String>();

		MultipartRequest mr = new MultipartRequest(request, uploadPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		System.out.println(mr.getParameter("type"));
		System.out.println(mr.getParameter("contentwrite"));
		System.out.println(mr.getParameter("title"));
		System.out.println(mr.getParameter("writer"));
		// 멀티플로 보낸 파일 받기
		Enumeration<String> e = mr.getFileNames();// type파일로 온 data의 이름을 가져오는 메소드
		List<CustomerFile> fileList = new ArrayList<CustomerFile>();
		while (e.hasMoreElements()) {
			CustomerFile ctF = new CustomerFile();
			ctF.setCsFileId(Integer.parseInt(mr.getParameter("writer")));
			ctF.setCsFileName(mr.getFilesystemName(e.nextElement()));
			fileList.add(ctF);
		}

		System.out.println(fileList);

			
		if (fileNames.size() == 0) {// 파일 업로드가 됐는지 확인
			request.setAttribute("msg", "파일 업로드 오류입니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/customer/customerQnAWritingEnd");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		CustomerCenter c = new CustomerCenter();
		

		c.setCsWriter(mr.getParameter("writer"));
		c.setCsType(mr.getParameter("type"));
		c.setCsTitle(mr.getParameter("title"));
		c.setCsContent(mr.getParameter("contentwrite"));
		c.setCsNickname(mr.getParameter("nickname"));
		c.setCsAnswer(mr.getParameter("answer"));
		
		
		// csFileId는 NULL

		int result = new CustomerService().insertQnA(c,fileList);
		if (result > 0) {
			// 업로드 성공
			request.setAttribute("msg", "업로드 완료!");
			request.setAttribute("loc", "/customer/customerQnA.jsp");
		} else {
			request.setAttribute("msg", "업로드에 실패하였습니다.");
			request.setAttribute("loc", "/customer/customerQnAWriting.jsp");
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

//	private String getFileName(Part part) {
//		String contentDisp = part.getHeader("content-disposition");
//		String[] tokens = contentDisp.split(";");
//		for (String token : tokens) {
//			if (token.trim().startsWith("filename")) {
//				return token.substring(token.indexOf("=") + 2, token.length() - 1);
//			}
//		}
//		return "";
//	}
}
