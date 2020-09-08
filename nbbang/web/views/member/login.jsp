<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body>
<section>
    <div id="loginBox">
        <div id="loginField">
            <img src="<%=request.getContextPath() %>/resources/logo.png" alt="">
            <form action="<%=request.getContextPath()%>/login" method="post">
              <input type="text" placeholder="아이디" class="input" id="memberId" name="memberId" maxlength=20>
              <input type="password" placeholder="비밀번호" class="input" id="memberPwd" name="memberPwd" maxlength=16>
              <div id="saveIdField">
                <input type="checkbox" id="saveId" name="saveId"><span><label for="saveId">&nbsp;아이디 저장하기</label></span>
              </div>
              <button type="submit">로그인</button>
              <div id="loginSearchField">
              	<span id="findId" class="loginSearch" onclick="location.href='<%=request.getContextPath()%>/'">아이디찾기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	<span id="findPw" class="loginSearch" onclick="location.href='<%=request.getContextPath()%>/'">비밀번호찾기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	<span id="signIn" class="loginSearch" onclick="location.href='<%=request.getContextPath()%>/'">회원가입</span>
              </div>
            </form>
        </div>
    </div>
</section>
<%@ include file="/views/common/footer.jsp" %>