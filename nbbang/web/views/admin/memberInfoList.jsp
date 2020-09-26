<%@page import="com.nbbang.admin.model.vo.AdminMem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<AdminMem> list = (List) request.getAttribute("list");

/* String a = (String) request.getParameter("a");
String s = request.getParameter("s");
String Sc = request.getParameter("Sc"); */
%>


<!--  우리 메뉴바 색깔 #FFC107 -->
<style>
#writecontainer {
	border-radius: 5px;
	/* border: 1px rgba(128, 128, 128, 0.5) solid; */
	/* 	border: 1px #ECAF59 solid; */
	border: 2px black solid;
	padding: 20px;
}

#cList {
	width: 100%;
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

.nav-link {
	font-size: 20px;
}

#search {
	display: block;
	float: center;
	overflow: hidden;
}

#search div {
	float: right;
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
	margin-left: 150%;
	width: 100%;
	font-size: 20px;
}
</style>

<div class="container" id="writecontainer">
	<div class="form-group">
		<h1>문의 내역</h1>
	</div>


	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">UID</div>
				<div class="divCell">회원 이름</div>
				<div class="divCell">닉네임</div>
				<div class="divCell">성별</div>
				<div class="divCell">생년월일</div>
				<div class="divCell">가입날짜</div>
				<div class="divCell">포인트</div>
				<div class="divCell">탈퇴여부</div>
				<div class="divCell">n빵 점수</div>
				<div class="divCell">생성한 방 갯수</div>
				<div class="divCell">회원등급</div>
				<div class="divCell">신고당한횟수</div>
			</div>
			<%
				if (!list.isEmpty()) {
				for (AdminMem a : list) {
			%>
			<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
				<div class="divCell"><%=a.getMem().getUsid()%></div>
				<div class="divCell"><%=a.getMem().getMemberName()%></div>
				<div class="divCell"><%=a.getMem().getNickname()%></div>
				<div class="divCell"><%=a.getMem().getGender()%></div>
				<div class="divCell"><%=a.getMem().getBirthday()%></div>
				<div class="divCell"><%=a.getMem().getEnrollDate()%></div>
				<div class="divCell"><%=a.getMem().getPoint()%></div>
				<div class="divCell"><%=a.getMem().getLeaveMem()%></div>
				<div class="divCell"><%=a.getMem().getNbbangScore()%></div>
				<div class="divCell"><%=a.getCreateBoardCount()%></div>
				<div class="divCell"><%=a.getGradeLevel()%></div>
				<div class="divCell"><%=a.getReportCount()%></div>
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


	<form class="form-inline" action="<%=request.getContextPath()%>/admin/adminCustomerSearch" id="search">
	</form>
	<nav aria-lable="Page navigation" id="pagebar">
		<ul class="pagination justify-content-center">
			<%=request.getAttribute("pageBar")%>
		</ul>
	</nav>
</div>

<script>

   $('.divRow').hover(function(){
        $(this).css('color','#FFC107');
        $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
    }, function() {
        $(this).css('color','black');
        $(this).addClass( 'shadow p-3 mb-5 bg-white rounded' );
    });




</script>

<%@ include file="/views/common/footer.jsp"%>