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
	padding-left: 5rem;
	padding-right: 9rem;
	margin:0 auto;
	width:80em;
}
/* 
.pagination>li>.page-link {
} */

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

#writeBoard {
	text-align: right;
	padding-right: 1em;
}
#writeBoard>button {
	height: 2em;
	width: 5em;
}
</style>
<section>
	<div class="card-wrapper">
		<div id="boardTitle">
		<h1>게시판 이름</h1>
		</div>
		<div id="writeBoard">
			<button onclick="fn_boWrite();">글쓰기</button>
		</div>
		<%
			for (Board b : bolist) {
		%>
		<div class="card"
			onclick="location.href='<%=request.getContextPath()%>/board/boardPage?boardId=<%=b.getBoardId()%>'"
			style="width: 15rem; cursor: pointer; padding:0px">
			<img src="<%=request.getContextPath()%>/images/cute.png"
				class="card-img-top" alt="제품이미지" width="120em" height="160em">
			<div class="card-body">
				<input type="hidden" value="<%=b.getBoardId()%>">
				<h5 class="card-title"><%= b.getBoardTitle() %>제목</h5>
				<p><%= b.getTradeArea() %>주소</p>
				<p><%= b.getLikeCount() %> 관심수 , <%= b.getHit() %> 조회수</p>
				<h4 class="card-price"><%= b.getProductPrice() %>가격</h4>
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
<script>
	function fn_boWrite(){
		location.assign("<%= request.getContextPath() %>/board/boardWrite");
	}
</script>
<%@ include file="/views/common/footer.jsp"%>
