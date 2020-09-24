<%@page import="com.nbbang.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	

%>

<style>
#writecontainer {
	border: 1px #ECAF59 solid;
	border-radius: 5px;
	margin-top: 5%;
	margin-bottom: 2%;
	height: 770px;
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
}

.noti {
	/*width:733%;  */
	width: 133%;
	margin: 0px;
	height: 200px;
	display: inline-block;
}

.btn {
	margin: 0 5px 0 5px;
}

</style>



<div class="container" id="writecontainer">
	<div class="form-group">
		<h1>공지 사항 작성</h1>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/notice/noticeWrite">
		<input type="hidden" name="usid" value="${loginnedMember.usid}">
		<input type="hidden" name="nickname" value="${loginnedMember.nickname}">
		<div class="form-group">
				<label for="formGroupExampleInput">공지 사항 제목 : </label>
				<input type="text" name="title" class="form-control" id="formGroupExampleInput" placeholder="공지사항 제목">
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">공지사항 내용 : </label>
			<textarea class="form-control" name="content" id="content" rows="20"></textarea>
		</div>
		<div class="form-group">
			<a href="<%=request.getContextPath()%>/notice/noticeList" class="btn btn-primary">작성 취소</a>
			<input type="submit" class="btn btn-primary" value="작성 완료"></input>
		</div>
	</form>
</div>



<script>
	
CKEDITOR.replace('content');
CKEDITOR.editorConfig = function( config ) {
config.uiColor = red;
config.height = 600;
config.toolbarCanCollapse = true;};
	
	
</script>


<%@ include file="/views/common/footer.jsp"%>