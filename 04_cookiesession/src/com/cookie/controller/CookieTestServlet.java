package com.cookie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieTestServlet
 */
@WebServlet("/cookieTest.do")
public class CookieTestServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
      //쿠키생성해서 클라이언트에게 보내기
      Cookie cookie = new Cookie("id","BS");
      //유효기간설정
      cookie.setMaxAge(24*60*60);//1일
      //cookie전송
      response.addCookie(cookie);
      
      Cookie cookie2 = new Cookie("email","js@naver.com");
      cookie.setMaxAge(24*60*60);
      response.addCookie(cookie2); //name은 key값이기 때문에 중복되면 안됨! 덮어쓰기됨!
      
      //응답페이지 작성
      response.setContentType("text/html; charset=UTF-8;");
      PrintWriter out = response.getWriter();
      String html = "<html>";
      html +="<body>";
      html+="<p>쿠키가 전송되었습니다</p>";
      html+="<button onclick='location.assign(\"checkCookie.do\");'>쿠키값확인</button>";
      html +="</body>";
      html +="</html>";
      out.print(html);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}