<%@page import="com.nbbang.board.model.vo.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Card c = (Card) request.getAttribute("curCard");
%>
<style>
#wrapper {
	margin: 0 auto;
	margin-top: 3em;
	padding: 1em;
	width: 45em;
	text-align: center;
	align-items: center;
	margin-bottom: 3em;
	border: 0.5px solid rgb(224, 224, 224);
	border-radius: 1em;
	overflow: auto;
}

#title {
	text-align: left;
}

#imageUpload {
	border: 1px rgb(224, 224, 224) solid;
	text-align: left;
	height: 6em;
	border-radius: 7px;
}

#submitBtn>button {
	width: 100%;
	height: 2.5em;
	color: white;
	background-color: gray;
}

#submitBtn>button:hover {
	color: black;
	background-color: white;
}

#imageUpload {
	text-align: left;
	overflow: hidden;
}

#imageUpload>label {
	height: 100%;
	width: 6em;
	float: left;
	font-size: larger;
}

#imageUpload>label>p {
	margin-top: 0.1em;
}

#image-prev {
	width: 35.25em;
	height: 6em;
	border-radius: 5px;
	overflow: hidden;
	float: left;
}

#image-prev>img {
	width: 7.05em;
	height: 100%;
}

.marginTop {
	margin-top: 0.5em;
}
</style>

<section>
	<div id="wrapper">
		<div id="title">
			<h4>글 수정</h4>
		</div>
		<hr color="black">
		<div id="editor">
			<form id="frm" action="<%=request.getContextPath()%>/board/boardSpecialModifyEnd" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="writerNickname" value="<%=loginnedMember.getNickname()%>">
				<input type="hidden" name="writerUsid" value="<%=loginnedMember.getUsid()%>">
				<input type="hidden" name="tradeArea" value="<%=loginnedMember.getAddress()%>">
				<input type="hidden" name="originalFiles" value="<%=c.getCardFile().getFileName("toString")%>">
				<input type="hidden" name="boardId" value="<%=c.getCardBoard().getBoardId()%>">
				<div class="input-group marginTop">
					<input class="form-control" type="text" name="title" id="titleInput" placeholder="특가 제목을 입력하세요">
				</div>
				<div class="input-group marginTop">
					<input class="form-control" type="text" name="name" id="titleInput" placeholder="업체명을 입력하세요">
				</div>
					<div class="input-group marginTop">
					<input class="form-control" type="text" name="price" id="price" placeholder="가격">
					<select class="custom-select custom-select-md" name="maxMems" id="maxMems">
						<option value="" selected>마감 인원</option>
						<option value="30">30</option>
						<option value="50">50</option>
						<option value="100">100</option>
						<option value="150">150</option>
						<option value="200">200</option>
					</select>
					<select class="custom-select custom-select-md" name="time" id="time">
						<option value="">특딜 기간</option>
						<option value="3">3시간</option>
						<option value="6">6시간</option>
						<option value="12">12시간</option>
						<option value="24">24시간</option>
					</select>
				</div>
				<div id="textEditor" class="marginTop">
					<textarea name="content" id="content" rows="20" cols="80" placeholder="내용을 입력해주세요.">
						<%=c.getCardBoard().getContent()%>
					</textarea>
				</div>
				<div id="imageUpload" class="marginTop">
					<label id="uploadBtn" class="btn btn-lg btn-outline-secondary" for="file"><p>이미지</p>업로드</label>
					<input style="display: none;" type="file" name="file" id="file" multiple="true">
					<div id="image-prev">
						<!-- 이미지 미리보기 -->
						<%
							for (String s : c.getCardFile().getFileName()) {
						%>
						<img src="<%=request.getContextPath() + "/upload/images/" + s%>">
						<%
							}
						%>
					</div>
				</div>
				<div id="urlInsert" class="input-group marginTop">
					<input type="text" class="form-control" name="url" id="url" placeholder="제품 URL">
				</div>
				<div id="submitBtn">
					<button class="marginTop btn btn-outline-secondary" type="button" onclick="fn_submit();">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</section>
<script>
	CKEDITOR.replace('content');
	CKEDITOR.editorConfig = function(config) {
		config.uiColor = red;
		config.height = 600;
		config.toolbarCanCollapse = true;
	};

	var sel_file;
	$(function() {
		$("#file").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		let files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		if (filesArr.length > 5) {
			alert("파일은 최대 5개까지 업로드 가능합니다");
			document.getElementById("file").value = null;
			return;
		}

		e.target.closest("#imageUpload").style.border = "1px rgb(224, 224, 224) solid";

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("이미지파일만 업로드 가능합니다.")
				document.getElementById("file").value = null;
				return;
			}
			$("#image-prev").html("");

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("<img>").attr("src", e.target.result).appendTo(
						$("#image-prev"))
			}
			reader.readAsDataURL(f);
		});
	}
	function fn_submit() {


		if (document.getElementById("titleInput").value == "") {
			alert("특가 제목을 입력해주세요.");
			document.getElementById("titleInput").focus();
			return;
		}

		if (document.getElementById("price").value == "") {
			alert("가격을 입력해주세요.");
			document.getElementById("price").focus();
			return;
		}

		if (document.getElementById("maxMems").value == "") {
			alert("마감 인원을 결정해주세요.");
			document.getElementById("maxMems").focus();
			return;
		}

		if (document.getElementById("time").value == "") {
			alert("마감 시간을 설정해주세요.");
			document.getElementById("time").focus();
			return;
		}

		if (document.getElementById("content").value == null) {
			alert("특가 내용을 입력해주세요.");
			document.getElementById("content").focus();
			return;
		}

		/* files = document.querySelector("#file").files;
		filesArr = Array.prototype.slice.call(files)
		if(filesArr < 1) {
			alert("파일은 1개 이상 첨부해주세요.");
			document.querySelector("#imageUpload").style.border = "1px red solid";
			return;
		} */

		document.getElementById("frm").submit();

	}
</script>
<%@ include file="/views/common/footer.jsp"%>