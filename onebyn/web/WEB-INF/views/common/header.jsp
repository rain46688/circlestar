<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>semi1 board</title>
<link href="<%=application.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/cms.css" rel="stylesheet">
<script src="<%=application.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=application.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a href="<%=application.getContextPath()%>/board.do">
			<img class="navbar-brand" src="<%=application.getContextPath()%>/images/b1.png">
		</a>
		<form class="form-inline" action="/action_page.php">
			<input class="form-control mr-sm-2" type="text" placeholder="검색">
			<button class="btn btn-success" type="submit">검색</button>
		</form>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<!-- 위치 조정용 -->
		</div>
		<!-- 세션에 따라 분기 처리 -->
	
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto ">
				<!-- <li class="nav-item active"> -->
				<c:if test="${empty(m)}">
				<li class="nav-item">
					<a class="nav-link" href="<%=application.getContextPath()%>/login.do">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">회원가입</a>
				</li>
				</c:if>
				<c:if test="${!empty(m)}">
				<li class="nav-item">
					<a class="nav-link">${m.id}</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=application.getContextPath()%>/logout.do">로그아웃</a>
				</li>
				</c:if>
				<li class="nav-item">
					<a class="nav-link" href="#">고객센터</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">마이페이지</a>
				</li>
			</ul>
		</div>



	</nav>


	<nav class="navbar navbar-expand-sm bg-warning navbar-light" id="onebyn-nav-mid">
		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav mr-auto">
				<!-- 위치 조정용 -->
			</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 특가 </a>
					<div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a>
						<a class="dropdown-item" href="#">2</a>
						<a class="dropdown-item" href="#">3</a>
						<a class="dropdown-item" href="#">4</a>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 식품 </a>
					<div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a>
						<a class="dropdown-item" href="#">2</a>
						<a class="dropdown-item" href="#">3</a>
						<a class="dropdown-item" href="#">4</a>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 패션잡화 </a>
					<div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a>
						<a class="dropdown-item" href="#">2</a>
						<a class="dropdown-item" href="#">3</a>
						<a class="dropdown-item" href="#">4</a>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 취미-문구 </a>
					<div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a>
						<a class="dropdown-item" href="#">2</a>
						<a class="dropdown-item" href="#">3</a>
						<a class="dropdown-item" href="#">4</a>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 티켓 </a>
					<div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a>
						<a class="dropdown-item" href="#">2</a>
						<a class="dropdown-item" href="#">3</a>
						<a class="dropdown-item" href="#">4</a>
					</div>
				</li>
			</ul>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"> 애완용품 </a>
					<div class="dropdown-menu mt-0" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">1</a>
						<a class="dropdown-item" href="#">2</a>
						<a class="dropdown-item" href="#">3</a>
						<a class="dropdown-item" href="#">4</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>