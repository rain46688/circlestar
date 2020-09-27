<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.nbbang.board.model.vo.Card"%>
<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<% 
	Card c = (Card)request.getAttribute("curCard");
	Date enrollDate = c.getCardBoard().getEnrollDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
	String newDate = sdf.format(enrollDate);
	List<Integer> tradeUserList = new ArrayList<Integer>();
	if(request.getAttribute("tradeUserList")!=null){
		tradeUserList = (List<Integer>)request.getAttribute("tradeUserList");
	}
	String reply = new String();
	if(request.getAttribute("reply")!=null) {
		reply = (String)request.getAttribute("reply");
	}
%>
<style>
  #wrapper {
    margin: 0 auto;
    <% if(!(loginnedMember.getUsid()==c.getCardBoard().getWriterUsid()&&c.getCardBoard().getTradeStage()==1)){ %>
    margin-top: 5em;
    <% } %>
    padding-top: 1em;
    width: 45em;
    text-align: center;
    align-items: center;
    margin-bottom: 3em;
    border: 0.5px solid rgb(224, 224, 224);
    border-radius: 1em;
    overflow: auto;
  }

  #imageWrapper {
    margin-bottom: 2em;
  }

  #imageWrapper>img {
    border-radius: 1em;
  }

  #userInfo {
    margin: 0 auto;
  	width:34em;
  	text-align:left;
  	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    font-size: large;
  }

  #userInfo>#level {
    float: right;
    margin-top: 0.5em;
  }

  .content{
    width: 40em;
    margin: 0 auto;
    padding: 0.5em;
    overflow: auto;
  }

  #title {
    text-align: left;
    width: 100%;
    overflow: auto;
    font-weight: bolder;
    font-size: 1.7em;
  }

  #priceAndLikeBtn {
    text-align: left;
    padding-top: 0.5em;
    overflow: auto;
  }

  
  #contentText {
    float: left;
    text-align: left;
    position: relative;
    width: 100%;
    margin-bottom: 2.5em;
  }

  #etcInfo {
    text-align: left;
    font-size: small;
  }
  
  #commentSection {
    text-align: left;
    margin: 0 auto;
    width: 38em;
    padding-left: 0.5em;
    padding-right: 0.5em;
    margin-bottom: 2em;
  }

  #commentInsert {
    width: fluid;
    margin: 0 auto;
    text-align: center;
    height: 2em;
    overflow: auto;
  }

  #Comments {
    width: 100%;
  }

  #Comments>ul {
    padding-left: 0.5em;
    list-style: none;
    margin: 0 auto;
    overflow: auto;
  }

  .comment_area {
    padding-top: 0.5em;
    width: 100%;
    overflow: auto;
  }
  .comment_thumb {
    text-align: center;
    position: relative;
    width: 5em;
    float: left;
  }
  .comment_box {
    word-break: break-all;
    width: 29em;
    float: left;
    position: relative;
  }
  .comment_id {
    font-size: small;
    font-weight: bold;
  }

  .comment_text {
    font-size: 16px;
  }

  .comment_info {
    font-size: small;
    color: darkgray;
    margin-top: 0.25em;
  }
  
  #userThumb {
    float: left;
    margin-right: 4px;
  }
  #userIdAndAddress {
    float: left;
  }
  #userId {
    font-size: 18px;
    font-weight: bold;
  }
  #userAddress {
    font-size: 16px;
  }

  #date {
    text-align: left;
    color: darkgray;
    overflow: auto;
  }
  
  #date p {
    color: darkgreen;
    font-weight: bold;
  }
  #etcInfo a {
  	color:black;
  }
  #titleContent {
    width: 17em;
    height: 2em;
    float: left;
  }
  #titleContent>p {
    font-size: 25px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  #startBtn {
    margin-left: 2.5px;
    float: left;
    font-size: 18px;
  }
  .turnRed {
    background-color: red;
  }
  #userThumb>img {
  	border-radius: 70%;
  }
  #comment_thumb>img {
  	border-radius: 70%;
  }
  #funcBtns {
    padding-top: 0.5em;
    padding-bottom: 0px;
    padding-left: 0em;
    font-size: 12px;
  }
  #funcBtns>ul {
    padding-left: 0.25em;
    list-style: none;
    text-align: left;
  }
  #funcBtns>ul>li {
    display: inline-block;
    text-align: center;
    margin-left:0.5em;
    margin-right: 0.5em;
    padding-bottom: 0px;
    height: 4.5em;
  }
  #funcBtns>ul div {
    cursor: pointer;
  }
  #funcBtns>ul div:hover {
    transform:scale(1.1);
    font-weight: bold;
  }
  #btnForWriter {
   	margin: 0 auto;
  	margin-top:3em;
  	margin-bottom:5px;
  	text-align:right;
  	width:45em;
    font-family:'Do Hyeon', sans-serif;
  }
  #btnForWriter>button {
	height: 2em;
	width: 5em;
	font-size: 20px;
	}

	#btnForWriter>button:hover {
	border: 2px black solid;
	}
</style>
<section>
	<% if(loginnedMember.getUsid()==c.getCardBoard().getWriterUsid()&&c.getCardBoard().getTradeStage()==1){ %>
	<div id="btnForWriter"> 
  		<button onclick="fn_modifyBoard();">수정하기</button>
  		<button onclick="fn_deleteBoard();">삭제하기</button>
  	</div>
  	<%} %>
  <div id="wrapper">
    <div id="imageWrapper">
      <div id="carouselField" name="carouselField" >
        <div id="carouselNB" class="carousel slide " data-ride="carousel" data-interval="false">
          <ol class="carousel-indicators">
      <% for(int i = 0; i < c.getCardFile().getFileName().length; i++)  {%>
            <% if(i==0) { %>
            <li data-target="#carouselInhee" data-slide-to="<%= i %>" class="active"></li>
            <% }else { %>
              <li data-target="#carouselInhee" data-slide-to="<%= i %>"></li>
            <% }} %>
          </ol>
          <div class="carousel-inner" role="listbox">
            <% for(int i = 0; i < c.getCardFile().getFileName().length; i++)  {%>
              <% if(i==0) { %>
            <div class="carousel-item active">
              <img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[i] %>"
                class="d-block w-100" alt="..." width="700em" height="400em">
            </div>
            <% }else { %>
              <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[i] %>"
                  class="d-block w-100" alt="..." width="700em" height="400em">
              </div>
            <% }} %>
          </div>
    
          <a class="carousel-control-prev" href="#carouselNB" role="button"
            data-slide="prev"> <span class="carousel-control-prev-icon"
            aria-hidden="true"></span> <span class="sr-only">Previous</span>
          </a> 
          <a class="carousel-control-next" href="#carouselNB" role="button"
            data-slide="next"> <span class="carousel-control-next-icon"
            aria-hidden="true"></span> <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>
    <div id="userInfo">
    	<hr>
      <div id="userThumb">
        <img src="<%= memberPic + c.getWriterProfile() %>" alt="" width="40px" height="40px">
      </div>
        <div id="userIdAndAddress">
          <div id="userId"><%= c.getCardBoard().getWriterNickname() %></div>
          <div id="userAddress"><%= c.getCardBoard().getTradeArea()%></div>
        </div>
      <!-- 프로필 사진 + id -->
      <h5 id="level">신뢰 level</h5>
    </div>
    <div class="content">
      <hr>
      <div id="title">
        <div id="titleContent"><p><%= c.getCardBoard().getBoardTitle() %></p></div>
        <!-- <button onclick="fun_decidebuy();">n빵하기</button>
        <button onclick="fun_cancelbuy();">취소</button>
        <button onclick="fun_createroom();">인원 차서 방장이 방열기</button>
        <form name="form">
				<!-- 디비에서 객체를 받아와서 다시 넣어야됨 일단은 리터럴로 넘김 -->
					<!-- BOARD 컬럼의  BOARD_ID -->
					<!-- <input type="hidden" name="boardId" value="${curCard.cardBoard.boardId}">  -->
					<!-- BOARD 컬럼의  MAX_MEMS -->
					<!-- <input type="hidden" name="maxMems" value="${curCard.cardBoard.maxMems}">  -->
					<!-- BOARD 컬럼의  TRADE_STAGE -->
					<!-- <input type="hidden" name="tradeStage" value="${curCard.cardBoard.tradeStage}">  -->
					<!-- BOARD 컬럼의  WRITER_USID -->
					<!-- <input type="hidden" name="writerUsid" value="${loginnedMember.usid}"> -->
					<!-- MEMBER 컬럼의  MEMBER_PICTURE -->
          <!-- <input type="hidden" name="memberPicture" value="${loginnedMember.memberPicture}"> -->
          <!-- <%-- <% if(c.getCardBoard().getTradeStage()>1) {%> --%> -->
					<!-- <button onclick="nbbang(this.form)" >채팅방 접속하기</button>	 -->
          <!-- <%-- <%}%> --%> -->
        <!-- </form> -->
      </div>
      
      <div id="date"><%= newDate %> &nbsp&nbsp 관심 <%= c.getCardBoard().getLikeCount() %>  조회수 <%= c.getCardBoard().getHit() %> 
      <p>
      	<% if(tradeUserList.contains(loginnedMember.getUsid())){ %>
          	현재 참여중인 N빵입니다.
            <% }else { %>
            <% } %>
      </p></div>
      <!-- 가격 -->
      <div id="priceAndLikeBtn">
          <h5><%= c.getCardBoard().getProductPrice() %>원</h5>
      </div>
      <div id="contentText"><%= c.getCardBoard().getContent() %></div>
      <div id="etcInfo"><a href="<%= request.getContextPath() %>/member/report?userId=<%= loginnedMember.getUsid() %>&boardId=<%= c.getCardBoard().getBoardId() %>&writerUsid=<%=c.getCardBoard().getWriterUsid()%>">신고하기</a> <%if(c.getCardBoard().getProductUrl()!=null){ %><a href="http://<%= c.getCardBoard().getProductUrl() %>" target="_blank">제품 페이지</a><%} else { %>제품 페이지<%} %></div>
      <hr>
      <div id="funcBtns">
        <ul>
          <form style="display: none;" name="form">
            <!-- 디비에서 객체를 받아와서 다시 넣어야됨 일단은 리터럴로 넘김 -->
              <!-- BOARD 컬럼의  BOARD_ID -->
              <input type="hidden" name="boardId" value="${curCard.cardBoard.boardId}"> 
              <!-- BOARD 컬럼의  MAX_MEMS -->
              <input type="hidden" name="maxMems" value="${curCard.cardBoard.maxMems}"> 
              <!-- BOARD 컬럼의  TRADE_STAGE -->
              <input type="hidden" name="tradeStage" value="${curCard.cardBoard.tradeStage}"> 
              <!-- BOARD 컬럼의  WRITER_USID -->
              <input type="hidden" name="writerUsid" value="${loginnedMember.usid}">
              <!-- MEMBER 컬럼의  MEMBER_PICTURE -->
              <input type="hidden" name="memberPicture" value="${loginnedMember.memberPicture}">
              <!-- <%-- <% if(c.getCardBoard().getTradeStage()>1) {%> --%> -->
              <button id="hiddenEnterBtn" onclick="nbbang(this.form)" >채팅방 접속하기</button>	
              <!-- <%-- <%}%> --%> -->
            </form>
          <li><div id="likeFunc" >
          <% if(!likelist.contains(c.getCardBoard().getBoardId())) {%>
            <img src="<%= request.getContextPath() %>/images/heart.png" width="40px" height="40px">
            <%}if(likelist.contains(c.getCardBoard().getBoardId())) { %>
            <img src="<%= request.getContextPath() %>/images/fullheart.png" width="40px" height="40px">
            <%} %>
            <p>찜하기</p></div></li>
          	<% if(c.getCardBoard().getWriterUsid()!=loginnedMember.getUsid()) {%>
          <li><div id="startFuncBtn" onclick="fun_decidebuy();">
            <% if(tradeUserList.contains(loginnedMember.getUsid())){ %>
            <img src="<%= request.getContextPath() %>/images/cancel.png" width="40px" height="40px">
            <p>N빵취소</p></div></li>
            <% }else { %>
            <img src="<%= request.getContextPath() %>/images/onebyn.png" width="40px" height="40px">
            <p>N빵신청</p></div></li>
            <% } %>
            <% } %>
            <% if(tradeUserList.contains(loginnedMember.getUsid())&&c.getCardBoard().getTradeStage()>1) {%>
          <li><div id="enterFuncBtn" onclick="fn_enterBtn();">
            <img src="<%= request.getContextPath() %>/images/enter.png" width="40px" height="40px">
            <p>채팅방접속</p></div></li>
            <%} %>
            <%if(c.getCardBoard().getWriterUsid()!=loginnedMember.getUsid()){ %>
            <%if(c.getCardBoard().getTradeStage()==2&&tradeUserList.contains(loginnedMember.getUsid())) {%>
          <li><div id="openFuncBtn" onclick="fn_pay();">
            <img src="<%= request.getContextPath() %>/images/dollar.png" width="40px" height="40px">
            <p>결제하기</p></div></li>
            <%} %>
            <%} %>
          <% if(c.getCardBoard().getWriterUsid()==loginnedMember.getUsid()){ %>
          <li><div id="openFuncBtn" onclick="fun_createroom();">
            <img src="<%= request.getContextPath() %>/images/open.png" width="40px" height="40px">
            <p>방열기</p></div></li>
            <%} %>
        </ul>
      </div>
      
      <hr>
    </div>
    <div id="commentSection">
      <div id="commentInsert">
          <select name="commentTo" id="commentTo">
            <option value="openComment" selected>전체댓글</option>
            <option value="secretComment">비밀댓글</option>
          </select>
          <input type="text" id="commentContent" size="48">
          <input type="hidden" id="commentLevel" value="1">
          <button id="commentInsertBtn">댓글입력</button>
      </div>
    <div id="Comments">
      <ul class="comment_list">
        <!-- 댓글이 들어갈 곳 -->
      </ul>
    </div>
    </div>
  </div>
</section>
<script>

function fn_modifyBoard(){
  location.href = "<%=request.getContextPath()%>/board/boardModify?boardId=<%=c.getCardBoard().getBoardId()%>";
}

function fn_deleteBoard(){
  if(confirm('게시물을 삭제하시겠습니까?')){
  location.href = "<%=request.getContextPath()%>/board/boardDelete?boardId=<%=c.getCardBoard().getBoardId()%>&category=<%=c.getCardBoard().getProductCategory()%>";
  }
}

function fn_pay(){
  if(confirm('결제를 진행하시겠습니까?')) {
    location.href="<%=request.getContextPath()%>/board/boardPay?buyerUsid=<%=loginnedMember.getUsid()%>&boardId=<%=c.getCardBoard().getBoardId()%>&productPrice=<%=c.getCardBoard().getProductPrice()%>&writerUsid=<%=c.getCardBoard().getWriterUsid()%>";
  }
}

function fn_enterBtn(){
  $("#hiddenEnterBtn").click();
}

var pop;
window.onunload = function() { 
	pop.close(); 
}
<% if(reply.equals("success")) { %>
function autoReple() {
  $("#commentContent").val('결제했습니다.');
  $("#commentInsertBtn").click();
}
<% } %>

/*  채팅창 관련 로직  */
function nbbang(f){
	var x = 600;
	var y = 800;
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
	
	$.ajax({
		type: "GET",
		/* "boardId":"2" 부분 게시판 id값을 객체로 받아와서 넣기로 변경해야됨 */
		data: {"boardId":"${curCard.cardBoard.boardId}"},
		dataType: "json",
		url: "<%=request.getContextPath()%>/chat/createRoom",
			success : function(data) {
					console.log("data : "+data);
				if (data == 1) {
					//방의 상태를 바꿔야되니 ajax로 갔따오자 방의 상태를 2로 변경함
          alert('채팅방이 생성되었습니다.');
				} else {
					alert('N빵 인원이 다 체워지지 않았습니다.');
				} 
			}
		})
}

function fun_decidebuy(){
	/* 컨트롤 f주의 여기 틀어짐 컨텍스트 부분 */
  if($("#startFuncBtn>img").attr("src")=="<%= request.getContextPath() %>/images/onebyn.png") {
	$.ajax({
		type: "GET",
		/* "boardId":"2" 부분 게시판 id값을 객체로 받아와서 넣기로 변경해야됨 */
		data: {usid : "${loginnedMember.usid}",nickname : "${loginnedMember.nickname}","boardId":"${curCard.cardBoard.boardId}","flag":"1"},
		url: "<%=request.getContextPath()%>/chat/decidebuy",
			success : function(data) {
        $("#startFuncBtn>img").attr("src","<%= request.getContextPath() %>/images/cancel.png");
        $("#startFuncBtn>p").text("N빵취소");
        $("#date p").text("현재 참여중인 N빵입니다.");
      }
		}) 	
	}else {
    $.ajax({
		/* "boardId":"2" 부분 게시판 id값을 객체로 받아와서 넣기로 변경해야됨 */
		data: {usid : "${loginnedMember.usid}",nickname : "${loginnedMember.nickname}","boardId":"${curCard.cardBoard.boardId}","flag":"2"},
		url: "<%=request.getContextPath()%>/chat/decidebuy",
			success : function(data) {
        $("#startFuncBtn>img").attr("src","<%= request.getContextPath() %>/images/onebyn.png");
        $("#startFuncBtn>p").text("N빵신청");
        $("#date p").text("");
			}
		})
  }
}

//취소할때
function fun_cancelbuy() {
	$.ajax({
		/* "boardId":"2" 부분 게시판 id값을 객체로 받아와서 넣기로 변경해야됨 */
		data: {usid : "${loginnedMember.usid}",nickname : "${loginnedMember.nickname}","boardId":"${curCard.cardBoard.boardId}","flag":"2"},
		url: "<%=request.getContextPath()%>/chat/decidebuy",
			success : function(data) {
				location.reload();
			}
		})
}



	$("#commentContent").keypress(function(e){
		if(e.keyCode == 13) {
			$("#commentInsertBtn").click();
			$("#commentContent").val("");
			return false;
		}
	});

    $(document).ready(function () {
        fn_commentList();
        <% if(reply.equals("success")) { %>
        autoReple();
        <% } %>
        console.log("last");
        $("#hideButton").hide();
        $("#likeFunc").click(function (e) {
            if ($("#likeFunc>img").attr("src") == "<%= request.getContextPath() %>/images/heart.png") {
                $.ajax({
                    url: "<%=request.getContextPath()%>/board/boardLike?key=insert",
                    type: "post",
                    dataType: "text",
                    data: {
                        'userUsid': '<%= loginnedMember.getUsid() %>',
                        'boardId': '<%= c.getCardBoard().getBoardId() %>'
                    },
                    success: function (data) {
                        $("#likeFunc>img").attr("src", "<%= request.getContextPath() %>/images/fullheart.png");
                    }
                })
            } else {
                $.ajax({
                    url: "<%=request.getContextPath()%>/board/boardLike?key=delete",
                    type: "post",
                    dataType: "text",
                    data: {
                        'userUsid': '<%= loginnedMember.getUsid() %>',
                        'boardId': '<%= c.getCardBoard().getBoardId() %>'
                    },
                    success: function (data) {
                        $("#likeFunc>img").attr("src", "<%= request.getContextPath() %>/images/heart.png");
                    }
                })
            }
        })
    })

    $("#commentInsertBtn").click(function (e) {
        if ($("#commentContent").val() != null) {
            $.ajax({
                url: "<%=request.getContextPath()%>/board/commentInsert",
                type: "post",
                dataType: "text",
                data: {
                    "cBoardId": "<%= c.getCardBoard().getBoardId() %>",
                    "content": $("#commentContent").val(),
                    "secret": $("#commentTo").val(),
                    "cWriterNickname": "<%= loginnedMember.getNickname() %>",
                    "comLayer": $("#commentLevel").val(),
                    "comProfile": "<%= loginnedMember.getMemberPicture() %>"
                },
                success: function (data) {
                    if (data != "success") {
                        alert("댓글 작성에 실패했습니다.");
                    }
                    fn_commentList(data);
                }
            })
        }
    })

    function fn_commentList() {
        $.ajax({
            url: "<%=request.getContextPath()%>/board/commentList",
            type: "post",
            dataType: "json",
            data: {
                "cBoardId": "<%= c.getCardBoard().getBoardId() %>"
            },
            success: function (data) {
                let html = "";
                $.each(data, function (index, item) {
                    html += "<li class='comment_item'>";
                    html += "<hr>";
                    html += "<div class='comment_area'>";
                    html += "<div class='comment_thumb'>";
                    html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                            " height='30px' style='border-radius: 70%'>";
                    html += "</div>";
                    html += "<div class='comment_box'>";
                    html += "<div class='comment_id'>";
                    html += item.cwriterNickname;
                    html += "</div>";
                    html += "<div class='comment_text'>";
                    html += item.content + "</div>";
                    html += "<div class='comment_info'>";
                    html += item.cenrollDate + " 답글쓰기";
                    html += "</div></div></div></li>"
                });
                $(".comment_list").html(html);
            }
        })
    }
</script>
<%@ include file="/views/common/footer.jsp" %>