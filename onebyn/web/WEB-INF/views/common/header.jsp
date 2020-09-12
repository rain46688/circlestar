<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>semi1 board</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/cms.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a href="<%=request.getContextPath()%>/board.do">
			<img class="navbar-brand" src="<%=request.getContextPath()%>/images/b1.png">
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
						<a class="nav-link" href="<%=request.getContextPath()%>/login.do">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">회원가입</a>
					</li>
				</c:if>
				<c:if test="${!empty(m)}">
					<li class="nav-item">
						<a class="nav-link">${m.memberId}</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
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


	<script>
	$(function(){
	
		/* 웹소켓 생성해서 변수에 담음 */
		var msgTextArea = document.getElementById("msgTextArea");
		console.log("msgTextArea : " + msgTextArea)

		function connectWebSocket(url, message, open, close, error) {
			console.log("connectWebSocket실행");
			let webSocket = new WebSocket(url);
			function call(cb, msg) {
				console.log("call실행");
				if (cb !== undefined && typeof cb === "function") {
					console.log("call실행2");
					cb.call(null, msg);
				}
			}
			//소켓이 연결됬을때 호출되는 이벤트 함수
			webSocket.onopen = function() {
				console.log("onopen실행");
				call(open);
			};
			//소켓이 종료됬을때 호출되는 이벤트 함수
			webSocket.onclose = function() {
				console.log("onclose실행");
				call(close);
			};
			//소켓이 에러났을때 호출되는 이벤트 함수
			webSocket.onerror = function() {
				console.log("onerror실행");
				call(error);
			};
			//소켓이 메세지가 와리가리할때 호출되는 이벤트 함수
			webSocket.onmessage = function(msg) {
				console.log("onmessage실행");
				call(message, msg);
			};
			return webSocket;
		}

		var open = function() {
			console.log("open실행");
			msgTextArea.value += "서버와 연결중...\n";
		}
		var close = function() {
			console.log("close실행");
			msgTextArea.value += "서버와 연결끊김...\n";
			setTimeout(function() {
				//재접속
				console.log("재접속 setTimeout실행");
				webSocket = connectWebSocket(
						"ws://localhost:9090/onebyn/chatsocket", message, open,
						close, error);
			});
		}
		var error = function() {
			console.log("error실행");
			msgTextArea.value += "서버와 연결에러...\n";
		}
		var message = function(msg) {
			console.log("message실행");
			msgTextArea.value += msg.data + "\n";
		};
		var webSocket = connectWebSocket(
				"ws://localhost:9090/onebyn/chatsocket", message, open, close,
				error);

		//송신 버튼을 눌렸을때 이벤트 처리 함수
		function sendMessage() {
			console.log("sendMessage실행");
			var user = document.getElementById("user");
			var message = document.getElementById("textMsg");
			msgTextArea.vlue += user.value + "(나) : " + message.value + "\n";
			webSocket.send("[" + user.value + "]" + message.value);
			message.value = "";
		}

		//소켓 종료 버튼 눌렀을때 이벤트 처리 함수
		function disconnect() {
			console.log("disconnect실행");
			webSocket.close();
		}
		
	})
	
	</script>