<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.board.model.vo.Board, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Board> bolist = (List<Board>) request.getAttribute("boardList");
%>
<style>
.card-wrapper {
	padding-left: 4rem;
	padding-right: 4rem;
}

.center {
	text-align: center;
}
</style>
<section>
	<div class="card-wrapper">
		<%
			for (Board b : bolist) {
		%>
		<div class="card"
			onclick="location.href='<%=request.getContextPath()%>/board/boardPage?boardId=<%=b.getBoardId()%>'"
			style="width: 18rem; cursor: pointer;">
			<img src="<%=request.getContextPath()%>/resources/cute.png"
				class="card-img-top" alt="...">
			<div class="card-body">
				<input type="hidden" value="<%=b.getBoardId()%>">
				<h5 class="card-title"><%=b.getBoardTitle()%></h5>
				<p class="card-text"><%=b.getContent()%></p>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<br>
	<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4 btn-group">
		<%=request.getAttribute("pageBar")%>
	</div>
	<div class="col-sm-4"></div>
	</div>
	<br>
	<br>
</section>
<%@ include file="/views/common/footer.jsp"%>
