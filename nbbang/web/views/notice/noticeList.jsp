<%@page import="com.nbbang.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Notice> list = (List) request.getAttribute("list");
%>

<style>
#writecontainer {
	border: 1px #ECAF59 solid;
	border-radius: 5px;
	margin-top: 5%;
	margin-bottom: 2%;
	height: auto;
	width: 70%;
	float: center;
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
	font-size: 20px;
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
	width: 100%;
}

h1 {
	font-weight: bold;
	text-shadow: -1px 0 #BFBFBF, 0 0.5px #BFBFBF, 0.5px 0 #BFBFBF, 0 -1px
		#BFBFBF;
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
}

.divListBody {
	display: table-row-group;
}

h1 {
	margin: 15px 0 10px 0;
}

.btn {
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
	margin-top:15px;
	margin-left:10px;
	font-size:20px;
	font-weight:bold;
}

.empty{
	float:center;
	font-size:20px;
	font-weight:bold;
		margin-top:15px;
	margin-left:10px;
}
</style>




<div id="container">

	<!-- 사이드바 넣어야되나???? 누가 넣어줘라 -->


	<div class="container" id="writecontainer">
		<div class="form-group">
			<h1>공지 사항</h1>
		</div>
		<button onclick="location.href='<%=request.getContextPath() %>/notice/noticeWrite'" class="btn btn-success">공지 등록</button>
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
					<div class="divCell"><%=n.getNoticeDate()%></div>
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