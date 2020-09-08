package onebyn.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import onebyn.common.AES;
import onebyn.model.service.MemberService;
import onebyn.model.vo.Member;

/**
 * Servlet implementation class DetailPageServlet
 */
@WebServlet("/enrollpage.do")
public class EnrollPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/WEB-INF/views/member/enrollpage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("회원가입 로직");
		
		Member m = new Member();
		m.setMemberId(request.getParameter("userId"));
		m.setMemberPwd(request.getParameter("password"));
		m.setMemberName(request.getParameter("userName"));
		m.setNickname(request.getParameter("nickName"));
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		m.setAddress(request.getParameter("address"));
		try {
			m.setEmail(AES.enc(email));
			m.setPhone(AES.enc(phone));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result = new MemberService().insertMember(m);
		
		String msg = "";
		String loc = "/";
		if (result > 0) {
			msg = "회원가입성공";
			loc = "/login.do";
		} else {
			msg = "회원가입실패";
			loc = "/enrollpage.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
	}

}
