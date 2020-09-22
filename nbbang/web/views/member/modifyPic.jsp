<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<style>
	.btn{
		border: 1px black solid;
	}
	.btn-file{
		position: relative;
		overflow: hidden;
	}
	.btn-file input[type=file]{
		position:absolute;
		top: 0;
		right: 0;
		min-width: 100%;
		min-height: 100%;
		font-size: 100px;
		text-align: right;
		filter: alpha(opacity=0);
		opacity: 0;
		outline: none;
		background: white;
		cursor: inherit;
		display: block;
	}
</style>
<div>
	<form id="modifyProfilePic" action="<%=request.getContextPath()%>/member/modifyPicCpl" enctype="multipart/form-data" method="post">
		<div>
			<p>미리보기</p>
		</div>
		<span class="btn btn-default btn-file">
			클릭하여 이미지를 업로드하세요. <input type="file" name="userProfile">
		</span>
		<button type="button" class="pcbtn">수정</button>
		<button type="button" class="pcbtn" onclick="fn_resetTheForm();">수정취소</button>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
</div>
<script>
	function fn_resetTheForm(){
		$("#picBtn").css({"display":"block"});
		$("#updatePic").css({"display":"none"});
	}
</script>