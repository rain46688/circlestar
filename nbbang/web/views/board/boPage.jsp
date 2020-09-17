<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<% 
	Board b = (Board)request.getAttribute("curBoard");
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
  	/* border: solid green; */
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
    border: 1px green solid;
    width: 38em;
    padding-left: 0.5em;
    padding-right: 0.5em;
  }

  #commentInsert {
    margin: 0 auto;
    text-align: center;
  }

  #Comments {
    width: 100%;
  }

  #Comments>ul {
    padding-left: 0.5em;
    list-style: none;
    margin: 0 auto;
  }

  .comment_area {
    width: 100%;
    height: 10em;
    border: 1px red solid;
  }
  .comment_thumb {
    text-align: center;
    position: relative;
    width: 5em;
    float: left;
    border: 1px red solid;
  }
  .comment_box {
    word-break: break-all;
    width: 29em;
    float: left;
    position: relative;
    border: 1px red solid;
  }
  #likeBtn {
  	/* margin-bottom:0.5em; */
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
  }

  #chattingRoom {
    border: 1px red solid;
  }
</style>
<section>
  <div id="wrapper">
    <div id="imageWrapper">
      <img src="<%= request.getContextPath() %>/images/cute.png" alt="" width="700em" height="400em">
      <!-- carousel 적용할 예정 -->
    </div>
    <div id="userInfo">
    	<hr>
      <div id="userThumb"><img src="<%= request.getContextPath() %>/images/bread.png" alt="" width="40px" height="40px"></div>
        <div id="userIdAndAddress">
          <div id="userId"><%= b.getWriterNickname() %>닉네임</div>
          <div id="userAddress"><%= b.getTradeArea()%>거래지</div>
        </div>
      <!-- 프로필 사진 + id -->
      <h5 id="level">신뢰 level</h5>
    </div>
    <div class="content">
      <hr>
      <div id="title">
        <h4>제목</h4>
      </div>
      <div id="date">날짜</div>
      <!-- 가격과 좋아요 버튼 -->
      <div id="priceAndLikeBtn">
          <h5>30,000원</h5>
          <!-- <a href=""><img src="<%= request.getContextPath() %>/images/heart.png" alt="LikeBtn" width="30px" height="30px"></a> -->
      </div>
      <br>
      <div id="contentText">내용</div>
      <div id="etcInfo">관심 , 조회수, 신고하기</div>
    </div>
    <div id="commentSection">
      <div id="commentInsert">
        <form action="">
          <select name="commentTo" id="commentTo">
            <option value="openComment" selected>전체댓글</option>
            <option value="secretComment">비밀댓글</option>
          </select>
          <input type="text" size="48">
          <button>댓글입력</button>
        </form>
      </div>
    <div id="Comments">
      <ul class="comment_list">
        <li class="comment_item">
          <div class="comment_area">
            <div class="comment_thumb">
            <img id="likeBtn" src="<%= request.getContextPath() %>/images/logo.png" alt="" width="30px" height="30px">
            </div>
            <div class="comment_box">
              아이디
            <div class="comment_text">
              내용
            </div>
            <div class="comment_info">
              날짜 시간
            </div>
          </div>
          </div>
        </li>
        <li class="comment_item">
          <div class="comment_area">
            <div class="comment_thumb">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="" width="30px" height="30px">
            </div>
            <div class="comment_box">
              아이디     ㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇㅁㄴㅇㄴasdasdasdasdasdsad
            <div class="comment_text">
              내용 asdasdasdasdsadsa
            </div>
            <div class="comment_info">
              날짜 시간 asdasdasdasd
            </div>
          </div>
          </div>
        </li>
      </ul>
    </div>
    </div>
  </div>
  <div id="chattingRoom">

  </div>
</section>

<%@ include file="/views/common/footer.jsp" %>
