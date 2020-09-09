<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.board.model.vo.Board, java.util.List" %>
<%@ include file="/views/common/header.jsp" %>
<%
	List<Board> bolist = (List<Board>)request.getAttribute("boardList");
%>
<style>
	.card-wrapper{
		padding-left:4rem;
		padding-right:4rem;
	}
</style>
<section>
<div class="card-wrapper">
	<% for(int i = 0; i < 8; i++) { %>
	<div class="card" onclick="location.href='<%= request.getContextPath() %>/board/boardPage?boardId=<%= bolist.get(i).getBoardId() %>'" style="width:18rem; cursor:pointer;">
	  <img src="<%= request.getContextPath() %>/resources/cute.png" class="card-img-top" alt="...">
	  	<div class="card-body">
	  		<input type="hidden" value="<%= bolist.get(i).getBoardId() %>" >
	    	<h5 class="card-title"><%= bolist.get(i).getBoardTitle() %></h5>
	    	<p class="card-text"><%= bolist.get(i).getContent() %></p>
	  	</div>
	</div>
	<% } %>
</div>
</section>
<%@ include file="/views/common/footer.jsp" %>
