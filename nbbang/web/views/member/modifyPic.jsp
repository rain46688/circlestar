<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
	String memberPic=request.getContextPath()+"/upload/profilePic/";
%>
<style>
	input[type=file]{
		position: relative;
		top: 0;
		right: 0;
		min-width: 100%;
		min-height: 100%;
		font-size: 10px;
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
		position: relative;
	}
	#fileNameField{
        outline: none;
        border: black solid 1px;
        background-color: white;
        width: 59%;
        height: 36px;
        margin: 0 10px 15px;
        padding: 5px;
        box-sizing: border-box;
        font-size: 14px;
    }
	div.profilePicDiv{
		position: relative;
		width: 30%;
		float: left;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	#profilePicField,#imgPreview{
		position: relative;
		margin: auto;
		border-radius: 70%;
		height: 10em;
		width: 10em;
		border: 1px black thin;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-left: 1em;
		margin-right: 1em;
	}
	button.pcbtn{
        outline: none;
        background: #735020;
        min-width: 100px;
        width: 15%;
        height: 36px;
        border: none;
        padding: 5px;
        color: #FFFFFF;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        margin: 0 0 15px 10px;
    }
</style>
<div>
	<form id="modifyProfilePic" action="<%=request.getContextPath()%>/member/modifyPicCpl" enctype="multipart/form-data" method="post">
		<div>
			<div class="profilePicDiv" style="min-width: 180px; border: none;">
				<img id="imgPreview">
			 </div>
		</div>
		<br>
		<input type="file" name="userProfile" id="real-input" class="file" accept="img/*">
		<div class="input-group col-xs-12">
			<input type="text" class="inputFile" id="fileNameField" disabled placeholder="이미지를 업로드 하세요.">
			<button type="button" class="browse pcbtn" onclick="fn_browseFile();">
				파일찾기
			</button>
		</div>
		<button type="button" class="pcbtn" onclick="fn_modifyPic();">수정</button>
		<button type="button" class="pcbtn" onclick="fn_resetTheForm();">수정취소</button>
		<input type="hidden" name="usid" value="<%=m.getUsid()%>">
	</form>
</div>
<script>
	$(document).on('click','.browse',function(){
		var file=$(this).parent().parent().find('.file');
		file.trigger('click');
	});
	$(document).on('change','.file',function(){
		$(this).parent().find('.inputFile').val($(this).val().replace(/C:\\fakepath\\/i,''));
	});

	function fn_modifyPic(){
		$("#modifyProfilePic").submit();
	}
	function fn_resetTheForm(){
		$("#picBtn").css({"display":"block"});
		$("#updatePic").css({"display":"none"});
	}

	$(document).ready(function(){
		function readURL(input) { 
			if (input.files && input.files[0]) { 
				var reader = new FileReader(); 
				reader.onload = function (e) { 
					$('#imgPreview').attr('src', e.target.result); 
			} 
			reader.readAsDataURL(input.files[0]); 
			} 
		}
		$("#real-input").change(function(){ 
			readURL(this); 
		}); 
	});

</script>
