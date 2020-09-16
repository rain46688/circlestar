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
.pagination>li>.page-link {
}
.pagination>li>a {
	color:black;
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
		<nav aria-lable="Page navigation">
			<ul class="pagination justify-content-center">
				<%=request.getAttribute("pageBar")%>
			</ul>
		</nav>
	<br>
</section>
<%@ include file="/views/common/footer.jsp"%>
