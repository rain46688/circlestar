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

import com.google.gson.Gson;
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
		String uploadPath = request.getServletContext().getRealPath("/upload/") + UPLOAD_FOLDER;

		File fileSaveDir = new File(uploadPath);// 경로 없으면 생성
		if (!fileSaveDir.exists())
			fileSaveDir.mkdirs();
		int maxSize = 1024 * 1024 * 100;// 100MB
		List<String> fileNames = new ArrayList<String>();

		MultipartRequest mr = new MultipartRequest(request, uploadPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 멀티플로 보낸 파일 받기
		Enumeration<String> e = mr.getFileNames();// type파일로 온 data의 이름을 가져오는 메소드
		List<CustomerFile> fileList = new ArrayList<CustomerFile>();
		while (e.hasMoreElements()) {
			CustomerFile ctF = new CustomerFile();
			ctF.setCsFileName(mr.getFilesystemName(e.nextElement()));
			System.out.println("실행됨2? : "+ctF.getCsFileName());
			fileList.add(ctF);
		}

		System.out.println(fileList);

			
		CustomerCenter c = new CustomerCenter();
		
		
		c.setCsWriterUsid(Integer.parseInt(mr.getParameter("csWriterUsid")));
		//System.out.println(mr.getParameter("csWriterUsid"));
		c.setCsType(mr.getParameter("csType"));
		//System.out.println(mr.getParameter("csType"));
		c.setCsTitle(mr.getParameter("csTitle"));
		//System.out.println(mr.getParameter("csTitle"));
		c.setCsContent(mr.getParameter("csContent"));
		//System.out.println(mr.getParameter("csContent"));
		c.setCsNickname(mr.getParameter("csNickname"));
		//System.out.println(mr.getParameter("csNickname"));
		
		
		
		// csFileId는 NULL

		int result = new CustomerService().insertQnA(c,fileList);
		
		
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(result,response.getWriter());
		
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


}
