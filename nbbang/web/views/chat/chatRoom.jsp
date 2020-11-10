<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>${boardTitle}</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
</head>
<style>

/* === 채팅 구현 부분  === */
* {
	font-family: 'Jua', sans-serif;
	font-weight: bold;
	/* text-shadow: -1px 0 #FFC107, 0 0.5px #FFC107, 0.5px 0 #FFC107, 0 -1px #FFC107; */
}

body {
	/* background-color:#FFC107; */
	background-image:
		url('<%=request.getContextPath()%>/images/chatRoom.png');
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

/* 사이드바 사이즈  */
#side {
	height: 62%;
	width: 62%;
	margin: 28% auto;
	/* 	border: 4px black solid; */
	padding: 1px;
	border-radius: 10px;
	/* background-color:#B2C7D9; */
	background-color: #FEFCEC;
}

/* 텍스트 출력되는 하얀부분 위 박스 */
#ChatArea {
	/* 아래 스크롤바 감추기 */
	overflow-x: hidden;
	height: 80%;
	width: 100%;
	/* 스크롤 바 투명하게 만들기 */
	-ms-overflow-style: none;
}

/* 스크롤 바 투명하게 만들기 */
::-webkit-scrollbar {
	display: none;
}

/* 밑에 입력하는 하얀부분 */
#inputDiv {
	height: 20%;
	width: 100%;
	/* background-color:white; */
	background-color: #FFE9B9;
	/* 	background-color:#FEFCEC; */
	border: 1px solid #E8AB62;
	border-radius: 10px;
	border-radius-bottom-left: 10px;
	border-radius-bottom-right: 10px;
}

/* 하얀부분 안에들어가는 입력하는 곳 텍스트 */
#msgText {
	resize: none;
	border: none;
	padding: 10px 10px 10px 10px;
	/*  */
	margin-top: 5px;
	margin-left: 7px;
	/*  */
	width: 79%;
	border-radius: 5px;
	height: 86px;
}

/* 위 텍스트 영역 눌르면 옆에 테두리 생기는거 지우는 용도 */
textarea:focus {
	outline: none;
}

/* 전송 버튼 걍 부트스트랩*/
#chatBtn {
	margin-bottom: 80px;
	margin-right: 1px;
}

/* 접속부분 글자색 */
.conn {
	color: #272728;
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
	font-size: 20px;
}

/* 관리자 전용 접속부분 글자색 */
.admin {
	color: red;
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
	font-size: 20px;
}

/* 프로필 둥글게보이기 radius 70%하면됨  */
.profile {
	width: 50px;
	height: 50px;
	border: 1px solid #FFC107;
	border-radius: 70%;
	float: left;
	margin: 10px;
}

/* 세션과 채팅쓴 사람이 같은경우 노란색에 오른쪽 정렬 */
.mymsg {
	/* width:170px;  */
	/* margin-left:180px; */
	/* float: right; */
	width: auto;
	overflow: hidden;
	height: auto;
	background-color: #FFEB33;
	border-radius: 10px;
	margin: 15px;
	padding: 10px;
	/* margin-left:180px; */
	margin-left: 60%;
	margin-bottom: 5px;
}

/* 각각 채팅을 감싸는 div 배경색과 같은 테투리를 갖고있음 */
.tmp {
	/* border:1px black solid;
border:1px #B2C7D9 solid;
 */
	border: 1px #FEFCEC solid;
}

/* 다른 사람껀 프로필이랑 이름 보여주고 왼쪽 */
.othermsg {
	/*float: left; */
	width: auto;
	overflow: hidden;
	height: auto;
	background-color: white;
	border-radius: 10px;
	margin: 15px;
	padding: 10px;
	/* margin-right:120px; */
	margin-right: 40%;
	/* 	margin-left:-50px; */
	margin-left: 25%;
	margin-top: 25px;
	margin-bottom: 5px;
	border: 1px #FFC107 solid;
}

/* 닉네임 div */
.nick {
	float: left;
}

/* 본인이 보는 채팅 */
.date {
	display: inline;
	color: black;
	margin-left: 78%;
	font-size: 12px;
}

/* 남이 쓰는 채팅 */
.date2 {
	display: inline;
	color: black;
	margin-left: 30%;
	font-size: 12px;
}

/* 현재 방번호 상단에 보여주기 위해 */
/* #roomno{
text-align:center;
margin-top:10px;
} */
</style>

<section>
	<div id="side">
		<div id="chat">
			<c:if test="${!empty loginnedMember}">
				<div id="ChatArea"></div>
				<div id="inputDiv">
					<textarea id="msgText" rows="3" cols="33"></textarea>
					<button type="button" onclick="sendMessage()" class="btn btn-success" id="chatBtn">전송</button>
				</div>
			</c:if>
			<c:if test="${empty loginnedMember}">
				<div id="ChatArea">
					<div class='tmp'>
						<div class='admin'>로그인후 다시 접속해주세요!</div>
					</div>
				</div>
				<div id="inputDiv">
					<!-- 	<textarea id="msgText" rows="3" cols="33"></textarea> -->
					<textarea id="msgText" rows="1" cols="1"></textarea>
					<button type="button" onclick="sendMessage()" class="btn btn-success" id="chatBtn">전송</button>
				</div>
			</c:if>
		</div>
	</div>
</section>

<script>

$(function(){

	/* 여기서 댓글 처럼 채팅 리스트를 가져와서 쏴주기만하면됨  */
	$.ajax({
		type: "POST",
		data: {"boardId":"${boardId}"},
		dataType: "json",
		url: "<%=request.getContextPath()%>/chat/getChatList",
			success : function(data) {
				console.log("success 부분 data : ["+data+"]");
				let html ="";
				if(data != null && data != ''){
					console.log('data null 인지 아닌지? : '+data);
				$.each(data,function(i,msg){
					if(msg["msg"] == "SYS1"){
						 if(msg["sendNickName"] == "ADMIN"){
								html+="<div class='tmp'><div class='admin'> ADMIN 관리자가 접속하였습니다." + "</div></div>";
						}else{ 
							html+="<div class='tmp'><div class='conn'>"+msg["sendNickName"]+" 이(가) 합류하였습니다." + "</div></div>";
						}
					}else if(msg["msg"] == "SYS2"){
						html+="<div class='tmp'><div class='conn'>"+msg["sendNickName"]+" 이(가) 퇴장하였습니다." + "</div></div>";
					}else if(msg["sendNickName"] == "ADMIN"){
						 html+="<div class='tmp'><div class='admin'> 시스템 관리자 : "+msg["msg"] + "</div></div>";
					}else if(msg["sendNickName"] == "${m.nickname}"){
						let time = msg["chatTime"];
						let arr = time.split('오');
						time='오'+arr[1];
						time = time.substring(0,time.lastIndexOf(':'));
						html+="<div class='tmp'><div class='mymsg'>"+msg["msg"]+"</div><div class='date'>"+time+"</div></div>";
					}else{
						let time = msg["chatTime"];
						let arr = time.split('오');
						time='오'+arr[1];
						time = time.substring(0,time.lastIndexOf(':'));
						html+="<div class='tmp'><img class='profile' src='<%=request.getContextPath()%>/upload/profilePic/"+msg["chatProfile"]+"'><div class='nick'>"+msg["sendNickName"]+"</div><div class='othermsg'>"+msg["msg"]+"</div><div class='date2'>"+time+"</div></div>";
					}
				});
				$("#ChatArea").html(html);
				$("#ChatArea").scrollTop($("#ChatArea")[0].scrollHeight);
				}
				
				
			}
		})
		
	
})



/* 메인 Window 사이즈 조절 막기 x,y는 chatRoomServlet에서 파라미터로 받아와야됨*/

$(this).resize(fixedSize);
function fixedSize() {
		this.resizeTo(620,850);
}

/* 웹소켓 부분 */

	//===== 소켓 생성 배포 서버 사용시에 변경 해야됨 =====
	/* 
	
	cd .\Downloads\
	
	pscp -P 21578 .\20AM_nbbang.war team1@rclass.iptime.org:/home/apache-tomcat-8.5.45/webapps/
	
	team11
	
	*/	
		
 let socket=new WebSocket("ws://rclass.iptime.org:9999<%=request.getContextPath()%>/socket");
 <%-- var socket=new WebSocket("ws://localhost:9090<%=request.getContextPath()%>/socket"); --%>  
	
	//소켓 오픈,클로즈,에러,메세지 구현
	socket.onopen = function(e) {
		console.log('onopen 실행')
	let _today = new Date();
	let day = _today.format('yyyy-MM-dd a/p hh:mm:ss');
		console.log("day : "+day);
		socket.send(JSON.stringify(new Message("${m.nickname}","SYS1","${curMemsList}","${boardId}","",day)));
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
				let time = msg["chatTime"];
				let arr = time.split('오');
				time='오'+arr[1];
				time = time.substring(0,time.lastIndexOf(':'));
	 		let html="<div class='tmp'><div class='mymsg'>"+msg["msg"]+"</div><div class='date'>"+time+"</div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html); 
		}else{
			//상대방 메세지일 경우 분기처리
				let time = msg["chatTime"];
				let arr = time.split('오');
				time='오'+arr[1];
				time = time.substring(0,time.lastIndexOf(':'));
				console.log("msg['chatProfile']"+msg["chatProfile"]);
			let html="<div class='tmp'><img class='profile' src='<%=request.getContextPath()%>/upload/profilePic/"+msg["chatProfile"]+"'><div class='nick'>"+msg["sendNickName"]+"</div><div class='othermsg'>"+msg["msg"]+"</div><div class='date2'>"+time+"</div></div>";
			$("#ChatArea").html($("#ChatArea").html()+html);
		}
		/* 스크롤 아래로 유지해주는 것  채팅이 입력되면 가장 아래로 스크롤을 고정시켜야된다.
		안그러면 채팅 누가 칠때마다 스크롤을 내려줘야되는 번거로움이있음!*/
		$("#ChatArea").scrollTop($("#ChatArea")[0].scrollHeight);
	};
	
	//메세지를 발송하는 부분
	function sendMessage() {
		console.log("sendMessage 실행");	

		console.log("여기 실행됨?? 2");
		let txt = $("#msgText");
		if(txt.val().trim()!=""){
		let user = "${m.nickname}";
		let _today = new Date();
		let day = _today.format('yyyy-MM-dd a/p hh:mm:ss');
		console.log("${loginnedMember}");
		socket.send(JSON.stringify(new Message(user,txt.val(),"${curMemsList}","${boardId}","${memberPicture}",day)));
		console.log("여기 실행됨?? 3");
		txt.val(' ');//칸 비워주기
		txt.html(' ');//html 비워주기
			}
		};
		
	//엔터키 입력시 메세지 발송
	$("#msgText").keyup(function(key) {
		if (key.keyCode == 13) {
			console.log("엔터 남아있는지 여부 : "+$(this).val().includes("\n"));
			if($(this).val().includes("\n")){
				console.log($(this).val());
				console.log(typeof($(this)));
				let s = $(this).val().replace("\n", '');
				$(this).val(s);
				$(this).selectRange(0,0);
				console.log("["+s+"]");
				console.log("엔터 남아있는지 여부 : "+$(this).val().includes("\n"));
				sendMessage();
			}else{
				sendMessage();
				console.log(" 엔터 없음 : ["+s+"]");
			}
		}
	});
	
	//메세지 객체
	function Message(sendNickName,msg,curMemsList,boardId,chatProfile,chatTime,mem){
		this.sendNickName=sendNickName;
		this.msg=msg;
		this.curMemsList=curMemsList;
		this.boardId = boardId;
		this.chatProfile = chatProfile;
		this.chatTime = chatTime;
		this.mem = mem;
	};
	
	
	$.fn.selectRange = function(start, end) {
		return this.each(function() {
			if(this.setSelectionRange) {
				this.focus();
				this.setSelectionRange(start, end);
			}
			else if(this.createTextRange) {
				let range = this.createTextRange();
				range.collapse(true);
				range.moveEnd('character', end);
				range.moveStart('character', start);
				range.select();
			}
		});
	};


	
	//날짜 포멧용 함수
	Date.prototype.format = function (f) {
	    if (!this.valueOf()) return " ";
	    let weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    let weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
	    let weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	    let weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	    let d = this;
	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear(); // 년 (4자리)
	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
	            case "dd": return d.getDate().zf(2); // 일 (2자리)
	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
	            default: return $1;
	        }
	    });
	};
	String.prototype.string = function (len) {
		let s = '', i = 0; while (i++ < len) { s += this; } return s; 
		};
		
	String.prototype.zf = function (len) {
		return "0".string(len - this.length) + this; 
		};
	Number.prototype.zf = function (len) {
		return this.toString().zf(len); 
		};


</script>