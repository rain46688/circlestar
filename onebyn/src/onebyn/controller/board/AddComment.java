package onebyn.controller.board;

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

import onebyn.model.service.CommentService;
import onebyn.model.vo.Comment;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/board/addComment.do")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		CommentService c = new CommentService();
		List<Comment> list = c.getComment(request.getParameter("board_id"));
		
		String jsonText = "{\"List\":["; 
		for (int i = 0; i < list.size(); i++) {
			String id = list.get(i).getCwriterId();
			String com = list.get(i).getComment();
			Date date = list.get(i).getCenrollDate();
			SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd");
			int com_no = Integer.parseInt(list.get(i).getComId());
			jsonText += "[{\"id\":\"" + id + "\"},";
			jsonText += "{\"com_date\":\"" + df.format(date) + "\"},";
			jsonText += "{\"com_content\":\"" + com + "\"},";
			jsonText += "{\"com_no\":\"" + com_no + "\"}]";
			if (i != list.size() - 1) {
				jsonText += ",";
			}
		}
		jsonText += "]}";
//		System.out.println("json : "+jsonText);
		out.print(jsonText);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
