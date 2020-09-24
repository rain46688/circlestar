package com.nbbang.customer.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerFileDown
 */
@WebServlet("/customer/customerFileDown")
public class CustomerFileDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_FOLDER = "customerImages";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerFileDown() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1. 전송할 파일에 대한 경로를 가져옴
		String path=getServletContext().getRealPath("/upload/") + UPLOAD_FOLDER;;
		String file=request.getParameter("fname");
		

		File downFile=new File(path+"/"+file);
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(downFile));
		
		//클라이언트 스트림 열기
		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);

		String fileRename="";
		String header=request.getHeader("user-agent");
		boolean isMSIE=header.indexOf("MSIE")!=-1 || header.indexOf("Trident") !=-1;
		if(isMSIE) {
			fileRename=URLEncoder.encode(file,"UTF-8").replaceAll("\\+", "%20");//인코딩처리 \\+를 %20으로 바꿔줌
		}else {
			fileRename=new String(file.getBytes("UTF-8"),"ISO-8859-1");
		}
			

		response.setContentType("application/octet-stream");//file로 보내는 방식
		response.setHeader("Content-Disposition", "attachment;filename="+fileRename);
		
		//파일 전송하기
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
