<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%Member m=(Member)request.getAttribute("member") %>
<style>
.infoContainer {
   display: grid;
   grid-template-columns: repeat(2, 1fr);
   grid-template-rows: repeat(5, 1fr);
   column-gap: 2%;
   row-gap: 5%;
   margin: 5% 30%;
   /* 세로정렬꽉차게 가운데:center */
   align-items: stretch;
   /* 가로정렬꽉차게 가운데:center */
   justify-items: stretch;
   width: 40%;
}
div#infoContainer .item:nth-child(1) {
   grid-column-start: 1;
   grid-column-end: 3;
   grid-row-start: 1;
   grid-row-end: 2;
}
.infoContainer>.item{
   min-height: 200px;
   border: 1px solid rgb(236, 175, 89);
   border-radius: 3px
   ;
   background-color: white;
}
div#headContainer{
   display: flex;
}
div#profilePicDiv{
   position: relative;
   width: 20%;
   float: left;
   display: flex;
   justify-content: center;
   align-items: center;
}
div#memberInfo{
   width: 80%;
   float: right;
}
div#profilePicField{
   position: relative;
   margin: auto;
   border-radius: 50%;
   height: 9em;
   width: 10em;
   border: 1px black solid;
   display: flex;
   justify-content: center;
   align-items: center;
   margin-left: 1em;
}
div#memberInfo, div.smallBox{
   padding: 5%;
}
p.title{
   font-size: 1.5em;
}
p.text{
   padding: 0 5px;
   font-size: 1em;
}
p>button{
    margin:0;
}
p.title>span{
	margin-bottom:5px;
}
button#chargebtn{
	border:none;
	border-radius: 10px;
	background-color: rgb(236, 175, 89);
	color:white;
}
</style>
<section>
   <div id="infoContainer" name="infoContainer" class="infoContainer">
      <div class="item" id="headContainer">
         <div id="profilePicDiv">
            <div id="profilePicField">
               <div id="profilePic">^^</div>
            </div>
         </div>
         <div id="memberInfo">
            <p class="title"><%=m.getMemberId() %>님의 마이페이지</p>
            <span>회원등급:&nbsp;</span>&nbsp;&nbsp;<span>가용포인트:&nbsp;</span>&nbsp;<button type="button" id="chargebtn">충전하기</button><br>
            <span>총 개설 가능한 방 개수:&nbsp;</span>&nbsp;&nbsp;<span>개설 중인 방 개수:&nbsp;</span><br>
            <span>가입일:&nbsp;</span>&nbsp;&nbsp;<span>신고당한 횟수:&nbsp;</span><br>
           
         </div>
      </div>
      <div class="item smallBox" id="crntList">
         <p class="title">거래 중인 게시물</p>
         <p class="text">거래 중인 게시물 목록으로 이동합니다.</p>
         <p><button type="button" class="btn btn-outline-warning">이동하기</button></p>
      </div>
      <div class="item smallBox" id="pastList">
         <p class="title">과거 거래 내역</p>
         <p class="text">과거 거래 내역을 확인합니다.</p>
         <p><button type="button" class="btn btn-outline-warning">이동하기</button></p>
      </div>
      <div class="item smallBox" id="profileModify">
         <p class="title">프로필 수정하기</p>
         <p class="text">닉네임 및 프로필 사진을 수정해보세요.</p>
         <p><button type="button" class="btn btn-outline-warning">수정하기</button></p>
      </div>
      <div class="item smallBox" id="pwModify">
         <p class="title">비밀번호 수정하기</p>
         <p class="text">비밀번호 수정으로 개인정보를 보호하세요.</p>
         <p><button type="button" class="btn btn-outline-warning">수정하기</button></p>
      </div>
      <div class="item smallBox" id="commuModify">
         <p class="title">연락처 수정하기</p>
         <p class="text">이름, 전화번호, 주소, 이메일 수정이 가능합니다.</p>
         <p><button type="button" class="btn btn-outline-warning">수정하기</button></p>
      </div>
      <div></div>
   </div>
</section>
<%@ include file="/views/common/footer.jsp" %>