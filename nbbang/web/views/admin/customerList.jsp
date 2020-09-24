<%@page import="java.util.List"%>
<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%
	List<CustomerCenter> list = (List) request.getAttribute("list");
String a = (String) request.getParameter("a");
%>
<style>
#writecontainer {
	border-radius: 5px;
	/* border: 1px rgba(128, 128, 128, 0.5) solid; */
	border: 1px #ECAF59 solid;
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

#bar {
	display: inline-block;
	float: center;
}
</style>

<div class="container" id="writecontainer">
	<div class="form-group">
		<h1>문의 내역</h1>
	</div>

	<div id="cMenu">
		<ul class="nav nav-tabs">
			<li class="nav-item">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</li>
			<li class="nav-item">
				<a class="nav-link <%=a != null && a.equals("0") ? "active" : ""%>" href="<%=request.getContextPath()%>/admin/adminCustomerList?a=0">
					<small>미처리</small>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link <%=a != null && a.equals("1") ? "active" : ""%>" href="<%=request.getContextPath()%>/admin/adminCustomerList?a=1">
					<small>처리</small>
				</a>
			</li>
		</ul>
	</div>

	<br>

	<div class="divList">
		<div class="divListBody">

			<div class="divRowTitle">
				<div class="divCell">문의 ID</div>
				<div class="divCell">작성자</div>
				<div class="divCell">제목</div>
				<div class="divCell">문의 날짜</div>
			</div>
			<%
				for (CustomerCenter c : list) {
			%>
			<div class="divRow" style="cursor: pointer">
				<div class="divCell"><%=c.getCsId()%></div>
				<div class="divCell"><%=c.getCsNickname()%></div>
				<div class="divCell"><%=c.getCsTitle()%></div>
				<div class="divCell"><%=c.getCsDate()%></div>
			</div>

			<%
				}
			%>

			<br>
		</div>
	</div>
	<nav aria-lable="Page navigation">
		<ul class="pagination justify-content-center">
			<%=request.getAttribute("pageBar")%>
		</ul>
	</nav>
</div>

<script>
$(".divRow").click(e=>{
	/* 상세 페이지를 따로 만들 필요없이 도환이 고객센터 상세 페이지로 연결 세션이 어드민일경우에 "답변 작성 폼이있고 완료를 누를 경우 
	답변(CS_ANSWER)이 등록되며 처리 상태(CS_ISCHECK = 1)로 넘어감 이미 처리 상태 일경우에 기존 답변을 가져와서 다시 수정후 넘길수있게 도 가능하면
	좋겠음" 일단 CS_ID 파라미터 cid로 넘김 나중에 수정하길*/
    location.assign('<%=request.getContextPath()%>/customer/customerReadFrm?cid='+$(e.target).parent().children('div').html());
})

</script>

<%@ include file="/views/common/footer.jsp"%>