<%@page import="com.nbbang.board.model.vo.Card"%>
<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<% 
	Card c = (Card)request.getAttribute("curCard");
%>
<style>
  #wrapper {
    margin: 0 auto;
    margin-top: 3em;
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


  #startBtn>button {
    width: 5em;
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
  #likeBtn, #startBtn {
    /* width: 5em; */
    margin-left: 2.5px;
    text-align: right;
    float: right;
    font-size: 20px;
  }
</style>
<section>
  <div id="wrapper">
    <div id="imageWrapper">
      <img src="<%= request.getContextPath() %>/upload/images/<%= c.getCardFile().getFileName()[0] %>" alt="" width="700em" height="400em">
      <!-- carousel 적용할 예정 -->
    </div>
    <div id="userInfo">
    	<hr>
      <div id="userThumb"><img src="<%= request.getContextPath() %>/images/bread.png" alt="" width="40px" height="40px"></div>
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
        <div id="titleContent"><p><%= c.getCardBoard().getBoardTitle() %>가나다라마바사아만아답자당마자다나아자</p></div>
        <div id="startBtn"><button>n빵하기</button></div>
        <div id="likeBtn"><button>❤️</button></div>
      </div>
      
      <div id="date"><%= c.getCardBoard().getEnrollDate() %> <%= c.getCardBoard().getLikeCount() %> 관심 <%= c.getCardBoard().getHit() %> 조회수 </div>
      <!-- 가격 -->
      <div id="priceAndLikeBtn">
          <h5><%= c.getCardBoard().getProductPrice() %>원</h5>
          <!-- <a href=""><img src="<%= request.getContextPath() %>/images/heart.png" alt="LikeBtn" width="30px" height="30px"></a> -->
      </div>
      <br>
      <div id="contentText"><%= c.getCardBoard().getContent() %></div>
      <div id="etcInfo"><a href="#">신고하기</a> <a href="#">제품 페이지</a></div>
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
        <li class="comment_item">
          <hr>
          <div class="comment_area">
            <div class="comment_thumb">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="" width="30px" height="30px">
            </div>
            <div class="comment_box">
              <div class="comment_id">
                아이디
              </div>
            <div class="comment_text">
              내용
            </div>
            <div class="comment_info">
              1993.01.11 19:33 답글쓰기 
            </div>
          </div>
          </div>
        </li>
      </ul>
    </div>
    </div>
  </div>
</section>
<script>
  $(document).ready(function(){
    fn_commentList();
  })

  $("#likeBtn").click(function(e){
    $.ajax({
      url:"<%=request.getContextPath()%>/board/boardLike",
      type:"post",
      dataType:"text",
      data : {
        'userUsid':'<%= loginnedMember.getUsid() %>',
        'boardId':'<%= c.getCardBoard().getBoardId() %>'
      },
      success : function(data){
        $("#likeBtn>button").css("background-color","yellow");
        console.log(data);
      }
    })
  })
  $("#commentInsertBtn").click(function(e){
    if($("#commentContent").val()!=null) {
    $.ajax({
      url:"<%=request.getContextPath()%>/board/commentInsert",
      type:"post",
      dataType:"text",
      data : {
        "cBoardId" : "<%= c.getCardBoard().getBoardId() %>",
        "content" : $("#commentContent").val(),
        "secret" : $("#commentTo").val(),
        "cWriterNickname" : "<%= loginnedMember.getNickname() %>",
        "comLayer" : $("#commentLevel").val(),
        "comProfile" : "<%= loginnedMember.getMemberPicture() %>"
      },
      success : function(data){
        if(data!="success") {
          alert("댓글 작성에 실패했습니다.");
        }
        fn_commentList(data);
      }
    })
    }
  })

  function fn_commentList(){
    $.ajax({
      url:"<%=request.getContextPath()%>/board/commentList",
      type:"post",
      dataType:"json",
      data:{
        "cBoardId" : "<%= c.getCardBoard().getBoardId() %>"
      },
      success:function(data){
        let html = "";
        $.each(data, function(index, item){
          html += "<li class='comment_item'>";
          html += "<hr>";
          html += "<div class='comment_area'>";
          html += "<div class='comment_thumb'>";
          html += "<img src='<%= request.getContextPath() %>/images/logo.png' alt='' width='30px' height='30px'>";
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

  $("#startBtn").click(function(e){

  })

</script>
<%@ include file="/views/common/footer.jsp" %>