package com.nbbang.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.nbbang.customer.model.service.CustomerService;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CustomerRead
 */
@WebServlet("/customer/customerReadFrm")
public class CustomerReadFrm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerReadFrm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			
//			request.setAttribute("msg", "오류");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			return;
//		}
//
//		System.out.println(getServletContext().getRealPath("/"));
//
//		String path=getServletContext().getRealPath("/")+"css/cstmcss"; 
//		int maxSize=1024*1024*10;
//		String encode="UTF-8";
//	
//		MultipartRequest mPr=new MultipartRequest(request,path,maxSize,encode,new DefaultFileRenamePolicy());
//		
//		String content=mPr.getParameter("content");
//		String fileload=mPr.getParameter("csFile");
//		String type=mPr.getParameter("qnaType");
//		CustomerCenter c=new CustomerCenter(0,null,type,null,content,null,fileload);
//		int result=new CustomerService().viewDetailRead(c);
		
		
		
		request.getRequestDispatcher("/views/customer/customerRead.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
