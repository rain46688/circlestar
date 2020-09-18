<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
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
#editor .input-group {
	margin-top: 0.5em;
}
#textEditor {
	margin-top: 0.5em;
}
</style>

<section>
	<div id="wrapper">
		<div id="title"><h4>N빵 글쓰기</h4></div>
		<hr color="black">
		<div id="editor">
			<form action="">
				<select class="custom-select custom-select-sm" name="" id="">
					<option value="" selected>게시판을 선택하세요</option>
					<option value="식품">식품</option>
					<option value="패션잡화">패션잡화</option>
					<option value="취미-문구">취미-문구</option>
					<option value="티켓">티켓</option>
					<option value="애완용품">애완용품</option>
				</select>
				<div class="input-group">
				<input class="form-control" type="text" name="" id="" placeholder="제목을 입력하세요">
				</div>
				<div id="textEditor">
					<textarea name="editor1" id="editor1" rows="20" cols="80" placeholder="내용을 입력해주세요.">
						
					</textarea>
				</div>
			</form>
		</div>
	</div>
</section>
<script>
	CKEDITOR.replace('editor1');
	CKEDITOR.editorConfig = function( config ) {
	config.uiColor = red;
	config.height = 600;
	config.toolbarCanCollapse = true;
};
</script>
<%@ include file="/views/common/footer.jsp"%>