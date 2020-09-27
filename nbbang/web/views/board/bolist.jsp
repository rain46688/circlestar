<%@page import="com.nbbang.board.model.vo.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.board.model.vo.Board, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Card> bolist = (List<Card>) request.getAttribute("boardList");
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
.card-img-top {
        width: 100%;
        height: 10vw;
        object-fit: cover;
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
.card-wrapper h1 {
	font-family: 'Do Hyeon', sans-serif;
}
#writeBoard {
	text-align: right;
	padding-right: 1em;
	font-family: 'Do Hyeon', sans-serif;
	height: 3em;
}
#writeBoard>#writeBtn {
	height: 2em;
	width: 5em;
	font-size: 20px;
}

#writeBoard>button:hover {
	border: 2px black solid;
}
#interest {
	font-size:15px;
	color:gray;
}
.card {
	border: 1px white solid;
}
.card-title {
	width: 9.5em;
	height: 1em;
}

.card-title>p {
	font-size: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#searchInHere {
	font-family: Arial, Helvetica, sans-serif;
	border: 2px gray solid;
	padding-left: 4px;
	height: 2.55em;
}

#searchInHere:focus{
	outline: none;
	margin-bottom: -1px;
}

#searchInHereBtn {
	height: 2em;
	width: 3em;
	font-size: 20px;
}
</style>
<section>
	<div class="card-wrapper">
		<div id="boardTitle">
		<h1><%= request.getAttribute("category") %></h1>
		</div>
		<div id="writeBoard">
			<input id="searchInHere" onkeypress="searchEnter();" type="text" placeholder="게시판 내에서 검색">
			<button id="searchInHereBtn" onclick="fn_search('<%= request.getAttribute("category") %>');">검색</button>
			<% if(request.getAttribute("category").equals("특가")) {%>
			<% 	if(loginnedMember!=null&&loginnedMember.getNickname().equals("ADMIN")){ %>
			<button id="writeBtn" onclick="fn_boWrite();">글쓰기</button>
			<%  }else { 
				}}
			else { %>
			<button id="writeBtn" onclick="fn_boWrite();">글쓰기</button>
			<%} %>
		</div>
		<%
			for (Card c : bolist) {
		%>
		<div class="card"
			onclick="location.href='<%=request.getContextPath()%>/board/boardPage?boardId=<%=c.getCardBoard().getBoardId()%>&writerUsid=<%=c.getCardBoard().getWriterUsid() %>'"
			style="width: 15rem; cursor: pointer; padding:0px">
			<!-- file의 갯수 분기처리 -->
			<%-- <% if(files.length==1) {%> --%>
			<div class="image-wrapper">
			<img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="200em">
			<%-- <% }else { %> --%>
			<%-- <img src="<%=request.getContextPath()%>/upload/images/<%= files[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="160em"> --%>
		<%-- 	<%} %> --%>
			</div>
			<div class="card-body">
				<input type="hidden" value="<%= c.getCardBoard().getBoardId()%>">
				<h4 class="card-title"><p><%= c.getCardBoard().getBoardTitle() %></p></h4>
				<p><%= c.getCardBoard().getTradeArea() %></p>
				<p id="interest"><%= c.getCardBoard().getLikeCount() %> 관심 <%= c.getCardBoard().getHit() %> 조회</p>
				<h4 class="card-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%= c.getCardBoard().getProductPrice() %>"></fmt:formatNumber>원</h4>
			</div>
			<br>
			<hr>
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
	function searchEnter() {
		if(window.event.keyCode==13) {
			$("#searchInHereBtn").click();
		}
		return false;
	}
	function fn_boWrite(){
		location.assign("<%= request.getContextPath() %>/board/boWrite?category=<%= request.getAttribute("category") %>");
	}

</script>
<%@ include file="/views/common/footer.jsp"%>
