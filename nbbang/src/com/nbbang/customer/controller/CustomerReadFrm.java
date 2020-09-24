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
	
		
		//저기뒤에 매개변수로 넘기는 건 jsp에서 보내오는 값. 이름이 같아야함.
		System.out.println("request.getParameter(\"num\"): " + request.getParameter("num"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		//이런거 보내고 나서 꼭 확인
		//그래야 에러잡기 쉬움
		System.out.println("num in servlet: " + num);
		
		//매개변수로 저기에 있는 num을 넘기기
		CustomerCenter cc = new CustomerService().viewDetailRead(num); 
		
		System.out.println("cc in servlet: " + cc);
		
		//페이지 이동처리
		String view ="";
		if(cc == null) {
			request.setAttribute("msg", "조회 실패");
			request.setAttribute("loc", "customerQnA.jsp"); 
			
		view ="/views/common/msg.jsp";
			
		}else {
			request.setAttribute("cc", cc); 
			view="/views/customer/customerRead.jsp"; 
					
		}
		

		
		
		
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
