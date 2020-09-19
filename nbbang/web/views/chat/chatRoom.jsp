<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> 

<style>

</style>

<div id="side">
	<div id="chat">
			<c:if test="${tradeStage == 2}">
					<div id="ChatArea"></div>
					<div id="inputDiv">
						<textarea id="msgText" rows="3" cols="33"></textarea>
						<button type="button" onclick="sendMessage()" class="btn btn-success" id="chatBtn">전송</button>
					</div>
			</c:if>
	</div>
</div>

<script>

/* 메인 Window 사이즈 조절 막기 */

$(this).resize(fixedSize);
function fixedSize() {
		this.resizeTo("${x}","${y}")
}

/* 웹소켓 부분 */

if("${tradeStage}"=="2"){
	var socket=new WebSocket("ws://localhost:9090<%=request.getContextPath()%>/socket");
	socket.onopen = function(e) {
		console.log('onopen 실행')
		var user = "${m.memberId}";
		socket.send(JSON.stringify(new Message(user,"SYS1","${blist}","${bid}")));
	};
	socket.onclose = function(e) {
		console.log("close e실행 : "+e.data);
	
	};
	socket.onerror = function(e) {
		console.log("error e실행 : "+e.data);
	};
	socket.onmessage = function(e) {
		console.log(e);
		console.log(e.data);
		const msg=JSON.parse(e.data);
		console.log(e.data);
		
	console.log("onmessage 함수 매개변수의 msg 출력 : "+msg["msg"]);
		console.log("메세지 보낸사람 : "+msg["sender"]);
		console.log("현재 세션 사람 : "+"${m.memberId}");
		if(msg["msg"] == "SYS1"){
			let html ="";
			 if(msg["sender"] == "ADMIN"){
					html="<div class='tmp'><div class='admin'> ADMIN 관리자가 합류하였습니다." + "</div></div>";
			}else{ 
				html="<div class='tmp'><div class='conn'>"+msg["sender"]+" 이(가) 합류하였습니다." + "</div></div>";
			}
				$("#msgTextArea").html($("#msgTextArea").html()+html); 
		}else if(msg["msg"] == "SYS2"){
			html="<div class='tmp'><div class='conn'>"+msg["sender"]+" 이(가) 퇴장하였습니다." + "</div></div>";
			$("#msgTextArea").html($("#msgTextArea").html()+html); 
		}else if(msg["sender"] == "ADMIN"){
			let html="<div class='tmp'><div class='admin'> 시스템 관리자 : "+msg["msg"] + "</div></div>";
			$("#msgTextArea").html($("#msgTextArea").html()+html); 
		}else if(msg["sender"] == "${m.memberId}"){
			console.log("자기 메세지")
	 		let html="<div class='tmp'><div class='mymsg'>"+msg["msg"]+"</div></div>";
			$("#msgTextArea").html($("#msgTextArea").html()+html); 
		}else{
			console.log("상대방 메세지")
			let html="<div class='tmp'><div class='profile'></div><div class='nick'>"+msg["sender"]+"</div><div class='othermsg'>"+msg["msg"]+"</div></div></div>";
			$("#msgTextArea").html($("#msgTextArea").html()+html);
		}
		/* 스크롤 아래로 유지해주는 것  */
		$("#msgTextArea").scrollTop($("#msgTextArea")[0].scrollHeight);
	};
	
	function sendMessage() {
		console.log("sendMessage");	
		let txt = $("#textMsg");
		if(txt.val().trim()!=""){
		var user = "${m.memberId}";
		socket.send(JSON.stringify(new Message(user,txt.val(),"${blist}","${bid}")));
		txt.val("");
		console.log(txt.val());
		}
		};
	
	$("#textMsg").keydown(function(key) {
		if (key.keyCode == 13) {
			sendMessage();
		}
	});
	
	function Message(sender,msg,blist,bid){
		this.sender=sender;
		this.msg=msg;
		this.blist=blist;
		this.bid = bid;
	};
	
}

</script>