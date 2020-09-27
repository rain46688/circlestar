<%@page import="com.nbbang.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Notice> list = (List) request.getAttribute("list");
%>

<style>
#writecontainer {
/* 	border: 1px #ECAF59 solid; */
	border-radius: 5px;
	margin-top: 5%;
	margin-bottom: 2%;
	height: auto;
/* 	width: 62%; */
	 width: 70%; 
	float: right;
}

.divList {
	display: table;
	width: 100%;
	height: 150px;
	text-align: center;
}

.divRow {
	display: table-row;
}

.divRowTitle {
	display: table-row;
	font-size: 15px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	width: 100%;
}

h2 {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px #BFBFBF;
	margin: 15px 0 10px 0;
}

.active {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
}

.divCell, .divTableHead {
	border-bottom: 1px #DEE2E6 solid;
	display: table-cell;
	padding: 25px 10px;
	width: 16.67%;
	font-size:15px;
}

.divListBody {
	display: table-row-group;
}


#n_btn {
	float: right;
	margin:0 10px 10px 0;
}

.noti {
	/*width:733%;  */
	width: 133%;
	margin: 0px;
	height: 200px;
	display: inline-block;
}

.noContent {
	margin-top:20px;
	margin-bottom:15px;
	margin-left:100%;
	font-size:15px;
	font-weight:bold;
	width:100%;
}

.empty{
	margin-top:20px;
	font-weight:bold;
		margin-top:15px;
	margin-left:150%;
		width:100%;
			font-size:15px;
}

#side{
float:left;

}

#container{
margin-left:auto;
margin-right:auto;
}





/* 인희꺼 사이드바 */

div#myPageSideBar{
        position: relative;
        background: white;
        text-align: center;
        margin: 3% 3% 3% 20%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 14%;
        float: left;
        font-family: 'Do Hyeon', sans-serif;
    }
    div#sideBarTitleContainer{
        background-color: rgb(243, 183, 24);
        padding: 6%;
        color: white;
        border: 1px black solid;
    }
    p#sideBarTitle{
        font-size: 2.5em;
        margin-top: 10%;
    }
    p#sideBarText{
        font-size: 1.3em;
        margin-bottom: 10%;
    }
    div#sideBarLinkContainer{
        border: darkgrey 1px solid;
        border-top: none;
        padding: 10%;
        border: 1px black solid;
        border-top: none;
    }
    
        .postList{
        font-size: 1.3em;
        text-align: left;
    }
    .postList:hover{
        color: rgb(243, 183, 24);
    }


/* 인희꺼 가져옴 ㅋㅋ */

   div#writecontainer{
        position: relative;
	    background: #FFFFFF;
	    text-align: center;
        margin: 3% 21% 5% 2%;
        /* 세로정렬꽉차게 가운데:center */
        align-items: stretch;
        /* 가로정렬꽉차게 가운데:center */
        justify-items: stretch;
        width: 40%;
        float: left;
    }


</style>




<div>

<div id="myPageSideBar">
            <div id="sideBarTitleContainer">
                <p id="sideBarTitle">고객센터</p>
                <p class="sideBarText">N빵은 고객님의<br><span>고민을</span><br>N빵해드립니다.</p>
            </div>
            <div id="sideBarLinkContainer">
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/customerMain">소개글</a>
                </div>
                  <% if(!loginnedMember.getNickname().equals("ADMIN")) {%>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/customer/customerQnA">문의하기</a>
                </div>
                  <%} else { %>
                           <a class="nav-link postList" href="<%=request.getContextPath()%>/admin/adminCustomerList?a=0">문의보기</a>
                     <%} %>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/notice/noticeList">소식보기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/customerFaq">FAQ</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>#">홈</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>#">구경하기</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>#">해외직구</a>
                </div>
                <div>
                    <a class="nav-link postList" href="<%=request.getContextPath()%>/member/myPage?usid=<%=loginnedMember.getUsid()%>">마이페이지</a>
                </div>
            </div>
        </div>

	<div id="writecontainer">
		<div class="form-group">
			<h2>공지 사항</h2>
		</div>
		<% if(loginnedMember.getNickname().equals("ADMIN")) {%>
		<button onclick="location.href='<%=request.getContextPath() %>/notice/noticeWrite'" id="n_btn" class="btn btn-success">공지 등록</button>
		<%} %>
		<div class="divList">
			<div class="divListBody">

				<div class="divRowTitle shadow p-3 mb-5 bg-white rounded">
					<div class="divCell">공지 ID</div>
					<div class="divCell">관리자명</div>
					<div class="divCell">제목</div>
					<div class="divCell">등록 날짜</div>
				</div>
				<%
					if(!list.isEmpty()){
					for (Notice n : list) {
				%>
				<div class="divRow shadow p-3 mb-5 bg-white rounded" style="cursor: pointer">
					<div class="divCell"><%=n.getNoticeId()%></div>
					<div class="divCell"><%=n.getNoticeWriteNickname()%></div>
					<div class="divCell"><%=n.getNoticeTitle()%></div>
					<div class="divCell"><%=n.getTimestamp()%></div>
				</div>
				<div class="noti">
					<div class="noContent"><%=n.getNoticeContent()%></div>

				</div>

				<%
					}
				}else {
				%>

					<div class="empty">등록된 공지 글이 없습니다.</div>

				
				<%} %>

				<br>
			</div>
		</div>

		<nav aria-lable="Page navigation" id="pagebar">
			<ul class="pagination justify-content-center">
				<%=request.getAttribute("pageBar")%>
			</ul>
		</nav>

	</div>
</div>






<script>

$(function(){
	$(".noti").slideToggle('fast', function() {
	     });
})
	
$(".divRow").click(e=>{
   $(e.target).parent().next().slideToggle('slow', function() {
	 /*   $(e.target).parent().next().html("<p>"+2343234+"</p>"); */
	
     });
   $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
})




   $('.divRow').hover(function(){
        $(this).css('color','#FFC107');
        $(this).removeClass( 'shadow p-3 mb-5 bg-white rounded' );
    }, function() {
        $(this).css('color','black');
        $(this).addClass( 'shadow p-3 mb-5 bg-white rounded' );
    });
	
</script>


<%@ include file="/views/common/footer.jsp"%>