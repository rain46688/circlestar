<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>

/* === 채팅 구현 부분  === */

*{
font-family: 'Jua', sans-serif;
}

/* 사이드바 사이즈  */
#side {
	height: 80%;
	width: 80%;
	margin: 30px auto;
	border: 2px black solid;
	border-radius: 10px;
	background-color:#B2C7D9;
}

/* 텍스트 출력되는 하얀부분 위 박스 */
#ChatArea{
/* 아래 스크롤바 감추기 */
	overflow-x:hidden;
	height:80%;
	width:100%;
/* 스크롤 바 투명하게 만들기 */	
	-ms-overflow-style: none;
}

/* 스크롤 바 투명하게 만들기 */
::-webkit-scrollbar { display: none; }

/* 밑에 입력하는 하얀부분 */
#inputDiv{
	height:20%;
	width:100%;
	background-color:white;
	border-radius-bottom-left: 10px;
	border-radius-bottom-right: 10px;
}

/* 하얀부분 안에들어가는 입력하는 곳 텍스트 */
#msgText{
	resize: none;
	border: none;
	padding: 10px 0px 10px 0px;
	width:80%;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus{
	outline:none;
}

/* 전송 버튼 걍 부트스트랩*/
#chatBtn{
	margin-bottom:80px;
	margin-right:1px;
}

/* 접속부분 글자색 */
.conn{
	color:#272728;
	margin-bottom:10px;
	margin-top:10px;
	text-align:center;
}

/* 관리자 전용 접속부분 글자색 */
.admin{
	color:red;
 	margin-bottom:10px;
	margin-top:10px;
	text-align:center;
}

/* 프로필 둥글게보이기 radius 70%하면됨  */
.profile{
 	width:50px; 
	height:50px;
	border-radius: 70%;
	background-color:#272728;
	 float: left;
	 margin:10px;
}

/* 세션과 채팅쓴 사람이 같은경우 노란색에 오른쪽 정렬 */
.mymsg{
	/* width:170px;  */
	/* margin-left:180px; */
	/* float: right; */
	width:auto; 
	overflow:hidden;
	height:auto;
	background-color:#FFEB33;
	border-radius: 10px;
	margin:15px;
	padding:10px;
	margin-left:180px;
}

/* 각각 채팅을 감싸는 div 배경색과 같은 테투리를 갖고있음 */
.tmp{
/* border:1px black solid; */
border:1px #B2C7D9 solid;
}

/* 다른 사람껀 프로필이랑 이름 보여주고 왼쪽 */
.othermsg{
	/*float: left; */
	width:auto; 
	overflow:hidden;
	height:auto;
	background-color:white;
	border-radius: 10px;
	margin:15px;
	padding:10px;
	margin-right:120px;
	margin-left:-50px;
	margin-top:25px;
}

/* 닉네임 div */
.nick{
	 float: left;
}

/* 현재 방번호 상단에 보여주기 위해 */
/* #roomno{
text-align:center;
margin-top:10px;
} */

</style>

<div id="side">
	<div id="chat">
	<!-- tradeStage 방의 상태가 2단계인경우
	게시판 상세페이지에서 방이 생성될때 정보를 변경 후 Attribute 보내줘야됨 
	-->
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

/* 메인 Window 사이즈 조절 막기 x,y는 chatRoomServlet에서 파라미터로 받아와야됨*/

$(this).resize(fixedSize);
function fixedSize() {
		this.resizeTo("${x}","${y}")
}

/* 웹소켓 부분 */

// 게시글 상태가 2단계일때 실행
if("${tradeStage}"=="2"){
	//소켓 생성
	var socket=new WebSocket("ws://localhost:9090<%=request.getContextPath()%>/socket");
	//소켓 오픈,클로즈,에러,메세지 구현
	socket.onopen = function(e) {
		console.log('onopen 실행')
		socket.send(JSON.stringify(new Message("${m.nickname}","SYS1","${curMemsList}","${boardId}","")));
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
			//관리자인 경우 분기 처리
		}else if(msg["sendNickName"] == "ADMIN"){
			let html="<div class='tmp'><div class='admin'> 시스템 관리자 : "+msg["msg"] + "</div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html); 
		}else if(msg["sendNickName"] == "${m.nickname}"){
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
		socket.send(JSON.stringify(new Message(user,txt.val(),"${curMemsList}","${boardId}","${memberPicture}")));
		txt.val(' ');//칸 비워주기
		txt.html(' ');
		//txt.val(txt.replace(/\r\n/g, ''));
		//엔터키 없애주기
			}
		};
		
	//엔터키 입력시 메세지 발송
	$("#msgText").keydown(function(key) {
		if (key.keyCode == 13) {
			sendMessage();
		}
	});
	
	//메세지 객체
	function Message(sendNickName,msg,curMemsList,boardId,chatProfile){
		this.sendNickName=sendNickName;
		this.msg=msg;
		this.curMemsList=curMemsList;
		this.boardId = boardId;
		this.chatProfile = chatProfile;
	};
	
}

</script>