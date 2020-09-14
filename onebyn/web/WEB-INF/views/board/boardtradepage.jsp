<%@page import="onebyn.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/tradeboard.css" rel="stylesheet">


<%
	String id = request.getParameter("id");
String[] blist = request.getParameterValues("blist");
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
							<button type="button" class="btn btn-success green addbtn delcomment" id="addcomment">
								<i class='fa fa-share'></i> 댓글작성
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

						<!-- 
						여기서 if문으로 분기를 나눠야됨 
						현재 방에 들어와서 db에 curlist에 이름이있으면 구매확정이 안보이고 채팅방 열기가 보이게
						그러면 밑에 조건식은 필요없어짐 이미 글 작성자는 구매확정 리스트에 있으니
						나중에 바꿔보기
						 -->
						<div id="ctest">

							<c:set var="loop_flag" value="false" />
							<c:set var="buser" value="false" />
							<c:forEach var="bl" items="${blist}" varStatus="st">
								<c:if test="${not loop_flag }">
									<c:if test="${m.memberId == bl}">
										<c:set var="buser" value="true" />
										<c:set var="loop_flag" value="true" />
									</c:if>
									<c:if test="${m.memberId != bl}">
										<c:set var="buser" value="false" />
									</c:if>
								</c:if>
							</c:forEach>

							<c:if test="${buser}">
								<h2>N빵 인원이 모일때까지 기다려주세요</h2>
								<!-- 방장일때만 채팅방 열기가 보임!!
								채팅이 열린 상태로 변경되면 채팅방 입장으로 다른 유저들도 볼수있게하기 -->
								<c:if test="${m.memberId == b.writerId}">
									<button onclick="fun_createroom()">채팅방 열기!</button>
								</c:if>
							</c:if>
							<c:if test="${!buser}">
								<h2>
									정말 구매할꺼면 <br>누르세요
								</h2>
								<button onclick="fun_decidebuy()">구매 확정!</button>
							</c:if>

						</div>
						<br>
						<div>
							<label for="formControlRange">N빵 인원 수</label><br>
							<progress value="${curnum}" max="${b.maxMems}"></progress>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>





$(function(){
	//온로드
	
	
	
	//텍스트 출력 창 글 못쓰게 막기
	$("#msgTextArea").attr("readonly", true);

	//주기마다 댓글창 갱신 인터벌
 	function re(){
		 console.log("printCom");
		 printCom();
		}
		setInterval(re, 10000); 
	
		//댓글 등록하기
    $("#addcomment").click(function(){
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
    
    		
    

		
		
	
	
		
//온로드 닫힘
});

function printCom(){
	
	const curuser = "${m.memberId}";
	const boarduser = "${b.writerId}";
/* 	console.log("boarduser : "+boarduser); */
	/* writerId */
	$.ajax({
		url: "<%=request.getContextPath()%>/board/addComment.do",
        type: "POST",
        dataType:"json",
        data: {board_id : ${b.boardId}},
        success: function (data) { 
        	$("#commentbdiv").text("");
          	var print = ""; 
          	var num=0;
          	let d=$("<div>");
        	$.each(data,function(i,v){
        		num++;
        		  print += "<div>";
        		/* console.log(v["cwriterId"]+" "+curuser+" "+v["secret"]) */
        		if(!v["secret"]){//시크릿 댓글이 아닌경우
        			if(v["cwriterId"] == curuser || curuser == 'ADMIN'){
        				//댓글 작성자 혹은 관리자는 댓글을 삭제할수있다.
                		print += "&nbsp;&nbsp; <label id='comlabel'>" + v["cwriterId"] + "</label>&nbsp;&nbsp; <button type='button' onclick='del_fun(event);' class='btn btn-success green delcomment' name='del'><i class='fa fa-share'></i> 댓글삭제</button>"; 
        			}else{
        				print += "&nbsp;&nbsp; <label id='comlabel'>" + v["cwriterId"] + "</label>&nbsp;&nbsp;";
        			}
                	print += "&nbsp;&nbsp;&nbsp;&nbsp;<label id='comlabel'>" + v["cenrollDate"]+"</label>";
                	print += "<h4>" + v["comment"] + "</h4>";
                	print +="<hr><input type='hidden' id='com"+(num+1)+"' value='"+v["comId"]+"'></div>";
        		}else{//시크릿 댓글인 경우
        			if(v["cwriterId"] == curuser || curuser == 'ADMIN' || curuser == boarduser){
        				//글 작성자 혹은 관리자 혹은 댓글 작성자는 볼수있다.
        				if(v["cwriterId"] == curuser || curuser == 'ADMIN'){
        					//댓글 작성자 혹은 관리자는 댓글을 삭제할수있다.
                    		print += "&nbsp;&nbsp; <label id='comlabel'>" + v["cwriterId"] + "</label>&nbsp;&nbsp; <button type='button' onclick='del_fun(event);' class='btn btn-success green delcomment' name='del'><i class='fa fa-share'></i> 댓글삭제</button>"; 
            			}else{
            				print += "&nbsp;&nbsp; <label id='comlabel'>" + v["cwriterId"] + "</label>&nbsp;&nbsp;";
            			}
        			  	print += "&nbsp;&nbsp;&nbsp;&nbsp;<label id='comlabel'>" + v["cenrollDate"]+"</label>&nbsp;<label><small>- 비밀 댓글입니다 -</small></label>";
                    	print += "<h4>" + v["comment"] + "</h4>";
                    	print +="<hr><input type='hidden' id='com"+(num+1)+"' value='"+v["comId"]+"'></div>";
        			}else{
        				//자신이 댓글 작성자 관리자 글 작성자가 아니면 시크릿 댓글은 볼수없다.
        			print += "<h4>" + "비밀 댓글입니다." + "</h4><br><hr>";
        			}
                	}
        	})
              	$("#commentbdiv").html(print); 
              	$(".com_count").html(num);
        }
	})
	}printCom(); 

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
                e.target.parentNode.remove(); 
                printCom();
            }
        });
} 


//구매 확정누르면 넘어감
function fun_decidebuy(){
	$.ajax({
		type: "GET",
		data: {user : "${m.memberId}",bid:"${b.boardId}"},
		url: "<%=request.getContextPath()%>/decidebuy.do",
		success:function(data){
			console.log(data);

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
		data:{"bid":"${b.boardId}"},
		url: "<%=request.getContextPath()%>/chatroom.do",
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





 

	
	

	
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>