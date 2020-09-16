<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<style>
#fontBold{font-weight:bold;}
</style>
<section id="customerMain-container">
				<div id="customer-submain">
				<ul id="cstmt-menu">
					<li class="cstmt-list" style="font-size:40px;" id="fontBold"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>
					<li class="cstmt-list" style="font-size:20px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>
					<li class="cstmt-list" style="font-size:20px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>
					<li class="cstmt-list" style="font-size:20px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>
				</ul>
			</div>
			<div id="main-content">
				<h2>N빵가이드입니다.</h2>
			</div>
			<div id="sub-content">
				<h3>Sub Contentzzz</h3>
			</div>
</section>
<%@ include file="/views/common/footer.jsp" %>