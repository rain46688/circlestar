<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<textarea id="msgTextArea" rows="10" cols="20" style="resize: none;"></textarea>
		<br>
		<form>
			<%-- 		<input type="text" value=${m.memberId } id="user" readonly>
							<br> <br>  --%>
			<input type="text" id="textMsg"> <br> <br>
			<button type="button" onclick="sendMessage()">입력</button>
			<!-- <input type="button" value="Disconnect" onclick="disconnect()"> -->
			<button type="button" onclick="create()">소켓 생성</button>
		</form>
	</div>


	<script>
		var webSocket;

		/* 웹소켓 생성해서 변수에 담음 */
		function create() {
			var msgTextArea = document.getElementById("msgTextArea");
			webSocket = connectWebSocket("ws://localhost:9090/onebyn/socket",
					message, open, close, error);
		}

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
			var user = "${m.memberId}";
			msgTextArea.value += user + "님이 접속하셨습니다.\n";
		}
		var close = function() {
			console.log("close실행");
			msgTextArea.value += "서버와 연결끊김...\n";
			setTimeout(function() {
				//재접속
				console.log("재접속 setTimeout실행");
				webSocket = connectWebSocket(
						"ws://localhost:9090/onebyn/socket", message, open,
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

		//송신 버튼을 눌렸을때 이벤트 처리 함수
		function sendMessage() {
			console.log("sendMessage실행");
			/* var user = document.getElementById("user"); */
			var user = "${m.memberId}";
			var message = document.getElementById("textMsg");
			msgTextArea.vlue += user + "(나) : " + message.value + "\n";
			webSocket.send("[" + user + "]" + message.value);
			message.value = "";
		}

		//소켓 종료 버튼 눌렀을때 이벤트 처리 함수
		function disconnect() {
			console.log("disconnect실행");
			webSocket.close();
		}
	</script>

</body>
</html>