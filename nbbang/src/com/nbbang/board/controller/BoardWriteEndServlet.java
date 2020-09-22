package com.nbbang.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Board;
import com.nbbang.board.model.vo.BoardFile;
import com.nbbang.common.temp.uploadRename;

/**
 * Servlet implementation class BoardWriteEndServlet
 */
@WebServlet("/board/boardWriteEnd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)
public class BoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_FOLDER = "images";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardWriteEndServlet() {
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
		// 이미지 저장 경로
		
		
		String uploadPath = request.getServletContext().getRealPath("/upload/") + UPLOAD_FOLDER;

		File fileSaveDir = new File(uploadPath);// 경로 없으면 생성
		if (!fileSaveDir.exists())
			fileSaveDir.mkdirs();
		
		List<String> fileNames = new ArrayList<String>();
		int index = 0;
		for (Part part : request.getParts()) {
			if (part.getName().equals("file")) {
				String renamed = new uploadRename().randomString(getFileName(part));
				part.write(uploadPath + File.separator + renamed);
				fileNames.add(renamed);
			}
		}
		
		if(fileNames.size()==0) {//파일 업로드가 됐는지 확인
			request.setAttribute("msg", "파일 업로드 오류입니다. 관리자에게 문의하세요.");
			request.setAttribute("loc", "/board/boardWrite");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		BoardFile bg = new BoardFile();
		Board b = new Board();
		b.setProductCategory(request.getParameter("category"));
		b.setWriterNickname(request.getParameter("writer"));
		b.setBoardTitle(request.getParameter("title"));
		b.setProductPrice(Integer.parseInt(request.getParameter("price")));
		b.setMaxMems(Integer.parseInt(request.getParameter("maxMems")));
		b.setTradeArea(request.getParameter("tradeArea"));
		b.setTradeKind(request.getParameter("tradeMethod"));
		b.setContent(request.getParameter("content"));
		b.setProductUrl(request.getParameter("url"));
		b.setWriterNickname(request.getParameter("writerNickname"));
		b.setWriterUsid(Integer.parseInt(request.getParameter("writerUsid")));
		b.setOwnStatus(request.getParameter("ownStatus"));
		bg.setFileName(fileNames.toArray(new String[fileNames.size()]));
		
		
		int result = new BoardService().boardInsert(b,bg);
		if(result > 1) {
			//업로드 성공
			request.setAttribute("msg", "업로드 완료!");
			request.setAttribute("loc", "/boList");
		}else {
			request.setAttribute("msg", "업로드에 실패하였습니다.");
			request.setAttribute("loc", "/board/boWrite");
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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

	private String getFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] tokens = contentDisp.split(";");
		for (String token : tokens) {
			if (token.trim().startsWith("filename")) {
				return token.substring(token.indexOf("=") + 2, token.length() - 1);
			}
		}
		return "";
	}
}
