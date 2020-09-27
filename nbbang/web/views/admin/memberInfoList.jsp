<%@page import="com.nbbang.admin.model.vo.AdminMem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<AdminMem> list = (List) request.getAttribute("list");

String ra = (String) request.getParameter("ra");
String s = request.getParameter("s");
String Sc = request.getParameter("Sc");
String c = request.getParameter("c");
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
	margin-left: 280%;
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

	<form action="<%=request.getContextPath()%>/admin/memberInfoSearchList" id="search">
		<div id="searchDiv" class="shadow p-3 mb-5 bg-white rounded">
			<div class="form-group">
				<h1>회원 관리</h1>
			</div>
			<div class="row shadow p-3 mb-3 bg-white rounded">
				<div class="cell">
					<select class="form-control" id="sel1" name="s">
						<option value="ALL" <%=s != null && s.equals("ALL") ? "selected" : ""%>>전체</option>
						<option value="n" <%=s != null && s.equals("n") ? "selected" : ""%>>회원이름</option>
						<option value="N" <%=s != null && s.equals("N") ? "selected" : ""%>>닉네임</option>
						<option value="e" <%=s != null && s.equals("e") ? "selected" : ""%>>이메일</option>
					</select>
				</div>
				<div class="cell">
					<input class="form-control mr-sm-2" type="text" name="Sc" placeholder="검색할 내용을 입력" value="<%=Sc != null && !Sc.equals("") ? Sc : ""%>">
				</div>
			</div>
			<div class="row shadow p-3 mb-3 bg-white rounded">
				<div class="cell">
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="ra" value="M" <%=ra != null && ra.equals("M") ? "checked" : ""%>>남
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio" class="form-check-input" name="ra" value="F" <%=ra != null && ra.equals("F") ? "checked" : ""%>>여
						</label>
					</div>
				</div>
				<div class="cell">
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="checkbox" class="form-check-input" name="c" value="leave" <%=c != null && c.equals("leave") ? "checked" : ""%>>탈퇴여부
						</label>
					</div>
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
				<div class="divCell">UID</div>
				<div class="divCell">회원 이름</div>
				<div class="divCell">닉네임</div>
				<div class="divCell">이메일</div>
				<div class="divCell">성별</div>
				<div class="divCell">생년월일</div>
				<div class="divCell">가입날짜</div>
				<div class="divCell">포인트</div>
				<div class="divCell">탈퇴여부</div>
				<div class="divCell">n빵 점수</div>
				<div class="divCell">총 게시글수</div>
				<div class="divCell">회원등급</div>
				<div class="divCell">신고당한횟수</div>
			</div>
			<%
				if (!list.isEmpty()) {
				for (AdminMem am : list) {
			%>
			<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
				<div class="divCell"><%=am.getMem().getUsid()%></div>
				<div class="divCell"><%=am.getMem().getMemberName()%></div>
				<div class="divCell"><%=am.getMem().getNickname()%></div>
				<div class="divCell"><%=am.getMem().getMemberId()%></div>
				<div class="divCell"><%=am.getMem().getGender()%></div>
				<div class="divCell"><%=am.getMem().getBirthday()%></div>
				<div class="divCell"><%=am.getMem().getEnrollDate()%></div>
				<div class="divCell"><%=am.getMem().getPoint()%></div>
				<div class="divCell"><%=(am.getMem().getLeaveMem()) ? 'Y' : 'N'%></div>
				<div class="divCell"><%=am.getMem().getNbbangScore()%></div>
				<div class="divCell"><%=am.getCreateBoardCount()%></div>
				<div class="divCell"><%=am.getGradeLevel()%></div>
				<div class="divCell"><%=am.getReportCount()%></div>
			</div>

			<%
				}
			} else {
			%>

			<div class="empty">조회된 회원이 없습니다.</div>

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
	$('.divRow').hover(function() {
		$(this).css('color', '#FFC107');
		$(this).removeClass('shadow p-3 mb-5 bg-white rounded');
	}, function() {
		$(this).css('color', 'black');
		$(this).addClass('shadow p-3 mb-5 bg-white rounded');
	});
</script>

<%@ include file="/views/common/footer.jsp"%>