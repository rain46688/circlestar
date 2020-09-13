<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/tradeboard.css" rel="stylesheet">



<!-- 
작성자 아이디
작성 날짜
조회수

- 주 기능 -
카테고리
제품 이름
배송 예정 날짜
거래 지역
게시판 단계 상태 
-->

<style>
.delcomment {
	float: right;
}
</style>

<div class="container" id="boardtrade">
	<div class="row">
		<div class="col-10">

			<div id="writecontainer">
				<h2 class="display-4">${b.boardTitle}</h2>
				<p class="lead">작성자 : ${b.writerId}</p>
				<p class="lead">
					작성 날짜 : ${b.enrollDate} <span style="float: right;">조회수 : ${b.hit}</span>
				</p>
				<hr class="my-4">
				<p class="lead">제품 카테고리 : ${b.productCategori}</p>
				<p class="lead">제품 이름 : ${b.productName }</p>
				<p class="lead">거래지역 : ${b.tradeArea}</p>
				<p class="lead">제품 가격 : ${b.productPrice }원</p>
				<p class="lead">제품 보유 상태 : ${b.ownStatus }</p>
				<p class="lead">거래 종류 : ${b.tradeKind }</p>
				<hr class="my-4">
				<div id="content">
					<c:if test="${b.files!='images/'}">
						<img class="card-img-top" src="<%= request.getContextPath() %>/images/${b.files}" alt="" width="100%" height="100%">
						<br>
						<br>
					</c:if>
					<%-- <p>${m.memberId}</p> --%>
					<h4>${b.content }</h4>
				</div>
				<br> <br> <br> <br>
				<div id="writecontainer">
					<div class="status-upload">
						<h4>
							댓글 (<span class="com_count"></span>)
						</h4>
						<form>
							<input type="hidden" name="no" id="no" value="${b.boardId}"> <input type="hidden" name="id" id="id" value="${m.memberId}">
							<textarea placeholder="내용을 입력하세요." id="commnetbox" class="pb-cmnt-textarea"></textarea>
							<div class="checkbox">
								<input type="checkbox" name="secret" id="secret"> 비밀댓글
							</div>
							<button type="button" class="btn btn-success green addbtn" id="addcomment">
								<i class="fa fa-share"></i> 댓글작성
							</button>
						</form>
					</div>
				</div>
				<br>
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentbdiv">
						<!-- 	<br> 작성되어있는 댓글 없음.
						<hr> -->
					</div>
				</form>
				<br> <br>
			</div>
		</div>


		<div class="col-2">
			<div class="sidebar">
				<div class="sticky">
					<div id="side">
						<!-- <h2>사이드바</h2> -->
						<textarea id="msgTextArea" rows="10" cols="20" style="resize: none;"></textarea>
							<br>
												<form>
					<%-- 		<input type="text" value=${m.memberId } id="user" readonly>
							<br> <br>  --%>
							<input type="text" id="textMsg">
							<br> 
							<br> 
							<button type="button" onclick="sendMessage()">입력</button>
							<!-- <input type="button" value="Disconnect" onclick="disconnect()"> -->
						<button type="button" onclick="create()">소켓 생성</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>








$(function(){
	
	$("#msgTextArea").attr("readonly", true);

	
 	function re(){
		 console.log("printCom");
		 printCom();
		}
		setInterval(re, 10000); 
	
    $("#addcomment").click(function(){
    	/* console.log("secret : "+$("#secret").is(":checked")); */
    	
    	if($("#commnetbox").val().trim() === ""){
    		alert("내용을 입력하세요.");
    		$("#commnetbox").val("").focus();
    	}else{
    		$.ajax({
    			url: "<%=request.getContextPath()%>/board/writeComment.do",
                type: "POST",
                data: {
                    no : $("#no").val(),
                    id : $("#id").val(),
                   con : $("#commnetbox").val(),
                   se : $("#secret").is(":checked")
                },
                success: function () {
                	alert("댓글이 등록되었습니다.");
                	$("#commnetbox").val("");
                	printCom();
                }
    		})
    	}
    })
    
    		
    
    function printCom(){
    	
    	const curuser = "${m.memberId}";
    	/* console.log(curuser); */
    	
    	$.ajax({
			url: "<%=request.getContextPath()%>/board/addComment.do",
            type: "POST",
            async : true, 
            data: {board_id : ${b.boardId}},
            success: function (data) { 
            	/* console.log(data); */
            	$("#commentbdiv").text("");
            	var obj = JSON.parse(data); 
            	var List = obj.List;
            	var print = ""; 
            	for (var i = 0; i < List.length; i++) { 
	                    print += "<div class='w3-border w3-padding'>";
	                for (var j = 0; j < List[i].length; j++) {
	                    var com = List[i][j];
	                    /* console.log("com.com_no : "+com.com_no); */
	                /*     console.log(i+" "+j+" "+com.com_no+" "+com.id+" "+com.com_date+" "+com.com_content);  */
	                    if(j === 0){
	                   /*  	console.log("com.id : "+com.id); */
	                    	if(com.id == curuser){
	                    	print += "&nbsp;&nbsp; <label id='comlabel'>" + com.id + "</label>&nbsp;&nbsp; <button type='button' onclick='del_fun(event);' class='btn btn-success green delcomment' name='del'><i class='fa fa-share'></i> 댓글삭제</button>"; 
	                    	/* print += "&nbsp;&nbsp; <label id='comlabel'>" + com.id + "</label>&nbsp;&nbsp; <button type='button' class='btn btn-success green delcomment' name='del'><i class='fa fa-share'></i> 댓글삭제</button>"; */
	                    	}else{
	                    	print += "&nbsp;&nbsp; <label id='comlabel'>" + com.id + "</label>&nbsp;&nbsp;";
	                    }
	                    }else if(j === 1){
	                    	print += "&nbsp;&nbsp;&nbsp;&nbsp;<label id='comlabel'>" + com.com_date+"</label>";
	                    }else if(j === 2){
	                    	print += "<h4>" + com.com_content + "</h4>";
	                    }else if(j === 3){
	                    	print +="<hr><input type='hidden' id='com"+(i+1)+"' value='"+com.com_no+"'></div>";
	                    }
	                
	                };
	        	};
	              	$("#commentbdiv").html(print); 
	              	$(".com_count").html(i);
            }
    	})
		}printCom(); 
		
		
<%-- 		$.ajax({

			type: "GET",
			url: "<%=request.getContextPath()%>/writenotice.do",
			success:function(data){
				console.log(data);
				$("#side").html(data);
			}
		}) --%>
		
		// 다른 페이지 가져와서 뿌려줄수있음!! 
		

});



 function del_fun(e){
	const com = e.target.parentNode.lastChild.value;
	console.log(com);
	  $.ajax({
            type : "GET",
            url : "<%=request.getContextPath()%>/board/delcomment.do",
            data: {cono : com},
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                alert("댓글이 삭제되었습니다." + data) ;
              /* $("#dataArea").html(data) ; */
                e.target.parentNode.remove(); 
            }
             
        });
	  
	
} 


	 var webSocket;

		/* 웹소켓 생성해서 변수에 담음 */
	function create(){
		var msgTextArea = document.getElementById("msgTextArea");
		webSocket = connectWebSocket("ws://localhost:9090/onebyn/socket",message,open,close,error);
	}
	


	function connectWebSocket(url, message, open, close, error){
		console.log("connectWebSocket실행");
		let webSocket = new WebSocket(url);
		function call(cb, msg){
			console.log("call실행");
			if(cb !== undefined && typeof cb === "function"){
				console.log("call실행2");
				cb.call(null, msg);
			}		
		}
		
		//소켓이 연결됬을때 호출되는 이벤트 함수
		webSocket.onopen = function(){
			console.log("onopen실행");
			call(open);
		};
		//소켓이 종료됬을때 호출되는 이벤트 함수
		webSocket.onclose = function(){
			console.log("onclose실행");
			call(close);
		};
		//소켓이 에러났을때 호출되는 이벤트 함수
		webSocket.onerror = function(){
			console.log("onerror실행");
			call(error);
		};
		//소켓이 메세지가 와리가리할때 호출되는 이벤트 함수
		webSocket.onmessage = function(msg){
			console.log("onmessage실행");
			call(message, msg);
		};
		return webSocket;
	}

	var open = function(){
		console.log("open실행");
		var user = "${m.memberId}";
		msgTextArea.value += user+"님이 접속하셨습니다.\n";
	}
	var close = function(){
		console.log("close실행");
		msgTextArea.value += "서버와 연결끊김...\n";
		setTimeout(function (){
			//재접속
			console.log("재접속 setTimeout실행");
			webSocket = connectWebSocket("ws://localhost:9090/onebyn/socket",message,open,close,error);
		});
	}
	var error = function(){
		console.log("error실행");
		msgTextArea.value += "서버와 연결에러...\n";
	}
	var message = function(msg){
		console.log("message실행");
		msgTextArea.value += msg.data+"\n";
	};


	//송신 버튼을 눌렸을때 이벤트 처리 함수
	function sendMessage(){
		console.log("sendMessage실행");
		/* var user = document.getElementById("user"); */
		var user = "${m.memberId}";
		var message = document.getElementById("textMsg");
		msgTextArea.vlue += user + "(나) : "+message.value+"\n";
		webSocket.send("["+ user +"]"+message.value);
		message.value = "";
	}

	//소켓 종료 버튼 눌렀을때 이벤트 처리 함수
	function disconnect(){
		console.log("disconnect실행");
		webSocket.close();
	}
 

	
	

	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>