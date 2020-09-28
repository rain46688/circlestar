<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%

%>
<style>
.infoContainer {
   display: grid;
   grid-template-columns: repeat(2, 1fr);
   grid-template-rows: repeat(3, 1fr);
   column-gap: 2%;
   row-gap: 5%;
   margin: 3% 30%;
   /* 세로정렬꽉차게 가운데:center */
   align-items: stretch;
   /* 가로정렬꽉차게 가운데:center */
   justify-items: stretch;
   width: 40%;
}
.infoContainer>.item{
   min-height: 200px;
   border: 2px solid black;
   background-color: white;
}
div#headContainer{
   text-align: center;
   font-family: 'Do Hyeon', sans-serif;
   font-size: 2em;
   margin-top: 3%;
}
div.smallBox{
   position: relative;
   height: auto;
   padding: 5%;
   border-radius: 15px;
}
p.title{
   font-size: 1.5em;
   font-family: 'Do Hyeon', sans-serif;
}
p.text{
   padding: 0 5px;
   font-size: 1em;
}
.bottomBtn{
   position: absolute;
   margin-bottom: 5%;
   bottom: 0px;
}
.realBtn{
   background-color: #ecaf59;
   color: white;
   border: none;
   font-family: 'Do Hyeon', sans-serif;
   font-size: 1.2em;
   border-radius: 10px;
   width: 4em;
}
p>button{
    margin:0;
}
.memberInfoText{
   margin-bottom:15px;
   margin-right: 20px;
   display: inline-block;
}
</style>
<section>
      <div id="headContainer">
         관리자 페이지
      </div>
      <div id="infoContainer" name="infoContainer" class="infoContainer">
	      <div class="item smallBox" id="iCreateList">
	         <p class="title">회원 관리</p>
	         <p class="text">회원 관리 페이지로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/admin/memberInfoList'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="waitList">
	         <p class="title">게시판 관리</p>
	         <p class="text">게시판 관리 페이지로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/admin/boardInfoList'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="onGoingList">
	         <p class="title">신고 보기</p>
	         <p class="text">접수된 신고 내역을 보여줍니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="pastList">
	         <p class="title">문의 보기</p>
	         <p class="text">접수된 문의 내역을 보여줍니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/admin/adminCustomerList?a=0'">이동하기</button></p>
	      </div>
	      <div></div>
	   </div>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</section>
<%@ include file="/views/common/footer.jsp" %>