<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloMVC</title>
<link rel="stylesheet" 
href="<%= request.getContextPath() %>/css/style.css"
type="text/css">
<script src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<header>
		<h1>Hello MVC</h1>
		<div class="login-container">
			<form id="loginFrm" action="<%= request.getContextPath() %>/login" method="post">
				<table>
					<tr>
						<td>
							<input type="text" name="userId" id="userId" placeholder="아이디">
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<input type="password" name="password" id="password" placeholder="비밀번호">
						</td>
						<td>
							<input type="submit" value="로그인" onclick="return fn_login_validate();">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" name="saveId" id="saveId">
							<label for="saveId">아이디저장</label>
							<input type="button" value="회원가입">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<nav>
			<ul class="main-nav">
				<li class="home"><a href="#">Home</a></li>
				<li id="notice"><a href="#">공지사항</a></li>
				<li id="board"><a href="#">게시판</a></li>
			</ul>
		</nav>
	</header>
	<script>
		function fn_login_validate(){
			let id = $("#userId").val();
			let password = $("#password").val();
			
			//아이다가 4글자 미만이면 재입력
			if(id.trim().length < 4){
				alert("아이디는 4글자 이상 입력하세요");
				$("#userId").focus();
				return false;
			}
			//패스워드를 입력하지 않으면 안됨
			if(password.trim().length == 0) {
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return false;
			}
		}
	</script>