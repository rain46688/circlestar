<%@page import="com.nbbang.admin.model.vo.AdminBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<AdminBoard> list = (List) request.getAttribute("list");

String ra = (String) request.getParameter("ra");
String s2 = (String) request.getParameter("s2");
String s3 = (String) request.getParameter("s3");
String s = request.getParameter("s");
String Sc = request.getParameter("Sc");
String p = request.getParameter("pop");
%>


<!--  우리 메뉴바 색깔 #FFC107 -->
<style>
#writecontainer {
	border-radius: 5px;
	/* border: 1px rgba(128, 128, 128, 0.5) solid; */
	/* 	border: 1px #ECAF59 solid; */
	border: 2px black solid;
	padding: 20px;
	width: 90%;
	margin: 20px auto;
}

#cList {
	width: auto;
	height: 500px;
}

.container {
	margin-top: 20px;
	margin-bottom: 20px;
}

#cMenu {
	margin-top: 20px;
}

.divList {
	display: table;
	width: 100%;
	height: 150px;
	text-align: center;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 20px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
}

h1 {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
}

.active {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
}

.divCell, .divTableHead {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
	text-overflow: ellipsis;
}

.divListBody {
	display: table-row-group;
}

#check {
	margin-left: 5em;
}

#pagebar {
	float: center;
}

.nav-tabs {
	border: 1px solid white;
	border-bottom: 1px #DEE2E6 solid;
}

.empty {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	margin-left: 300%;
	width: 100%;
	font-size: 20px;
}

#searchDiv {
	width: 40%;
	margin: 1em auto;
	padding: 3em;
	font-size: 20px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
}

.row {
	display: table;
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

.cell {
	display: table-cell;
	width: 16.67%;
}

.wideCell {
	display: table-cell;
}

.cols {
	float: center;
}

.cols button {
	margin: 0 0 0 45%;
}
</style>

<div id="writecontainer">

	<form action="<%=request.getContextPath()%>/admin/boardInfoSearchList" id="search">
		<div id="searchDiv" class="shadow p-3 mb-5 bg-white rounded">
			<div class="form-group">
				<h1>게시판 관리</h1>
			</div>
			<div class="row shadow p-3 mb-3 bg-white rounded">
				<div class="cell">
					<select class="form-control" id="sel1" name="s">
						<option value="ALL" <%=s != null && s.equals("ALL") ? "selected" : ""%>>전체</option>
						<option value="t" <%=s != null && s.equals("t") ? "selected" : ""%>>제목</option>
						<option value="N" <%=s != null && s.equals("N") ? "selected" : ""%>>닉네임</option>
						<option value="l" <%=s != null && s.equals("l") ? "selected" : ""%>>거래지역</option>
					</select>
				</div>
				<div class="cell">
					<input class="form-control mr-sm-2" type="text" name="Sc" placeholder="검색할 내용을 입력" value="<%=Sc != null && !Sc.equals("") ? Sc : ""%>">
				</div>
			</div>
			<div class="row shadow p-3 mb-3 bg-white rounded">
				<div class="cell">
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="ra" value="ASC" <%=ra != null && ra.equals("ASC") ? "checked" : ""%>>오름 차순
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="ra" value="DESC" <%=ra != null && ra.equals("DESC") ? "checked" : ""%>>내림 차순
						</label>
					</div>
				</div>
				<div class="cell">
					<select class="form-control" id="sel1" name="s2">
						<option value="D" <%=s2 != null && s2.equals("D") ? "selected" : ""%>>날짜</option>
						<option value="b" <%=s2 != null && s2.equals("b") ? "selected" : ""%>>글 ID</option>
						<option value="h" <%=s2 != null && s2.equals("h") ? "selected" : ""%>>조회수</option>
						<option value="T" <%=s2 != null && s2.equals("T") ? "selected" : ""%>>거래단계</option>
						<option value="p" <%=s2 != null && s2.equals("p") ? "selected" : ""%>>제품가격</option>
						<option value="g" <%=s2 != null && s2.equals("g") ? "selected" : ""%>>좋아요</option>
					</select>
				</div>
			</div>
			<div class="row shadow p-3 mb-3 bg-white rounded">
				<div class="cell">
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="checkbox" class="form-check-input" name="pop" value="pop" <%=p != null && p.equals("pop") ? "checked" : ""%>>인기 게시물 여부
						</label>
					</div>
				</div>
				<div class="cell">
					<select class="form-control" id="sel1" name="s3">
						<option value="특가" <%=s3 != null && s3.equals("특가") ? "selected" : ""%>>특가</option>
						<option value="식품" <%=s3 != null && s3.equals("식품") ? "selected" : ""%>>식품</option>
						<option value="패션잡화" <%=s3 != null && s3.equals("패션잡화") ? "selected" : ""%>>패션잡화</option>
						<option value="취미문구" <%=s3 != null && s3.equals("취미문구") ? "selected" : ""%>>취미문구</option>
						<option value="티켓" <%=s3 != null && s3.equals("티켓") ? "selected" : ""%>>티켓</option>
						<option value="애완용품" <%=s3 != null && s3.equals("애완용품") ? "selected" : ""%>>애완용품</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="cols">
					<button class="btn btn-success" type="submit">검색</button>
				</div>
			</div>
		</div>
	</form>

	<hr>
	<br> <br>
	<div class="divList">
		<div class="divListBody">
			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">글 ID</div>
				<div class="divCell">작성자 USID</div>
				<div class="divCell">글 제목</div>
				<div class="divCell">작성자 닉네임</div>
				<div class="divCell">등록날짜</div>
				<div class="divCell">조회수</div>
				<div class="divCell">카테고리</div>
				<div class="divCell">거래지역</div>
				<div class="divCell">거래단계</div>
				<div class="divCell">인기 게시물</div>
				<div class="divCell">거래종류</div>
				<div class="divCell">제품 가격</div>
				<div class="divCell">N빵 인원</div>
				<div class="divCell">좋아요 갯수</div>
			</div>
			<%
				if (!list.isEmpty()) {
				for (AdminBoard ab : list) {
			%>
			<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
				<div class="divCell"><%=ab.getBo().getBoardId()%></div>
				<div class="divCell"><%=ab.getBo().getWriterUsid()%></div>
				<div class="divCell"><%=ab.getBo().getBoardTitle()%></div>
				<div class="divCell"><%=ab.getBo().getWriterNickname()%></div>
				<div class="divCell"><%=ab.getBo().getEnrollDate()%></div>
				<div class="divCell"><%=ab.getBo().getHit()%></div>
				<div class="divCell"><%=ab.getBo().getProductCategory()%></div>
				<div class="divCell"><%=ab.getBo().getTradeArea()%></div>
				<div class="divCell"><%=ab.getBo().getTradeStage()%></div>
				<div class="divCell"><%=(ab.getBo().isPopularBoard()) ? 'Y' : 'N'%></div>
				<div class="divCell"><%=ab.getBo().getTradeKind()%></div>
				<div class="divCell"><%=ab.getBo().getProductPrice()%></div>
				<div class="divCell"><%=ab.getNbbangMemCount()%></div>
				<div class="divCell"><%=ab.getLikeCount()%></div>
			</div>

			<%
				}
			} else {
			%>

			<div class="empty">조회된 게시글이 없습니다.</div>

			<%
				}
			%>

			<br>
		</div>
	</div>


	<form class="form-inline" action="<%=request.getContextPath()%>/admin/adminCustomerSearch" id="search"></form>
	<nav aria-lable="Page navigation" id="pagebar">
		<ul class="pagination justify-content-center">
			<%=request.getAttribute("pageBar")%>
		</ul>
	</nav>
</div>

<script>

$(".divRow").click(e=>{
    location.assign('<%=request.getContextPath()%>/board/boardPage?boardId='+$(e.target).parent().children('div').html()+'&writerUsid='+$(e.target).parent().children('div:eq(1)').html());
})


	$('.divRow').hover(function() {
		$(this).css('color', '#FFC107');
		$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
	}, function() {
		$(this).css('color', 'black');
		$(this).addClass('shadow p-3 mb-5 bg-white rounded');
	});
</script>

<%@ include file="/views/common/footer.jsp"%>