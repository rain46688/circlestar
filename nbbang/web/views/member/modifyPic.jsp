<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
	String memberPic=(String)session.getAttribute("memberPic");
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
	.file{
		visibility: hidden;
		position: absolute;
	}
	#fileNameField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 80%;
        height: 36px;
        margin: 10px 0 15px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 14px;
    }
</style>
<div>
	<form id="modifyProfilePic" action="<%=request.getContextPath()%>/member/modifyPicCpl" enctype="multipart/form-data" method="post">
		<div>
			<p>
				<img src="<%=memberPic %>">
			</p>
		</div>
		<input type="file" name="userProfile" class="file">
		<div class="input-group col-xs-12">
			<input type="text" class="input form-control" id="fileNameField" disabled placeholder="이미지를 업로드 하세요.">
			<span class="input-group-btn">
				<button type="button" class="browse btn btn-primary input-lg" onclick="fn_browseFile();">
					파일찾기
				</button>
			</span>
		</div>
		<button type="button" class="pcbtn" onclick="fn_modifyPic();">수정</button>
		<button type="button" class="pcbtn" onclick="fn_resetTheForm();">수정취소</button>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
</div>
<script>
	$(document).on('click','.browse',function(){
		var file=$(this).parent().parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i,''));
	});

	function fn_modifyPic(){
		$("#modifyProfilePic").submit();
	}
	function fn_resetTheForm(){
		$("#picBtn").css({"display":"block"});
		$("#updatePic").css({"display":"none"});
	}
</script>
