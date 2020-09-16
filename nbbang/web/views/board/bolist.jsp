<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.board.model.vo.Board, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Board> bolist = (List<Board>) request.getAttribute("boardList");
%>
<style>
.card-wrapper {
	padding-top: 3rem;
	padding-left: 4rem;
	padding-right: 4rem;
}

.pagination>li>.page-link {
}

.pagination>li>a {
	color:black;
}
.card-price {
	float: right;
	margin-top: 0;
}
.card-body {
	padding: 0.5em;
}
</style>
<section>
	<div class="card-wrapper">
		<h1>게시판 이름</h1>
		<%
			for (Board b : bolist) {
		%>
		<div class="card"
			onclick="location.href='<%=request.getContextPath()%>/board/boardPage?boardId=<%=b.getBoardId()%>'"
			style="width: 12rem; cursor: pointer; padding:0px">
			<img src="<%=request.getContextPath()%>/images/cute.png"
				class="card-img-top" alt="제품이미지" width="120em" height="120em">
			<div class="card-body">
				<input type="hidden" value="<%=b.getBoardId()%>">
				<h6 class="card-title">제품이름</h5>
				<p>아이디, 주소</p>
				<h4 class="card-price">제품가격</h6>
				<p class="card-text"></p>
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
