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
 * Servlet implementation class BoardModifyEnd
 */
@WebServlet("/board/boardModifyEnd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
* 100)
public class BoardModifyEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPLOAD_FOLDER = "images";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardModifyEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uploadPath = request.getServletContext().getRealPath("/upload/") + UPLOAD_FOLDER;
		List<String> fileNames = new ArrayList<String>();
		String originalFiles = request.getParameter("originalFiles");
		boolean hasFile = false;
		
		//파일이 있는지 확인.
		for(Part part : request.getParts()) {
			if(part.getName().equals("file")&&part.getSize()>0){
				hasFile = true;
			}
		}
		
		//있으면 전에 있던 파일 지움.
		if(hasFile) {
			//파일 이름을 배열로 바꿔줌
			String[] filesToDelete = {};
			if(originalFiles.contains(",")) {
				//길이가 1개 이상인지 확인
				filesToDelete = originalFiles.split(",");
			}else {
				filesToDelete = new String[]{originalFiles};
			}
			//갯수대로 삭제
			for(String s : filesToDelete) {
				File file = new File(uploadPath + UPLOAD_FOLDER + s);
				if(file.exists()) {
					//삭제
					if(file.delete())System.out.println("삭제완료");;
				}
			}
			//파일 업로드
			for (Part part : request.getParts()) {
				if (part.getName().equals("file")) {
					String renamed = new uploadRename().randomString(getFileName(part));
					part.write(uploadPath + File.separator + renamed);//업로드
					fileNames.add(renamed);//이름 DB에 올릴 이름 추가해줌
				}
			}
			if(fileNames.size()==0) {//파일 업로드가 됐는지 확인
				request.setAttribute("msg", "파일 업로드 오류입니다. 관리자에게 문의하세요.");
				request.setAttribute("loc", "/board/boardWrite");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
				return;
			}
		}
		
		
		//게시글 정보 DB에 업로드
		BoardFile bf = new BoardFile();
		Board b = new Board();
		String boardId = request.getParameter("boardId");
		b.setBoardId(Integer.parseInt(boardId));
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
		if(hasFile) {
		bf.setBfFileId(Integer.parseInt(request.getParameter("boardId")));
		bf.setFileName(fileNames.toArray(new String[fileNames.size()]));
		}
		
		int result = new BoardService().boardModify(b, bf, hasFile);
		if(!hasFile) {
			if(result > 0) {
				request.setAttribute("msg", "수정 성공!");
				request.setAttribute("loc", "/boList?boardTitle="+b.getProductCategory());
			}
			else {
				request.setAttribute("msg", "업로드에 실패하였습니다.");
				request.setAttribute("loc", "/");
			}
		}else {
			if(result > 2) {
				request.setAttribute("msg", "수정 성공!");
				request.setAttribute("loc", "/boList?boardTitle="+b.getProductCategory());
			}
			else {
				request.setAttribute("msg", "업로드에 실패하였습니다.");
				request.setAttribute("loc", "/");
			}
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
