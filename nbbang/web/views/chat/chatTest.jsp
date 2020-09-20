<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

	<!-- 채팅창 관련 로직  -->
				<form name="form">
					<input type="hidden" name="boardId" value="2"> 
					<input type="hidden" name="maxMems" value="3"> 
					<input type="hidden" name="tradeStage" value="2"> 
					<input type="hidden" name="writerUsid" value="9999">
					<button onclick="nbbang(this.form)" class="btn btn-success">N빵하기</button>
				</form>


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

</script>

<%@ include file="/views/common/footer.jsp"%>
