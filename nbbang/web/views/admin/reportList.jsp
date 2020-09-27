<%@page import="com.nbbang.admin.model.vo.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Report> list = (List) request.getAttribute("list");
String a = (String) request.getParameter("a");
String s = request.getParameter("s");
String Sc = request.getParameter("Sc");
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

.nc {
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
		<h1>신고 내역</h1>
	</div>

	<div id="cMenu">
		<ul class="nav nav-tabs">
			<li class="nav-item">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</li>
			<li class="nav-item">
				<a class="nav-link nc <%=a != null && a.equals("0") ? "active" : ""%>" href="<%=request.getContextPath()%>/admin/adminReportList?a=0">
					<small>미처리</small>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link nc <%=a != null && a.equals("1") ? "active" : ""%>" href="<%=request.getContextPath()%>/admin/adminReportList?a=1">
					<small>처리</small>
				</a>
			</li>
		</ul>
	</div>

	<br>

	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">신고 ID</div>
				<div class="divCell">유형</div>
				<div class="divCell">작성자</div>
				<div class="divCell">제재 회원</div>
				<div class="divCell">제목</div>
				<div class="divCell">신고 날짜</div>
				<div class="divCell">제재 여부</div>
				<div class="divCell">제재 회원 ID</div>
			</div>
			<%
				if (!list.isEmpty()) {
				for (Report r : list) {
			%>
			<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
				<div class="divCell"><%=r.getReportId()%></div>
				<div class="divCell"><%=r.getReportType()%></div>
				<div class="divCell"><%=r.getReportUserNickname()%></div>
				<div class="divCell"><%=r.getReportTargetNickname()%></div>
				<div class="divCell"><%=r.getReportTitle()%></div>
				<div class="divCell"><%=r.getReportDate()%></div>
				<div class="divCell"><%=r.getReportIswarning()%></div>
				<div class="divCell"><%=r.getReportTargetUsid()%></div>
			</div>

			<%
				}
			} else {
			%>

			<div class="empty">등록된 신고 글이 없습니다.</div>

			<%
				}
			%>

			<br>
		</div>
	</div>


	<form class="form-inline" action="<%=request.getContextPath()%>/admin/adminReportListSearch" id="search">

		<div>
			<select class="form-control" id="sel1" name="s">
				<option value="ALL" <%=s != null && s.equals("ALL") ? "selected" : ""%>>전체</option>
				<option value="n" <%=s != null && s.equals("n") ? "selected" : ""%>>제재 회원</option>
				<option value="w" <%=s != null && s.equals("w") ? "selected" : ""%>>작성자</option>
				<option value="t" <%=s != null && s.equals("t") ? "selected" : ""%>>제목</option>
				<option value="c" <%=s != null && s.equals("c") ? "selected" : ""%>>유형</option>
			</select>
			<input type="hidden" name="a" value=<%=a%>>
			<input class="form-control mr-sm-2" type="text" name="Sc" placeholder="검색할 내용을 입력" value="<%=Sc != null && !Sc.equals("") ? Sc : ""%>">
			<button class="btn btn-success" type="submit">검색</button>
		</div>
	</form>
	<nav aria-lable="Page navigation" id="pagebar">
		<ul class="pagination justify-content-center">
			<%=request.getAttribute("pageBar")%>
		</ul>
	</nav>
</div>

<script>
$(".divRow").click(e=>{
    <%-- location.assign('<%=request.getContextPath()%>/customer/customerReadFrm?num='+$(e.target).parent().children('div').html()); --%>
})


   $('.divRow').hover(function(){
        $(this).css('color','#FFC107');
        $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
    }, function() {
        $(this).css('color','black');
        $(this).addClass( 'shadow p-3 mb-5 bg-white rounded' );
    });







</script>

<%@ include file="/views/common/footer.jsp"%>