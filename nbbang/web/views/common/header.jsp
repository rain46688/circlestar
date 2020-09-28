<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Member loginnedMember=(Member)session.getAttribute("loginnedMember");
	String memberPic=request.getContextPath()+"/upload/profilePic/";
	List<Integer> likelist = new ArrayList<Integer>();
	if(session.getAttribute("likeList")!=null){
		likelist=(List<Integer>)session.getAttribute("likeList");
	}
%>
<!DOCTYPE html>
<html>

<head>
	<!-- Favicon -->
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
	<meta charset="UTF-8">
	<title>nbbang</title>
	<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
	<link href="<%=request.getContextPath()%>/css/section.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet">
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>

<body>
	<div id="container">
	<header>
		<div id="topField">
			<div id="logoContainer">
				<a href="<%= request.getContextPath() %>/">
				<img src="<%=request.getContextPath() %>/images/logoTitle.png" id="logoTitle" alt="logoTitle">
				</a>
			</div>
			<div id="searchSection">
				<input type="text" name="searchKeyword" id="searchKeyword" onkeypress="enterkey();">
				<div id="searchImage" onclick="fn_search('overall');">
					<img src="<%=request.getContextPath()%>/images/search.png" alt="" width="30px" height="30px">
				</div>
			</div>
			<div id="topBtn">
				<%if(loginnedMember==null) {%>
				<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
					onclick="location.href='<%=request.getContextPath()%>/loginPage'">로그인</button>
				<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
					onclick="location.href='<%=request.getContextPath()%>/enrollMember'">회원가입</button>
				<%}else{ %>
				<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
					onclick="location.href='<%=request.getContextPath()%>/member/memLogout.lo'">로그아웃</button>
				<%} %>

				<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
					onclick="location.href='<%=request.getContextPath()%>/customerFaq'">고객센터</button>

				<%if(loginnedMember!=null) {%>
					<%if(loginnedMember.getUsid()==9999) {%>
					<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
	   					onclick="location.href='<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>'">관리자페이지</button>
					<%}else{ %>
	   				<button type="button" class="btn btn-outline-primary" style="font-size: 20px;"
	   					onclick="location.href='<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>'">마이페이지</button>
   					<%} %>
   				<%} %>
			</div>
		</div>
		<nav>
			<ul class="nav justify-content-center">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/boList?boardTitle=특가">특가</a>
					<!-- 차후 게시판 분류대로 나눌 예정 -->
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/boList?boardTitle=식품">식품</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/boList?boardTitle=패션잡화">패션잡화</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/boList?boardTitle=취미-문구">취미-문구</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/boList?boardTitle=티켓">티켓</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/boList?boardTitle=애완용품">애완용품</a>
				</li>
			</ul>
		</nav>
	</header>
	<script>
		function enterkey(){
			if(window.event.keyCode == 13) {
				fn_search('overall');
			}
			return false;
		}

		function fn_search(category){
			let keyword = document.getElementById('searchKeyword').value;
			if(category=='overall') {
			if(keyword==""){
				alert("검색어를 입력해주세요.")
			}else {
				location.assign("<%=request.getContextPath()%>/boListSearch?keyword="+keyword +"&category="+category);
			}}else {
				keyword = document.getElementById('searchInHere').value;
				location.assign("<%=request.getContextPath()%>/boListSearch?keyword="+keyword +"&category="+category);
			}
		}
	</script>