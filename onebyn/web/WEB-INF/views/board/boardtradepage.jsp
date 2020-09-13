<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/tradeboard.css" rel="stylesheet">

<%
	String id = request.getParameter("id");
%>


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

처음에는 
구매 확정 버튼이있음 게시글 작성자(방장)의 경우 채팅방 열기 버튼도있음
구매 확정 버튼을 누르면 누른사람 아이디가 정산되고
방장이 채팅방 열기를 누르면 js함수가 호출되며 ajax로 "/chatroom.do" 서블릿으로 전달됨
전달된 값을 DB에 "현재 회원 리스트" 넣고 게시물 상태를 다음 단계로 변경함
그리고 값을 분리해서  chatroom.jsp로 넘기고 
Soket.java로 가져가서 if문으로 채팅을 분기해서 뿌려줌
이상 뇌피셜 해봐야안다...




-->

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
						<div id="ctest">
							<h2>
								정말 구매할꺼면 <br>누르세요
							</h2>
							<c:if test="${m.memberId != b.writerId}">
								<button onclick="fun_decidebuy()">구매 확정!</button>
							</c:if>
						</div>
						<c:if test="${m.memberId == b.writerId}">
							<!-- 글쓴이만 방만들기 가능 -->
							<button onclick="fun_createroom()">채팅방 열기!</button>
						</c:if>


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
		
		
	
		
		

});





//구매 확정누르면 넘어감
function fun_decidebuy(){

	$.ajax({
		type: "GET",
		data: {user : "${m.memberId}"},
		url: "<%=request.getContextPath()%>/decidebuy.do",
		success:function(data){
			console.log(data);
			$("#ctest").html("<h2>N빵 인원이 모일때까지 기다려주세요</h2><br><button onclick='fun_cancelbuy()'>취소하기</button>");
			/*
			$("#side").html("");
			$("#side").html(data); 
			*/
			
		}
	})
	
}

//채팅방 열기!
function fun_createroom(){
<%-- 	var idd = <%=id%>;
	console.log("idd : "+idd);
	var id;
	
	if(idd == null){
	id += "${m.memberId}";
	}else{
		id += (idd+",${m.memberId}");
	} --%>
	
	$.ajax({
		type: "GET",
		url: "<%=request.getContextPath()%>/chatroom.do?id=${m.memberId}",
		success:function(data){
			console.log(data);
			$("#side").html("");
			$("#side").html(data);
		}
	})
	// 다른 페이지 가져와서 뿌려줄수있음!! 
}

//취소할때
function fun_cancelbuy(){
	console.log("fun_cancelbuy");
}


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


 

	
	

	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>