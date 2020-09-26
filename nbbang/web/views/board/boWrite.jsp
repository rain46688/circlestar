<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	String category = request.getParameter("category");
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
	border:1px  rgb(224, 224, 224) solid;
	text-align: left;
	height: 6em;
	border-radius: 7px;
}


#submitBtn>button{
	width: 100%;
	height: 2.5em;
	color: white;
	background-color: gray;
}

#submitBtn>button:hover{
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

#imageUpload>label>p{
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

.marginTop{
	margin-top: 0.5em;
}

</style>

<section>
	<div id="wrapper">
		<div id="title"><h4>글쓰기</h4></div>
		<hr color="black">
		<div id="editor">
			<form id="frm" action="<%= request.getContextPath() %>/board/boardWriteEnd" method="POST"
				enctype="multipart/form-data">
				<select class="custom-select custom-select-sm" name="category" id="category">
					<option value="" <%if(category==null){%>selected<%} %>>게시판을 선택하세요</option>
					<option value="식품"<%if(category.equals("식품")){%>selected<%} %>>식품</option>
					<option value="패션잡화"<%if(category.equals("패션잡화")){%>selected<%} %>>패션잡화</option>
					<option value="취미-문구"<%if(category.equals("취미-문구")){%>selected<%} %>>취미-문구</option>
					<option value="티켓"<%if(category.equals("티켓")){%>selected<%} %>>티켓</option>
					<option value="애완용품"<%if(category.equals("애완용품")){%>selected<%} %>>애완용품</option>
				</select>
				<input type="hidden" name="writerNickname" value="<%= loginnedMember.getNickname() %>" >
				<input type="hidden" name="writerUsid" value="<%= loginnedMember.getUsid() %>" >
				<input type="hidden" name="tradeArea" value="<%= loginnedMember.getAddress() %>" >
				<div class="input-group marginTop">
				<input class="form-control" type="text" name="title" id="titleInput" placeholder="제목을 입력하세요">
				</div>
				<div class="input-group marginTop">	
				<input class="form-control" type="text" name="price" id="price" placeholder="가격">
				<select class="custom-select custom-select-md" name="maxMems" id="maxMems">
					<option value="" selected>n빵 인원</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
				</select>
				<select class="custom-select custom-select-md" name="tradeMethod" id="tradeMethod">
					<option value="">거래방식</option>
					<option value="직거래">직거래</option>
					<option value="택배배송">택배배송</option>
				</select>
				<select class="custom-select custom-select-md" name="ownStatus" id="ownStatus">
					<option value="구매예정">구매예정</option>
					<option value="제품소유중">개인보유</option>
				</select>
				</div>
				<div id="textEditor" class="marginTop">
					<textarea name="content" id="content" rows="20" cols="80" placeholder="내용을 입력해주세요.">

					</textarea>
				</div>
				<div id="imageUpload" class="marginTop">
					<label id="uploadBtn" class="btn btn-lg btn-outline-secondary" for="file"><p>이미지</p>업로드</label>
					<input style="display: none;" type="file" name="file" id="file" multiple="true">
					<div id="image-prev">
						<!-- 이미지 미리보기 -->
					</div>
				</div>
				<div id="urlInsert" class="input-group marginTop">
					<input type="text" class="form-control" name="url" id="url" placeholder="제품 URL">
				</div>
				<div id="submitBtn">
					<button class="marginTop btn btn-outline-secondary" type="button" onclick="fn_submit();">글 등록</button>
				</div>
			</form>
		</div>
	</div>
</section>
<script>
	CKEDITOR.replace('content');
	CKEDITOR.editorConfig = function( config ) {
	config.uiColor = red;
	config.height = 600;
	config.toolbarCanCollapse = true;};

	var sel_file;

	$(function(){
		$("#file").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		let files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		if(filesArr.length>5) {
			alert("파일은 최대 5개까지 업로드 가능합니다");
			document.getElementById("file").value = null;
			return;
		}

		e.target.closest("#imageUpload").style.border="1px rgb(224, 224, 224) solid";

		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지파일만 업로드 가능합니다.")
				document.getElementById("file").value = null;
				return;
			}
			$("#image-prev").html("");

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("<img>").attr("src", e.target.result).appendTo($("#image-prev"))
			}
			reader.readAsDataURL(f);

		
		});
	}
	function fn_submit(){
		if(document.getElementById("category").value == "") {
			alert("카테고리를 선택해주세요.");
			document.getElementById("category").focus();
			return;
		}

		if(document.getElementById("titleInput").value == "") {
			alert("제목을 입력해주세요.");
			document.getElementById("titleInput").focus();
			return;
		}

		if(document.getElementById("price").value == "") {
			alert("가격을 입력해주세요.");
			document.getElementById("price").focus();
			return;
		}

		if(document.getElementById("maxMems").value == "") {
			alert("n빵 인원을 결정해주세요.");
			document.getElementById("maxMems").focus();
			return;
		}

		if(document.getElementById("tradeMethod").value == "") {
			alert("거래방식을 설정해주세요.");
			document.getElementById("tradeMethod").focus();
			return;
		}

		if(document.getElementById("content").value == null) {
			alert("내용을 입력해주세요.");
			document.getElementById("content").focus();
			return;
		}

		files = document.querySelector("#file").files;
		filesArr = Array.prototype.slice.call(files)
		if(filesArr < 1) {
			alert("파일은 1개 이상 첨부해주세요.");
			document.querySelector("#imageUpload").style.border = "1px red solid";
			return;
		}	

		document.getElementById("frm").submit();
		
	}
</script>
<%@ include file="/views/common/footer.jsp"%>