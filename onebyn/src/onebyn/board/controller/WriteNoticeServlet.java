package onebyn.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import onebyn.board.model.service.BoardService;
import onebyn.board.model.vo.Board;
import onebyn.member.model.vo.Member;

@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5, fileSizeThreshold = 1024 * 1024)
@WebServlet("/writenotice.do")
public class WriteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = -2971330747359854797L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/views/board/writeno.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("m");
		System.out.println("curuserid : " + m.getMemberId());

		if (!ServletFileUpload.isMultipartContent(req)) {
			req.setAttribute("msg", "공지사항 작성 오류[form:enctype 관리자에게 문의하세요]");
			req.setAttribute("loc", "/");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
			return;
		}
		String path = getServletContext().getRealPath("/") + "images";
		int maxSize = 1024 * 1024 * 10;
		String encode = "UTF-8";
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, encode, new DefaultFileRenamePolicy());

		String title = mr.getParameter("title");
		String content = mr.getParameter("content"); // 게시판에서 다른 값 가져와서 DB에 넣는거 해야됨 String cate =
		String cate = mr.getParameter("select_cate");
		String pname = mr.getParameter("pname");
		String mem = mr.getParameter("select_mem");
		int price = Integer.parseInt(mr.getParameter("price"));
		String own = mr.getParameter("select_own");
		String tradeloc = mr.getParameter("tradeloc");
		String tradekind = mr.getParameter("select_trade");
		String fileNameStr = mr.getFilesystemName("file");

		Board b = new Board();
		b.setBoardTitle(title);
		b.setContent(content);
		b.setFiles(fileNameStr);
		b.setWriterId(m.getMemberId());

		b.setProductCategori(cate);//
		b.setProductName(pname);//
		b.setMaxMems(mem);//
		b.setProductPrice(price);//
		b.setOwnStatus(own);//
		b.setTradeArea(tradeloc);//
		b.setTradeKind(tradekind);//

		System.out.println(b);

		BoardService bs = new BoardService();
		int result = bs.writeNotice(b);

		if (result == 1) {
			System.out.println();
			System.out.println("게시물 등록 성공");
			System.out.println();
		} else {
			System.out.println();
			System.out.println("게시물 등록 실패");
			System.out.println();
		}

		resp.sendRedirect(req.getContextPath() + "/board.do");
		// 다시 게시판으로 이동 redirect를 해야 req,resp가 남지않으니 좋음
	}
}
