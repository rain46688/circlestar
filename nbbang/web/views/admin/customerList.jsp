<%@page import="java.util.List"%>
<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%
	List<CustomerCenter> list = (List) request.getAttribute("list");
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
	height:150px;
	text-align:center;
}

.divRow {
	display: table-row;
}

.divRowTitle{
	display: table-row;
	font-size:20px;
	font-weight:bold;
}

.divCell, .divTableHead {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
}

.divListBody {
	display: table-row-group;
}

.nav-link{
	font-size:20px;
}

#bar{


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
				<a class="nav-link active" href="#">
					<small>미처리</small>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">
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
<%			for (CustomerCenter c : list) { %>
			<div class="divRow">
				<div class="divCell"><%=c.getCsNo() %></div>
				<div class="divCell"><%=c.getCsNickname() %></div>
				<div class="divCell"><%=c.getCsTitle() %></div>
				<div class="divCell"><%=c.getCsDate() %></div>
			</div>

<%} %>

		<br>	
			<div id="bar">
				<nav aria-lable="Page navigation">
			<ul class="pagination justify-content-center">
				<%=request.getAttribute("pageBar")%>
			</ul>
		</nav>
</div>

		
	</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>