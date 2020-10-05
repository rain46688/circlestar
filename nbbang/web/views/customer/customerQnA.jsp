<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%
	Member loginedMember = new Member(); //세션저장용

List<CustomerCenter> list = (List) request.getAttribute("list");
CustomerCenter c = (CustomerCenter) request.getAttribute("cc");
loginedMember = (Member) session.getAttribute("loginnedMember");
int loginedId = loginnedMember.getUsid(); //로그인한 멤버 아이디?usId가 먼지 모르겟음
%>

<style>
#writecontainer {
	/* 	border: 1px #ECAF59 solid; */
	border-radius: 5px;
	margin-top: 5%;
	margin-bottom: 2%;
	height: auto;
	/* 	width: 62%; */
	width: 70%;
	float: right;
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
	font-size: 15px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	width: 100%;
}

h2 {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	margin: 15px 0 10px 0;
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
	width: 16.67%;
	font-size: 15px;
}

.divListBody {
	display: table-row-group;
}

#n_btn {
	float: right;
	margin: 0 10px 10px 0;
}

.noti {
	/*width:733%;  */
	width: 133%;
	margin: 0px;
	height: 200px;
	display: inline-block;
}

.noContent {
	margin-top: 20px;
	margin-bottom: 15px;
	margin-left: 100%;
	font-size: 15px;
	font-weight: bold;
	width: 100%;
}

.empty {
	margin-top: 20px;
	font-weight: bold;
	margin-top: 15px;
	margin-left: 200%;
	width: 100%;
	font-size: 15px;
}

#container {
	margin-left: auto;
	margin-right: auto;
}

div#writecontainer {
	position: relative;
	background: #FFFFFF;
	text-align: center;
	margin: 3% 21% 5% 2%;
	/* 세로정렬꽉차게 가운데:center */
	align-items: stretch;
	/* 가로정렬꽉차게 가운데:center */
	justify-items: stretch;
	width: 40%;
	float: left;
}
</style>


<div>
	<jsp:include page="/views/notice/sideBar.jsp"></jsp:include>
</div>

<div id="writecontainer">
	<div class="form-group">
		<h2>문의 사항</h2>
	</div>
	<%
		if (!loginnedMember.getNickname().equals("ADMIN")) {
	%>
	<button onclick="location.href='<%=request.getContextPath()%>/customer/customerQnAFrm?nick=<%=loginnedMember.getNickname()%>' " id="n_btn" class="btn btn-success">문의하기</button>
	<%
		}
	%>
	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
				<div class="divCell">글번호</div>
				<div class="divCell">문의유형</div>
				<div class="divCell">제목</div>
				<div class="divCell">작성자</div>
				<div class="divCell">문의 날짜</div>
			</div>
			<%
				if (!list.isEmpty()) {
				for (CustomerCenter cc : list) {
			%>
			<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer" onclick="location.href=''">
				<div class="divCell"><%=cc.getCsId()%></div>
				<div class="divCell"><%=cc.getCsType()%></div>
				<div class="divCell"><%=cc.getCsTitle()%></div>
				<div class="divCell"><%=cc.getCsNickname()%></div>
				<div class="divCell"><%=cc.getCsDate()%></div>
			</div>

			<%
				}
			} else {
			%>

			<div class="empty">등록된 문의가 없습니다.</div>

			<%
				}
			%>

			<br>
			<br>
		</div>
	</div>

	<nav aria-lable="Page navigation" id="pagebar">
		<ul class="pagination justify-content-center">
			<%=request.getAttribute("pageBar")%>
		</ul>
	</nav>

</div>

<script>

$(".divRow").click(e=>{
	
    location.assign('<%=request.getContextPath()%>/customer/customerReadFrm?num='+$(e.target).parent().children('div').html());


})

</script>



<%@ include file="/views/common/footer.jsp"%>