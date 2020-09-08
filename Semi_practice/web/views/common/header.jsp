<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.inhee.member.model.vo.Member" %>
<% Member loginnedMember=(Member)session.getAttribute("loginnedMember");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>One by N</title>
<!-- 부트스트랩 -->
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<div id="topField">
			<div id="logoContainer">
				<img src="<%=request.getContextPath() %>/resources/logoTitle.png" id="logoTitle" alt="logoTitle">
			</div>
			<div id="topBtn">
				<%if(loginnedMember==null) {%>
					<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
					onclick="location.href='<%=request.getContextPath()%>/loginPage'">로그인</button>
					<button type="button" class="btn btn-outline-primary" style="font-size: 20px;">회원가입</button>
				<%}else{ %>
					<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
					onclick>로그아웃</button>
				<%} %>
   				<button type="button" class="btn btn-outline-primary" style="font-size: 20px;">마이페이지</button>
      			<button type="button" class="btn btn-outline-primary" style="font-size: 20px;">고객센터</button>
			</div>
		</div>
		<nav>
			<ul class="nav justify-content-center">
				<li class="nav-item">
				  <a class="nav-link active" href="<%=request.getContextPath() %>/">홈</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="#">특가</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" href="#">식품</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">패션잡화</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">취미-문구</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">티켓</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">애완용품</a>
				</li>
			  </ul>
		</nav>
	</header>