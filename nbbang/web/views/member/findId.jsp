<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member"%>

<%
	 Member m=(Member)request.getAttribute("findMember");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	/* 아이디 비번 찾기 */
	div#findIdContainer{
 		width: 550px;
 		height:547px;
		background-image: url("<%=request.getContextPath()%>/resources/rememberBread.png");
		background-size: 101%;
		position: absolute;
	    background-repeat: no-repeat;
	    top:0;
	    left:0;
	    bottom:0;
	    right:0;
	}
	
	#findIdField{
		position: relative;
		width: 50%;
		text-align: center;
		margin: 180px 40px 180px 150px;
	}
	
	#findIdField p{
		font-size: 30px;
		font-family: 'Do Hyeon', sans-serif;
		margin:15px;
	}
	
	#findIdField input{
		font-size: 20px;
		font-family: 'Do Hyeon', sans-serif;
		width:90%;
	}
	
	#findIdField #findIdbtn{
		border: none;
		border-radius: 10px;
		background-color: gold;
	}
	#resultField{
		position: relative;
		width:50%;
		text-align: center;
		margin: 240px 50px 100px 150px;
	}
	#resultField p{
		font-size: 30px;
		font-family: 'Do Hyeon', sans-serif;
	}
</style>
</head>
<body>
	<div id="findIdContainer">
		<%if(m==null) {%>
		<table id="findIdField">
			<form action="<%=request.getContextPath()%>/findId" method="post">
				<tr>
					<td>
						<p>^ㅇ^아이디 찾기^ㅇ^</p>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="memberName" id="memberName" placeholder="이름을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" onclick="return fn_validate()" value="아이디 찾기" id="findIdbtn">
					</td>
				</tr>
				<%} else{%>
				<div id="resultField">
					<p>회원님의 아이디는<br>[<%=m.getMemberId() %>]입니다.</p>
				</div>
				<%} %>
			</form>
		</table>
	</div>
	<script>
		function fn_validate() {
			let name=document.getElementById("memberName").value;
			let email=document.getElementById("email").value;
			if(name.trim().length<1){
				alert("이름을 입력해주세요");
				document.getElementById("memberName").focus();
				return false;
			}
			if(email.trim().length<1){
				alert("이메일을 입력해주세요");
				document.getElementById("email").focus();
				return false;
			}
		}
	</script>
</body>
</html>