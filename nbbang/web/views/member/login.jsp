<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<% 
	Member loginnedMember=(Member)session.getAttribute("loginnedMember");
	
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
		for(Cookie c:cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
				break;
			}
		}
	}
%>
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
            <img src="<%=request.getContextPath() %>/images/logo.png" alt="">
            <form action="<%=request.getContextPath()%>/login" method="post">
              <input type="text" placeholder="아이디" class="input" id="memberId" name="memberId" maxlength=20
              value="<%=saveId!=null ? saveId : ""%>">
              <input type="password" placeholder="비밀번호" class="input" id="memberPwd" name="memberPwd" maxlength=16>
              <div id="saveIdField">
                <input type="checkbox" id="saveId" name="saveId" <%=saveId!=null ? "checked" : "" %>><span><label for="saveId">&nbsp;아이디 저장하기</label></span>
              </div>
              <button type="submit">로그인</button>
              <div id="loginSearchField">
              	<span id="findId" class="loginSearch" onclick="fn_findId();">아이디찾기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	<span id="findPw" class="loginSearch" onclick="fn_findPw();">비밀번호찾기</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	<span id="signIn" class="loginSearch" onclick="location.href='<%=request.getContextPath()%>/enrollMember'" >회원가입</span>
              </div>
            </form>
        </div>
    </div>
</section>
<script>
	
	function fn_findId() {
		const url="<%=request.getContextPath()%>/views/member/findId.jsp";
		const title="findId";
		const status="left=100px, top=100px, width=550px, height=548px";
		
		window.open(url,title,status);
		findId.target=title;
		findId.action="<%=request.getContextPath()%>/findId";
		findId.method="post";
		findId.submit();
	}
	function fn_findPw() {
		const url="<%=request.getContextPath()%>/views/member/findPw.jsp";
		const title="findPw";
		const status="left=100px, top=100px, width=550px, height=548p";
		
		open(url,title,status);
		
		findPw.target=title;
		findPw.action="<%=request.getContextPath()%>/findPw";
		findPw.method="post";
		findPw.submit();
	}
</script>
<%@ include file="/views/common/footer.jsp" %>