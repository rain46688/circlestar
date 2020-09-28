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
	padding-left: 9rem;
	padding-right: 5rem;
	margin:0 auto;
	width:100em;
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
	padding-right: 10em;
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

.time > *{
font-size:2em;
font-weight:bold;
}

</style>
<section>
	<div class="card-wrapper">
		<div id="boardTitle">
		<h1><%= request.getAttribute("category") %></h1>
		</div>
		<div id="writeBoard">
			<%-- <input id="searchInHere" onkeypress="searchEnter();" type="text" placeholder="게시판 내에서 검색">
			<button id="searchInHereBtn" onclick="fn_search('<%= request.getAttribute("category") %>');">검색</button> --%>
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
		for(int i=0; i<bolist.size(); i++) {
		%>
		<div class="card" onclick="location.href='<%=request.getContextPath()%>/board/boardSpecialPage?boardId=<%=bolist.get(i).getCardBoard().getBoardId()%>&writerUsid=<%=bolist.get(i).getCardBoard().getWriterUsid() %>'" style="width: 24rem; cursor: pointer; padding:0px">
			<!-- file의 갯수 분기처리 -->
			<%-- <% if(files.length==1) {%> --%>
			<div class="image-wrapper">
			<img src="<%=request.getContextPath()%>/upload/images/<%= bolist.get(i).getCardFile().getFileName()[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="200em">
			<%-- <% }else { %> --%>
			<%-- <img src="<%=request.getContextPath()%>/upload/images/<%= files[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="160em"> --%>
		<%-- 	<%} %> --%>
			</div>
			<div class="card-body">
				<input type="hidden" value="<%= bolist.get(i).getCardBoard().getBoardId()%>">
				<h4 class="card-title"><p><%= bolist.get(i).getCardBoard().getBoardTitle() %></p></h4>
			<%-- 	<p><%= bolist.get(i).getCardBoard().getTradeArea() %></p> --%>
				<div class="time">특가 마감까지 <p id="count<%=i%>"></p></div>
						<script>
						$(function(){
							Timer('<%=bolist.get(i).getCardBoard().getTime()%>', 'count<%=i%>');	
						});
						</script>
				<p id="interest"><%= bolist.get(i).getCardBoard().getLikeCount() %> 관심 <%= bolist.get(i).getCardBoard().getHit() %> 조회</p>
				<h4 class="card-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%= bolist.get(i).getCardBoard().getProductPrice() %>"></fmt:formatNumber>원</h4>
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
		location.assign("<%= request.getContextPath() %>/board/boSpecialWrite");
	}
	
	function Timer(dt, id) {
	    var end = new Date(dt);
	    var _second = 1000;
	    var _minute = _second * 60;
	    var _hour = _minute * 60;
	    var _day = _hour * 24;
	    var timer;
	    function showRemaining() {
	        var now = new Date();
	        var distance = end - now;

	        if (distance < 0) {
	            clearInterval(timer);
	            document.getElementById(id).innerHTML = '특딜이 마감되었습니다!';
	            return;
	        }
	        var days = Math.floor(distance / _day);
	        var hours = Math.floor((distance % _day) / _hour);
	        var minutes = Math.floor((distance % _hour) / _minute);
	        var seconds = Math.floor((distance % _minute) / _second);

	        document.getElementById(id).innerHTML = days + '일 ';
	        document.getElementById(id).innerHTML += hours + '시간 ';
	        document.getElementById(id).innerHTML += minutes + '분 ';
	        document.getElementById(id).innerHTML += seconds + '초';
	    }
	    timer = setInterval(showRemaining, 1000);
	}

</script>
<%@ include file="/views/common/footer.jsp"%>
