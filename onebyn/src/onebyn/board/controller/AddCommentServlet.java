package onebyn.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import onebyn.board.model.service.CommentService;
import onebyn.board.model.vo.Comment;
import onebyn.member.model.vo.Member;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/board/addComment.do")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCommentServlet() {
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
		PrintWriter out = response.getWriter();

		CommentService c = new CommentService();
		List<Comment> list = c.getComment(request.getParameter("board_id"));
		HttpSession session = request.getSession();
		String curuser = "";
		Member m = (Member) session.getAttribute("m");
		if (m != null) {
			curuser = m.getMemberId();
		}
//		System.out.println("curuser : "+curuser);

		String jsonText = "{\"List\":[";
		for (int i = 0; i < list.size(); i++) {
			String id = list.get(i).getCwriterId();
			String com = list.get(i).getComment();
			Date date = list.get(i).getCenrollDate();
			Boolean secret = list.get(i).getSecret();// 비밀 댓글 여부
			SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd");
			int com_no = Integer.parseInt(list.get(i).getComId());
//			System.out.println("com_no : "+com_no);
//			System.out.println("id : "+id);
			if (secret) {// 비밀 댓글일 경우

				if (curuser.equals(id) || curuser.equals("ADMIN")) {
					// 비밀 댓글 작성 본인이거나 운영자면
					jsonText += "[{\"id\":\"" + id + "\"},";
					jsonText += "{\"com_date\":\"" + df.format(date) + "\"},";
					jsonText += "{\"com_content\":\"" + com + "\"},";
					jsonText += "{\"com_no\":\"" + com_no + "\"}]";
				} else {// 아니면 비밀댓글로 보이게
					jsonText += "[{\"id\":\"" + "" + "\"},";
					jsonText += "{\"com_date\":\"" + "" + "\"},";
					jsonText += "{\"com_content\":\"" + "비밀댓글입니다." + "\"},";
					jsonText += "{\"com_no\":\"" + "" + "\"}]";
				}

			} else {// 비밀 댓글이 아닐경우
				jsonText += "[{\"id\":\"" + id + "\"},";
				jsonText += "{\"com_date\":\"" + df.format(date) + "\"},";
				jsonText += "{\"com_content\":\"" + com + "\"},";
				jsonText += "{\"com_no\":\"" + com_no + "\"}]";
			}

			if (i != list.size() - 1) {
				jsonText += ",";
			}

		}
		jsonText += "]}";
//		System.out.println("json : "+jsonText);
		out.print(jsonText);
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
