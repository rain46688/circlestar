<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<style>
.infoContainer {
   display: grid;
   grid-template-columns: repeat(2, 1fr);
   grid-template-rows: repeat(8, 1fr);
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
   border: 2px solid black;
   background-color: white;
}
div#headContainer{
   display: flex;
   border-radius: 15px;
}
div.profilePicDiv{
   position: relative;
   width: 35%;
   float: left;
   display: flex;
   justify-content: center;
   align-items: center;
}
#profilePicField{
   position: relative;
   margin: auto;
   border-radius: 70%;
   height: 10em;
   width: 10em;
   border: none;
   display: flex;
   justify-content: center;
   align-items: center;
   margin-left: 1em;
   margin-right: 1em;
}
div#memberInfo{
   width: 65%;
   float: right;
   padding: 3%;
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
   <%if(loginnedMember.getUsid()!=9999){%>
	   <div id="infoContainer" name="infoContainer" class="infoContainer">
	      <div class="item" id="headContainer">
	         <div class="profilePicDiv" style="min-width: 180px;">
	            <img id="profilePicField" src="<%=memberPic+m.getMemberPicture() %>" alt="프사">
	         </div>
	         <div id="memberInfo">
	            <p class="title"><%=m.getNickname() %>님의 마이페이지</p>
	            <p class="memberInfoText">&nbsp;회원등급:&nbsp;<%=request.getAttribute("grade") %></p>
	            <span class="memberInfoText">가용포인트:&nbsp;<%=m.getPoint() %>&nbsp;&nbsp;<button type="button" class="realBtn" id="chargebtn" onclick="fn_chargePoint();">충전하기</button></span><br>
	            <p class="memberInfoText">&nbsp;개설 가능한 방 개수:&nbsp;<%=request.getAttribute("maxRoomCount") %></p><br>
	            <p class="memberInfoText">&nbsp;가입일:&nbsp;<%=m.getEnrollDate() %></p>
	            <span class="memberInfoText">신고당한 횟수:&nbsp;<%=request.getAttribute("reportCount") %></span><br>
	            <form action="" name="chargePoint">
	            	<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	            </form>
	         </div>
	      </div>
	      <div class="item smallBox" id="iCreateList">
	         <p class="title">내가 만든 거래</p>
	         <p class="text">내가 만든 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/iCreateList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="waitList">
	         <p class="title">신청한 거래</p>
	         <p class="text">다른 참여자를 기다리는 중인 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/waitList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="onGoingList">
	         <p class="title">시작된 거래</p>
	         <p class="text">N빵이 시작된 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/onGoingList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="pastList">
	         <p class="title">과거 거래 내역</p>
	         <p class="text">과거 거래 내역을 확인합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/pastList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="LikeList">
	         <p class="title">좋아요 한 게시글</p>
	         <p class="text">좋아요를 누른 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="profileModify">
	         <p class="title">프로필 수정하기</p>
	         <p class="text">닉네임 및 프로필 사진을 수정해보세요.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	         	onclick="location.href='<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>'">수정하기</button></p>
	      </div>
	      <div class="item smallBox" id="pwModify">
	         <p class="title">비밀번호 수정하기</p>
	         <p class="text">비밀번호 수정으로 개인정보를 보호하세요.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	         	onclick="location.href='<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>'">수정하기</button></p>
	      </div>
	      <div class="item smallBox" id="commuModify">
	         <p class="title">개인정보 확인하기</p>
	         <p class="text">개인정보를 확인 및 수정할 수 있습니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	         	onclick="location.href='<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>'">확인하기</button></p>
	      </div>
	         <div class="item smallBox" id="report">
	            <p class="title">내 신고 내역</p>
	            <p class="text">나의 신고 내용과 관리자의 답변을 확인할 수 있습니다.</p>
	            <p class="bottomBtn"><button type="button" class="realBtn"
	               onclick="location.href='<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>'">확인하기</button></p>
	         </div>
	      <div></div>
      </div>
   <!-- 관리자페이지 -->
   <%}else{ %>
      <div id="infoContainer" name="infoContainer" class="infoContainer">
	      <div class="item" id="headContainer">
	         <div class="profilePicDiv" style="min-width: 180px;">
	            <img id="profilePicField" src="<%=memberPic+m.getMemberPicture() %>" alt="프사">
	         </div>
	         <div id="memberInfo">
	            <p class="title"><%=m.getNickname() %>님의 마이페이지</p>
	            <p class="memberInfoText">&nbsp;회원등급:&nbsp;<%=request.getAttribute("grade") %></p>
	            <span class="memberInfoText">가용포인트:&nbsp;<%=m.getPoint() %>&nbsp;&nbsp;<button type="button" class="realBtn" id="chargebtn" onclick="fn_chargePoint();">충전하기</button></span><br>
	            <p class="memberInfoText">&nbsp;개설 가능한 방 개수:&nbsp;<%=request.getAttribute("maxRoomCount") %></p><br>
	            <p class="memberInfoText">&nbsp;가입일:&nbsp;<%=m.getEnrollDate() %></p>
	            <span class="memberInfoText">신고당한 횟수:&nbsp;<%=request.getAttribute("reportCount") %></span><br>
	            <form action="" name="chargePoint">
	            	<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	            </form>
	         </div>
	      </div>
	      <div class="item smallBox" id="iCreateList">
	         <p class="title">내가 만든 거래</p>
	         <p class="text">내가 만든 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/iCreateList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="waitList">
	         <p class="title">신청한 거래</p>
	         <p class="text">다른 참여자를 기다리는 중인 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/waitList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="onGoingList">
	         <p class="title">시작된 거래</p>
	         <p class="text">N빵이 시작된 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/onGoingList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="pastList">
	         <p class="title">과거 거래 내역</p>
	         <p class="text">과거 거래 내역을 확인합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/pastList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="LikeList">
	         <p class="title">좋아요 한 게시글</p>
	         <p class="text">좋아요를 누른 거래 게시글 목록으로 이동합니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	            onclick="location.href='<%=request.getContextPath()%>/member/likeList?usid=<%=loginnedMember.getUsid()%>'">이동하기</button></p>
	      </div>
	      <div class="item smallBox" id="profileModify">
	         <p class="title">프로필 수정하기</p>
	         <p class="text">닉네임 및 프로필 사진을 수정해보세요.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	         	onclick="location.href='<%=request.getContextPath()%>/member/modifyProfile?usid=<%=loginnedMember.getUsid()%>'">수정하기</button></p>
	      </div>
	      <div class="item smallBox" id="pwModify">
	         <p class="title">비밀번호 수정하기</p>
	         <p class="text">비밀번호 수정으로 개인정보를 보호하세요.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	         	onclick="location.href='<%=request.getContextPath()%>/member/updatePw?usid=<%=loginnedMember.getUsid()%>'">수정하기</button></p>
	      </div>
	      <div class="item smallBox" id="commuModify">
	         <p class="title">개인정보 확인하기</p>
	         <p class="text">개인정보를 확인 및 수정할 수 있습니다.</p>
	         <p class="bottomBtn"><button type="button" class="realBtn"
	         	onclick="location.href='<%=request.getContextPath()%>/member/memberInfo?usid=<%=loginnedMember.getUsid()%>'">확인하기</button></p>
	      </div>
	         <div class="item smallBox" id="report">
	            <p class="title">신고 접수 내역</p>
	            <p class="text">접수된 신고 내역을 확인할 수 있습니다.</p>
	            <p class="bottomBtn"><button type="button" class="realBtn"
	               onclick="location.href='<%=request.getContextPath()%>/member/reportList?usid=<%=loginnedMember.getUsid()%>'">확인하기</button></p>
	         </div>
	      <div></div>
	   </div>
	<%} %>
   <script>
      function fn_chargePoint(){
         const url="<%=request.getContextPath()%>/member/chargePoint";
			const title="chargePoint";
			const status="left=500px,top=100px,width=500px,height=660px";

			open("",title,status);

			chargePoint.target=title;
			chargePoint.action=url;
			chargePoint.method="post";

			chargePoint.submit();
      }
   </script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</section>
<%@ include file="/views/common/footer.jsp" %>