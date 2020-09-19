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

// 게시글 상태가 2단계일때 실행
if("${tradeStage}"=="2"){
	var socket=new WebSocket("ws://localhost:9090<%=request.getContextPath()%>/socket");
	socket.onopen = function(e) {
		console.log('onopen 실행')
		socket.send(JSON.stringify(new Message("${m.nickname}","SYS1","${curMemsList}","${boardId}")));
	};
	socket.onclose = function(e) {
		console.log("onclose 실행");
	
	};
	socket.onerror = function(e) {
		console.log("onerror 실행");
	};
	socket.onmessage = function(e) {
		console.log("onerror 실행");
		console.log(e);
		console.log(e.data);
		const msg=JSON.parse(e.data);
		console.log("onmessage 함수 매개변수의 msg 출력 : "+msg["msg"]);
		console.log("메세지 보낸 사람 닉네임 : "+msg["sendNickName"]);
		console.log("현재 세션 사람 닉네임 : "+"${m.nickname}");
		
		//입&퇴장시 메세지 일반 메세지 출력 분기처리 
		if(msg["msg"] == "SYS1"){
			let html ="";
			//관리자일 경우 일반 유저일 경우 분기처리 
			 if(msg["sendNickName"] == "ADMIN"){
					html="<div class='tmp'><div class='admin'> ADMIN 관리자가 접속하였습니다." + "</div></div>";
			}else{ 
				html="<div class='tmp'><div class='conn'>"+msg["sendNickName"]+" 이(가) 합류하였습니다." + "</div></div>";
			}
				$("#ChatArea").html($("#ChatArea").html()+html); 
		}else if(msg["msg"] == "SYS2"){
			html="<div class='tmp'><div class='conn'>"+msg["sendNickName"]+" 이(가) 퇴장하였습니다." + "</div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html); 
		}else if(msg["sendNickName"] == "ADMIN"){
			let html="<div class='tmp'><div class='admin'> 시스템 관리자 : "+msg["msg"] + "</div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html); 
		}else if(msg["sendNickName"] == "${m.memberId}"){
			//자기 메세지일 경우 분기처리
	 		let html="<div class='tmp'><div class='mymsg'>"+msg["msg"]+"</div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html); 
		}else{
			//상대방 메세지일 경우 분기처리
			let html="<div class='tmp'><div class='profile'></div><div class='nick'>"+msg["sendNickName"]+"</div><div class='othermsg'>"+msg["msg"]+"</div></div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html);
		}
		/* 스크롤 아래로 유지해주는 것  채팅이 입력되면 가장 아래로 스크롤을 고정시켜야된다.
		안그러면 채팅 누가 칠때마다 스크롤을 내려줘야되는 번거로움이있음!*/
		$("#ChatArea").scrollTop($("#ChatArea")[0].scrollHeight);
	};
	
	//메세지를 발송하는 부분
	function sendMessage() {
		console.log("sendMessage 실행");	
		let txt = $("#msgText");
		if(txt.val().trim()!=""){
		var user = "${m.nickname}";
		socket.send(JSON.stringify(new Message(user,txt.val(),"${curMemsList}","${boardId}")));
		txt.val("");
		console.log(txt.val());
			}
		};
		
	//엔터키 입력시 메세지 발송
	$("#msgText").keydown(function(key) {
		if (key.keyCode == 13) {
			sendMessage();
		}
	});
	//메세지 객체
	function Message(sendNickName,msg,curMemsList,boardId){
		this.sendNickName=sendNickName;
		this.msg=msg;
		this.curMemsList=curMemsList;
		this.boardId = boardId;
	};
	
}

</script>