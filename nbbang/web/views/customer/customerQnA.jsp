<%@page import="com.nbbang.customer.model.vo.CustomerCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/cstmcss/main.css"
	type="text/css">


<style>
div#customer-submain {
	padding-top: 2%;
}

div#container-qna {
	padding-top: 6.5%;
	margin-bottom: 7%;
}

.qna-list, .qna-list2  {
	text-align: center;
	list-style: none;
	/* border-left: 2px solid bisque; */
	display: inline;
	padding-top: 5%;
	margin-left: 9%;
	
}
/* .qna-list2: first-child{
content: "●";

} */

.qna-list:first {
	border-left: none;
}

#fontBold {
	font-weight: bold;
}

#title-1, #title-2, #title-3 {
	margin-left: 6%;
	border-bottom: 10px;
}

#customer-QNA {
	padding-top: 3%;
}

#fontBold {
	font-weight: bold;
}
div#kdh-header h1{
	margin-left:15%;
	
	
}
</style>
<%

List<CustomerCenter> list = (List) request.getAttribute("list");
%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<style>
/*  */
</style>
<div id="kdh-container">
	<div id="kdh-sidebar-left">
	  <h2></h2>
	  <ul class="side-bar-kdh">
		 <li class="cstmt-list" style="font-size:20px;" id="fontBold"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>
		<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>
		<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>
		<li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>
	  </ul>
	  <ul class="side-bar-kdh">
		<li class="list-hiper"><a href="" class="hiper-tag">홈</a></li>
		<li class="list-hiper"><a href="" class="hiper-tag">구경하기</a></li>
		<li class="list-hiper"><a href="" class="hiper-tag">해외직구</a></li>
		<li class="list-hiper"><a href="" class="hiper-tag">마이페이지</a></li>
	  </ul>
	  <ul class="side-bar-kdh">
		<li id="list-image1"><a href=""><image src="<%=request.getContextPath()%>/images/we.png" style="width: 150px; height: auto;" ></a></li>
		<li id="list-image2"><a href=""><image src="<%=request.getContextPath()%>/images/pang.png" style="width: 150px; height: auto;"></a></li>
		<li id="list-image3"><a href=""><image src="<%=request.getContextPath()%>/images/llist1.png" style="width: 150px; height: auto;"></a></li>
	  
	  </ul>
	</div>
	</div>
	

<section>
	<div id="container-qna">
	<button type="button" id="btn-frm"
		onclick="location.assign('<%=request.getContextPath()%>/customer/customerQnAFrm')">문의하기</button>
		<li id="title-1">1:1문의</li>
		<li id="title-2">*개인정보를 기입하지마세요.</li>
		<li id="title-3">*허위정보를 기입하지마세요.</li>
		<div id="customer-QNA">

			<ul class="cstmt-qna">
				<li class="qna-list">글번호</li>
				<li class="qna-list">문의유형</li>
				<li class="qna-list">제목</li>
				<li class="qna-list">작성자</li>
				<li class="qna-list">문의날짜</li>
			</ul>
			<%
				if (list.isEmpty()) {
			%>
						<ul class="cstmt-qna2">
				<li class="qna-list2">1</li>
				<li class="qna-list2">신고</li>
				<li class="qna-list2"><a href="">너 신고합니다.</a></li>
				<li class="qna-list2">김똑환</li>
				<li class="qna-list2">2020-09-18</li>
			</ul>
			<%
				} else {
				for (CustomerCenter cc : list) {
			%>
			<ul class="cstmt-qna2">
				<li class="qna-list2"><%=cc.getCsNo()%></li>
				<li class="qna-list2"><%=cc.getCsType()%></li>
				<li class="qna-list2"><a href=""><%=cc.getCsTitle()%></a></li>
				<li class="qna-list2"><%=cc.getCsWriter()%></li>
				<li class="qna-list2"><%=cc.getCsDate()%></li>
							</ul>

			<%
				}
			}
			%>

		</div>
	</div>
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>