package onebyn.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import onebyn.model.vo.Board;
import onebyn.service.BoardService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5, fileSizeThreshold = 1024 * 1024)
@WebServlet("/board/wn")
public class WriteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = -2971330747359854797L;
	private static final String IMG = "images/";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("/text/html; charset=utf-8;");

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		PrintWriter out = resp.getWriter();
		String DIR = req.getServletContext().getRealPath("/images");
		String contentType = req.getContentType();
		List<String> fileNameList = new ArrayList<String>();
		String fileNameStr = "";

		System.out.println(title);
		System.out.println(content);
		System.out.println(DIR);

		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {

			Collection<Part> parts = req.getParts();

			for (Part part : parts) {
				System.out.printf("파라미터 명 : %s, contentType :  %s,  size : %d bytes \n", part.getName(),
						part.getContentType(), part.getSize());

				if (part.getHeader("Content-Disposition").contains("filename=")) {
					String fileName = extractFileName(part.getHeader("Content-Disposition"));

					if (part.getSize() > 0) {
						System.out.printf("업로드 파일 명 : %s  \n", fileName);
						fileNameList.add(fileName);
						part.write(DIR + File.separator + fileName);
						part.delete();
					}
				} else {
					String formValue = req.getParameter(part.getName());
					System.out.printf("name : %s, value : %s  \n", part.getName(), formValue);
				}
			}

			System.out.println("업로드 완료");
		} else {
			System.out.println("업로드 실패");
		}

		System.out.println("사이즈 : " + fileNameList.size());

		for (String s : fileNameList) {
			if (!fileNameList.isEmpty()) {
				System.out.println("파일 이름 : " + s);
				if (fileNameList.get(fileNameList.size() - 1) != s) {
					fileNameStr += s + "/";
				} else {
					fileNameStr += s;
				}
			} else {
				System.out.println("파일 비어있음~");
			}
		}

		System.out.println("파일 구분 : " + fileNameStr);

		Board b = new Board();
		b.setTitle(title);
		b.setContent(content);
		b.setFiles(IMG + fileNameStr);
		b.setWriterId("ADMIN");

		BoardService bs = new BoardService();
		int result = bs.writeNotice(b, getServletContext());

		if (result == 1) {
			System.out.println();
			System.out.println("게시물 등록 성공");
			System.out.println();
		} else {
			System.out.println();
			System.out.println("게시물 등록 실패");
			System.out.println();
		}

		resp.sendRedirect(req.getContextPath()+"/board/notice");
		//다시 게시판으로 이동 redirect를 해야 req,resp가 남지않으니 좋음
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/views/writeno.jsp").forward(req, resp);
	}

	private String extractFileName(String partHeader) {
		for (String cd : partHeader.split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
				;
				int index = fileName.lastIndexOf(File.separator);
				return fileName.substring(index + 1);
			}
		}
		return null;
	}

}
