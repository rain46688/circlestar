<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

	<!-- 채팅창 관련 로직  -->
				<form name="form">
					<input type="hidden" name="boardId" value="2"> 
					<input type="hidden" name="maxMems" value="3"> 
					<input type="hidden" name="tradeStage" value="2"> 
					<input type="hidden" name="writerUsid" value="9999">
					<button onclick="fun_decidebuy()" class="btn btn-success">N빵하기</button>
							<button onclick="fun_cancelbuy()" class="btn btn-success">취소기</button>
				</form>
				
				<button onclick="fun_createroom()" class="btn btn-success">인원 차서 방장이 방열기</button>
						<button onclick="nbbang(this.form)" class="btn btn-success">채팅방 접속하기</button>

<script>

var pop;
window.onunload = function() { 
	pop.close(); 
}

/*  채팅창 관련 로직  */
function nbbang(f){
	var x = 450;
	var y = 660;
	var cx = (window.screen.width / 2) - (x / 2);
	var cy= (window.screen.height / 2) - (y / 2);
	console.log("window.screen.width : "+window.screen.width+", cx : "+cx);
	console.log("window.screen.height : "+window.screen.height+", cy : "+cy);
	var url    ="<%=request.getContextPath()%>/chat/chatRoom";
	  var title  = "chat";
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width="+x+", height="+y+", top="+cy+",left="+cx;
	  pop =  window.open("", title,status);
	  f.target = title;
	  f.action = url;
	  f.method = "post";
	  f.submit();    
}


function fun_createroom() {
/*  	const max = 3;
	const curnum = "${curnum}"; */

	$.ajax({
		type: "GET",
		data: {"boardId":"2"},
		dataType: "json",
		url: "<%=request.getContextPath()%>/chat/createRoom",
			success : function(data) {
					console.log("data : "+data);
				if (data == 1) {
					//방의 상태를 바꿔야되니 ajax로 갔따오자 방의 상태를 2로 변경함
					nbbang(this.form);
				} else {
					alert('N빵 인원이 다 체워지지 않았습니다.');
				} 
			}
		})
}

function fun_decidebuy(){
	/* 컨트롤 f주의 여기 틀어짐 컨텍스트 부분 */
	$.ajax({
		type: "GET",
		data: {user : "${m.memberId}",bid:"${bid}","flag":"1"},
		url: "<%=request.getContextPath()%>/decidebuy.do",
			success : function(data) {
				location.reload();
			}
		}) 	

	}

//취소할때
function fun_cancelbuy() {
	alert('취소 되었습니다.');
	$.ajax({
		type: "GET",
		data: {user : "${m.memberId}",bid:"${bid}","flag":"2"},
		url: "<%=request.getContextPath()%>/cancelbuy.do",
			success : function(data) {
				location.reload();
			}
		})
}

</script>

<%@ include file="/views/common/footer.jsp"%>
